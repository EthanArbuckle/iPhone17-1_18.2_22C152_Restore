@interface DMDEngineRefreshStatusOperation
- (NSString)organizationIdentifier;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setOrganizationIdentifier:(id)a3;
@end

@implementation DMDEngineRefreshStatusOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = [(DMDEngineRefreshStatusOperation *)self organizationIdentifier];
  v6 = +[DMDPayloadMetadata fetchRequestForPayloadMetadatasFromOrganizationWithIdentifier:v5 matchingPredicate:0];

  id v26 = 0;
  v7 = [v6 execute:&v26];
  id v8 = v26;
  if (v7)
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v23;
      do
      {
        v13 = 0;
        do
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v22 + 1) + 8 * (void)v13) setNeedsRefreshStatus];
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v11);
    }

    id v21 = v8;
    unsigned __int8 v14 = [v4 save:&v21];
    id v15 = v21;

    if (v14)
    {
      v16 = +[NSNotificationCenter defaultCenter];
      v17 = [(DMDEngineRefreshStatusOperation *)self organizationIdentifier];
      [v16 postNotificationName:@"DMDConfigurationSourceStatusDidChange" object:v17];

      v18 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        sub_100084CB0(v9, self, v18);
      }

      v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
      [(DMDEngineRefreshStatusOperation *)self setResultObject:v19];
    }
    else
    {
      [(DMDEngineRefreshStatusOperation *)self setError:v15];
    }
    id v8 = v15;
  }
  else
  {
    v20 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_100084C18(self, v20);
    }

    [(DMDEngineRefreshStatusOperation *)self setError:v8];
  }
}

- (NSString)organizationIdentifier
{
  return self->_organizationIdentifier;
}

- (void)setOrganizationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end