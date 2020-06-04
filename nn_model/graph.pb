node {
  name: "input_seq_feature"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 12
        }
      }
    }
  }
}
node {
  name: "PlaceholderWithDefault/input"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_BOOL
        tensor_shape {
        }
        bool_val: true
      }
    }
  }
}
node {
  name: "PlaceholderWithDefault"
  op: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault/input"
  attr {
    key: "dtype"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "label"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "qid"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "batch_size"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "sorted_label"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "Variable/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Variable/Assign"
  op: "Assign"
  input: "Variable"
  input: "Variable/initial_value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Variable/read"
  op: "Identity"
  input: "Variable"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
}
node {
  name: "ExponentialDecay/initial_learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1000
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast"
  op: "Cast"
  input: "ExponentialDecay/Cast/x"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "ExponentialDecay/Cast_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "ExponentialDecay/Cast_2"
  op: "Cast"
  input: "Variable/read"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "ExponentialDecay/truediv"
  op: "RealDiv"
  input: "ExponentialDecay/Cast_2"
  input: "ExponentialDecay/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay/Pow"
  op: "Pow"
  input: "ExponentialDecay/Cast_1/x"
  input: "ExponentialDecay/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "ExponentialDecay"
  op: "Mul"
  input: "ExponentialDecay/initial_learning_rate"
  input: "ExponentialDecay/Pow"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "save/filename/input"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
        }
        string_val: "model"
      }
    }
  }
}
node {
  name: "save/filename"
  op: "PlaceholderWithDefault"
  input: "save/filename/input"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save/Const"
  op: "PlaceholderWithDefault"
  input: "save/filename"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "save/SaveV2/tensor_names"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable"
      }
    }
  }
}
node {
  name: "save/SaveV2/shape_and_slices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/SaveV2"
  op: "SaveV2"
  input: "save/Const"
  input: "save/SaveV2/tensor_names"
  input: "save/SaveV2/shape_and_slices"
  input: "Variable"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_INT32
      }
    }
  }
}
node {
  name: "save/control_dependency"
  op: "Identity"
  input: "save/Const"
  input: "^save/SaveV2"
  attr {
    key: "T"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@save/Const"
      }
    }
  }
}
node {
  name: "save/RestoreV2/tensor_names"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: "Variable"
      }
    }
  }
}
node {
  name: "save/RestoreV2/shape_and_slices"
  op: "Const"
  device: "/device:CPU:0"
  attr {
    key: "dtype"
    value {
      type: DT_STRING
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_STRING
        tensor_shape {
          dim {
            size: 1
          }
        }
        string_val: ""
      }
    }
  }
}
node {
  name: "save/RestoreV2"
  op: "RestoreV2"
  input: "save/Const"
  input: "save/RestoreV2/tensor_names"
  input: "save/RestoreV2/shape_and_slices"
  device: "/device:CPU:0"
  attr {
    key: "dtypes"
    value {
      list {
        type: DT_INT32
      }
    }
  }
}
node {
  name: "save/Assign"
  op: "Assign"
  input: "Variable"
  input: "save/RestoreV2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "save/restore_all"
  op: "NoOp"
  input: "^save/Assign"
}
node {
  name: "AttenNet/Shape"
  op: "Shape"
  input: "input_seq_feature"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/Shape"
  input: "AttenNet/strided_slice/stack"
  input: "AttenNet/strided_slice/stack_1"
  input: "AttenNet/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/Shape_1"
  op: "Shape"
  input: "input_seq_feature"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/Shape_1"
  input: "AttenNet/strided_slice_1/stack"
  input: "AttenNet/strided_slice_1/stack_1"
  input: "AttenNet/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/zeros/mul"
  op: "Mul"
  input: "AttenNet/strided_slice"
  input: "AttenNet/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/zeros/Less/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1000
      }
    }
  }
}
node {
  name: "AttenNet/zeros/Less"
  op: "Less"
  input: "AttenNet/zeros/mul"
  input: "AttenNet/zeros/Less/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/zeros/packed"
  op: "Pack"
  input: "AttenNet/strided_slice"
  input: "AttenNet/strided_slice_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/zeros/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/zeros"
  op: "Fill"
  input: "AttenNet/zeros/packed"
  input: "AttenNet/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/ones/mul"
  op: "Mul"
  input: "AttenNet/strided_slice"
  input: "AttenNet/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/ones/Less/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1000
      }
    }
  }
}
node {
  name: "AttenNet/ones/Less"
  op: "Less"
  input: "AttenNet/ones/mul"
  input: "AttenNet/ones/Less/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/ones/packed"
  op: "Pack"
  input: "AttenNet/strided_slice"
  input: "AttenNet/strided_slice_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/ones/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/ones"
  op: "Fill"
  input: "AttenNet/ones/packed"
  input: "AttenNet/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/Sum/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/Sum"
  op: "Sum"
  input: "AttenNet/ones"
  input: "AttenNet/Sum/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/TensorArray/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/TensorArray"
  op: "TensorArrayV3"
  input: "AttenNet/TensorArray/size"
  attr {
    key: "clear_after_read"
    value {
      b: false
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "dynamic_size"
    value {
      b: true
    }
  }
  attr {
    key: "element_shape"
    value {
      shape {
        unknown_rank: true
      }
    }
  }
  attr {
    key: "identical_element_shapes"
    value {
      b: true
    }
  }
  attr {
    key: "tensor_array_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/while/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/while/Enter"
  op: "Enter"
  input: "AttenNet/while/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "AttenNet/while/while_context"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 10
    }
  }
}
node {
  name: "AttenNet/while/Enter_1"
  op: "Enter"
  input: "AttenNet/Sum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "AttenNet/while/while_context"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 10
    }
  }
}
node {
  name: "AttenNet/while/Enter_2"
  op: "Enter"
  input: "AttenNet/TensorArray:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "AttenNet/while/while_context"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: false
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 10
    }
  }
}
node {
  name: "AttenNet/while/Merge"
  op: "Merge"
  input: "AttenNet/while/Enter"
  input: "AttenNet/while/NextIteration"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/Merge_1"
  op: "Merge"
  input: "AttenNet/while/Enter_1"
  input: "AttenNet/while/NextIteration_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/Merge_2"
  op: "Merge"
  input: "AttenNet/while/Enter_2"
  input: "AttenNet/while/NextIteration_2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/while/Shape"
  op: "Shape"
  input: "AttenNet/while/Merge_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/strided_slice/stack"
  op: "Const"
  input: "^AttenNet/while/Merge"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/while/strided_slice/stack_1"
  op: "Const"
  input: "^AttenNet/while/Merge"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/while/strided_slice/stack_2"
  op: "Const"
  input: "^AttenNet/while/Merge"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/while/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/while/Shape"
  input: "AttenNet/while/strided_slice/stack"
  input: "AttenNet/while/strided_slice/stack_1"
  input: "AttenNet/while/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/while/Less"
  op: "Less"
  input: "AttenNet/while/Merge"
  input: "AttenNet/while/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/LoopCond"
  op: "LoopCond"
  input: "AttenNet/while/Less"
}
node {
  name: "AttenNet/while/Switch"
  op: "Switch"
  input: "AttenNet/while/Merge"
  input: "AttenNet/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/while/Merge"
      }
    }
  }
}
node {
  name: "AttenNet/while/Switch_1"
  op: "Switch"
  input: "AttenNet/while/Merge_1"
  input: "AttenNet/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/while/Merge_1"
      }
    }
  }
}
node {
  name: "AttenNet/while/Switch_2"
  op: "Switch"
  input: "AttenNet/while/Merge_2"
  input: "AttenNet/while/LoopCond"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/while/Merge_2"
      }
    }
  }
}
node {
  name: "AttenNet/while/Identity"
  op: "Identity"
  input: "AttenNet/while/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/Identity_1"
  op: "Identity"
  input: "AttenNet/while/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/Identity_2"
  op: "Identity"
  input: "AttenNet/while/Switch_2:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/while/add/y"
  op: "Const"
  input: "^AttenNet/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/while/add"
  op: "Add"
  input: "AttenNet/while/Identity"
  input: "AttenNet/while/add/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/add_1/y"
  op: "Const"
  input: "^AttenNet/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/while/add_1"
  op: "Add"
  input: "AttenNet/while/Identity"
  input: "AttenNet/while/add_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/strided_slice_1/stack"
  op: "Pack"
  input: "AttenNet/while/Identity"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/while/strided_slice_1/stack_1"
  op: "Pack"
  input: "AttenNet/while/add_1"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/while/strided_slice_1/stack_2"
  op: "Const"
  input: "^AttenNet/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/while/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/while/Identity_1"
  input: "AttenNet/while/strided_slice_1/stack"
  input: "AttenNet/while/strided_slice_1/stack_1"
  input: "AttenNet/while/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/while/zeros/Less/y"
  op: "Const"
  input: "^AttenNet/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1000
      }
    }
  }
}
node {
  name: "AttenNet/while/zeros/Less"
  op: "Less"
  input: "AttenNet/while/strided_slice_1"
  input: "AttenNet/while/zeros/Less/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/zeros/packed"
  op: "Pack"
  input: "AttenNet/while/strided_slice_1"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/while/zeros/Const"
  op: "Const"
  input: "^AttenNet/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/while/zeros"
  op: "Fill"
  input: "AttenNet/while/zeros/packed"
  input: "AttenNet/while/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/add_2/y"
  op: "Const"
  input: "^AttenNet/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/while/add_2"
  op: "Add"
  input: "AttenNet/while/Identity"
  input: "AttenNet/while/add_2/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/strided_slice_2/stack"
  op: "Pack"
  input: "AttenNet/while/Identity"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/while/strided_slice_2/stack_1"
  op: "Pack"
  input: "AttenNet/while/add_2"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/while/strided_slice_2/stack_2"
  op: "Const"
  input: "^AttenNet/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/while/strided_slice_2"
  op: "StridedSlice"
  input: "AttenNet/while/Identity_1"
  input: "AttenNet/while/strided_slice_2/stack"
  input: "AttenNet/while/strided_slice_2/stack_1"
  input: "AttenNet/while/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/while/sub"
  op: "Sub"
  input: "AttenNet/while/sub/Enter"
  input: "AttenNet/while/strided_slice_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/sub/Enter"
  op: "Enter"
  input: "AttenNet/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "AttenNet/while/while_context"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 10
    }
  }
}
node {
  name: "AttenNet/while/ones/Reshape/shape"
  op: "Const"
  input: "^AttenNet/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/while/ones/Reshape"
  op: "Reshape"
  input: "AttenNet/while/sub"
  input: "AttenNet/while/ones/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/ones/Const"
  op: "Const"
  input: "^AttenNet/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/while/ones"
  op: "Fill"
  input: "AttenNet/while/ones/Reshape"
  input: "AttenNet/while/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/concat/axis"
  op: "Const"
  input: "^AttenNet/while/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/while/concat"
  op: "ConcatV2"
  input: "AttenNet/while/zeros"
  input: "AttenNet/while/ones"
  input: "AttenNet/while/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/TensorArrayWrite/TensorArrayWriteV3"
  op: "TensorArrayWriteV3"
  input: "AttenNet/while/TensorArrayWrite/TensorArrayWriteV3/Enter"
  input: "AttenNet/while/Identity"
  input: "AttenNet/while/concat"
  input: "AttenNet/while/Identity_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/while/concat"
      }
    }
  }
}
node {
  name: "AttenNet/while/TensorArrayWrite/TensorArrayWriteV3/Enter"
  op: "Enter"
  input: "AttenNet/TensorArray"
  attr {
    key: "T"
    value {
      type: DT_RESOURCE
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/while/concat"
      }
    }
  }
  attr {
    key: "frame_name"
    value {
      s: "AttenNet/while/while_context"
    }
  }
  attr {
    key: "is_constant"
    value {
      b: true
    }
  }
  attr {
    key: "parallel_iterations"
    value {
      i: 10
    }
  }
}
node {
  name: "AttenNet/while/NextIteration"
  op: "NextIteration"
  input: "AttenNet/while/add"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/NextIteration_1"
  op: "NextIteration"
  input: "AttenNet/while/Identity_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/NextIteration_2"
  op: "NextIteration"
  input: "AttenNet/while/TensorArrayWrite/TensorArrayWriteV3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/while/Exit"
  op: "Exit"
  input: "AttenNet/while/Switch"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/Exit_1"
  op: "Exit"
  input: "AttenNet/while/Switch_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/while/Exit_2"
  op: "Exit"
  input: "AttenNet/while/Switch_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/TensorArrayStack/TensorArraySizeV3"
  op: "TensorArraySizeV3"
  input: "AttenNet/TensorArray"
  input: "AttenNet/while/Exit_2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/TensorArray"
      }
    }
  }
}
node {
  name: "AttenNet/TensorArrayStack/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/TensorArrayStack/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/TensorArrayStack/range"
  op: "Range"
  input: "AttenNet/TensorArrayStack/range/start"
  input: "AttenNet/TensorArrayStack/TensorArraySizeV3"
  input: "AttenNet/TensorArrayStack/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/TensorArray"
      }
    }
  }
}
node {
  name: "AttenNet/TensorArrayStack/TensorArrayGatherV3"
  op: "TensorArrayGatherV3"
  input: "AttenNet/TensorArray"
  input: "AttenNet/TensorArrayStack/range"
  input: "AttenNet/while/Exit_2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/TensorArray"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "element_shape"
    value {
      shape {
        dim {
          size: -1
        }
      }
    }
  }
}
node {
  name: "AttenNet/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/transpose"
  op: "Transpose"
  input: "input_seq_feature"
  input: "AttenNet/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/transpose_1"
  op: "Transpose"
  input: "AttenNet/zeros"
  input: "AttenNet/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/transpose_2"
  op: "Transpose"
  input: "AttenNet/TensorArrayStack/TensorArrayGatherV3"
  input: "AttenNet/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_w_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\002\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_w_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_w_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_w_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_w_bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_w_bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_w_bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_w_bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_w_bias/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/r_w_bias"
  input: "AttenNet/model/transformer/r_w_bias/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_w_bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_w_bias/read"
  op: "Identity"
  input: "AttenNet/model/transformer/r_w_bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_w_bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_r_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\002\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_r_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_r_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_r_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_r_bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_r_bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_r_bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_r_bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_r_bias/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/r_r_bias"
  input: "AttenNet/model/transformer/r_r_bias/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_r_bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_r_bias/read"
  op: "Identity"
  input: "AttenNet/model/transformer/r_r_bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_r_bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/Shape"
  op: "Shape"
  input: "AttenNet/transpose"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/Shape"
  input: "AttenNet/model/transformer/strided_slice/stack"
  input: "AttenNet/model/transformer/strided_slice/stack_1"
  input: "AttenNet/model/transformer/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/Shape_1"
  op: "Shape"
  input: "AttenNet/transpose"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/Shape_1"
  input: "AttenNet/model/transformer/strided_slice_1/stack"
  input: "AttenNet/model/transformer/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/add/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/add"
  op: "Add"
  input: "AttenNet/model/transformer/add/x"
  input: "AttenNet/model/transformer/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_2"
  op: "StridedSlice"
  input: "AttenNet/transpose_2"
  input: "AttenNet/model/transformer/strided_slice_2/stack"
  input: "AttenNet/model/transformer/strided_slice_2/stack_1"
  input: "AttenNet/model/transformer/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/Shape_2"
  op: "Shape"
  input: "AttenNet/model/transformer/strided_slice_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_3"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/Shape_2"
  input: "AttenNet/model/transformer/strided_slice_3/stack"
  input: "AttenNet/model/transformer/strided_slice_3/stack_1"
  input: "AttenNet/model/transformer/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/strided_slice_3"
  input: "AttenNet/model/transformer/zeros/mul/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/zeros/mul"
  input: "AttenNet/model/transformer/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros/Less/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1000
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros/Less"
  op: "Less"
  input: "AttenNet/model/transformer/zeros/mul_1"
  input: "AttenNet/model/transformer/zeros/Less/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros/packed/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros/packed"
  op: "Pack"
  input: "AttenNet/model/transformer/strided_slice_3"
  input: "AttenNet/model/transformer/zeros/packed/1"
  input: "AttenNet/model/transformer/strided_slice"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros"
  op: "Fill"
  input: "AttenNet/model/transformer/zeros/packed"
  input: "AttenNet/model/transformer/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/concat"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/zeros"
  input: "AttenNet/model/transformer/strided_slice_2"
  input: "AttenNet/model/transformer/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_4/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_4/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_4/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_4"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/concat"
  input: "AttenNet/model/transformer/strided_slice_4/stack"
  input: "AttenNet/model/transformer/strided_slice_4/stack_1"
  input: "AttenNet/model/transformer/strided_slice_4/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 7
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 7
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 8
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/Greater/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/Greater"
  op: "Greater"
  input: "AttenNet/model/transformer/strided_slice_4"
  input: "AttenNet/model/transformer/Greater/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/Greater"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/eye/Minimum"
  op: "Minimum"
  input: "AttenNet/model/transformer/strided_slice_1"
  input: "AttenNet/model/transformer/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/eye/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/eye/concat/values_1"
  op: "Pack"
  input: "AttenNet/model/transformer/eye/Minimum"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/eye/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/eye/concat"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/eye/shape"
  input: "AttenNet/model/transformer/eye/concat/values_1"
  input: "AttenNet/model/transformer/eye/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/eye/ones/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/eye/ones"
  op: "Fill"
  input: "AttenNet/model/transformer/eye/concat"
  input: "AttenNet/model/transformer/eye/ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/eye/MatrixDiag"
  op: "MatrixDiag"
  input: "AttenNet/model/transformer/eye/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/Neg"
  op: "Neg"
  input: "AttenNet/model/transformer/eye/MatrixDiag"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_1/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_1/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/strided_slice_1"
  input: "AttenNet/model/transformer/zeros_1/mul/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_1/Less/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1000
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_1/Less"
  op: "Less"
  input: "AttenNet/model/transformer/zeros_1/mul"
  input: "AttenNet/model/transformer/zeros_1/Less/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_1/packed/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_1/packed"
  op: "Pack"
  input: "AttenNet/model/transformer/strided_slice_1"
  input: "AttenNet/model/transformer/zeros_1/packed/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_1"
  op: "Fill"
  input: "AttenNet/model/transformer/zeros_1/packed"
  input: "AttenNet/model/transformer/zeros_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/concat_1"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/zeros_1"
  input: "AttenNet/model/transformer/Neg"
  input: "AttenNet/model/transformer/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_5/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_5/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_5/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_5"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/concat_1"
  input: "AttenNet/model/transformer/strided_slice_5/stack"
  input: "AttenNet/model/transformer/strided_slice_5/stack_1"
  input: "AttenNet/model/transformer/strided_slice_5/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 3
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 3
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 12
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/add_1"
  op: "Add"
  input: "AttenNet/model/transformer/Cast"
  input: "AttenNet/model/transformer/strided_slice_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/Greater_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/Greater_1"
  op: "Greater"
  input: "AttenNet/model/transformer/add_1"
  input: "AttenNet/model/transformer/Greater_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/Cast_1"
  op: "Cast"
  input: "AttenNet/model/transformer/Greater_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/lookup_table"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000}\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/lookup_table"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/lookup_table"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/lookup_table"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/lookup_table"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/lookup_table"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/lookup_table"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/lookup_table"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32000
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/lookup_table/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/word_embedding/lookup_table"
  input: "AttenNet/model/transformer/word_embedding/lookup_table/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/lookup_table"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/lookup_table/read"
  op: "Identity"
  input: "AttenNet/model/transformer/word_embedding/lookup_table"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/lookup_table"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/embedding_lookup/axis"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/lookup_table"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/embedding_lookup"
  op: "GatherV2"
  input: "AttenNet/model/transformer/word_embedding/lookup_table/read"
  input: "AttenNet/transpose"
  input: "AttenNet/model/transformer/word_embedding/embedding_lookup/axis"
  attr {
    key: "Taxis"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/lookup_table"
      }
    }
  }
  attr {
    key: "batch_dims"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/word_embedding/embedding_lookup/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/word_embedding/embedding_lookup"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model/transformer/dropout/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model/transformer/dropout/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/dropout/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/word_embedding/embedding_lookup/Identity"
  input: "AttenNet/model/transformer/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/embedding_lookup/Identity"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model/transformer/dropout/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform/max"
  input: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform/mul"
  input: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/dropout/cond/dropout/sub/x"
  input: "AttenNet/model/transformer/dropout/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/dropout/cond/dropout/truediv/x"
  input: "AttenNet/model/transformer/dropout/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model/transformer/dropout/cond/dropout/random_uniform"
  input: "AttenNet/model/transformer/dropout/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/dropout/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model/transformer/dropout/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/dropout/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/dropout/cond/dropout/mul"
  input: "AttenNet/model/transformer/dropout/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/dropout/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/word_embedding/embedding_lookup/Identity"
  input: "AttenNet/model/transformer/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/word_embedding/embedding_lookup/Identity"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout/cond/Merge"
  op: "Merge"
  input: "AttenNet/model/transformer/dropout/cond/Identity"
  input: "AttenNet/model/transformer/dropout/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_s_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\002\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_s_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_s_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_s_bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_s_bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_s_bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_s_bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_s_bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_s_bias/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/r_s_bias"
  input: "AttenNet/model/transformer/r_s_bias/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_s_bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/r_s_bias/read"
  op: "Identity"
  input: "AttenNet/model/transformer/r_s_bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/r_s_bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/seg_embed/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/seg_embed"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\002\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/seg_embed/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/seg_embed"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/seg_embed/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/seg_embed"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/seg_embed/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/seg_embed/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/seg_embed"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/seg_embed/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/seg_embed/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/seg_embed/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/seg_embed"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/seg_embed/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/seg_embed/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/seg_embed/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/seg_embed"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/seg_embed"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/seg_embed"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 2
        }
        dim {
          size: 2
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/seg_embed/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/seg_embed"
  input: "AttenNet/model/transformer/seg_embed/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/seg_embed"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/seg_embed/read"
  op: "Identity"
  input: "AttenNet/model/transformer/seg_embed"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/seg_embed"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_2/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_2/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/zeros_2/mul/x"
  input: "AttenNet/model/transformer/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_2/Less/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1000
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_2/Less"
  op: "Less"
  input: "AttenNet/model/transformer/zeros_2/mul"
  input: "AttenNet/model/transformer/zeros_2/Less/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_2/packed/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_2/packed"
  op: "Pack"
  input: "AttenNet/model/transformer/zeros_2/packed/0"
  input: "AttenNet/model/transformer/strided_slice"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/zeros_2"
  op: "Fill"
  input: "AttenNet/model/transformer/zeros_2/packed"
  input: "AttenNet/model/transformer/zeros_2/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/concat_2/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/concat_2"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/zeros_2"
  input: "AttenNet/transpose_1"
  input: "AttenNet/model/transformer/concat_2/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_6/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_6/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_6/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_6"
  op: "StridedSlice"
  input: "AttenNet/transpose_1"
  input: "AttenNet/model/transformer/strided_slice_6/stack"
  input: "AttenNet/model/transformer/strided_slice_6/stack_1"
  input: "AttenNet/model/transformer/strided_slice_6/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 2
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_7/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_7/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_7/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_7"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/concat_2"
  input: "AttenNet/model/transformer/strided_slice_7/stack"
  input: "AttenNet/model/transformer/strided_slice_7/stack_1"
  input: "AttenNet/model/transformer/strided_slice_7/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 2
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 2
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/Equal"
  op: "Equal"
  input: "AttenNet/model/transformer/strided_slice_6"
  input: "AttenNet/model/transformer/strided_slice_7"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/LogicalNot"
  op: "LogicalNot"
  input: "AttenNet/model/transformer/Equal"
}
node {
  name: "AttenNet/model/transformer/Cast_2"
  op: "Cast"
  input: "AttenNet/model/transformer/LogicalNot"
  attr {
    key: "DstT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/one_hot/on_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/one_hot/off_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/one_hot/depth"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/one_hot"
  op: "OneHot"
  input: "AttenNet/model/transformer/Cast_2"
  input: "AttenNet/model/transformer/one_hot/depth"
  input: "AttenNet/model/transformer/one_hot/on_value"
  input: "AttenNet/model/transformer/one_hot/off_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "TI"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: -1
    }
  }
}
node {
  name: "AttenNet/model/transformer/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/range/limit"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/range/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/range/start"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/range/Cast_1"
  op: "Cast"
  input: "AttenNet/model/transformer/range/limit"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/range"
  op: "Range"
  input: "AttenNet/model/transformer/range/Cast"
  input: "AttenNet/model/transformer/range/Cast_1"
  input: "AttenNet/model/transformer/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/truediv/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 100.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/range"
  input: "AttenNet/model/transformer/truediv/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/pow/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 10000.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/pow"
  op: "Pow"
  input: "AttenNet/model/transformer/pow/x"
  input: "AttenNet/model/transformer/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/truediv_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/truediv_1"
  op: "RealDiv"
  input: "AttenNet/model/transformer/truediv_1/x"
  input: "AttenNet/model/transformer/pow"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/Neg_1"
  op: "Neg"
  input: "AttenNet/model/transformer/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/range_1/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/range_1/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/add"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/range_1/Cast_1"
  op: "Cast"
  input: "AttenNet/model/transformer/Neg_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/range_1"
  op: "Range"
  input: "AttenNet/model/transformer/range_1/Cast"
  input: "AttenNet/model/transformer/range_1/Cast_1"
  input: "AttenNet/model/transformer/range_1/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/einsum/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/einsum/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/range_1"
  input: "AttenNet/model/transformer/einsum/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/einsum/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/einsum/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/truediv_1"
  input: "AttenNet/model/transformer/einsum/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/einsum/ExpandDims/dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/einsum/ExpandDims"
  op: "ExpandDims"
  input: "AttenNet/model/transformer/einsum/transpose"
  input: "AttenNet/model/transformer/einsum/ExpandDims/dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/einsum/ExpandDims_1/dim"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/einsum/ExpandDims_1"
  op: "ExpandDims"
  input: "AttenNet/model/transformer/einsum/transpose_1"
  input: "AttenNet/model/transformer/einsum/ExpandDims_1/dim"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tdim"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/einsum/Mul"
  op: "Mul"
  input: "AttenNet/model/transformer/einsum/ExpandDims"
  input: "AttenNet/model/transformer/einsum/ExpandDims_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/einsum/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/einsum/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/einsum/Mul"
  input: "AttenNet/model/transformer/einsum/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/Sin"
  op: "Sin"
  input: "AttenNet/model/transformer/einsum/transpose_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/Cos"
  op: "Cos"
  input: "AttenNet/model/transformer/einsum/transpose_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/concat_3/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/concat_3"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/Sin"
  input: "AttenNet/model/transformer/Cos"
  input: "AttenNet/model/transformer/concat_3/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_8/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_8/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_8/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_8"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/concat_3"
  input: "AttenNet/model/transformer/strided_slice_8/stack"
  input: "AttenNet/model/transformer/strided_slice_8/stack_1"
  input: "AttenNet/model/transformer/strided_slice_8/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 5
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 5
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 2
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/Tile/multiples/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/Tile/multiples/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/Tile/multiples"
  op: "Pack"
  input: "AttenNet/model/transformer/Tile/multiples/0"
  input: "AttenNet/model/transformer/strided_slice"
  input: "AttenNet/model/transformer/Tile/multiples/2"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/Tile"
  op: "Tile"
  input: "AttenNet/model/transformer/strided_slice_8"
  input: "AttenNet/model/transformer/Tile/multiples"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model/transformer/dropout_1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model/transformer/dropout_1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/Tile"
  input: "AttenNet/model/transformer/dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/Tile"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform/max"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform/mul"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/sub/x"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/truediv/x"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/random_uniform"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/mul"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/dropout_1/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/Tile"
  input: "AttenNet/model/transformer/dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/Tile"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_1/cond/Merge"
  op: "Merge"
  input: "AttenNet/model/transformer/dropout_1/cond/Identity"
  input: "AttenNet/model/transformer/dropout_1/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_9/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_9/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_9/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_9"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/r_s_bias/read"
  input: "AttenNet/model/transformer/strided_slice_9/stack"
  input: "AttenNet/model/transformer/strided_slice_9/stack_1"
  input: "AttenNet/model/transformer/strided_slice_9/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_10/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_10/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_10/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_10"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/seg_embed/read"
  input: "AttenNet/model/transformer/strided_slice_10/stack"
  input: "AttenNet/model/transformer/strided_slice_10/stack_1"
  input: "AttenNet/model/transformer/strided_slice_10/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/r_w_bias/read"
  input: "AttenNet/model/transformer/layer_0/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/r_r_bias/read"
  input: "AttenNet/model/transformer/layer_0/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_0/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_0/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
  input: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/q/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/dropout/cond/Merge"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\002\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/q/kernel/read"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/mul/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/mul_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/Reshape_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
  input: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/k/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/dropout/cond/Merge"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\002\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/k/kernel/read"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/mul/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/mul_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/Reshape_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
  input: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/v/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/dropout/cond/Merge"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\002\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/v/kernel/read"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/mul/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/mul_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/Reshape_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
  input: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/r/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/dropout_1/cond/Merge"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\002\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/r/kernel/read"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/mul/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/mul_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/strided_slice_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/Reshape_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose_2"
  input: "AttenNet/model/transformer/layer_0/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\003\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_1/transpose_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_1/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_1/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_1/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_1/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_1/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_1/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/MatMul"
  op: "BatchMatMulV2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\003\000\000\000\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/Reshape_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/add_1"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose_2"
  input: "AttenNet/model/transformer/layer_0/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/add_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\003\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_3/transpose_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_2"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_2/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_2/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/mul/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_1/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_1/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_1/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_1/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/mul"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/MatMul"
  op: "BatchMatMulV2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/strided_slice_2"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\003\000\000\000\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/Reshape_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_2"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_2/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_2/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_3"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_3/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_3/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_4/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_4/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_4/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_4"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_4/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_4/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_4/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_3"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_4"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_5/transpose_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Slice/begin"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Slice/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Slice"
  op: "Slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Slice/begin"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Slice/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_5/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_5/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_5/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_5"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_5/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_5/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_5/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_6/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_6/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_6/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_6"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_6/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_6/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_6/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/sub/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_6"
  input: "AttenNet/model/transformer/layer_0/rel_attn/sub/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_7/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_7/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_7/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_7"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_7/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_7/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_7/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_8/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_8/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_8/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_8"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_8/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_8/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_8/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_5"
  input: "AttenNet/model/transformer/layer_0/rel_attn/sub"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_7"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice_8"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1/begin"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1/size/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1/size/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1/size/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1/size"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1/size/0"
  input: "AttenNet/model/transformer/layer_0/rel_attn/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1/size/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1/size/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1"
  op: "Slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Reshape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1/begin"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/add_2"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum/transpose_2"
  input: "AttenNet/model/transformer/strided_slice_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\001\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/add_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/strided_slice_10"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/mul/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape/shape/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape/shape/0"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/mul_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape/shape/2"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/MatMul"
  op: "BatchMatMulV2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape_1/shape/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape_1/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape_1/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape_1/shape/0"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape_1/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape_1/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\001\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/Reshape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\000\000\000\000\001\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/one_hot"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_6/transpose_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_2"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_2/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_2/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/mul/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_3"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_3/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_3/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_1/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_1/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_1/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_3"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_1/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_1/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_1/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/MatMul"
  op: "BatchMatMulV2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/strided_slice_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/Reshape_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/add_3"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_4/transpose_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Slice_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/add_4"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/add_3"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_7/transpose_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1767766922712326
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/add_4"
  input: "AttenNet/model/transformer/layer_0/rel_attn/mul/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/mul_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000150474662e+30
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/mul_1/x"
  input: "AttenNet/model/transformer/Cast_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/sub_1"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/rel_attn/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Rank_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Sub_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Sub_2"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Rank_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Sub_2/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range/limit"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range"
  op: "Range"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range/start"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range/limit"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range_1/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range_1/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range_1"
  op: "Range"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range_1/start"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Sub_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range_1/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/concat/values_1"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Sub_2"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/concat/values_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/concat"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range"
  input: "AttenNet/model/transformer/layer_0/rel_attn/concat/values_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/concat/values_3"
  input: "AttenNet/model/transformer/layer_0/rel_attn/concat/axis"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/sub_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Softmax"
  op: "Softmax"
  input: "AttenNet/model/transformer/layer_0/rel_attn/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Sub_3/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/Sub_3"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Rank_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Sub_3/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range_2/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range_2/limit"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range_2/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range_2"
  op: "Range"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range_2/start"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range_2/limit"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range_2/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range_3/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range_3/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/range_3"
  op: "Range"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range_3/start"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Sub_3"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range_3/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/concat_1/values_1"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Sub_3"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/concat_1/values_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/concat_1"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/concat_1/values_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/range_3"
  input: "AttenNet/model/transformer/layer_0/rel_attn/concat_1/values_3"
  input: "AttenNet/model/transformer/layer_0/rel_attn/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/Softmax"
  input: "AttenNet/model/transformer/layer_0/rel_attn/concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_0/rel_attn/transpose_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/transpose_1"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform/max"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/sub/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/truediv/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/random_uniform"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_0/rel_attn/transpose_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/transpose_1"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/Merge"
  op: "Merge"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\003\000\000\000\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout/cond/Merge"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_2/transpose_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_2"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Shape_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_2/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_2/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_1/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_1/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_1/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_1/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_1/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_1/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/MatMul"
  op: "BatchMatMulV2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/strided_slice_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\000\000\000\000\001\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/Reshape_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
  input: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/o/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_8/transpose_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\002\000\000\000\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/o/kernel/read"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul_2/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul_2"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul_2/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul_2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_1/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/mul_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_1/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/strided_slice"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_2/shape/2"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/MatMul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/Reshape_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose_2"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform/max"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/sub/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/truediv/x"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/random_uniform"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose_2"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/einsum_9/transpose_2"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/Merge"
  op: "Merge"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/add_5"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/dropout_1/cond/Merge"
  input: "AttenNet/model/transformer/dropout/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/mean"
  op: "Mean"
  input: "AttenNet/model/transformer/layer_0/rel_attn/add_5"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/StopGradient"
  op: "StopGradient"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "AttenNet/model/transformer/layer_0/rel_attn/add_5"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/variance/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/variance"
  op: "Mean"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/SquaredDifference"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/variance/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999960041972e-13
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/variance"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/Rsqrt"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/add_5"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/mul_2"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/moments/mean"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/beta/read"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/add_1"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/mul_1"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/bias/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/bias"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/bias/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/axes"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/free"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/GatherV2/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/GatherV2"
  op: "GatherV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Shape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/free"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/GatherV2/axis"
  attr {
    key: "Taxis"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "batch_dims"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/GatherV2_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/GatherV2_1"
  op: "GatherV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Shape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/axes"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/GatherV2_1/axis"
  attr {
    key: "Taxis"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "batch_dims"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Prod"
  op: "Prod"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/GatherV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Prod_1"
  op: "Prod"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/GatherV2_1"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/concat"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/free"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/axes"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/stack"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Prod"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Prod_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/add_1"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/transpose"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/stack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/kernel/read"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/transpose_1"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Reshape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/concat_1"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/GatherV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/Const_2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/MatMul"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot/concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/BiasAdd"
  op: "BiasAdd"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Tensordot"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_1/Relu"
  op: "Relu"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/ff/drop_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Relu"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/Relu"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/ff/drop_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/ff/drop_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform/max"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform/mul"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/ff/drop_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/sub/x"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/ff/drop_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/truediv/x"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/random_uniform"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/mul"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_0/ff/layer_1/Relu"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_1/Relu"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/Merge"
  op: "Merge"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/Identity"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/bias/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/bias"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/bias/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/axes"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/free"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/GatherV2/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/GatherV2"
  op: "GatherV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Shape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/free"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/GatherV2/axis"
  attr {
    key: "Taxis"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "batch_dims"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/GatherV2_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/GatherV2_1"
  op: "GatherV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Shape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/axes"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/GatherV2_1/axis"
  attr {
    key: "Taxis"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "batch_dims"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Prod"
  op: "Prod"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/GatherV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Prod_1"
  op: "Prod"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/GatherV2_1"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/concat"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/free"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/axes"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/stack"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Prod"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Prod_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/ff/drop_1/cond/Merge"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/transpose"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/stack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/kernel/read"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/transpose_1"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Reshape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/concat_1"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/GatherV2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/Const_2"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/MatMul"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot/concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/layer_2/BiasAdd"
  op: "BiasAdd"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/Tensordot"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/ff/drop_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/BiasAdd"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/BiasAdd"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/ff/drop_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/ff/drop_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform/max"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform/mul"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/ff/drop_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/sub/x"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_0/ff/drop_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/truediv/x"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/random_uniform"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/mul"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_0/ff/layer_2/BiasAdd"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/layer_2/BiasAdd"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/Merge"
  op: "Merge"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/Identity"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/ff/drop_2/cond/Merge"
  input: "AttenNet/model/transformer/layer_0/rel_attn/LayerNorm/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/beta/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/beta"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/beta/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/LayerNorm/beta"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/mean"
  op: "Mean"
  input: "AttenNet/model/transformer/layer_0/ff/add"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/StopGradient"
  op: "StopGradient"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "AttenNet/model/transformer/layer_0/ff/add"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/variance/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/variance"
  op: "Mean"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/SquaredDifference"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/variance/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999960041972e-13
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/variance"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/Rsqrt"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/ff/add"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/mul_2"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/moments/mean"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/beta/read"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/add_1"
  op: "Add"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/mul_1"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_11/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_11/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_11/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_11"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/r_s_bias/read"
  input: "AttenNet/model/transformer/strided_slice_11/stack"
  input: "AttenNet/model/transformer/strided_slice_11/stack_1"
  input: "AttenNet/model/transformer/strided_slice_11/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_12/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_12/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_12/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/strided_slice_12"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/seg_embed/read"
  input: "AttenNet/model/transformer/strided_slice_12/stack"
  input: "AttenNet/model/transformer/strided_slice_12/stack_1"
  input: "AttenNet/model/transformer/strided_slice_12/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/r_w_bias/read"
  input: "AttenNet/model/transformer/layer_1/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/r_r_bias/read"
  input: "AttenNet/model/transformer/layer_1/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_1/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_1/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
  input: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/q/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/add_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\002\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/q/kernel/read"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/mul/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/mul_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/Reshape_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
  input: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/k/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/add_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\002\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/k/kernel/read"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/mul/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/mul_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/Reshape_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
  input: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/v/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/add_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\002\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/v/kernel/read"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/mul/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/mul_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/Reshape_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
  input: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/r/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/dropout_1/cond/Merge"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\000\000\000\000\002\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/r/kernel/read"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/mul/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/mul_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/strided_slice_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/Reshape_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose_2"
  input: "AttenNet/model/transformer/layer_1/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\003\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_1/transpose_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_1/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_1/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_1/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_1/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_1/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_1/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/MatMul"
  op: "BatchMatMulV2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\003\000\000\000\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/Reshape_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/add_1"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose_2"
  input: "AttenNet/model/transformer/layer_1/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\003\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_3/transpose_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_2"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_2/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_2/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/mul/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_1/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_1/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_1/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_1/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/mul"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/MatMul"
  op: "BatchMatMulV2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/strided_slice_2"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\003\000\000\000\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/Reshape_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_2"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_2/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_2/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_3"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_3/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_3/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_4/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_4/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_4/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_4"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_4/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_4/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_4/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_3"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_4"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_5/transpose_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Slice/begin"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Slice/size"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377\377"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Slice"
  op: "Slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Slice/begin"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Slice/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_5/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_5/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_5/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_5"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_5/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_5/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_5/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_6/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_6/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_6/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_6"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_6/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_6/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_6/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/sub/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_6"
  input: "AttenNet/model/transformer/layer_1/rel_attn/sub/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_7/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_7/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_7/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_7"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_7/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_7/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_7/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_8/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_8/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_8/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_8"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_8/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_8/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_8/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_5"
  input: "AttenNet/model/transformer/layer_1/rel_attn/sub"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_7"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice_8"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1/begin"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1/size/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1/size/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1/size/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1/size"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1/size/0"
  input: "AttenNet/model/transformer/layer_1/rel_attn/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1/size/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1/size/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1"
  op: "Slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Reshape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1/begin"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1/size"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/add_2"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum/transpose_2"
  input: "AttenNet/model/transformer/strided_slice_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\001\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/strided_slice_12"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/mul/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape/shape/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape/shape/0"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/mul_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape/shape/2"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/MatMul"
  op: "BatchMatMulV2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape_1/shape/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape_1/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape_1/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape_1/shape/0"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape_1/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape_1/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\001\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/Reshape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\000\000\000\000\001\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/one_hot"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_6/transpose_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_2"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_2/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_2/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/mul/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_2"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_3/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_3/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_3/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_3"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_3/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_3/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_3/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_1/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_1/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_1/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_3"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_1/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_1/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_1/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/MatMul"
  op: "BatchMatMulV2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/strided_slice_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/Reshape_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/add_3"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_4/transpose_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Slice_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/add_4"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_3"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_7/transpose_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/mul/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1767766922712326
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_4"
  input: "AttenNet/model/transformer/layer_1/rel_attn/mul/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/mul_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000150474662e+30
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/mul_1/x"
  input: "AttenNet/model/transformer/Cast_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/sub_1"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/rel_attn/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Rank"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Rank_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Sub_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Sub_2"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Rank_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Sub_2/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range/limit"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range"
  op: "Range"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range/start"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range/limit"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range_1/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range_1/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range_1"
  op: "Range"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range_1/start"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Sub_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range_1/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/concat/values_1"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Sub_2"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/concat/values_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/concat"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range"
  input: "AttenNet/model/transformer/layer_1/rel_attn/concat/values_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/concat/values_3"
  input: "AttenNet/model/transformer/layer_1/rel_attn/concat/axis"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/sub_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Softmax"
  op: "Softmax"
  input: "AttenNet/model/transformer/layer_1/rel_attn/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Sub_3/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/Sub_3"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Rank_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Sub_3/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range_2/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range_2/limit"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range_2/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range_2"
  op: "Range"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range_2/start"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range_2/limit"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range_2/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range_3/start"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range_3/delta"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/range_3"
  op: "Range"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range_3/start"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Sub_3"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range_3/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/concat_1/values_1"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Sub_3"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/concat_1/values_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/concat_1"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/concat_1/values_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/range_3"
  input: "AttenNet/model/transformer/layer_1/rel_attn/concat_1/values_3"
  input: "AttenNet/model/transformer/layer_1/rel_attn/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/Softmax"
  input: "AttenNet/model/transformer/layer_1/rel_attn/concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/rel_attn/transpose_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/transpose_1"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform/max"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/sub/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/truediv/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/random_uniform"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/rel_attn/transpose_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/transpose_1"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/Merge"
  op: "Merge"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\003\000\000\000\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout/cond/Merge"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\002\000\000\000\000\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_2/transpose_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_2/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_2/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_2/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_2"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Shape_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_2/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_2/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_2/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_1/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_1/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_1/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_1/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_1/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_1/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/MatMul"
  op: "BatchMatMulV2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "adj_x"
    value {
      b: false
    }
  }
  attr {
    key: "adj_y"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_2/shape/3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/strided_slice_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_2/shape/2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_2/shape/3"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\002\000\000\000\000\000\000\000\001\000\000\000\003\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/Reshape_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
  input: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/o/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\003\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_8/transpose_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\002\000\000\000\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/o/kernel/read"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice_1/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice_1/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 4
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice_1/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice_1"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice_1/stack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice_1/stack_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice_1/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul_2/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 32
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul_2"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul_2/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul_2"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_1/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_1/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/mul_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_1/shape/1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_2/shape/1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 12
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_2/shape/2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_2/shape"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/strided_slice"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_2/shape/1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_2/shape/2"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_2"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/MatMul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_2/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose_2"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/Reshape_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose_2"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform/max"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/sub/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/truediv/x"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/random_uniform"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose_2"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/einsum_9/transpose_2"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge"
  op: "Merge"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/add_5"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean"
  op: "Mean"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_5"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/StopGradient"
  op: "StopGradient"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_5"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance"
  op: "Mean"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999960041972e-13
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/Rsqrt"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_5"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/beta/read"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/bias/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/bias"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/bias/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/axes"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/free"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/GatherV2/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/GatherV2"
  op: "GatherV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Shape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/free"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/GatherV2/axis"
  attr {
    key: "Taxis"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "batch_dims"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/GatherV2_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/GatherV2_1"
  op: "GatherV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Shape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/axes"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/GatherV2_1/axis"
  attr {
    key: "Taxis"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "batch_dims"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Prod"
  op: "Prod"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/GatherV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Prod_1"
  op: "Prod"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/GatherV2_1"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/concat"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/free"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/axes"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/stack"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Prod"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Prod_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/stack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/kernel/read"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_1"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 128
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/concat_1"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/GatherV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Const_2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd"
  op: "BiasAdd"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_1/Relu"
  op: "Relu"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/ff/drop_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Relu"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/Relu"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/ff/drop_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/ff/drop_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform/max"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform/mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/ff/drop_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/sub/x"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/ff/drop_1/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/truediv/x"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/random_uniform"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Relu"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_1/Relu"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge"
  op: "Merge"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/Identity"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/bias/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/bias"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/bias/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/bias"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/axes"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/free"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/GatherV2/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/GatherV2"
  op: "GatherV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Shape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/free"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/GatherV2/axis"
  attr {
    key: "Taxis"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "batch_dims"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/GatherV2_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/GatherV2_1"
  op: "GatherV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Shape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/axes"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/GatherV2_1/axis"
  attr {
    key: "Taxis"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tindices"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tparams"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "batch_dims"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Prod"
  op: "Prod"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/GatherV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Prod_1"
  op: "Prod"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/GatherV2_1"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/concat"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/free"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/axes"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/concat/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/stack"
  op: "Pack"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Prod"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Prod_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/concat"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/stack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_1"
  op: "Transpose"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/kernel/read"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_1/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_1"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_1"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_1/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/concat_1/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/concat_1"
  op: "ConcatV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/GatherV2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Const_2"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/concat_1/axis"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot"
  op: "Reshape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/concat_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd"
  op: "BiasAdd"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/ff/drop_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/ff/drop_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/ff/drop_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform/max"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform/mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/ff/drop_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/sub/x"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model/transformer/layer_1/ff/drop_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/truediv/x"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/random_uniform"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge"
  op: "Merge"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/Identity"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/beta/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/beta"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/LayerNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/beta/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/LayerNorm/beta"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma/Assign"
  op: "Assign"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma/read"
  op: "Identity"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean"
  op: "Mean"
  input: "AttenNet/model/transformer/layer_1/ff/add"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/StopGradient"
  op: "StopGradient"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference"
  op: "SquaredDifference"
  input: "AttenNet/model/transformer/layer_1/ff/add"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance"
  op: "Mean"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999960041972e-13
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/Rsqrt"
  op: "Rsqrt"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/Rsqrt"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/add"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/beta/read"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model/transformer/dropout_2/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model/transformer/dropout_2/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1"
  input: "AttenNet/model/transformer/dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform/max"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform/mul"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/sub/x"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model/transformer/dropout_2/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/truediv/x"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/random_uniform"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/mul"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/Identity"
  op: "Identity"
  input: "AttenNet/model/transformer/dropout_2/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1"
  input: "AttenNet/model/transformer/dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1"
      }
    }
  }
}
node {
  name: "AttenNet/model/transformer/dropout_2/cond/Merge"
  op: "Merge"
  input: "AttenNet/model/transformer/dropout_2/cond/Identity"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/strided_slice"
  op: "StridedSlice"
  input: "AttenNet/model/transformer/dropout_2/cond/Merge"
  input: "AttenNet/model_1/sequnece_summary/strided_slice/stack"
  input: "AttenNet/model_1/sequnece_summary/strided_slice/stack_1"
  input: "AttenNet/model_1/sequnece_summary/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal/mean"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal/stddev"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.019999999552965164
      }
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal/RandomStandardNormal"
  op: "RandomStandardNormal"
  input: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal/mul"
  op: "Mul"
  input: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal/RandomStandardNormal"
  input: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal/stddev"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal"
  op: "Add"
  input: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal/mul"
  input: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/kernel/Assign"
  op: "Assign"
  input: "AttenNet/model/sequnece_summary/summary/kernel"
  input: "AttenNet/model/sequnece_summary/summary/kernel/Initializer/random_normal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/kernel/read"
  op: "Identity"
  input: "AttenNet/model/sequnece_summary/summary/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/kernel"
      }
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 100
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/bias/Assign"
  op: "Assign"
  input: "AttenNet/model/sequnece_summary/summary/bias"
  input: "AttenNet/model/sequnece_summary/summary/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "AttenNet/model/sequnece_summary/summary/bias/read"
  op: "Identity"
  input: "AttenNet/model/sequnece_summary/summary/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model/sequnece_summary/summary/bias"
      }
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/summary/MatMul"
  op: "MatMul"
  input: "AttenNet/model_1/sequnece_summary/strided_slice"
  input: "AttenNet/model/sequnece_summary/summary/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/summary/BiasAdd"
  op: "BiasAdd"
  input: "AttenNet/model_1/sequnece_summary/summary/MatMul"
  input: "AttenNet/model/sequnece_summary/summary/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/summary/Tanh"
  op: "Tanh"
  input: "AttenNet/model_1/sequnece_summary/summary/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/Switch"
  op: "Switch"
  input: "PlaceholderWithDefault"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/switch_t"
  op: "Identity"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/switch_f"
  op: "Identity"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/pred_id"
  op: "Identity"
  input: "PlaceholderWithDefault"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/rate"
  op: "Const"
  input: "^AttenNet/model_1/sequnece_summary/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10000000149011612
      }
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Shape"
  op: "Shape"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Shape/Switch"
  op: "Switch"
  input: "AttenNet/model_1/sequnece_summary/summary/Tanh"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model_1/sequnece_summary/summary/Tanh"
      }
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform/min"
  op: "Const"
  input: "^AttenNet/model_1/sequnece_summary/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform/max"
  op: "Const"
  input: "^AttenNet/model_1/sequnece_summary/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform/sub"
  op: "Sub"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform/max"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform/mul"
  op: "Mul"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform/RandomUniform"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform"
  op: "Add"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform/mul"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/sub/x"
  op: "Const"
  input: "^AttenNet/model_1/sequnece_summary/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/sub"
  op: "Sub"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/sub/x"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/truediv/x"
  op: "Const"
  input: "^AttenNet/model_1/sequnece_summary/dropout/cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/truediv"
  op: "RealDiv"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/truediv/x"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/GreaterEqual"
  op: "GreaterEqual"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/random_uniform"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/rate"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul"
  op: "Mul"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Shape/Switch:1"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Cast"
  op: "Cast"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/GreaterEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1"
  op: "Mul"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/Identity"
  op: "Identity"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/Identity/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/Identity/Switch"
  op: "Switch"
  input: "AttenNet/model_1/sequnece_summary/summary/Tanh"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@AttenNet/model_1/sequnece_summary/summary/Tanh"
      }
    }
  }
}
node {
  name: "AttenNet/model_1/sequnece_summary/dropout/cond/Merge"
  op: "Merge"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/Identity"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "AttenNet/transpose_3/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 3
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000\002\000\000\000"
      }
    }
  }
}
node {
  name: "AttenNet/transpose_3"
  op: "Transpose"
  input: "AttenNet/model/transformer/dropout_2/cond/Merge"
  input: "AttenNet/transpose_3/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.24373334646224976
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.24373334646224976
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense/kernel/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/sub"
  op: "Sub"
  input: "dense/kernel/Initializer/random_uniform/max"
  input: "dense/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform/mul"
  op: "Mul"
  input: "dense/kernel/Initializer/random_uniform/RandomUniform"
  input: "dense/kernel/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/kernel/Initializer/random_uniform"
  op: "Add"
  input: "dense/kernel/Initializer/random_uniform/mul"
  input: "dense/kernel/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/kernel"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 100
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense/kernel/Assign"
  op: "Assign"
  input: "dense/kernel"
  input: "dense/kernel/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense/kernel/read"
  op: "Identity"
  input: "dense/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/kernel"
      }
    }
  }
}
node {
  name: "dense/bias/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense/bias"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense/bias/Assign"
  op: "Assign"
  input: "dense/bias"
  input: "dense/bias/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense/bias/read"
  op: "Identity"
  input: "dense/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense/bias"
      }
    }
  }
}
node {
  name: "dense/MatMul"
  op: "MatMul"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/Merge"
  input: "dense/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense/BiasAdd"
  op: "BiasAdd"
  input: "dense/MatMul"
  input: "dense/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "transpose/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "transpose"
  op: "Transpose"
  input: "label"
  input: "transpose/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "sub"
  op: "Sub"
  input: "label"
  input: "transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Minimum/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Minimum"
  op: "Minimum"
  input: "Minimum/x"
  input: "sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Maximum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -1.0
      }
    }
  }
}
node {
  name: "Maximum"
  op: "Maximum"
  input: "Minimum"
  input: "Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "add/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "add"
  op: "Add"
  input: "add/x"
  input: "Maximum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.5
      }
    }
  }
}
node {
  name: "mul"
  op: "Mul"
  input: "mul/x"
  input: "add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "transpose_1/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_1"
  op: "Transpose"
  input: "dense/BiasAdd"
  input: "transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "sub_1"
  op: "Sub"
  input: "dense/BiasAdd"
  input: "transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "logistic_loss/zeros_like"
  op: "ZerosLike"
  input: "sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "logistic_loss/GreaterEqual"
  op: "GreaterEqual"
  input: "sub_1"
  input: "logistic_loss/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "logistic_loss/Select"
  op: "Select"
  input: "logistic_loss/GreaterEqual"
  input: "sub_1"
  input: "logistic_loss/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "logistic_loss/Neg"
  op: "Neg"
  input: "sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "logistic_loss/Select_1"
  op: "Select"
  input: "logistic_loss/GreaterEqual"
  input: "logistic_loss/Neg"
  input: "sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "logistic_loss/mul"
  op: "Mul"
  input: "sub_1"
  input: "mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "logistic_loss/sub"
  op: "Sub"
  input: "logistic_loss/Select"
  input: "logistic_loss/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "logistic_loss/Exp"
  op: "Exp"
  input: "logistic_loss/Select_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "logistic_loss/Log1p"
  op: "Log1p"
  input: "logistic_loss/Exp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "logistic_loss"
  op: "Add"
  input: "logistic_loss/sub"
  input: "logistic_loss/Log1p"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "transpose_2/perm"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\000\000\000\000"
      }
    }
  }
}
node {
  name: "transpose_2"
  op: "Transpose"
  input: "qid"
  input: "transpose_2/perm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "sub_2"
  op: "Sub"
  input: "qid"
  input: "transpose_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Equal/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Equal"
  op: "Equal"
  input: "sub_2"
  input: "Equal/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Cast"
  op: "Cast"
  input: "Equal"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "Shape"
  op: "Shape"
  input: "input_seq_feature"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "strided_slice"
  op: "StridedSlice"
  input: "Shape"
  input: "strided_slice/stack"
  input: "strided_slice/stack_1"
  input: "strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "ones/mul"
  op: "Mul"
  input: "strided_slice"
  input: "strided_slice"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "ones/Less/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1000
      }
    }
  }
}
node {
  name: "ones/Less"
  op: "Less"
  input: "ones/mul"
  input: "ones/Less/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "ones/packed"
  op: "Pack"
  input: "strided_slice"
  input: "strided_slice"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "ones/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "ones"
  op: "Fill"
  input: "ones/packed"
  input: "ones/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "ones_1/Less/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1000
      }
    }
  }
}
node {
  name: "ones_1/Less"
  op: "Less"
  input: "strided_slice"
  input: "ones_1/Less/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "ones_1/packed"
  op: "Pack"
  input: "strided_slice"
  attr {
    key: "N"
    value {
      i: 1
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "ones_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "ones_1"
  op: "Fill"
  input: "ones_1/packed"
  input: "ones_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Diag"
  op: "Diag"
  input: "ones_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub_3"
  op: "Sub"
  input: "ones"
  input: "Diag"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_1"
  op: "Mul"
  input: "Cast"
  input: "sub_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Sum"
  op: "Sum"
  input: "mul_1"
  input: "Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "Equal_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Equal_1"
  op: "Equal"
  input: "Sum"
  input: "Equal_1/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "cond/Switch"
  op: "Switch"
  input: "Equal_1"
  input: "Equal_1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "cond/switch_t"
  op: "Identity"
  input: "cond/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "cond/switch_f"
  op: "Identity"
  input: "cond/Switch"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "cond/pred_id"
  op: "Identity"
  input: "Equal_1"
  attr {
    key: "T"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "cond/Const"
  op: "Const"
  input: "^cond/switch_t"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "cond/mul"
  op: "Mul"
  input: "cond/mul/Switch"
  input: "cond/mul/Switch_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "cond/mul/Switch"
  op: "Switch"
  input: "logistic_loss"
  input: "cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@logistic_loss"
      }
    }
  }
}
node {
  name: "cond/mul/Switch_1"
  op: "Switch"
  input: "mul_1"
  input: "cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@mul_1"
      }
    }
  }
}
node {
  name: "cond/Const_1"
  op: "Const"
  input: "^cond/switch_f"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "cond/Sum"
  op: "Sum"
  input: "cond/mul"
  input: "cond/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "cond/truediv"
  op: "RealDiv"
  input: "cond/Sum"
  input: "cond/truediv/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "cond/truediv/Switch"
  op: "Switch"
  input: "Sum"
  input: "cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Sum"
      }
    }
  }
}
node {
  name: "cond/Merge"
  op: "Merge"
  input: "cond/truediv"
  input: "cond/Const"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "global_step/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@global_step"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
        }
        int64_val: 0
      }
    }
  }
}
node {
  name: "global_step"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@global_step"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "global_step/Assign"
  op: "Assign"
  input: "global_step"
  input: "global_step/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@global_step"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "global_step/read"
  op: "Identity"
  input: "global_step"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@global_step"
      }
    }
  }
}
node {
  name: "Cast_1"
  op: "Cast"
  input: "global_step/read"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "Cast_2/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1000
      }
    }
  }
}
node {
  name: "Cast_2"
  op: "Cast"
  input: "Cast_2/x"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "truediv"
  op: "RealDiv"
  input: "Cast_1"
  input: "Cast_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "mul_2/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "mul_2"
  op: "Mul"
  input: "truediv"
  input: "mul_2/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "sub_4/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
        }
        int64_val: 1000
      }
    }
  }
}
node {
  name: "sub_4"
  op: "Sub"
  input: "global_step/read"
  input: "sub_4/y"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "PolynomialDecay/initial_learning_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "PolynomialDecay/Cast/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999974752427e-07
      }
    }
  }
}
node {
  name: "PolynomialDecay/Cast_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "PolynomialDecay/Cast_2"
  op: "Cast"
  input: "sub_4"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "PolynomialDecay/Cast_3/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 999000
      }
    }
  }
}
node {
  name: "PolynomialDecay/Cast_3"
  op: "Cast"
  input: "PolynomialDecay/Cast_3/x"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "PolynomialDecay/Minimum/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 999000.0
      }
    }
  }
}
node {
  name: "PolynomialDecay/Minimum"
  op: "Minimum"
  input: "PolynomialDecay/Cast_2"
  input: "PolynomialDecay/Minimum/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "PolynomialDecay/div"
  op: "RealDiv"
  input: "PolynomialDecay/Minimum"
  input: "PolynomialDecay/Cast_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "PolynomialDecay/sub"
  op: "Sub"
  input: "PolynomialDecay/initial_learning_rate"
  input: "PolynomialDecay/Cast/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "PolynomialDecay/sub_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "PolynomialDecay/sub_1"
  op: "Sub"
  input: "PolynomialDecay/sub_1/x"
  input: "PolynomialDecay/div"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "PolynomialDecay/Pow"
  op: "Pow"
  input: "PolynomialDecay/sub_1"
  input: "PolynomialDecay/Cast_1/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "PolynomialDecay/Mul"
  op: "Mul"
  input: "PolynomialDecay/sub"
  input: "PolynomialDecay/Pow"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "PolynomialDecay"
  op: "Add"
  input: "PolynomialDecay/Mul"
  input: "PolynomialDecay/Cast/x"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Less/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
        }
        int64_val: 1000
      }
    }
  }
}
node {
  name: "Less"
  op: "Less"
  input: "global_step/read"
  input: "Less/y"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "Select"
  op: "Select"
  input: "Less"
  input: "mul_2"
  input: "PolynomialDecay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/grad_ys_0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/Fill"
  op: "Fill"
  input: "gradients/Shape"
  input: "gradients/grad_ys_0"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/Fill"
  input: "cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Fill"
      }
    }
  }
}
node {
  name: "gradients/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cond/Merge_grad/cond_grad"
  input: "^gradients/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Fill"
      }
    }
  }
}
node {
  name: "gradients/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cond/Merge_grad/cond_grad:1"
  input: "^gradients/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/Fill"
      }
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/cond/truediv_grad/Shape"
  input: "gradients/cond/truediv_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/RealDiv"
  op: "RealDiv"
  input: "gradients/cond/Merge_grad/tuple/control_dependency"
  input: "cond/truediv/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/Sum"
  op: "Sum"
  input: "gradients/cond/truediv_grad/RealDiv"
  input: "gradients/cond/truediv_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/Reshape"
  op: "Reshape"
  input: "gradients/cond/truediv_grad/Sum"
  input: "gradients/cond/truediv_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/Neg"
  op: "Neg"
  input: "cond/Sum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/RealDiv_1"
  op: "RealDiv"
  input: "gradients/cond/truediv_grad/Neg"
  input: "cond/truediv/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/RealDiv_2"
  op: "RealDiv"
  input: "gradients/cond/truediv_grad/RealDiv_1"
  input: "cond/truediv/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/mul"
  op: "Mul"
  input: "gradients/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/cond/truediv_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/Sum_1"
  op: "Sum"
  input: "gradients/cond/truediv_grad/mul"
  input: "gradients/cond/truediv_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/cond/truediv_grad/Sum_1"
  input: "gradients/cond/truediv_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cond/truediv_grad/Reshape"
  input: "^gradients/cond/truediv_grad/Reshape_1"
}
node {
  name: "gradients/cond/truediv_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cond/truediv_grad/Reshape"
  input: "^gradients/cond/truediv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cond/truediv_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/cond/truediv_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cond/truediv_grad/Reshape_1"
  input: "^gradients/cond/truediv_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cond/truediv_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/cond/Sum_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/cond/Sum_grad/Reshape"
  op: "Reshape"
  input: "gradients/cond/truediv_grad/tuple/control_dependency"
  input: "gradients/cond/Sum_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/Sum_grad/Shape"
  op: "Shape"
  input: "cond/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/Sum_grad/Tile"
  op: "Tile"
  input: "gradients/cond/Sum_grad/Reshape"
  input: "gradients/cond/Sum_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/mul_grad/Shape"
  op: "Shape"
  input: "cond/mul/Switch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/mul_grad/Shape_1"
  op: "Shape"
  input: "cond/mul/Switch_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/cond/mul_grad/Shape"
  input: "gradients/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/mul_grad/Mul"
  op: "Mul"
  input: "gradients/cond/Sum_grad/Tile"
  input: "cond/mul/Switch_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cond/mul_grad/Sum"
  op: "Sum"
  input: "gradients/cond/mul_grad/Mul"
  input: "gradients/cond/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/cond/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/cond/mul_grad/Sum"
  input: "gradients/cond/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/mul_grad/Mul_1"
  op: "Mul"
  input: "cond/mul/Switch"
  input: "gradients/cond/Sum_grad/Tile"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/cond/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/cond/mul_grad/Mul_1"
  input: "gradients/cond/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/cond/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/cond/mul_grad/Sum_1"
  input: "gradients/cond/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/cond/mul_grad/Reshape"
  input: "^gradients/cond/mul_grad/Reshape_1"
}
node {
  name: "gradients/cond/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/cond/mul_grad/Reshape"
  input: "^gradients/cond/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cond/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/cond/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/cond/mul_grad/Reshape_1"
  input: "^gradients/cond/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/cond/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch"
  op: "Switch"
  input: "logistic_loss"
  input: "cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity"
  op: "Identity"
  input: "gradients/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_1"
  op: "Shape"
  input: "gradients/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros/Const"
  op: "Const"
  input: "^gradients/Identity"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros"
  op: "Fill"
  input: "gradients/Shape_1"
  input: "gradients/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/cond/mul/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/cond/mul_grad/tuple/control_dependency"
  input: "gradients/zeros"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss_grad/Shape"
  op: "Shape"
  input: "logistic_loss/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss_grad/Shape_1"
  op: "Shape"
  input: "logistic_loss/Log1p"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/logistic_loss_grad/Shape"
  input: "gradients/logistic_loss_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss_grad/Sum"
  op: "Sum"
  input: "gradients/cond/mul/Switch_grad/cond_grad"
  input: "gradients/logistic_loss_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/logistic_loss_grad/Reshape"
  op: "Reshape"
  input: "gradients/logistic_loss_grad/Sum"
  input: "gradients/logistic_loss_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss_grad/Sum_1"
  op: "Sum"
  input: "gradients/cond/mul/Switch_grad/cond_grad"
  input: "gradients/logistic_loss_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/logistic_loss_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/logistic_loss_grad/Sum_1"
  input: "gradients/logistic_loss_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/logistic_loss_grad/Reshape"
  input: "^gradients/logistic_loss_grad/Reshape_1"
}
node {
  name: "gradients/logistic_loss_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/logistic_loss_grad/Reshape"
  input: "^gradients/logistic_loss_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/logistic_loss_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/logistic_loss_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/logistic_loss_grad/Reshape_1"
  input: "^gradients/logistic_loss_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/logistic_loss_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/logistic_loss/sub_grad/Shape"
  op: "Shape"
  input: "logistic_loss/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss/sub_grad/Shape_1"
  op: "Shape"
  input: "logistic_loss/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/logistic_loss/sub_grad/Shape"
  input: "gradients/logistic_loss/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss/sub_grad/Sum"
  op: "Sum"
  input: "gradients/logistic_loss_grad/tuple/control_dependency"
  input: "gradients/logistic_loss/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/logistic_loss/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/logistic_loss/sub_grad/Sum"
  input: "gradients/logistic_loss/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/logistic_loss_grad/tuple/control_dependency"
  input: "gradients/logistic_loss/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/logistic_loss/sub_grad/Neg"
  op: "Neg"
  input: "gradients/logistic_loss/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/logistic_loss/sub_grad/Neg"
  input: "gradients/logistic_loss/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/logistic_loss/sub_grad/Reshape"
  input: "^gradients/logistic_loss/sub_grad/Reshape_1"
}
node {
  name: "gradients/logistic_loss/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/logistic_loss/sub_grad/Reshape"
  input: "^gradients/logistic_loss/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/logistic_loss/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/logistic_loss/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/logistic_loss/sub_grad/Reshape_1"
  input: "^gradients/logistic_loss/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/logistic_loss/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/logistic_loss/Log1p_grad/add/x"
  op: "Const"
  input: "^gradients/logistic_loss_grad/tuple/control_dependency_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "gradients/logistic_loss/Log1p_grad/add"
  op: "Add"
  input: "gradients/logistic_loss/Log1p_grad/add/x"
  input: "logistic_loss/Exp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/Log1p_grad/Reciprocal"
  op: "Reciprocal"
  input: "gradients/logistic_loss/Log1p_grad/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/Log1p_grad/mul"
  op: "Mul"
  input: "gradients/logistic_loss_grad/tuple/control_dependency_1"
  input: "gradients/logistic_loss/Log1p_grad/Reciprocal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/Select_grad/zeros_like"
  op: "ZerosLike"
  input: "sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/Select_grad/Select"
  op: "Select"
  input: "logistic_loss/GreaterEqual"
  input: "gradients/logistic_loss/sub_grad/tuple/control_dependency"
  input: "gradients/logistic_loss/Select_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/Select_grad/Select_1"
  op: "Select"
  input: "logistic_loss/GreaterEqual"
  input: "gradients/logistic_loss/Select_grad/zeros_like"
  input: "gradients/logistic_loss/sub_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/Select_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/logistic_loss/Select_grad/Select"
  input: "^gradients/logistic_loss/Select_grad/Select_1"
}
node {
  name: "gradients/logistic_loss/Select_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/logistic_loss/Select_grad/Select"
  input: "^gradients/logistic_loss/Select_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/logistic_loss/Select_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/logistic_loss/Select_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/logistic_loss/Select_grad/Select_1"
  input: "^gradients/logistic_loss/Select_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/logistic_loss/Select_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/logistic_loss/mul_grad/Shape"
  op: "Shape"
  input: "sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss/mul_grad/Shape_1"
  op: "Shape"
  input: "mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/logistic_loss/mul_grad/Shape"
  input: "gradients/logistic_loss/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss/mul_grad/Mul"
  op: "Mul"
  input: "gradients/logistic_loss/sub_grad/tuple/control_dependency_1"
  input: "mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/mul_grad/Sum"
  op: "Sum"
  input: "gradients/logistic_loss/mul_grad/Mul"
  input: "gradients/logistic_loss/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/logistic_loss/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/logistic_loss/mul_grad/Sum"
  input: "gradients/logistic_loss/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss/mul_grad/Mul_1"
  op: "Mul"
  input: "sub_1"
  input: "gradients/logistic_loss/sub_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/logistic_loss/mul_grad/Mul_1"
  input: "gradients/logistic_loss/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/logistic_loss/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/logistic_loss/mul_grad/Sum_1"
  input: "gradients/logistic_loss/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/logistic_loss/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/logistic_loss/mul_grad/Reshape"
  input: "^gradients/logistic_loss/mul_grad/Reshape_1"
}
node {
  name: "gradients/logistic_loss/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/logistic_loss/mul_grad/Reshape"
  input: "^gradients/logistic_loss/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/logistic_loss/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/logistic_loss/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/logistic_loss/mul_grad/Reshape_1"
  input: "^gradients/logistic_loss/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/logistic_loss/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/logistic_loss/Exp_grad/mul"
  op: "Mul"
  input: "gradients/logistic_loss/Log1p_grad/mul"
  input: "logistic_loss/Exp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/Select_1_grad/zeros_like"
  op: "ZerosLike"
  input: "logistic_loss/Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/Select_1_grad/Select"
  op: "Select"
  input: "logistic_loss/GreaterEqual"
  input: "gradients/logistic_loss/Exp_grad/mul"
  input: "gradients/logistic_loss/Select_1_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/Select_1_grad/Select_1"
  op: "Select"
  input: "logistic_loss/GreaterEqual"
  input: "gradients/logistic_loss/Select_1_grad/zeros_like"
  input: "gradients/logistic_loss/Exp_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/logistic_loss/Select_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/logistic_loss/Select_1_grad/Select"
  input: "^gradients/logistic_loss/Select_1_grad/Select_1"
}
node {
  name: "gradients/logistic_loss/Select_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/logistic_loss/Select_1_grad/Select"
  input: "^gradients/logistic_loss/Select_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/logistic_loss/Select_1_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/logistic_loss/Select_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/logistic_loss/Select_1_grad/Select_1"
  input: "^gradients/logistic_loss/Select_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/logistic_loss/Select_1_grad/Select_1"
      }
    }
  }
}
node {
  name: "gradients/logistic_loss/Neg_grad/Neg"
  op: "Neg"
  input: "gradients/logistic_loss/Select_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN"
  op: "AddN"
  input: "gradients/logistic_loss/Select_grad/tuple/control_dependency"
  input: "gradients/logistic_loss/mul_grad/tuple/control_dependency"
  input: "gradients/logistic_loss/Select_1_grad/tuple/control_dependency_1"
  input: "gradients/logistic_loss/Neg_grad/Neg"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/logistic_loss/Select_grad/Select"
      }
    }
  }
}
node {
  name: "gradients/sub_1_grad/Shape"
  op: "Shape"
  input: "dense/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_1_grad/Shape_1"
  op: "Shape"
  input: "transpose_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/sub_1_grad/Shape"
  input: "gradients/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_1_grad/Sum"
  op: "Sum"
  input: "gradients/AddN"
  input: "gradients/sub_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/sub_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/sub_1_grad/Sum"
  input: "gradients/sub_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN"
  input: "gradients/sub_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/sub_1_grad/Neg"
  op: "Neg"
  input: "gradients/sub_1_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/sub_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/sub_1_grad/Neg"
  input: "gradients/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/sub_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/sub_1_grad/Reshape"
  input: "^gradients/sub_1_grad/Reshape_1"
}
node {
  name: "gradients/sub_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/sub_1_grad/Reshape"
  input: "^gradients/sub_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/sub_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/sub_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/sub_1_grad/Reshape_1"
  input: "^gradients/sub_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/sub_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/transpose_1_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/transpose_1_grad/transpose"
  op: "Transpose"
  input: "gradients/sub_1_grad/tuple/control_dependency_1"
  input: "gradients/transpose_1_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AddN_1"
  op: "AddN"
  input: "gradients/sub_1_grad/tuple/control_dependency"
  input: "gradients/transpose_1_grad/transpose"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/sub_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dense/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/AddN_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/dense/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AddN_1"
  input: "^gradients/dense/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/dense/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AddN_1"
  input: "^gradients/dense/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/sub_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/dense/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dense/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/dense/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/dense/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/dense/BiasAdd_grad/tuple/control_dependency"
  input: "dense/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/dense/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/Merge"
  input: "gradients/dense/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/dense/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/dense/MatMul_grad/MatMul"
  input: "^gradients/dense/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/dense/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/dense/MatMul_grad/MatMul"
  input: "^gradients/dense/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/dense/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/dense/MatMul_grad/MatMul_1"
  input: "^gradients/dense/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/dense/MatMul_grad/tuple/control_dependency"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/cond_grad"
  input: "^gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/cond_grad:1"
  input: "^gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/dense/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Shape"
  op: "Shape"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Shape"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/tuple/control_dependency_1"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Mul"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Sum"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Mul_1"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Sum_1"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Reshape_1"
  input: "^gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_1"
  op: "Switch"
  input: "AttenNet/model_1/sequnece_summary/summary/Tanh"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_1"
  op: "Identity"
  input: "gradients/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_2"
  op: "Shape"
  input: "gradients/Switch_1:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_1/Const"
  op: "Const"
  input: "^gradients/Identity_1"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_1"
  op: "Fill"
  input: "gradients/Shape_2"
  input: "gradients/zeros_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Identity/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/zeros_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Shape"
  op: "Shape"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Shape"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/tuple/control_dependency"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Mul"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Sum"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Shape/Switch:1"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Mul_1"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Sum_1"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Reshape"
  input: "^gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Reshape"
  input: "^gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Reshape_1"
  input: "^gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_2"
  op: "Switch"
  input: "AttenNet/model_1/sequnece_summary/summary/Tanh"
  input: "AttenNet/model_1/sequnece_summary/dropout/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_2"
  op: "Identity"
  input: "gradients/Switch_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_3"
  op: "Shape"
  input: "gradients/Switch_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_2/Const"
  op: "Const"
  input: "^gradients/Identity_2"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_2"
  op: "Fill"
  input: "gradients/Shape_3"
  input: "gradients/zeros_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Shape/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/zeros_2"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/mul_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_2"
  op: "AddN"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Identity/Switch_grad/cond_grad"
  input: "gradients/AttenNet/model_1/sequnece_summary/dropout/cond/dropout/Shape/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/dropout/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/summary/Tanh_grad/TanhGrad"
  op: "TanhGrad"
  input: "AttenNet/model_1/sequnece_summary/summary/Tanh"
  input: "gradients/AddN_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/summary/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/AttenNet/model_1/sequnece_summary/summary/Tanh_grad/TanhGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/summary/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model_1/sequnece_summary/summary/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/AttenNet/model_1/sequnece_summary/summary/Tanh_grad/TanhGrad"
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/summary/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model_1/sequnece_summary/summary/Tanh_grad/TanhGrad"
  input: "^gradients/AttenNet/model_1/sequnece_summary/summary/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/summary/Tanh_grad/TanhGrad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/summary/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model_1/sequnece_summary/summary/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/AttenNet/model_1/sequnece_summary/summary/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/summary/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/AttenNet/model_1/sequnece_summary/summary/BiasAdd_grad/tuple/control_dependency"
  input: "AttenNet/model/sequnece_summary/summary/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "AttenNet/model_1/sequnece_summary/strided_slice"
  input: "gradients/AttenNet/model_1/sequnece_summary/summary/BiasAdd_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/MatMul"
  input: "^gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/MatMul"
  input: "^gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/MatMul_1"
  input: "^gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/strided_slice_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/dropout_2/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model_1/sequnece_summary/strided_slice_grad/StridedSliceGrad"
  op: "StridedSliceGrad"
  input: "gradients/AttenNet/model_1/sequnece_summary/strided_slice_grad/Shape"
  input: "AttenNet/model_1/sequnece_summary/strided_slice/stack"
  input: "AttenNet/model_1/sequnece_summary/strided_slice/stack_1"
  input: "AttenNet/model_1/sequnece_summary/strided_slice/stack_2"
  input: "gradients/AttenNet/model_1/sequnece_summary/summary/MatMul_grad/tuple/control_dependency"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 1
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/AttenNet/model_1/sequnece_summary/strided_slice_grad/StridedSliceGrad"
  input: "AttenNet/model/transformer/dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/strided_slice_grad/StridedSliceGrad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/cond_grad"
  input: "^gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/strided_slice_grad/StridedSliceGrad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/cond_grad:1"
  input: "^gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model_1/sequnece_summary/strided_slice_grad/StridedSliceGrad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Shape"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/tuple/control_dependency_1"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Mul"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Sum"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/mul"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_3"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1"
  input: "AttenNet/model/transformer/dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_3"
  op: "Identity"
  input: "gradients/Switch_3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_4"
  op: "Shape"
  input: "gradients/Switch_3:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_3/Const"
  op: "Const"
  input: "^gradients/Identity_3"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_3"
  op: "Fill"
  input: "gradients/Shape_4"
  input: "gradients/zeros_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/Identity/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/zeros_3"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Shape"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/tuple/control_dependency"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Mul"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Sum"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/dropout_2/cond/dropout/Shape/Switch:1"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_4"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1"
  input: "AttenNet/model/transformer/dropout_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_4"
  op: "Identity"
  input: "gradients/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_5"
  op: "Shape"
  input: "gradients/Switch_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_4/Const"
  op: "Const"
  input: "^gradients/Identity_4"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_4"
  op: "Fill"
  input: "gradients/Shape_5"
  input: "gradients/zeros_4/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/Shape/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/zeros_4"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/mul_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_3"
  op: "AddN"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/Identity/Switch_grad/cond_grad"
  input: "gradients/AttenNet/model/transformer/dropout_2/cond/dropout/Shape/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/dropout_2/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_3"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_3"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/add"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Neg"
  op: "Neg"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Neg"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/sub_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_4"
  op: "AddN"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/Rsqrt"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Mul"
  op: "Mul"
  input: "gradients/AddN_4"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/Rsqrt"
  input: "gradients/AddN_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/Rsqrt_grad/RsqrtGrad"
  op: "RsqrtGrad"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/Rsqrt"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance/reduction_indices"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/mod"
  op: "FloorMod"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/add"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/range"
  op: "Range"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/range/start"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Size"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Fill"
  op: "Fill"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/range"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/mod"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Maximum"
  op: "Maximum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/DynamicStitch"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/add_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Tile"
  op: "Tile"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape_2"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape_3"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Prod"
  op: "Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape_2"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Prod_1"
  op: "Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Shape_3"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Prod_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Cast"
  op: "Cast"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/truediv"
  op: "RealDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Tile"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/truediv"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/scalar"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/ff/add"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/StopGradient"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/variance_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Neg"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Reshape"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Neg"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean/reduction_indices"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/mod"
  op: "FloorMod"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/add"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/range"
  op: "Range"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/range/start"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Size"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Fill"
  op: "Fill"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/range"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/mod"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/DynamicStitch"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_2_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Tile"
  op: "Tile"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape_2"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape_3"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Prod"
  op: "Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape_2"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Shape_3"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Prod_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Cast"
  op: "Cast"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Tile"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_5"
  op: "AddN"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/moments/mean_grad/truediv"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/LayerNorm/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_5"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_5"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/tuple/control_dependency"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/cond_grad"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/cond_grad:1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/tuple/control_dependency_1"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_5"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_5"
  op: "Identity"
  input: "gradients/Switch_5:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_6"
  op: "Shape"
  input: "gradients/Switch_5:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_5/Const"
  op: "Const"
  input: "^gradients/Identity_5"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_5"
  op: "Fill"
  input: "gradients/Shape_6"
  input: "gradients/zeros_5/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Identity/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/zeros_5"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/tuple/control_dependency"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Shape/Switch:1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_6"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd"
  input: "AttenNet/model/transformer/layer_1/ff/drop_2/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_6"
  op: "Identity"
  input: "gradients/Switch_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_7"
  op: "Shape"
  input: "gradients/Switch_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_6/Const"
  op: "Const"
  input: "^gradients/Identity_6"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_6"
  op: "Fill"
  input: "gradients/Shape_7"
  input: "gradients/zeros_6/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Shape/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/zeros_6"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/mul_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_6"
  op: "AddN"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Identity/Switch_grad/cond_grad"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/dropout/Shape/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/AddN_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AddN_6"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd_grad/BiasAddGrad"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AddN_6"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/drop_2/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/BiasAdd_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot_grad/Reshape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/MatMul"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/MatMul"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/MatMul_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000d\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/MatMul_grad/tuple/control_dependency_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/concat"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_grad/transpose"
  op: "Transpose"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_grad/Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_1_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_1_grad/transpose"
  op: "Transpose"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/Reshape_1_grad/Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_1_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_grad/transpose"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_grad/transpose"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/cond_grad"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_grad/transpose"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/cond_grad:1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/layer_2/Tensordot/transpose_grad/transpose"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/tuple/control_dependency_1"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_7"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Relu"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_7"
  op: "Identity"
  input: "gradients/Switch_7:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_8"
  op: "Shape"
  input: "gradients/Switch_7:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_7/Const"
  op: "Const"
  input: "^gradients/Identity_7"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_7"
  op: "Fill"
  input: "gradients/Shape_8"
  input: "gradients/zeros_7/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Identity/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Merge_grad/tuple/control_dependency"
  input: "gradients/zeros_7"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Shape/Switch:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/tuple/control_dependency"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Shape/Switch:1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/Switch_8"
  op: "Switch"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Relu"
  input: "AttenNet/model/transformer/layer_1/ff/drop_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Identity_8"
  op: "Identity"
  input: "gradients/Switch_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/Shape_9"
  op: "Shape"
  input: "gradients/Switch_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/zeros_8/Const"
  op: "Const"
  input: "^gradients/Identity_8"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "gradients/zeros_8"
  op: "Fill"
  input: "gradients/Shape_9"
  input: "gradients/zeros_8/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Shape/Switch_grad/cond_grad"
  op: "Merge"
  input: "gradients/zeros_8"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/mul_grad/tuple/control_dependency"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_7"
  op: "AddN"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Identity/Switch_grad/cond_grad"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/dropout/Shape/Switch_grad/cond_grad"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/drop_1/cond/Identity/Switch_grad/cond_grad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "gradients/AddN_7"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Relu_grad/ReluGrad"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Relu_grad/ReluGrad"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Relu_grad/ReluGrad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd_grad/BiasAddGrad"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd_grad/BiasAddGrad"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/BiasAdd_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/MatMul"
  op: "MatMul"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot_grad/Reshape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/MatMul"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/MatMul_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/MatMul"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/MatMul"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/MatMul_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/MatMul_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_1_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "d\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/MatMul_grad/tuple/control_dependency_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/concat"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_grad/transpose"
  op: "Transpose"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_grad/Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_1_grad/InvertPermutation"
  op: "InvertPermutation"
  input: "AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_1/perm"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_1_grad/transpose"
  op: "Transpose"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/Reshape_1_grad/Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_1_grad/InvertPermutation"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tperm"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AddN_8"
  op: "AddN"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/add_grad/tuple/control_dependency_1"
  input: "gradients/AttenNet/model/transformer/layer_1/ff/layer_1/Tensordot/transpose_grad/transpose"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/ff/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_8"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_8"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_5"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_1_grad/tuple/control_dependency_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Neg"
  op: "Neg"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Neg"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/tuple/control_dependency_1"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/sub_grad/tuple/control_dependency_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AddN_9"
  op: "AddN"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/tuple/control_dependency_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/tuple/control_dependency_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/Rsqrt"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 100
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Mul"
  op: "Mul"
  input: "gradients/AddN_9"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/gamma/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Mul_1"
  op: "Mul"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/Rsqrt"
  input: "gradients/AddN_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/Rsqrt_grad/RsqrtGrad"
  op: "RsqrtGrad"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/Rsqrt"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_grad/tuple/control_dependency"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Shape_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/Rsqrt_grad/RsqrtGrad"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance/reduction_indices"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/mod"
  op: "FloorMod"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/add"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/range"
  op: "Range"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/range/start"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Size"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Fill"
  op: "Fill"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/range"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/mod"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Maximum"
  op: "Maximum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/DynamicStitch"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/add_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Tile"
  op: "Tile"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape_2"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape_3"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Prod"
  op: "Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape_2"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Prod_1"
  op: "Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Shape_3"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Prod_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Cast"
  op: "Cast"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/truediv"
  op: "RealDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Tile"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/StopGradient"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/scalar"
  op: "Const"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/truediv"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 2.0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Mul"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/scalar"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/sub"
  op: "Sub"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_5"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/StopGradient"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/variance_grad/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/mul_1"
  op: "Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Mul"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Sum"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Sum_1"
  op: "Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/mul_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Neg"
  op: "Neg"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Neg"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Reshape"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Neg"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/Neg"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/add"
  op: "Add"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean/reduction_indices"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/mod"
  op: "FloorMod"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/add"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/range"
  op: "Range"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/range/start"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Size"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Fill"
  op: "Fill"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "index_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/range"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/mod"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Maximum"
  op: "Maximum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/DynamicStitch"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/floordiv"
  op: "FloorDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_2_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Tile"
  op: "Tile"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape_2"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/add_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape_3"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Prod"
  op: "Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape_2"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Prod_1"
  op: "Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Shape_3"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Maximum_1"
  op: "Maximum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Prod_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Prod"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Cast"
  op: "Cast"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Truncate"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/truediv"
  op: "RealDiv"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Tile"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "gradients/AddN_10"
  op: "AddN"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/SquaredDifference_grad/tuple/control_dependency"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/moments/mean_grad/truediv"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/LayerNorm/batchnorm/mul_1_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_0/ff/LayerNorm/batchnorm/add_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Shape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Sum"
  op: "Sum"
  input: "gradients/AddN_10"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Reshape"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Sum"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Sum_1"
  op: "Sum"
  input: "gradients/AddN_10"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Reshape_1"
  op: "Reshape"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Sum_1"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Reshape_1"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Reshape"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Reshape_1"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Reshape_1"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge_grad/cond_grad"
  op: "Switch"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/tuple/control_dependency"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/pred_id"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge_grad/tuple/group_deps"
  op: "NoOp"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge_grad/cond_grad"
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge_grad/tuple/control_dependency"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge_grad/cond_grad"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge_grad/tuple/control_dependency_1"
  op: "Identity"
  input: "gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge_grad/cond_grad:1"
  input: "^gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/Merge_grad/tuple/group_deps"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@gradients/AttenNet/model/transformer/layer_1/rel_attn/add_5_grad/Reshape"
      }
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/mul_1_grad/Shape"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/mul_1_grad/Shape_1"
  op: "Shape"
  input: "AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "gradients/AttenNet/model/transformer/layer_1/rel_attn/dropout_1/cond/dropout/mul_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  attr {
    key: "T"
    value {
    }