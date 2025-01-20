@interface RMSubscribedStatusKeyPath
+ (id)fetchRequestWithKeyPaths:(id)a3;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (id)reportDetails;
- (void)_validateManagementSourceWithErrors:(id)a3;
- (void)_validateSetOncePropertiesWithErrors:(id)a3;
- (void)awakeFromInsert;
@end

@implementation RMSubscribedStatusKeyPath

- (void)awakeFromInsert
{
  v4.receiver = self;
  v4.super_class = (Class)RMSubscribedStatusKeyPath;
  [(RMSubscribedStatusKeyPath *)&v4 awakeFromInsert];
  v3 = objc_opt_new();
  [(RMSubscribedStatusKeyPath *)self setPrimitiveValue:v3 forKey:@"lastReceivedDate"];
}

- (BOOL)validateForInsert:(id *)a3
{
  v5 = objc_opt_new();
  v19.receiver = self;
  v19.super_class = (Class)RMSubscribedStatusKeyPath;
  id v20 = 0;
  unsigned __int8 v6 = [(RMSubscribedStatusKeyPath *)&v19 validateForInsert:&v20];
  id v7 = v20;
  v8 = v7;
  if (v6) {
    goto LABEL_9;
  }
  v9 = [v7 domain];
  if (![v9 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_8;
  }
  id v10 = [v8 code];

  if (v10 != (id)1560)
  {
LABEL_8:
    [v5 addObject:v8];
    goto LABEL_9;
  }
  v11 = [v8 userInfo];
  v12 = [v11 objectForKeyedSubscript:NSDetailedErrorsKey];

  if ([v12 count]) {
    [v5 addObjectsFromArray:v12];
  }

LABEL_9:
  [(RMSubscribedStatusKeyPath *)self _validateManagementSourceWithErrors:v5];
  id v13 = v5;
  id v14 = [v13 count];
  id v15 = v14;
  if (a3 && v14)
  {
    v16 = +[RMErrorUtilities createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:v13];
    v17 = v16;
    if (v16) {
      *a3 = v16;
    }
  }
  return v15 == 0;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v5 = objc_opt_new();
  v19.receiver = self;
  v19.super_class = (Class)RMSubscribedStatusKeyPath;
  id v20 = 0;
  unsigned __int8 v6 = [(RMSubscribedStatusKeyPath *)&v19 validateForUpdate:&v20];
  id v7 = v20;
  v8 = v7;
  if (v6) {
    goto LABEL_9;
  }
  v9 = [v7 domain];
  if (![v9 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_8;
  }
  id v10 = [v8 code];

  if (v10 != (id)1560)
  {
LABEL_8:
    [v5 addObject:v8];
    goto LABEL_9;
  }
  v11 = [v8 userInfo];
  v12 = [v11 objectForKeyedSubscript:NSDetailedErrorsKey];

  if ([v12 count]) {
    [v5 addObjectsFromArray:v12];
  }

LABEL_9:
  [(RMSubscribedStatusKeyPath *)self _validateSetOncePropertiesWithErrors:v5];
  id v13 = v5;
  id v14 = [v13 count];
  id v15 = v14;
  if (a3 && v14)
  {
    v16 = +[RMErrorUtilities createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:v13];
    v17 = v16;
    if (v16) {
      *a3 = v16;
    }
  }
  return v15 == 0;
}

- (void)_validateManagementSourceWithErrors:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(RMSubscribedStatusKeyPath *)self managementSource];
  if (!v4)
  {
    v5 = +[RMErrorUtilities createMissingMandatoryPropertyErrorWithPropertyNamed:@"managementSource" onObject:self];
    [v6 addObject:v5];
  }
}

- (void)_validateSetOncePropertiesWithErrors:(id)a3
{
  id v18 = a3;
  objc_super v4 = [(RMSubscribedStatusKeyPath *)self changedValues];
  v16 = [v4 allKeys];
  v17 = self;
  v5 = -[RMSubscribedStatusKeyPath committedValuesForKeys:](self, "committedValuesForKeys:");
  CFStringRef v25 = @"managementSource";
  +[NSArray arrayWithObjects:&v25 count:1];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        v11 = [v5 objectForKeyedSubscript:v10];
        if (v11)
        {
          v12 = [v4 objectForKeyedSubscript:v10];
          if (([v11 isEqual:v12] & 1) == 0)
          {
            id v13 = +[NSNull null];
            unsigned __int8 v14 = [v11 isEqual:v13];

            if ((v14 & 1) == 0)
            {
              id v15 = +[RMErrorUtilities createCannotChangeValueErrorForPropertyNamed:v10 onObject:v17];
              [v18 addObject:v15];
            }
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v7);
  }
}

+ (id)fetchRequestWithKeyPaths:(id)a3
{
  id v4 = a3;
  v5 = [a1 fetchRequest];
  id v6 = +[NSPredicate predicateWithFormat:@"(%K IN %@)", @"keyPath", v4];

  [v5 setPredicate:v6];

  return v5;
}

- (id)reportDetails
{
  id v4 = objc_opt_new();
  v5 = [(RMSubscribedStatusKeyPath *)self lastAcknowledgedDate];
  [v4 setObject:v5 forKeyedSubscript:@"lastAcknowledgedDate"];

  id v6 = [(RMSubscribedStatusKeyPath *)self lastReceivedDate];
  [v4 setObject:v6 forKeyedSubscript:@"lastReceivedDate"];

  id v7 = [(RMSubscribedStatusKeyPath *)self keyPath];
  [v4 setObject:v7 forKeyedSubscript:@"keyPath"];

  uint64_t v8 = [(RMSubscribedStatusKeyPath *)self lastAcknowledgedDate];
  if (v8)
  {
    v2 = [(RMSubscribedStatusKeyPath *)self lastAcknowledgedDate];
    self = [(RMSubscribedStatusKeyPath *)self lastReceivedDate];
    uint64_t v9 = [v2 isEqualToDate:self] ^ 1;
  }
  else
  {
    uint64_t v9 = 1;
  }
  uint64_t v10 = +[NSNumber numberWithInt:v9];
  [v4 setObject:v10 forKeyedSubscript:@"needsSync"];

  if (v8)
  {
  }

  return v4;
}

@end