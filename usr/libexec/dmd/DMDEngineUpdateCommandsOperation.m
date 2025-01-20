@interface DMDEngineUpdateCommandsOperation
- (DMFUpdateEnqueuedCommandsRequest)request;
- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3;
- (void)setRequest:(id)a3;
@end

@implementation DMDEngineUpdateCommandsOperation

- (void)performDatabaseModificationOperationWithManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = [(DMDEngineUpdateCommandsOperation *)self request];
  v6 = [v5 addCommands];
  v7 = [(DMDEngineUpdateCommandsOperation *)self request];
  v8 = [v7 organizationIdentifier];
  id v16 = 0;
  v9 = +[DMDCommandPayloadMetadata commandsWithPayloadDictionaries:v6 organizationIdentifier:v8 context:v4 error:&v16];
  id v10 = v16;

  if (v9)
  {
    id v15 = v10;
    unsigned __int8 v11 = [v4 save:&v15];
    id v12 = v15;

    if (v11)
    {
      [(DMDEngineUpdateCommandsOperation *)self setResultObject:0];
    }
    else
    {
      v14 = DMFConfigurationEngineLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_100084F7C(v12, v14);
      }

      [(DMDEngineUpdateCommandsOperation *)self setError:v12];
    }
    id v10 = v12;
  }
  else
  {
    v13 = DMFConfigurationEngineLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100084F04((uint64_t)v10, v13);
    }

    [(DMDEngineUpdateCommandsOperation *)self setError:v10];
  }
}

- (DMFUpdateEnqueuedCommandsRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end