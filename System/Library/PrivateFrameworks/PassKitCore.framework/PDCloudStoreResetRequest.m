@interface PDCloudStoreResetRequest
- (BOOL)_canCoalesceRequest:(id)a3;
- (BOOL)coalesceWithRequest:(id)a3;
- (NSArray)completionHandlers;
- (NSDictionary)additionalZoneIDsByDatabaseIdentifier;
- (NSSet)includeCachedZonesForDatabaseIdentifiers;
- (PDCloudStoreResetRequest)init;
- (PDCloudStoreResetRequest)initWithCompletion:(id)a3;
- (id)description;
- (void)addCompletion:(id)a3;
- (void)callCompletionsWithSuccess:(BOOL)a3 error:(id)a4;
- (void)setAdditionalZoneIDsByDatabaseIdentifier:(id)a3;
- (void)setIncludeCachedZonesForDatabaseIdentifiers:(id)a3;
@end

@implementation PDCloudStoreResetRequest

- (PDCloudStoreResetRequest)initWithCompletion:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PDCloudStoreResetRequest;
  v5 = [(PDCloudStoreResetRequest *)&v11 init];
  if (v5)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    completionHandlers = v5->_completionHandlers;
    v5->_completionHandlers = v6;

    if (v4)
    {
      v8 = v5->_completionHandlers;
      id v9 = objc_retainBlock(v4);
      [(NSMutableArray *)v8 addObject:v9];
    }
  }

  return v5;
}

- (PDCloudStoreResetRequest)init
{
  return [(PDCloudStoreResetRequest *)self initWithCompletion:0];
}

- (void)addCompletion:(id)a3
{
  if (a3)
  {
    completionHandlers = self->_completionHandlers;
    id v4 = objc_retainBlock(a3);
    [(NSMutableArray *)completionHandlers addObject:v4];
  }
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PDCloudStoreResetRequest *)self _canCoalesceRequest:v4];
  if (v5)
  {
    completionHandlers = self->_completionHandlers;
    v7 = [v4 completionHandlers];
    [(NSMutableArray *)completionHandlers addObjectsFromArray:v7];
  }
  return v5;
}

- (void)callCompletionsWithSuccess:(BOOL)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = [(NSMutableArray *)self->_completionHandlers copy];
  [(NSMutableArray *)self->_completionHandlers removeAllObjects];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      objc_super v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * (void)v11));
        objc_super v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)_canCoalesceRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 includeCachedZonesForDatabaseIdentifiers];
  int v5 = PKEqualObjects();

  if (v5)
  {
    id v6 = [v3 additionalZoneIDsByDatabaseIdentifier];
    char v7 = PKEqualObjects();
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"<%@: %p; ", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @"includeCachedZonesForDatabaseIdentifiers: '%@'; ",
    self->_includeCachedZonesForDatabaseIdentifiers);
  objc_msgSend(v3, "appendFormat:", @"additionalZoneIDsByDatabaseIdentifier: '%@'; ",
    self->_additionalZoneIDsByDatabaseIdentifier);
  [v3 appendFormat:@">"];
  return v3;
}

- (NSSet)includeCachedZonesForDatabaseIdentifiers
{
  return self->_includeCachedZonesForDatabaseIdentifiers;
}

- (void)setIncludeCachedZonesForDatabaseIdentifiers:(id)a3
{
}

- (NSDictionary)additionalZoneIDsByDatabaseIdentifier
{
  return self->_additionalZoneIDsByDatabaseIdentifier;
}

- (void)setAdditionalZoneIDsByDatabaseIdentifier:(id)a3
{
}

- (NSArray)completionHandlers
{
  return &self->_completionHandlers->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalZoneIDsByDatabaseIdentifier, 0);
  objc_storeStrong((id *)&self->_includeCachedZonesForDatabaseIdentifiers, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end