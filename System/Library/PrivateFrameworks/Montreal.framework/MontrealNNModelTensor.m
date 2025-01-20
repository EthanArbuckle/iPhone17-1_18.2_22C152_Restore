@interface MontrealNNModelTensor
+ (id)createInputs:(id *)a3 inputChunks:(id)a4 nodeName:(id)a5;
+ (id)createOutputs:(id *)a3 outputChunks:(id)a4 nodeName:(id)a5;
- (BOOL)isEqual:(id)a3;
- (MontrealNNModelTensor)initWithDictionary:(id)a3;
- (MontrealNNModelTensor)initWithName:(id)a3 dimension:(id)a4;
- (NSArray)dimension;
- (NSHashTable)asInput;
- (NSHashTable)asOutput;
- (NSString)name;
- (id)checkForValidity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)jsonDescription;
- (unint64_t)hash;
- (unint64_t)tensorSize;
- (void)description:(id)a3 indent:(id)a4;
@end

@implementation MontrealNNModelTensor

- (id)checkForValidity
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_name(self, a2, v2, v3);
  v13[0] = v5;
  v13[1] = @"name";
  v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v13, 2);
  v14[0] = v7;
  v9 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v8, (uint64_t)v14, 1);
  objc_msgSend_checkForValidity_(self, v10, (uint64_t)v9, v11);

  return self;
}

- (MontrealNNModelTensor)initWithName:(id)a3 dimension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v26.receiver = self;
  v26.super_class = (Class)MontrealNNModelTensor;
  v9 = [(MontrealNNModelTensor *)&v26 init];
  v13 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_name, a3);
    objc_storeStrong((id *)&v13->_dimension, a4);
    uint64_t v17 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v14, v15, v16);
    asInput = v13->_asInput;
    v13->_asInput = (NSHashTable *)v17;

    uint64_t v22 = objc_msgSend_weakObjectsHashTable(MEMORY[0x1E4F28D30], v19, v20, v21);
    asOutput = v13->_asOutput;
    v13->_asOutput = (NSHashTable *)v22;
  }
  objc_msgSend_checkForValidity(v13, v10, v11, v12);
  v24 = (MontrealNNModelTensor *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (unint64_t)tensorSize
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = objc_msgSend_dimension(self, a2, v2, v3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v16;
    unint64_t v12 = 1;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v4);
        }
        v12 *= objc_msgSend_unsignedIntegerValue(*(void **)(*((void *)&v15 + 1) + 8 * v13++), v7, v8, v9);
      }
      while (v10 != v13);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v10);
  }
  else
  {
    unint64_t v12 = 1;
  }

  return v12;
}

- (MontrealNNModelTensor)initWithDictionary:(id)a3
{
  v4 = off_1E94581C8;
  id v5 = a3;
  uint64_t v8 = objc_msgSend_exMRL_stringForKey_(v5, v6, (uint64_t)v4, v7);
  uint64_t v11 = objc_msgSend_exMRL_arrayForKey_(v5, v9, (uint64_t)off_1E94581D0, v10);

  uint64_t v13 = (MontrealNNModelTensor *)objc_msgSend_initWithName_dimension_(self, v12, (uint64_t)v8, (uint64_t)v11);
  return v13;
}

- (void)description:(id)a3 indent:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_name(self, v8, v9, v10);
  objc_msgSend_appendFormat_(v6, v12, @"\r %@ Name = %@", v13, v7, v11);

  long long v17 = objc_msgSend_dimension(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_exMRL_numberArrayDescription(v17, v18, v19, v20);
  objc_msgSend_appendFormat_(v6, v22, @"\r %@ Dimension = %@", v23, v7, v21);

  objc_msgSend_appendFormat_(v6, v24, @"\r %@ As Input", v25, v7);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v29 = objc_msgSend_asInput(self, v26, v27, v28);
  v33 = objc_msgSend_allObjects(v29, v30, v31, v32);

  uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v34, (uint64_t)&v78, (uint64_t)v83, 16);
  if (v35)
  {
    uint64_t v38 = v35;
    uint64_t v39 = *(void *)v79;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v79 != v39) {
          objc_enumerationMutation(v33);
        }
        v41 = *(void **)(*((void *)&v78 + 1) + 8 * v40);
        v42 = objc_msgSend_indentByFactor_(v7, v36, 1, v37);
        v46 = objc_msgSend_name(v41, v43, v44, v45);
        objc_msgSend_appendFormat_(v6, v47, @"\r %@ %@", v48, v42, v46);

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v33, v36, (uint64_t)&v78, (uint64_t)v83, 16);
    }
    while (v38);
  }

  objc_msgSend_appendFormat_(v6, v49, @"\r %@ As Output", v50, v7);
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v54 = objc_msgSend_asOutput(self, v51, v52, v53);
  v58 = objc_msgSend_allObjects(v54, v55, v56, v57);

  uint64_t v60 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v74, (uint64_t)v82, 16);
  if (v60)
  {
    uint64_t v63 = v60;
    uint64_t v64 = *(void *)v75;
    do
    {
      uint64_t v65 = 0;
      do
      {
        if (*(void *)v75 != v64) {
          objc_enumerationMutation(v58);
        }
        v66 = *(void **)(*((void *)&v74 + 1) + 8 * v65);
        v67 = objc_msgSend_indentByFactor_(v7, v61, 1, v62);
        v71 = objc_msgSend_name(v66, v68, v69, v70);
        objc_msgSend_appendFormat_(v6, v72, @"\r %@ %@", v73, v67, v71);

        ++v65;
      }
      while (v63 != v65);
      uint64_t v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v61, (uint64_t)&v74, (uint64_t)v82, 16);
    }
    while (v63);
  }
}

