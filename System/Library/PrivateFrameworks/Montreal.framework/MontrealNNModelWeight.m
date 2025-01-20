@interface MontrealNNModelWeight
- (MontrealNNModelQuantization)quantization;
- (MontrealNNModelWeight)initWithDictionary:(id)a3 quantization:(id)a4 jsonDir:(id)a5;
- (MontrealNNModelWeight)initWithName:(id)a3 index:(id)a4 dimension:(id)a5;
- (MontrealNNModelWeight)initWithName:(id)a3 index:(id)a4 dimension:(id)a5 weightData:(id)a6;
- (MontrealNNModelWeight)initWithName:(id)a3 index:(id)a4 dimension:(id)a5 weightValues:(id)a6;
- (NSArray)dimension;
- (NSArray)weightValues;
- (NSData)weightData;
- (NSNumber)index;
- (NSString)jsonDir;
- (NSString)name;
- (id)checkForValidity;
- (id)createConvertArrayToData:(id)a3 quantization:(id)a4;
- (id)createDataContainer;
- (id)createflattenWeightsFile:(id)a3;
- (id)createflattenWeightsHierarchy:(id)a3;
- (id)jsonDescription;
- (void)description:(id)a3 indent:(id)a4;
- (void)generateJSONAtPath:(id)a3;
@end

@implementation MontrealNNModelWeight

- (id)checkForValidity
{
  v21[2] = *MEMORY[0x1E4F143B8];
  v5 = objc_msgSend_name(self, a2, v2, v3);
  v20[0] = v5;
  v20[1] = @"name";
  v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v20, 2);
  v21[0] = v7;
  v11 = objc_msgSend_index(self, v8, v9, v10);
  v19[0] = v11;
  v19[1] = @"index";
  v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v12, (uint64_t)v19, 2);
  v21[1] = v13;
  v15 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v14, (uint64_t)v21, 2);
  objc_msgSend_checkForValidity_(self, v16, (uint64_t)v15, v17);

  return self;
}

- (MontrealNNModelWeight)initWithName:(id)a3 index:(id)a4 dimension:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MontrealNNModelWeight;
  v12 = [(MontrealNNModelWeight *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_index, a4);
    objc_storeStrong((id *)&v13->_dimension, a5);
  }

  return v13;
}

- (MontrealNNModelWeight)initWithName:(id)a3 index:(id)a4 dimension:(id)a5 weightData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = objc_msgSend_initWithName_index_dimension_(self, v14, (uint64_t)v10, (uint64_t)v11, v12);
  v19 = (void *)v15;
  if (v15) {
    objc_storeStrong((id *)(v15 + 40), a6);
  }
  objc_msgSend_checkForValidity(v19, v16, v17, v18);
  v20 = (MontrealNNModelWeight *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (MontrealNNModelWeight)initWithName:(id)a3 index:(id)a4 dimension:(id)a5 weightValues:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v15 = objc_msgSend_initWithName_index_dimension_(self, v14, (uint64_t)v10, (uint64_t)v11, v12);
  v19 = (void *)v15;
  if (v15) {
    objc_storeStrong((id *)(v15 + 32), a6);
  }
  objc_msgSend_checkForValidity(v19, v16, v17, v18);
  v20 = (MontrealNNModelWeight *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (MontrealNNModelWeight)initWithDictionary:(id)a3 quantization:(id)a4 jsonDir:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)MontrealNNModelWeight;
  v14 = [(MontrealNNModelWeight *)&v27 init];
  if (v14)
  {
    uint64_t v15 = objc_msgSend_exMRL_stringForKey_(v8, v11, (uint64_t)off_1E9457F50, v13);
    name = v14->_name;
    v14->_name = (NSString *)v15;

    uint64_t v19 = objc_msgSend_exMRL_arrayForKey_(v8, v17, (uint64_t)off_1E9457F48, v18);
    dimension = v14->_dimension;
    v14->_dimension = (NSArray *)v19;

    uint64_t v23 = objc_msgSend_exMRL_numberForKey_(v8, v21, (uint64_t)off_1E9457F40, v22);
    index = v14->_index;
    v14->_index = (NSNumber *)v23;

    objc_storeStrong((id *)&v14->_quantization, a4);
    objc_storeStrong((id *)&v14->_jsonDir, a5);
  }
  objc_msgSend_checkForValidity(v14, v11, v12, v13);
  v25 = (MontrealNNModelWeight *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_name(self, v7, v8, v9);
  objc_msgSend_appendFormat_(v29, v11, @"\r %@ Name = %@ ", v12, v6, v10);

  v16 = objc_msgSend_index(self, v13, v14, v15);
  objc_msgSend_appendFormat_(v29, v17, @"\r %@ Index = %@ ", v18, v6, v16);

  uint64_t v22 = objc_msgSend_dimension(self, v19, v20, v21);
  v26 = objc_msgSend_exMRL_numberArrayDescription(v22, v23, v24, v25);
  objc_msgSend_appendFormat_(v29, v27, @"\r %@ Dimension = %@ ", v28, v6, v26);
}

- (id)jsonDescription
{
  v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v9 = objc_msgSend_name(self, v6, v7, v8);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v10, (uint64_t)v9, (uint64_t)off_1E9457F50);

  uint64_t v14 = objc_msgSend_dimension(self, v11, v12, v13);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v15, (uint64_t)v14, (uint64_t)off_1E94581D0);

  uint64_t v19 = objc_msgSend_index(self, v16, v17, v18);
  objc_msgSend_setObject_forKeyedSubscript_(v5, v20, (uint64_t)v19, (uint64_t)off_1E9457F40);

  uint64_t v24 = objc_msgSend_copy(v5, v21, v22, v23);

  return v24;
}

