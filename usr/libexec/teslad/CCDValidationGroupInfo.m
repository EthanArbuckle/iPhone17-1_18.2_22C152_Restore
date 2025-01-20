@interface CCDValidationGroupInfo
- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4;
- (CCDValidationGroupInfo)initWithName:(id)a3 validationInfo:(id)a4;
- (NSArray)keyInfo;
- (id)_mutableKeyInfoArrayFromValidationInfo:(id)a3;
- (void)setKeyInfo:(id)a3;
@end

@implementation CCDValidationGroupInfo

- (CCDValidationGroupInfo)initWithName:(id)a3 validationInfo:(id)a4
{
  id v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CCDValidationGroupInfo;
  v7 = [(CCDValidationInfo *)&v12 initWithName:a3 validationInfo:v6];
  v8 = v7;
  if (v7)
  {
    uint64_t v9 = [(CCDValidationGroupInfo *)v7 _mutableKeyInfoArrayFromValidationInfo:v6];
    keyInfo = v8->_keyInfo;
    v8->_keyInfo = (NSArray *)v9;
  }
  return v8;
}

- (id)_mutableKeyInfoArrayFromValidationInfo:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 objectForKeyedSubscript:@"keyInfo"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v5 objectForKeyedSubscript:v10];
        objc_super v12 = [[CCDValidationKeyInfo alloc] initWithName:v10 validationInfo:v11];
        [v4 addObject:v12];
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (BOOL)validateSelfUsingValidationInfoWithDictionary:(id)a3 resultsDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CCDValidationInfo *)self name];
  uint64_t v9 = [v6 objectForKeyedSubscript:v8];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v10 = [(CCDValidationGroupInfo *)self keyInfo];
  id v11 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v15 validateSelfWithDictionary:v9 resultsDictionary:v7] & 1) == 0)
        {
          long long v17 = *(NSObject **)(DEPLogObjects() + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v18 = v17;
            v19 = [v9 description];
            v20 = [v15 description];
            *(_DWORD *)buf = 138543618;
            v27 = v19;
            __int16 v28 = 2114;
            v29 = v20;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Validation error in the following part of cloud config dictionary: \n%{public}@\nValidation information: %{public}@", buf, 0x16u);
          }
          BOOL v16 = 0;
          goto LABEL_13;
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 1;
LABEL_13:

  return v16;
}

- (NSArray)keyInfo
{
  return self->_keyInfo;
}

- (void)setKeyInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end