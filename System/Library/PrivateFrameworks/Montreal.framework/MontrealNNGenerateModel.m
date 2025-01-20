@interface MontrealNNGenerateModel
- (MontrealNNGenerateModel)initWithWeightFormat:(unint64_t)a3;
- (MontrealNNModelNetwork)network;
- (MontrealNeuralNetwork)nnObject;
- (NSMutableDictionary)inputs;
- (NSMutableDictionary)outputs;
- (id)modelContainerPath;
- (id)networkInputs;
- (id)networkOutputs;
- (unint64_t)weightFormat;
- (void)addInputs:(id)a3;
- (void)addOutputs:(id)a3;
- (void)dealloc;
- (void)generateModelContainer;
- (void)merge:(id)a3;
- (void)removeInput:(id)a3;
- (void)removeOutput:(id)a3;
- (void)setNnObject:(MontrealNeuralNetwork *)a3;
@end

@implementation MontrealNNGenerateModel

- (MontrealNNGenerateModel)initWithWeightFormat:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)MontrealNNGenerateModel;
  v4 = [(MontrealNNGenerateModel *)&v19 init];
  v5 = v4;
  if (v4)
  {
    v4->_weightFormat = a3;
    v6 = objc_alloc_init(MontrealNNModelNetwork);
    network = v5->_network;
    v5->_network = v6;

    uint64_t v11 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9, v10);
    inputs = v5->_inputs;
    v5->_inputs = (NSMutableDictionary *)v11;

    uint64_t v16 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v13, v14, v15);
    outputs = v5->_outputs;
    v5->_outputs = (NSMutableDictionary *)v16;

    sub_19E2374CC();
  }
  return v5;
}

- (void)dealloc
{
  nnObject = self->_nnObject;
  if (nnObject)
  {
    CFRelease(nnObject);
    self->_nnObject = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MontrealNNGenerateModel;
  [(MontrealNNGenerateModel *)&v4 dealloc];
}

- (void)setNnObject:(MontrealNeuralNetwork *)a3
{
  self->_nnObject = a3;
}

- (MontrealNeuralNetwork)nnObject
{
  result = self->_nnObject;
  if (!result)
  {
    result = (MontrealNeuralNetwork *)MRLNeuralNetworkCreate(0);
    self->_nnObject = result;
  }
  return result;
}

- (void)merge:(id)a3
{
  id v51 = a3;
  v7 = objc_msgSend_network(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_nodes(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_node(v51, v12, v13, v14);
  char v18 = objc_msgSend_containsObject_(v11, v16, (uint64_t)v15, v17);

  if (v18) {
    sub_19E15DB6C(@"Failed to merge %@ to the network as there is one which already exists with the same name", (uint64_t)v19, v20, v21, v22, v23, v24, v25, (uint64_t)v51);
  }
  v26 = objc_msgSend_network(self, v19, v20, v21);
  v30 = objc_msgSend_nodes(v26, v27, v28, v29);
  v34 = objc_msgSend_mutableCopy(v30, v31, v32, v33);

  v38 = objc_msgSend_node(v51, v35, v36, v37);
  objc_msgSend_addObject_(v34, v39, (uint64_t)v38, v40);

  v44 = objc_msgSend_copy(v34, v41, v42, v43);
  v48 = objc_msgSend_network(self, v45, v46, v47);
  objc_msgSend_setNodes_(v48, v49, (uint64_t)v44, v50);
}

- (void)generateModelContainer
{
  uint64_t v5 = objc_msgSend_weightFormat(self, a2, v2, v3);
  if (v5 == 1)
  {
    v35 = objc_msgSend_modelContainerPath(self, v6, v7, v8);
    v38 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v36, (uint64_t)v35, v37);
    v39 = (void *)off_1E9459438(v38, 8, 0);

    return v39;
  }
  else if (v5)
  {
    return 0;
  }
  else
  {
    uint64_t v9 = objc_msgSend_networkInputs(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_network(self, v10, v11, v12);
    objc_msgSend_setInputs_(v13, v14, (uint64_t)v9, v15);

    objc_super v19 = objc_msgSend_networkOutputs(self, v16, v17, v18);
    uint64_t v23 = objc_msgSend_network(self, v20, v21, v22);
    objc_msgSend_setOutputs_(v23, v24, (uint64_t)v19, v25);

    uint64_t v29 = objc_msgSend_network(self, v26, v27, v28);
    ModelContainer = objc_msgSend_generateModelContainer(v29, v30, v31, v32);

    return ModelContainer;
  }
}

- (id)modelContainerPath
{
  uint64_t v5 = objc_msgSend_networkInputs(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_network(self, v6, v7, v8);
  objc_msgSend_setInputs_(v9, v10, (uint64_t)v5, v11);

  uint64_t v15 = objc_msgSend_networkOutputs(self, v12, v13, v14);
  objc_super v19 = objc_msgSend_network(self, v16, v17, v18);
  objc_msgSend_setOutputs_(v19, v20, (uint64_t)v15, v21);

  uint64_t v22 = NSTemporaryDirectory();
  uint64_t v25 = objc_msgSend_stringByAppendingPathComponent_(v22, v23, @"model_generate.XXXXX", v24);

  id v26 = v25;
  v30 = (char *)objc_msgSend_UTF8String(v26, v27, v28, v29);
  uint64_t v31 = mkdtemp(v30);
  v35 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v32, v33, v34);
  size_t v36 = strlen(v31);
  v38 = objc_msgSend_stringWithFileSystemRepresentation_length_(v35, v37, (uint64_t)v31, v36);

  uint64_t v42 = objc_msgSend_network(self, v39, v40, v41);
  objc_msgSend_generateJSONAtPath_(v42, v43, (uint64_t)v38, v44);

  uint64_t v47 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v45, (uint64_t)v38, v46);
  ModelContainerWithJSON = (const void *)MRLNeuralNetworkCreateModelContainerWithJSON(v47);
  id v51 = objc_msgSend_stringByAppendingPathComponent_(v38, v49, @"model_container.nlmodel", v50);
  v54 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v52, (uint64_t)v51, v53);
  off_1E9459460(ModelContainerWithJSON, v54, 1, 0);

  if (ModelContainerWithJSON) {
    CFRelease(ModelContainerWithJSON);
  }

  return v51;
}

- (void)addInputs:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a3;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * v10);
        uint64_t v12 = NSNumber;
        uint64_t v13 = objc_msgSend_inputs(self, v5, v6, v7);
        uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v13, v14, v11, v15);
        uint64_t v20 = objc_msgSend_unsignedIntegerValue(v16, v17, v18, v19);
        uint64_t v23 = objc_msgSend_numberWithUnsignedInteger_(v12, v21, v20 + 1, v22);
        uint64_t v27 = objc_msgSend_inputs(self, v24, v25, v26);
        objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v23, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v8);
  }
}