- (void)generateJSONAtPath:(id)a3
{
  id v67 = a3;
  uint64_t v7 = objc_msgSend_jsonDir(self, v4, v5, v6);

  if (v7)
  {
    id v11 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v12 = NSString;
    uint64_t v13 = objc_msgSend_jsonDir(self, v8, v9, v10);
    uint64_t v17 = objc_msgSend_index(self, v14, v15, v16);
    uint64_t v20 = objc_msgSend_stringWithFormat_(v12, v18, @"%@/%@.json", v19, v13, v17);
    uint64_t v23 = objc_msgSend_fileURLWithPath_(v11, v21, (uint64_t)v20, v22);

    uint64_t v24 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v25 = NSString;
    id v29 = objc_msgSend_index(self, v26, v27, v28);
    uint64_t v32 = objc_msgSend_stringWithFormat_(v25, v30, @"%@/%@.json", v31, v67, v29);
    v35 = objc_msgSend_fileURLWithPath_(v24, v33, v32, v34);

    v39 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v36, v37, v38);
    LOBYTE(v32) = objc_msgSend_copyItemAtURL_toURL_error_(v39, v40, (uint64_t)v23, (uint64_t)v35, 0);

    if ((v32 & 1) == 0) {
      sub_19E15DB6C(@"%@ Source file %@ doesn't exist", v41, v42, v43, v44, v45, v46, v47, (uint64_t)self);
    }
  }
  else
  {
    v48 = objc_msgSend_weightValues(self, v8, v9, v10);

    if (!v48) {
      sub_19E15DB6C(@"%@ Cannot generate JSON weights file", (uint64_t)v49, v50, v51, v52, v53, v54, v55, (uint64_t)self);
    }
    v56 = (void *)MEMORY[0x1E4F28D90];
    v57 = objc_msgSend_weightValues(self, v49, v50, v51);
    uint64_t v23 = objc_msgSend_dataWithJSONObject_options_error_(v56, v58, (uint64_t)v57, 1, 0);

    v59 = NSString;
    v35 = objc_msgSend_index(self, v60, v61, v62);
    v65 = objc_msgSend_stringWithFormat_(v59, v63, @"%@/%@.json", v64, v67, v35);
    objc_msgSend_writeToFile_atomically_(v23, v66, (uint64_t)v65, 1);
  }
}

