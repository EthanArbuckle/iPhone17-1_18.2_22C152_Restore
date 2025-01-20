@interface REMAuxiliaryChangeInfoFetchResult
+ (id)auxiliaryChangeInfoFetchResultOfType:(Class)a3;
- (Class)typedKlass;
- (NSArray)auxiliaryChangeInfos;
- (NSMutableDictionary)changeObjectForAuxiliaryChangeInfoMap;
- (REMAuxiliaryChangeInfoFetchResult)initWithAuxiliaryChangeInfoType:(Class)a3;
- (id)auxiliaryChangeInfoFromData:(id)a3 withObjectID:(id)a4 fromChangeObject:(id)a5 error:(id *)a6;
- (id)changeObjectForAuxiliaryChangeInfo:(id)a3;
- (void)setAuxiliaryChangeInfos:(id)a3;
- (void)setChangeObjectForAuxiliaryChangeInfoMap:(id)a3;
- (void)setTypedKlass:(Class)a3;
@end

@implementation REMAuxiliaryChangeInfoFetchResult

- (REMAuxiliaryChangeInfoFetchResult)initWithAuxiliaryChangeInfoType:(Class)a3
{
  v9.receiver = self;
  v9.super_class = (Class)REMAuxiliaryChangeInfoFetchResult;
  v4 = [(REMAuxiliaryChangeInfoFetchResult *)&v9 init];
  v5 = v4;
  if (a3 && v4)
  {
    v4->_typedKlass = a3;
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    changeObjectForAuxiliaryChangeInfoMap = v5->_changeObjectForAuxiliaryChangeInfoMap;
    v5->_changeObjectForAuxiliaryChangeInfoMap = (NSMutableDictionary *)v6;
  }
  return v5;
}

- (id)changeObjectForAuxiliaryChangeInfo:(id)a3
{
  id v4 = a3;
  v5 = [(REMAuxiliaryChangeInfoFetchResult *)self changeObjectForAuxiliaryChangeInfoMap];
  uint64_t v6 = [v4 remObjectID];

  v7 = [v5 objectForKey:v6];

  return v7;
}

- (NSArray)auxiliaryChangeInfos
{
  return self->_auxiliaryChangeInfos;
}

- (Class)typedKlass
{
  return self->_typedKlass;
}

- (void)setTypedKlass:(Class)a3
{
  self->_typedKlass = a3;
}

- (NSMutableDictionary)changeObjectForAuxiliaryChangeInfoMap
{
  return self->_changeObjectForAuxiliaryChangeInfoMap;
}

- (void)setChangeObjectForAuxiliaryChangeInfoMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeObjectForAuxiliaryChangeInfoMap, 0);

  objc_storeStrong((id *)&self->_auxiliaryChangeInfos, 0);
}

+ (id)auxiliaryChangeInfoFetchResultOfType:(Class)a3
{
  v3 = [[REMAuxiliaryChangeInfoFetchResult alloc] initWithAuxiliaryChangeInfoType:a3];

  return v3;
}

- (id)auxiliaryChangeInfoFromData:(id)a3 withObjectID:(id)a4 fromChangeObject:(id)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = objc_opt_class();
  id v14 = objc_alloc([(REMAuxiliaryChangeInfoFetchResult *)self typedKlass]);
  v15 = REMCheckedDynamicCast(v13, (uint64_t)v14);

  v16 = (void *)[v15 initWithREMObjectID:v11];
  if (v16)
  {
    id v31 = v12;
    id v32 = 0;
    id v30 = v10;
    v17 = [MEMORY[0x1E4F28F98] propertyListWithData:v10 options:0 format:0 error:&v32];
    v18 = v32;
    v19 = v18;
    if (!v17 || v18)
    {
      v24 = [MEMORY[0x1E4F28C58] errorWithREMChangeErrorCode:10 underlyingError:v18];
      v20 = +[REMLog changeTracking];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v25 = NSStringFromClass([(REMAuxiliaryChangeInfoFetchResult *)self typedKlass]);
        v26 = [v19 localizedDescription];
        *(_DWORD *)buf = 138543874;
        v34 = v25;
        __int16 v35 = 2114;
        id v36 = v11;
        __int16 v37 = 2114;
        v38 = v26;
        _os_log_error_impl(&dword_1B9AA2000, v20, OS_LOG_TYPE_ERROR, "REMChangeTracking+AuxiliaryChgInfo: Failed to decode data to plist dictionary for {class: %{public}@, remObjectID: %{public}@, plistError: %{public}@}", buf, 0x20u);
      }
    }
    else
    {
      v20 = [v17 objectForKey:@"identifier"];
      if (v20)
      {
        v21 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v20];
        v22 = v21;
        if (v21)
        {
          v21 = [(id)objc_opt_class() objectIDWithUUID:v21];
        }
        if (-[NSObject isEqual:](v21, "isEqual:", v11, v21))
        {
          [v16 setStorage:v17];
          v23 = [(REMAuxiliaryChangeInfoFetchResult *)self changeObjectForAuxiliaryChangeInfoMap];
          [v23 setObject:v31 forKeyedSubscript:v11];
          v24 = 0;
        }
        else
        {
          v24 = [MEMORY[0x1E4F28C58] errorWithREMChangeErrorCode:10];
          v23 = +[REMLog changeTracking];
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            v28 = NSStringFromClass([(REMAuxiliaryChangeInfoFetchResult *)self typedKlass]);
            *(_DWORD *)buf = 138543874;
            v34 = v28;
            __int16 v35 = 2114;
            id v36 = v11;
            __int16 v37 = 2114;
            v38 = v29;
            _os_log_error_impl(&dword_1B9AA2000, v23, OS_LOG_TYPE_ERROR, "REMChangeTracking+AuxiliaryChgInfo: Decoded object identifier from the plist dictionary does not match with input object ID for {class: %{public}@, remObjectID: %{public}@, decodedObjID: %{public}@}", buf, 0x20u);
          }
        }
      }
      else
      {
        v24 = [MEMORY[0x1E4F28C58] errorWithREMChangeErrorCode:10];
        v22 = +[REMLog changeTracking];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[REMAuxiliaryChangeInfoFetchResult(REMChangeTrackingInternalAccess) auxiliaryChangeInfoFromData:withObjectID:fromChangeObject:error:](self);
        }
      }
    }
    id v10 = v30;
    id v12 = v31;
  }
  else
  {
    v24 = [MEMORY[0x1E4F28C58] errorWithREMChangeErrorCode:10];
    v19 = +[REMLog changeTracking];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[REMAuxiliaryChangeInfoFetchResult(REMChangeTrackingInternalAccess) auxiliaryChangeInfoFromData:withObjectID:fromChangeObject:error:](self);
    }
  }

  if (a6) {
    *a6 = v24;
  }

  return v16;
}

- (void)setAuxiliaryChangeInfos:(id)a3
{
}

@end