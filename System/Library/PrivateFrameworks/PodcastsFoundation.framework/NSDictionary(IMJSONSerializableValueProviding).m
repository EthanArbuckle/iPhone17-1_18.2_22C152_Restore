@interface NSDictionary(IMJSONSerializableValueProviding)
- (id)im_jsonSerializableValue;
@end

@implementation NSDictionary(IMJSONSerializableValueProviding)

- (id)im_jsonSerializableValue
{
  v1 = a1;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:a1])
  {
    id v2 = v1;
  }
  else
  {
    v3 = [v1 allKeys];
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v3, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      unint64_t v8 = 0x1E4F29000uLL;
      uint64_t v21 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v11 = [v1 objectForKey:v10];
            v12 = jsonSerializableValueForValue(v11);
            if (v12)
            {
              [v22 setObject:v12 forKey:v10];
            }
            else
            {
              unint64_t v14 = v8;
              id v15 = v4;
              v16 = v1;
              v17 = (objc_class *)objc_opt_class();
              v18 = NSStringFromClass(v17);
              v19 = _IMStoreLogCategoryDefault();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v28 = v11;
                __int16 v29 = 2112;
                v30 = v18;
                __int16 v31 = 2112;
                v32 = v10;
                _os_log_impl(&dword_1AC9D5000, v19, OS_LOG_TYPE_ERROR, "Object %@ of class %@ for key \"%@\" isn't JSON serializable", buf, 0x20u);
              }

              v1 = v16;
              id v4 = v15;
              unint64_t v8 = v14;
              uint64_t v7 = v21;
            }
          }
          else
          {
            v13 = (objc_class *)objc_opt_class();
            v11 = NSStringFromClass(v13);
            v12 = _IMStoreLogCategoryDefault();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v28 = v10;
              __int16 v29 = 2112;
              v30 = v11;
              _os_log_impl(&dword_1AC9D5000, v12, OS_LOG_TYPE_ERROR, "Non-string key %@ class %@ isn't JSON serializable", buf, 0x16u);
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v33 count:16];
      }
      while (v6);
    }

    id v2 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v22];
  }
  return v2;
}

@end