- (id)jsonDescription
{
  id v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v9 = objc_msgSend_name(self, v6, v7, v8);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v10, (uint64_t)v9, (uint64_t)off_1E94581C8);

  v14 = objc_msgSend_dimension(self, v11, v12, v13);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v15, (uint64_t)v14, (uint64_t)off_1E94581D0);

  uint64_t v19 = objc_msgSend_copy(v5, v16, v17, v18);

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v9 = objc_msgSend_name(self, v6, v7, v8);
    uint64_t v13 = objc_msgSend_name(v5, v10, v11, v12);

    char isEqual = objc_msgSend_isEqual_(v9, v14, (uint64_t)v13, v15);
  }
  else
  {
    char isEqual = 0;
  }

  return isEqual;
}

- (unint64_t)hash
{
  id v4 = objc_msgSend_name(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_hash(v4, v5, v6, v7);

  return v8;
}

+ (id)createInputs:(id *)a3 inputChunks:(id)a4 nodeName:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  uint64_t v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v20 = NSString;
        uint64_t v21 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v14, 1, v15);
        v24 = objc_msgSend_stringWithFormat_(v20, v22, @"tensor_input_%@_%@", v23, v7, v21);

        uint64_t v25 = [MontrealNNModelTensor alloc];
        uint64_t v27 = objc_msgSend_initWithName_dimension_(v25, v26, (uint64_t)v24, v19);
        objc_msgSend_addObject_(v11, v28, (uint64_t)v27, v29);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v16);
  }

  return v11;
}

+ (id)createOutputs:(id *)a3 outputChunks:(id)a4 nodeName:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  uint64_t v11 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v6;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v20 = NSString;
        uint64_t v21 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v14, 1, v15);
        v24 = objc_msgSend_stringWithFormat_(v20, v22, @"tensor_output_%@_%@", v23, v7, v21);

        uint64_t v25 = [MontrealNNModelTensor alloc];
        uint64_t v27 = objc_msgSend_initWithName_dimension_(v25, v26, (uint64_t)v24, v19);
        objc_msgSend_addObject_(v11, v28, (uint64_t)v27, v29);
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v16);
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_allocWithZone_(MontrealNNModelTensor, a2, (uint64_t)a3, v3);
  uint64_t v9 = objc_msgSend_name(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_dimension(self, v10, v11, v12);
  uint64_t v15 = objc_msgSend_initWithName_dimension_(v5, v14, (uint64_t)v9, (uint64_t)v13);

  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  uint64_t v19 = objc_msgSend_asInput(self, v16, v17, v18);
  uint64_t v23 = objc_msgSend_allObjects(v19, v20, v21, v22);

  uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v61, (uint64_t)v66, 16);
  if (v25)
  {
    uint64_t v29 = v25;
    uint64_t v30 = *(void *)v62;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v62 != v30) {
          objc_enumerationMutation(v23);
        }
        uint64_t v32 = *(void *)(*((void *)&v61 + 1) + 8 * v31);
        long long v33 = objc_msgSend_asInput(v15, v26, v27, v28);
        objc_msgSend_addObject_(v33, v34, v32, v35);

        ++v31;
      }
      while (v29 != v31);
      uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v26, (uint64_t)&v61, (uint64_t)v66, 16);
    }
    while (v29);
  }

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v39 = objc_msgSend_asOutput(self, v36, v37, v38, 0);
  v43 = objc_msgSend_allObjects(v39, v40, v41, v42);

  uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v57, (uint64_t)v65, 16);
  if (v45)
  {
    uint64_t v49 = v45;
    uint64_t v50 = *(void *)v58;
    do
    {
      uint64_t v51 = 0;
      do
      {
        if (*(void *)v58 != v50) {
          objc_enumerationMutation(v43);
        }
        uint64_t v52 = *(void *)(*((void *)&v57 + 1) + 8 * v51);
        uint64_t v53 = objc_msgSend_asOutput(v15, v46, v47, v48);
        objc_msgSend_addObject_(v53, v54, v52, v55);

        ++v51;
      }
      while (v49 != v51);
      uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v46, (uint64_t)&v57, (uint64_t)v65, 16);
    }
    while (v49);
  }

  return v15;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)dimension
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSHashTable)asInput
{
  return (NSHashTable *)objc_getProperty(self, a2, 24, 1);
}

- (NSHashTable)asOutput
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asOutput, 0);
  objc_storeStrong((id *)&self->_asInput, 0);
  objc_storeStrong((id *)&self->_dimension, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end