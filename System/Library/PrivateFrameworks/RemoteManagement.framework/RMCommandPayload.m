@interface RMCommandPayload
+ (id)keyPathsForValuesAffectingManagementSourceIdentifier;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (NSString)managementSourceIdentifier;
- (id)reportDetails;
@end

@implementation RMCommandPayload

+ (id)keyPathsForValuesAffectingManagementSourceIdentifier
{
  return +[NSSet setWithObject:@"managementSource.identifier"];
}

- (NSString)managementSourceIdentifier
{
  v2 = [(RMCommandPayload *)self managementSource];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

- (BOOL)validateForInsert:(id *)a3
{
  v5 = objc_opt_new();
  v21.receiver = self;
  v21.super_class = (Class)RMCommandPayload;
  id v22 = 0;
  unsigned __int8 v6 = [(RMCommandPayload *)&v21 validateForInsert:&v22];
  id v7 = v22;
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
  v13 = [(RMCommandPayload *)self managementSource];
  if (!v13)
  {
    v14 = +[RMErrorUtilities createMissingMandatoryPropertyErrorWithPropertyNamed:@"managementSource" onObject:self];
    [v5 addObject:v14];
  }
  id v15 = v5;
  id v16 = [v15 count];
  id v17 = v16;
  if (a3 && v16)
  {
    v18 = +[RMErrorUtilities createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:v15];
    v19 = v18;
    if (v18) {
      *a3 = v18;
    }
  }
  return v17 == 0;
}

- (BOOL)validateForUpdate:(id *)a3
{
  v33 = objc_opt_new();
  v39.receiver = self;
  v39.super_class = (Class)RMCommandPayload;
  id v40 = 0;
  unsigned __int8 v4 = [(RMCommandPayload *)&v39 validateForUpdate:&v40];
  id v5 = v40;
  unsigned __int8 v6 = v5;
  if (v4) {
    goto LABEL_9;
  }
  id v7 = [v5 domain];
  if (![v7 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_8;
  }
  id v8 = [v6 code];

  if (v8 != (id)1560)
  {
LABEL_8:
    [v33 addObject:v6];
    goto LABEL_9;
  }
  v9 = [v6 userInfo];
  id v10 = [v9 objectForKeyedSubscript:NSDetailedErrorsKey];

  if ([v10 count]) {
    [v33 addObjectsFromArray:v10];
  }

LABEL_9:
  v30 = v6;
  v31 = a3;
  v11 = [(RMCommandPayload *)self changedValues];
  v29 = [v11 allKeys];
  v12 = -[RMCommandPayload committedValuesForKeys:](self, "committedValuesForKeys:");
  v42[0] = @"identifier";
  v42[1] = @"managementSource";
  v42[2] = @"payload";
  +[NSArray arrayWithObjects:v42 count:3];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v13 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v36;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        v18 = [v12 objectForKeyedSubscript:v17];
        if (v18)
        {
          v19 = [v11 objectForKeyedSubscript:v17];
          if (([v18 isEqual:v19] & 1) == 0)
          {
            v20 = +[NSNull null];
            unsigned __int8 v21 = [v18 isEqual:v20];

            if ((v21 & 1) == 0)
            {
              id v22 = +[RMErrorUtilities createCannotChangeValueErrorForPropertyNamed:v17 onObject:self];
              [v33 addObject:v22];
            }
          }
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v14);
  }

  id v23 = v33;
  id v24 = [v23 count];
  id v25 = v24;
  if (v31 && v24)
  {
    v26 = +[RMErrorUtilities createMultipleValidationErrorOrReturnTheSingleErrorWithErrors:v23];
    v27 = v26;
    if (v26) {
      id *v31 = v26;
    }
  }
  return v25 == 0;
}

- (id)reportDetails
{
  v3 = objc_opt_new();
  unsigned __int8 v4 = [(RMCommandPayload *)self type];
  [v3 setObject:v4 forKeyedSubscript:@"type"];

  id v5 = [(RMCommandPayload *)self identifier];
  [v3 setObject:v5 forKeyedSubscript:@"identifier"];

  unsigned __int8 v6 = [(RMCommandPayload *)self state];
  id v7 = +[NSNumber numberWithShort:](NSNumber, "numberWithShort:", [v6 status]);
  [v3 setObject:v7 forKeyedSubscript:@"state.status"];

  id v8 = [v3 copy];

  return v8;
}

@end