- (id)createDataContainer
{
  uint64_t v5 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, v2, v3);
  uint64_t v6 = NSString;
  uint64_t v10 = objc_msgSend_jsonDir(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_index(self, v11, v12, v13);
  uint64_t v17 = objc_msgSend_stringWithFormat_(v6, v15, @"%@/%@.json", v16, v10, v14);

  uint64_t v21 = objc_msgSend_defaultManager(MEMORY[0x1E4F28CB8], v18, v19, v20);
  LODWORD(v14) = objc_msgSend_fileExistsAtPath_(v21, v22, (uint64_t)v17, v23);

  if (v14)
  {
    uint64_t v27 = objc_msgSend_createflattenWeightsFile_(self, v24, (uint64_t)v17, v26);
    uint64_t v31 = objc_msgSend_quantization(self, v28, v29, v30);
    v33 = objc_msgSend_createConvertArrayToData_quantization_(self, v32, (uint64_t)v27, (uint64_t)v31);

    uint64_t v37 = objc_msgSend_index(self, v34, v35, v36);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v38, (uint64_t)v33, (uint64_t)v37);
  }
  else
  {
    v39 = objc_msgSend_weightData(self, v24, v25, v26);

    if (!v39) {
      sub_19E15DB6C(@"%@ No weights file or data to add to data container", (uint64_t)v40, v41, v42, v43, v44, v45, v46, (uint64_t)self);
    }
    uint64_t v27 = objc_msgSend_weightData(self, v40, v41, v42);
    v33 = objc_msgSend_index(self, v47, v48, v49);
    objc_msgSend_setObject_forKeyedSubscript_(v5, v50, (uint64_t)v27, (uint64_t)v33);
  }

  uint64_t v54 = objc_msgSend_copy(v5, v51, v52, v53);

  return v54;
}

- (id)createflattenWeightsFile:(id)a3
{
  uint64_t v5 = objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E4F1C9B8], a2, (uint64_t)a3, v3);
  uint64_t v7 = objc_msgSend_JSONObjectWithData_options_error_(MEMORY[0x1E4F28D90], v6, (uint64_t)v5, 0, 0);
  uint64_t v10 = objc_msgSend_createflattenWeightsHierarchy_(self, v8, (uint64_t)v7, v9);

  return v10;
}

- (id)createflattenWeightsHierarchy:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v5, v6, v7);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v4;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v27;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_msgSend_addObjectsFromArray_(v8, v15, (uint64_t)v9, v16, (void)v26);
          goto LABEL_13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v19 = objc_msgSend_createflattenWeightsHierarchy_(self, v17, v14, v18, (void)v26);
          objc_msgSend_addObjectsFromArray_(v8, v20, (uint64_t)v19, v21);
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v17, (uint64_t)&v26, (uint64_t)v30, 16);
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  uint64_t v24 = objc_msgSend_arrayWithArray_(MEMORY[0x1E4F1C978], v22, (uint64_t)v8, v23);

  return v24;
}

