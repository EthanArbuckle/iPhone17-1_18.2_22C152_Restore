@interface SEMSkitInfo
+ (id)readOnlySkitInfoAtDirectory:(id)a3;
+ (id)writableSkitInfoAtDirectory:(id)a3 error:(id *)a4;
- (BOOL)commitUpdates:(id *)a3;
- (NSNumber)indexFeatures;
- (NSNumber)localeType;
- (SEMSkitInfo)initWithSkitDirectory:(id)a3 readOnly:(BOOL)a4 error:(id *)a5;
- (void)_createPendingLog;
- (void)clear;
- (void)rollbackUpdates;
- (void)updateIndexFeatures:(id)a3;
- (void)updateLocaleType:(id)a3;
@end

@implementation SEMSkitInfo

+ (id)readOnlySkitInfoAtDirectory:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc((Class)objc_opt_class());
  Only_error = objc_msgSend_initWithSkitDirectory_readOnly_error_(v4, v5, (uint64_t)v3, 1, 0);

  return Only_error;
}

+ (id)writableSkitInfoAtDirectory:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)objc_opt_class());
  Only_error = objc_msgSend_initWithSkitDirectory_readOnly_error_(v6, v7, (uint64_t)v5, 0, a4);

  return Only_error;
}

- (SEMSkitInfo)initWithSkitDirectory:(id)a3 readOnly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SEMSkitInfo;
  v9 = [(SEMSkitInfo *)&v16 init];
  if (v9
    && (v10 = [SEMDictionaryLog alloc],
        uint64_t Only_error = objc_msgSend_initWithFilename_directory_readOnly_error_(v10, v11, @"Info", (uint64_t)v8, v6, a5), log = v9->_log, v9->_log = (SEMDictionaryLog *)Only_error, log, !v9->_log))
  {
    v14 = 0;
  }
  else
  {
    v14 = v9;
  }

  return v14;
}

- (NSNumber)localeType
{
  pending = self->_pending;
  if (!pending) {
    pending = self->_log;
  }
  id v5 = objc_msgSend_objectForKey_(pending, a2, @"localeType", v2);
  return (NSNumber *)v5;
}

- (NSNumber)indexFeatures
{
  pending = self->_pending;
  if (!pending) {
    pending = self->_log;
  }
  id v5 = objc_msgSend_objectForKey_(pending, a2, @"index_features", v2);
  return (NSNumber *)v5;
}

- (void)_createPendingLog
{
  if (!self->_pending)
  {
    objc_msgSend_localeType(self, a2, v2, v3);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = objc_msgSend_indexFeatures(self, v5, v6, v7);
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pending = self->_pending;
    self->_pending = v9;

    if (v13) {
      objc_msgSend_updateLocaleType_(self, v11, (uint64_t)v13, v12);
    }
    if (v8) {
      objc_msgSend_updateIndexFeatures_(self, v11, (uint64_t)v8, v12);
    }
  }
}

- (void)clear
{
  objc_msgSend__createPendingLog(self, a2, v2, v3);
  objc_msgSend_removeAllObjects(self->_pending, v5, v6, v7);
  self->_clear = 1;
}

- (void)updateLocaleType:(id)a3
{
  id v8 = a3;
  objc_msgSend__createPendingLog(self, v4, v5, v6);
  objc_msgSend_setObject_forKey_(self->_pending, v7, (uint64_t)v8, @"localeType");
}

- (void)updateIndexFeatures:(id)a3
{
  id v8 = a3;
  objc_msgSend__createPendingLog(self, v4, v5, v6);
  objc_msgSend_setObject_forKey_(self->_pending, v7, (uint64_t)v8, @"index_features");
}

- (void)rollbackUpdates
{
  pending = self->_pending;
  self->_pending = 0;

  self->_clear = 0;
}

- (BOOL)commitUpdates:(id *)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if (self->_clear && (objc_msgSend_clear_(self->_log, a2, (uint64_t)a3, v3) & 1) == 0)
  {
    objc_msgSend_rollbackUpdates(self, a2, (uint64_t)a3, v3);
    return 0;
  }
  else
  {
    uint64_t v6 = objc_msgSend_allKeys(self->_pending, a2, (uint64_t)a3, v3);
    id v7 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v11 = objc_msgSend_count(v6, v8, v9, v10);
    v14 = objc_msgSend_initWithCapacity_(v7, v12, v11, v13);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v15 = v6;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v32, (uint64_t)v36, 16);
    if (v17)
    {
      uint64_t v20 = v17;
      uint64_t v21 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v33 != v21) {
            objc_enumerationMutation(v15);
          }
          v23 = objc_msgSend_objectForKey_(self->_pending, v18, *(void *)(*((void *)&v32 + 1) + 8 * i), v19, (void)v32);
          objc_msgSend_addObject_(v14, v24, (uint64_t)v23, v25);
        }
        uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v32, (uint64_t)v36, 16);
      }
      while (v20);
    }

    char v27 = objc_msgSend_writeUpdatedObjects_forKeys_error_(self->_log, v26, (uint64_t)v14, (uint64_t)v15, a3);
    objc_msgSend_rollbackUpdates(self, v28, v29, v30);
  }
  return v27;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pending, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

@end