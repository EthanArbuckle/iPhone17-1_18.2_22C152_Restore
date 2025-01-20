@interface CCDValidation
+ (BOOL)validateCloudConfiguration:(id)a3 withResultDictionary:(id)a4;
+ (BOOL)validateGroupDependenciesInCloudConfiguration:(id)a3;
+ (id)cloudConfigurationValidationDictionary;
@end

@implementation CCDValidation

+ (id)cloudConfigurationValidationDictionary
{
  if (qword_100025648 != -1) {
    dispatch_once(&qword_100025648, &stru_10001CCF0);
  }
  v2 = (void *)qword_100025640;

  return v2;
}

+ (BOOL)validateCloudConfiguration:(id)a3 withResultDictionary:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = *(NSObject **)(DEPLogObjects() + 8);
    BOOL v18 = 0;
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Cloud configuration is not a dictionary!", buf, 2u);
LABEL_19:
    BOOL v18 = 0;
    goto LABEL_20;
  }
  if (![a1 validateGroupDependenciesInCloudConfiguration:v6]) {
    goto LABEL_19;
  }
  v8 = *(NSObject **)(DEPLogObjects() + 8);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Cloud configuration group dependencies are valid.", buf, 2u);
  }
  [a1 cloudConfigurationValidationDictionary];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        v15 = [CCDValidationGroupInfo alloc];
        v16 = [v9 objectForKeyedSubscript:v14];
        v17 = [(CCDValidationGroupInfo *)v15 initWithName:v14 validationInfo:v16];

        if (![(CCDValidationInfo *)v17 validateSelfWithDictionary:v6 resultsDictionary:v7])
        {
          v20 = *(NSObject **)(DEPLogObjects() + 8);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Cloud configuration is NOT valid.", buf, 2u);
          }

          goto LABEL_19;
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  BOOL v18 = 1;
LABEL_20:

  return v18;
}

+ (BOOL)validateGroupDependenciesInCloudConfiguration:(id)a3
{
  return 1;
}

@end