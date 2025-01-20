@interface PDAccountManagerCreatedZoneRequest
- (BOOL)coalesceWithRequest:(id)a3;
- (NSSet)completionHandlers;
- (NSString)containerName;
- (NSString)description;
- (NSString)zoneAccountIdentifier;
- (NSString)zoneName;
- (PDAccountManagerCreatedZoneRequest)initWithZoneAccountIdentifier:(id)a3 containerName:(id)a4 zoneName:(id)a5;
- (id)requestIdentifier;
- (unint64_t)requestType;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithSuccess:(BOOL)a3 error:(id)a4;
@end

@implementation PDAccountManagerCreatedZoneRequest

- (PDAccountManagerCreatedZoneRequest)initWithZoneAccountIdentifier:(id)a3 containerName:(id)a4 zoneName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PDAccountManagerCreatedZoneRequest;
  v12 = [(PDAccountManagerCreatedZoneRequest *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_zoneAccountIdentifier, a3);
    objc_storeStrong((id *)&v13->_containerName, a4);
    objc_storeStrong((id *)&v13->_zoneName, a5);
    v14 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    completionHandlers = v13->_completionHandlers;
    v13->_completionHandlers = v14;
  }
  return v13;
}

- (unint64_t)requestType
{
  return 5;
}

- (id)requestIdentifier
{
  v3 = sub_10048DC70([(PDAccountManagerCreatedZoneRequest *)self requestType]);
  v4 = +[NSString stringWithFormat:@"%@-%@", v3, self->_zoneAccountIdentifier];

  return v4;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 requestType];
  if (v5 != (id)[(PDAccountManagerCreatedZoneRequest *)self requestType]) {
    goto LABEL_6;
  }
  v6 = [v4 requestIdentifier];
  v7 = [(PDAccountManagerCreatedZoneRequest *)self requestIdentifier];
  v8 = v6;
  id v9 = v7;
  if (v8 == v9)
  {

    goto LABEL_8;
  }
  id v10 = v9;
  if (!v8 || !v9)
  {

LABEL_21:
    BOOL v12 = 0;
LABEL_24:

    goto LABEL_25;
  }
  unsigned __int8 v11 = [(NSString *)v8 isEqualToString:v9];

  if (v11)
  {
LABEL_8:
    v8 = (NSString *)v4;
    v13 = [(NSString *)v8 zoneName];
    zoneName = self->_zoneName;
    id v10 = v13;
    v15 = zoneName;
    if (v10 == v15)
    {
    }
    else
    {
      v16 = v15;
      if (!v10 || !v15)
      {
LABEL_20:

        goto LABEL_21;
      }
      unsigned int v17 = [(NSString *)v10 isEqualToString:v15];

      if (!v17) {
        goto LABEL_19;
      }
    }
    v18 = [(NSString *)v8 containerName];
    containerName = self->_containerName;
    id v10 = v18;
    v20 = containerName;
    if (v10 == v20)
    {

LABEL_23:
      completionHandlers = self->_completionHandlers;
      id v10 = [(NSString *)v8 completionHandlers];
      [(NSMutableSet *)completionHandlers unionSet:v10];
      BOOL v12 = 1;
      goto LABEL_24;
    }
    v16 = v20;
    if (v10 && v20)
    {
      unsigned int v21 = [(NSString *)v10 isEqualToString:v20];

      if (!v21)
      {
LABEL_19:
        BOOL v12 = 0;
LABEL_25:

        goto LABEL_26;
      }
      goto LABEL_23;
    }
    goto LABEL_20;
  }
LABEL_6:
  BOOL v12 = 0;
LABEL_26:

  return v12;
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    [(NSMutableSet *)completionHandlers addObject:v4];
  }
}

- (void)callCompletionsWithSuccess:(BOOL)a3 error:(id)a4
{
  id v5 = a4;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v6 = self->_completionHandlers;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10));
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (NSString)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  id v4 = sub_10048DC70([(PDAccountManagerCreatedZoneRequest *)self requestType]);
  [v3 appendFormat:@"requstType: '%@'; ", v4];

  id v5 = [(PDAccountManagerCreatedZoneRequest *)self requestIdentifier];
  [v3 appendFormat:@"requestIdentifier: '%@'; ", v5];

  [v3 appendFormat:@"zoneAccountIdentifier: '%@'; ", self->_zoneAccountIdentifier];
  [v3 appendFormat:@"zoneName: '%@'; ", self->_zoneName];
  [v3 appendFormat:@"containerName: '%@'; ", self->_containerName];
  [v3 appendFormat:@">"];
  return (NSString *)v3;
}

- (NSString)zoneAccountIdentifier
{
  return self->_zoneAccountIdentifier;
}

- (NSString)containerName
{
  return self->_containerName;
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (NSSet)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_containerName, 0);
  objc_storeStrong((id *)&self->_zoneAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end