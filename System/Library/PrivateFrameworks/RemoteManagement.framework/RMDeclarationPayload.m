@interface RMDeclarationPayload
+ (BOOL)isSignificantChange:(id)a3;
+ (id)keyPathsForValuesAffectingManagementSourceIdentifier;
- (BOOL)validateForInsert:(id *)a3;
- (BOOL)validateForUpdate:(id *)a3;
- (NSString)description;
- (NSString)managementSourceIdentifier;
- (id)reportDetails;
- (signed)_currentLoadState;
- (void)_validateLoadStateWithErrors:(id)a3;
- (void)_validateManagementSourceWithErrors:(id)a3;
- (void)_validateSetOncePropertiesWithErrors:(id)a3;
@end

@implementation RMDeclarationPayload

- (NSString)description
{
  v3 = [(RMDeclarationPayload *)self entity];
  v4 = [v3 name];
  v5 = [(RMDeclarationPayload *)self identifier];
  v6 = [(RMDeclarationPayload *)self serverToken];
  v7 = +[NSString stringWithFormat:@"<%@ { identifier = %@, token = %@ }>", v4, v5, v6];

  return (NSString *)v7;
}

+ (id)keyPathsForValuesAffectingManagementSourceIdentifier
{
  return +[NSSet setWithObject:@"managementSource.identifier"];
}

- (NSString)managementSourceIdentifier
{
  v2 = [(RMDeclarationPayload *)self managementSource];
  v3 = [v2 identifier];

  return (NSString *)v3;
}

+ (BOOL)isSignificantChange:(id)a3
{
  return 1;
}

- (BOOL)validateForInsert:(id *)a3
{
  v5 = objc_opt_new();
  v19.receiver = self;
  v19.super_class = (Class)RMDeclarationPayload;
  id v20 = 0;
  unsigned __int8 v6 = [(RMDeclarationPayload *)&v19 validateForInsert:&v20];
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
  [(RMDeclarationPayload *)self _validateManagementSourceWithErrors:v5];
  [(RMDeclarationPayload *)self _validateLoadStateWithErrors:v5];
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
  v19.super_class = (Class)RMDeclarationPayload;
  id v20 = 0;
  unsigned __int8 v6 = [(RMDeclarationPayload *)&v19 validateForUpdate:&v20];
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
  [(RMDeclarationPayload *)self _validateSetOncePropertiesWithErrors:v5];
  [(RMDeclarationPayload *)self _validateLoadStateWithErrors:v5];
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
  v4 = [(RMDeclarationPayload *)self managementSource];
  if (!v4)
  {
    v5 = +[RMErrorUtilities createMissingMandatoryPropertyErrorWithPropertyNamed:@"managementSource" onObject:self];
    [v6 addObject:v5];
  }
}

- (void)_validateSetOncePropertiesWithErrors:(id)a3
{
  id v21 = a3;
  v4 = [(RMDeclarationPayload *)self changedValues];
  objc_super v19 = [v4 allKeys];
  id v20 = self;
  v5 = -[RMDeclarationPayload committedValuesForKeys:](self, "committedValuesForKeys:");
  v28[0] = @"declarationType";
  v28[1] = @"identifier";
  v28[2] = @"managementSource";
  v28[3] = @"payload";
  v28[4] = @"state";
  +[NSArray arrayWithObjects:v28 count:5];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
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
              id v15 = +[RMErrorUtilities createCannotChangeValueErrorForPropertyNamed:v10 onObject:v20];
              [v21 addObject:v15];
            }
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v7);
  }

  v16 = [v5 objectForKeyedSubscript:@"serverToken"];
  if (v16)
  {
    v17 = [v4 objectForKeyedSubscript:@"serverToken"];
    if ([(RMDeclarationPayload *)v20 _currentLoadState]
      && ([v16 isEqual:v17] & 1) == 0)
    {
      v18 = +[RMErrorUtilities createCannotChangeValueErrorForPropertyNamed:@"serverToken" onObject:v20];
      [v21 addObject:v18];
    }
  }
}

