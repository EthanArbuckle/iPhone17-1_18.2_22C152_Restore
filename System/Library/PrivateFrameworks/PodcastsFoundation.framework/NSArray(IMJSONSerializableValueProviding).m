@interface NSArray(IMJSONSerializableValueProviding)
- (id)im_jsonSerializableValue;
@end

@implementation NSArray(IMJSONSerializableValueProviding)

- (id)im_jsonSerializableValue
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:a1])
  {
    id v2 = a1;
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a1, "count"));
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = a1;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v5)
    {
      uint64_t v7 = v5;
      uint64_t v8 = *(void *)v18;
      *(void *)&long long v6 = 138412546;
      long long v16 = v6;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          jsonSerializableValueForValue(v10);
          id v11 = (id)objc_claimAutoreleasedReturnValue();
          if (!v11)
          {
            id v11 = v10;
            v12 = (objc_class *)objc_opt_class();
            v13 = NSStringFromClass(v12);
            v14 = _IMStoreLogCategoryDefault();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v16;
              id v22 = v11;
              __int16 v23 = 2112;
              v24 = v13;
              _os_log_impl(&dword_1AC9D5000, v14, OS_LOG_TYPE_ERROR, "Object %@ of class %@ isn't JSON serializable", buf, 0x16u);
            }
          }
          objc_msgSend(v3, "addObject:", v11, v16, (void)v17);
        }
        uint64_t v7 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v7);
    }

    id v2 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];
  }
  return v2;
}

@end