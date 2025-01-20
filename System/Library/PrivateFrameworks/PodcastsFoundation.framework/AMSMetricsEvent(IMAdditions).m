@interface AMSMetricsEvent(IMAdditions)
- (void)im_addPropertiesWithDictionary:()IMAdditions;
- (void)im_setProperty:()IMAdditions forBodyKey:;
@end

@implementation AMSMetricsEvent(IMAdditions)

- (void)im_addPropertiesWithDictionary:()IMAdditions
{
  objc_msgSend(a3, "im_jsonSerializableValue");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [a1 addPropertiesWithDictionary:v4];
}

- (void)im_setProperty:()IMAdditions forBodyKey:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 conformsToProtocol:&unk_1F03F8988];
  if (!v6 || v8)
  {
    objc_msgSend(v6, "im_jsonSerializableValue");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v6;
    v10 = _IMStoreLogCategoryDefault();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412546;
      id v12 = v9;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_1AC9D5000, v10, OS_LOG_TYPE_ERROR, "The property %@ for key %@ isn't JSON serializable", (uint8_t *)&v11, 0x16u);
    }
  }
  [a1 setProperty:v9 forBodyKey:v7];
}

@end