- (signed)_currentLoadState
{
  v3 = [(RMDeclarationPayload *)self changedValues];
  v4 = [v3 objectForKeyedSubscript:@"loadState"];

  if (v4)
  {
    CFStringRef v10 = @"loadState";
    v5 = +[NSArray arrayWithObjects:&v10 count:1];
    id v6 = [(RMDeclarationPayload *)self committedValuesForKeys:v5];
    id v7 = [v6 objectForKeyedSubscript:@"loadState"];

    signed __int16 v8 = (unsigned __int16)[v7 integerValue];
  }
  else
  {
    signed __int16 v8 = (unsigned __int16)[(RMDeclarationPayload *)self loadState];
  }

  return v8;
}

- (void)_validateLoadStateWithErrors:(id)a3
{
  id v11 = a3;
  id v4 = [(RMDeclarationPayload *)self loadState];
  uint64_t v5 = [(RMDeclarationPayload *)self payload];
  id v6 = (void *)v5;
  BOOL v7 = v4 == 4 || v4 == 1;
  if (v7 && !v5)
  {
    signed __int16 v8 = +[NSNumber numberWithShort:v4];
    v9 = &off_10001E860;
LABEL_11:
    CFStringRef v10 = +[RMErrorUtilities createMismatchedValuesErrorForPropertyNamed:@"loadState" onObject:self expected:v9 actual:v8];
    [v11 addObject:v10];

    goto LABEL_12;
  }
  if (!v4 && v5)
  {
    signed __int16 v8 = +[NSNumber numberWithShort:0];
    v9 = &off_10001E878;
    goto LABEL_11;
  }
LABEL_12:
}

- (id)reportDetails
{
  v3 = objc_opt_new();
  id v4 = [(RMDeclarationPayload *)self declarationType];

  if (v4)
  {
    uint64_t v5 = [(RMDeclarationPayload *)self declarationType];
    [v3 setObject:v5 forKeyedSubscript:@"declarationType"];
  }
  id v6 = [(RMDeclarationPayload *)self identifier];
  [v3 setObject:v6 forKeyedSubscript:@"identifier"];

  BOOL v7 = [(RMDeclarationPayload *)self serverToken];
  [v3 setObject:v7 forKeyedSubscript:@"serverToken"];

  unsigned int v8 = [(RMDeclarationPayload *)self loadState];
  if (v8 > 3) {
    CFStringRef v9 = @"unknown";
  }
  else {
    CFStringRef v9 = *(&off_10001C570 + (int)v8);
  }
  [v3 setObject:v9 forKeyedSubscript:@"loadState"];
  CFStringRef v10 = [(RMDeclarationPayload *)self state];
  if ([v10 conformsToProtocol:&OBJC_PROTOCOL___RMReportDetails])
  {
    id v11 = [(RMDeclarationPayload *)self state];
    char v12 = objc_opt_respondsToSelector();

    if (v12)
    {
      id v13 = [(RMDeclarationPayload *)self state];
      unsigned __int8 v14 = [v13 reportDetails];
      CFStringRef v15 = @"state";
LABEL_13:
      [v3 setObject:v14 forKeyedSubscript:v15];

      goto LABEL_14;
    }
  }
  else
  {
  }
  id v13 = [(RMDeclarationPayload *)self state];
  if ([v13 conformsToProtocol:&OBJC_PROTOCOL___RMDeclarationPayloadActivatableState])
  {
    v16 = [(RMDeclarationPayload *)self state];
    char v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) == 0) {
      goto LABEL_15;
    }
    id v13 = [(RMDeclarationPayload *)self state];
    unsigned __int8 v14 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v13 active]);
    CFStringRef v15 = @"active";
    goto LABEL_13;
  }
LABEL_14:

LABEL_15:
  id v18 = [v3 copy];

  return v18;
}

@end