- (id)createConvertArrayToData:(id)a3 quantization:(id)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  sub_19E315574((uint64_t)v83, 4);
  unint64_t v10 = objc_msgSend_count(v5, v7, v8, v9);
  unint64_t v11 = v10;
  v80 = 0;
  v81 = 0;
  v82 = 0;
  if (v10)
  {
    if (v10 >> 62) {
      sub_19E13D694();
    }
    size_t v12 = 4 * v10;
    uint64_t v13 = (char *)operator new(4 * v10);
    v80 = v13;
    v82 = &v13[4 * v11];
    bzero(v13, v12);
    v81 = v82;
  }
  else
  {
    uint64_t v13 = 0;
  }
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  id v14 = v5;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v76, (uint64_t)v86, 16);
  if (v19)
  {
    int v20 = 0;
    uint64_t v21 = *(void *)v77;
    do
    {
      uint64_t v22 = 0;
      int v23 = v20;
      uint64_t v24 = &v13[4 * v20];
      do
      {
        if (*(void *)v77 != v21) {
          objc_enumerationMutation(v14);
        }
        objc_msgSend_floatValue(*(void **)(*((void *)&v76 + 1) + 8 * v22), v16, v17, v18);
        *(_DWORD *)&v24[4 * v22++] = v25;
      }
      while (v19 != v22);
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v16, (uint64_t)&v76, (uint64_t)v86, 16);
      int v20 = v23 + v22;
    }
    while (v19);
  }

  long long v29 = objc_msgSend_weightStorage(v6, v26, v27, v28);
  v33 = objc_msgSend_weightStorageRange(v6, v30, v31, v32);
  if (objc_msgSend_isEqualToString_(v29, v34, (uint64_t)off_1E9458168, v35))
  {
    uint64_t v39 = objc_msgSend_count(v14, v36, v37, v38);
    v73 = 0;
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    if (v39)
    {
      if (v39 < 0) {
        sub_19E13D694();
      }
      size_t v43 = 2 * v39;
      uint64_t v44 = operator new(2 * v39);
      bzero(v44, v43);
    }
    else
    {
      uint64_t v44 = 0;
    }
    vImagePixelCount v53 = objc_msgSend_count(v14, v40, v41, v42);
    sub_19E302FA0(v13, v44, v53);
    objc_msgSend_count(v14, v54, v55, v56);
    std::ostream::write();
  }
  else
  {
    if (!objc_msgSend_isEqualToString_(v29, v36, (uint64_t)off_1E9458170, v38))
    {
      objc_msgSend_count(v14, v45, v46, v47);
      std::ostream::write();
      goto LABEL_27;
    }
    size_t v48 = objc_msgSend_count(v14, v45, v46, v47);
    size_t v52 = v48;
    v73 = 0;
    uint64_t v74 = 0;
    uint64_t v75 = 0;
    if (v48)
    {
      if ((v48 & 0x8000000000000000) != 0) {
        sub_19E13D694();
      }
      uint64_t v44 = operator new(v48);
      bzero(v44, v52);
    }
    else
    {
      uint64_t v44 = 0;
    }
    objc_msgSend_floatValue(v33, v49, v50, v51);
    float v58 = v57;
    uint64_t v62 = objc_msgSend_count(v14, v59, v60, v61);
    sub_19E303030((float *)v13, v44, v62, v58);
    objc_msgSend_count(v14, v63, v64, v65);
    std::ostream::write();
  }
  if (v44) {
    operator delete(v44);
  }
LABEL_27:
  std::stringbuf::str();
  v66 = (void *)MEMORY[0x1E4F1C9B8];
  std::stringbuf::str();
  if (v72 >= 0) {
    v68 = &v71;
  }
  else {
    v68 = v71;
  }
  if (v75 >= 0) {
    objc_msgSend_dataWithBytes_length_(v66, v67, (uint64_t)v68, HIBYTE(v75));
  }
  else {
  v69 = objc_msgSend_dataWithBytes_length_(v66, v67, (uint64_t)v68, v74);
  }
  if (v72 < 0)
  {
    operator delete(v71);
    if ((SHIBYTE(v75) & 0x80000000) == 0) {
      goto LABEL_35;
    }
  }
  else if ((SHIBYTE(v75) & 0x80000000) == 0)
  {
    goto LABEL_35;
  }
  operator delete(v73);
LABEL_35:

  if (v13) {
    operator delete(v13);
  }
  v83[0] = *MEMORY[0x1E4FBA418];
  *(void *)((char *)v83 + *(void *)(v83[0] - 24)) = *(void *)(MEMORY[0x1E4FBA418] + 24);
  v83[1] = MEMORY[0x1E4FBA470] + 16;
  if (v84 < 0) {
    operator delete((void *)v83[9]);
  }
  std::streambuf::~streambuf();
  std::ostream::~ostream();
  MEMORY[0x19F3BBB40](&v85);

  return v69;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)dimension
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)weightValues
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSData)weightData
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (MontrealNNModelQuantization)quantization
{
  return (MontrealNNModelQuantization *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)jsonDir
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_jsonDir, 0);
  objc_storeStrong((id *)&self->_quantization, 0);
  objc_storeStrong((id *)&self->_weightData, 0);
  objc_storeStrong((id *)&self->_weightValues, 0);
  objc_storeStrong((id *)&self->_dimension, 0);
  objc_storeStrong((id *)&self->_index, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end