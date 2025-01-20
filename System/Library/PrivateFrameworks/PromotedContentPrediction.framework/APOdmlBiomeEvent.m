@interface APOdmlBiomeEvent
+ (id)_customClassesForDataDict;
+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4;
- (APOdmlBiomeEvent)initWithDictionary:(id)a3 andIdentifier:(id)a4;
- (NSDictionary)dictionary;
- (NSMutableDictionary)outerDictionary;
- (NSUUID)identifier;
- (id)json;
- (id)jsonDict;
- (id)serialize;
- (unsigned)dataVersion;
- (void)setOuterDictionary:(id)a3;
@end

@implementation APOdmlBiomeEvent

- (APOdmlBiomeEvent)initWithDictionary:(id)a3 andIdentifier:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)APOdmlBiomeEvent;
  v10 = [(APOdmlBiomeEvent *)&v23 init];
  if (v10)
  {
    uint64_t v11 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9);
    outerDictionary = v10->_outerDictionary;
    v10->_outerDictionary = (NSMutableDictionary *)v11;

    v13 = v10->_outerDictionary;
    v16 = objc_msgSend_copy(v6, v14, v15);
    objc_msgSend_setObject_forKey_(v13, v17, (uint64_t)v16, @"data");

    if (v7)
    {
      v19 = v10->_outerDictionary;
      v24 = @"identifier";
      v25[0] = v7;
      v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v25, &v24, 1);
      objc_msgSend_setValuesForKeysWithDictionary_(v19, v21, (uint64_t)v20);
    }
  }

  return v10;
}

- (NSDictionary)dictionary
{
  v3 = objc_msgSend_outerDictionary(self, a2, v2);
  v5 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"data");

  return (NSDictionary *)v5;
}

- (NSUUID)identifier
{
  v3 = objc_msgSend_outerDictionary(self, a2, v2);
  v5 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"identifier");

  return (NSUUID *)v5;
}

+ (id)_customClassesForDataDict
{
  uint64_t v2 = MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_setWithObject_, v3);
}

- (unsigned)dataVersion
{
  return 1;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v8 = objc_msgSend_classesForDataDict(APOdmlTrainingSetBuilder, v6, v7);
  uint64_t v11 = objc_msgSend__customClassesForDataDict(a1, v9, v10);
  v13 = objc_msgSend_setByAddingObjectsFromSet_(v8, v12, (uint64_t)v11);

  id v31 = 0;
  uint64_t v15 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E4F28DC0], v14, (uint64_t)v13, v5, &v31);

  id v17 = v31;
  if (v15)
  {
    v18 = objc_msgSend_objectForKeyedSubscript_(v15, v16, @"data");
    if (v18)
    {
      id v19 = objc_alloc((Class)objc_opt_class());
      v21 = objc_msgSend_objectForKeyedSubscript_(v15, v20, @"identifier");
      objc_super v23 = objc_msgSend_initWithDictionary_andIdentifier_(v19, v22, (uint64_t)v18, v21);
    }
    else
    {
      v21 = OdmlLogForCategory(0xCuLL);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v33 = (uint64_t)v15;
        _os_log_impl(&dword_1BBC44000, v21, OS_LOG_TYPE_ERROR, "No data in deserialized dictionary:\n%@", buf, 0xCu);
      }
      objc_super v23 = 0;
    }
  }
  else
  {
    v18 = OdmlLogForCategory(0xCuLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v26 = objc_msgSend_code(v17, v24, v25);
      v29 = objc_msgSend_localizedDescription(v17, v27, v28);
      *(_DWORD *)buf = 134218242;
      uint64_t v33 = v26;
      __int16 v34 = 2112;
      v35 = v29;
      _os_log_impl(&dword_1BBC44000, v18, OS_LOG_TYPE_ERROR, "Error %ld unarchiving event data: %@", buf, 0x16u);
    }
    objc_super v23 = 0;
  }

  return v23;
}

- (id)serialize
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (void *)MEMORY[0x1E4F28DB0];
  id v5 = objc_msgSend_outerDictionary(self, a2, v2);
  id v21 = 0;
  uint64_t v7 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v4, v6, (uint64_t)v5, 1, &v21);
  id v8 = v21;

  if (v8) {
    BOOL v9 = 1;
  }
  else {
    BOOL v9 = v7 == 0;
  }
  if (v9)
  {
    uint64_t v10 = OdmlLogForCategory(0xCuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = objc_msgSend_code(v8, v11, v12);
      v16 = objc_msgSend_localizedDescription(v8, v14, v15);
      id v19 = objc_msgSend_outerDictionary(self, v17, v18);
      *(_DWORD *)buf = 134218498;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      __int16 v26 = 2112;
      v27 = v19;
      _os_log_impl(&dword_1BBC44000, v10, OS_LOG_TYPE_ERROR, "Error %ld encoding event data: %@\nData:\n%@", buf, 0x20u);
    }
  }

  return v7;
}

- (id)json
{
  return 0;
}

- (id)jsonDict
{
  return 0;
}

- (NSMutableDictionary)outerDictionary
{
  return self->_outerDictionary;
}

- (void)setOuterDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end