- (void)removeInput:(id)a3
{
  id v24 = a3;
  objc_super v4 = NSNumber;
  uint64_t v8 = objc_msgSend_inputs(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v24, v10);
  uint64_t v15 = objc_msgSend_unsignedIntegerValue(v11, v12, v13, v14);
  uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(v4, v16, v15 - 1, v17);
  uint64_t v22 = objc_msgSend_inputs(self, v19, v20, v21);
  objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v18, (uint64_t)v24);
}

- (void)addOutputs:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a3;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * v10);
        uint64_t v12 = NSNumber;
        uint64_t v13 = objc_msgSend_outputs(self, v5, v6, v7);
        uint64_t v16 = objc_msgSend_objectForKeyedSubscript_(v13, v14, v11, v15);
        uint64_t v20 = objc_msgSend_unsignedIntegerValue(v16, v17, v18, v19);
        uint64_t v23 = objc_msgSend_numberWithUnsignedInteger_(v12, v21, v20 + 1, v22);
        uint64_t v27 = objc_msgSend_outputs(self, v24, v25, v26);
        objc_msgSend_setObject_forKeyedSubscript_(v27, v28, (uint64_t)v23, v11);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v30, (uint64_t)v34, 16);
    }
    while (v8);
  }
}

- (void)removeOutput:(id)a3
{
  id v24 = a3;
  objc_super v4 = NSNumber;
  uint64_t v8 = objc_msgSend_outputs(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v24, v10);
  uint64_t v15 = objc_msgSend_unsignedIntegerValue(v11, v12, v13, v14);
  uint64_t v18 = objc_msgSend_numberWithUnsignedInteger_(v4, v16, v15 - 1, v17);
  uint64_t v22 = objc_msgSend_outputs(self, v19, v20, v21);
  objc_msgSend_setObject_forKeyedSubscript_(v22, v23, (uint64_t)v18, (uint64_t)v24);
}

- (id)networkInputs
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = objc_msgSend_inputs(self, v6, v7, v8, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_inputs(self, v11, v12, v13);
        uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v18, v19, v17, v20);
        BOOL v25 = objc_msgSend_unsignedIntegerValue(v21, v22, v23, v24) == 1;

        if (v25) {
          objc_msgSend_addObject_(v5, v11, v17, v13);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v14);
  }

  return v5;
}

- (id)networkOutputs
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = objc_msgSend_outputs(self, v6, v7, v8, 0);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_outputs(self, v11, v12, v13);
        uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v18, v19, v17, v20);
        BOOL v25 = objc_msgSend_unsignedIntegerValue(v21, v22, v23, v24) == 1;

        if (v25) {
          objc_msgSend_addObject_(v5, v11, v17, v13);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v14);
  }

  return v5;
}

- (unint64_t)weightFormat
{
  return self->_weightFormat;
}

- (MontrealNNModelNetwork)network
{
  return (MontrealNNModelNetwork *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableDictionary)inputs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableDictionary)outputs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);

  objc_storeStrong((id *)&self->_network, 0);
}

@end