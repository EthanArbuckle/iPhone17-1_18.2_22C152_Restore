@interface FMFFenceUpdateOperation
- (BOOL)isUpdateGeoFenceCompleted;
- (FMFClientSession)clientSession;
- (FMFFence)fence;
- (FMFFence)updatedFence;
- (FMFFenceUpdateOperation)initWithOperationType:(unint64_t)a3 fence:(id)a4 clientSession:(id)a5 completion:(id)a6;
- (NSUUID)identifier;
- (id)executionCompletionBlock;
- (id)updateCompletionBlock;
- (unint64_t)operationType;
- (void)executeWithCompletion:(id)a3;
- (void)finishWithFence:(id)a3 error:(id)a4;
- (void)sendUpdateGeoFenceCommand;
- (void)setClientSession:(id)a3;
- (void)setExecutionCompletionBlock:(id)a3;
- (void)setFence:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsUpdateGeoFenceCompleted:(BOOL)a3;
- (void)setOperationType:(unint64_t)a3;
- (void)setUpdateCompletionBlock:(id)a3;
- (void)setUpdatedFence:(id)a3;
- (void)terminateWithFences:(id)a3;
@end

@implementation FMFFenceUpdateOperation

- (FMFFenceUpdateOperation)initWithOperationType:(unint64_t)a3 fence:(id)a4 clientSession:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)FMFFenceUpdateOperation;
  v13 = [(FMFFenceUpdateOperation *)&v20 init];
  if (v13)
  {
    v14 = objc_opt_new();
    [(FMFFenceUpdateOperation *)v13 setIdentifier:v14];

    [(FMFFenceUpdateOperation *)v13 setOperationType:a3];
    [(FMFFenceUpdateOperation *)v13 setFence:v10];
    [(FMFFenceUpdateOperation *)v13 setClientSession:v11];
    [(FMFFenceUpdateOperation *)v13 setUpdateCompletionBlock:v12];
    if ((id)[(FMFFenceUpdateOperation *)v13 operationType] == (id)2)
    {
      v15 = [(FMFFenceUpdateOperation *)v13 fence];
      [v15 setActive:0];
    }
    v16 = sub_100005560();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [(FMFFenceUpdateOperation *)v13 identifier];
      v18 = [v10 identifier];
      *(_DWORD *)buf = 138412546;
      v22 = v17;
      __int16 v23 = 2112;
      v24 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation initialized: %@ for fenceIdentifier: %@", buf, 0x16u);
    }
  }

  return v13;
}

- (void)executeWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = sub_100005560();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(FMFFenceUpdateOperation *)self identifier];
    int v7 = 138412290;
    v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation executing: %@", (uint8_t *)&v7, 0xCu);
  }
  [(FMFFenceUpdateOperation *)self setExecutionCompletionBlock:v4];

  [(FMFFenceUpdateOperation *)self sendUpdateGeoFenceCommand];
}

- (void)finishWithFence:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = sub_100005560();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(FMFFenceUpdateOperation *)self identifier];
    int v14 = 138412546;
    v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation: %@ finishWithFence %@", (uint8_t *)&v14, 0x16u);
  }
  id v10 = [(FMFFenceUpdateOperation *)self updateCompletionBlock];

  if (v10)
  {
    id v11 = [(FMFFenceUpdateOperation *)self updateCompletionBlock];
    ((void (**)(void, id, id))v11)[2](v11, v6, v7);
  }
  id v12 = [(FMFFenceUpdateOperation *)self executionCompletionBlock];

  if (v12)
  {
    v13 = [(FMFFenceUpdateOperation *)self executionCompletionBlock];
    v13[2]();
  }
}

- (void)sendUpdateGeoFenceCommand
{
  v3 = +[FMFCommandManager sharedInstance];
  id v4 = [(FMFFenceUpdateOperation *)self fence];
  v5 = [(FMFFenceUpdateOperation *)self clientSession];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000161E8;
  v6[3] = &unk_1000A1708;
  v6[4] = self;
  [v3 updateFence:v4 clientSession:v5 completion:v6];
}

- (void)terminateWithFences:(id)a3
{
  id v4 = a3;
  if ((id)[(FMFFenceUpdateOperation *)self operationType] == (id)2)
  {
    v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(FMFFenceUpdateOperation *)self identifier];
      *(_DWORD *)buf = 138412290;
      v42 = v6;
      id v7 = "FMFFenceUpdateOperation: %@ updateWithFences but we are deleting.";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);

      goto LABEL_26;
    }
    goto LABEL_26;
  }
  if (![(FMFFenceUpdateOperation *)self isUpdateGeoFenceCompleted])
  {
    v5 = sub_100005560();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(FMFFenceUpdateOperation *)self identifier];
      *(_DWORD *)buf = 138412290;
      v42 = v6;
      id v7 = "FMFFenceUpdateOperation: %@ updateWithFences but update is not over";
      goto LABEL_25;
    }
LABEL_26:
    int v14 = v5;
    goto LABEL_32;
  }
  uint64_t v31 = [(FMFFenceUpdateOperation *)self fence];
  id v8 = [(FMFFenceUpdateOperation *)self fence];
  v9 = sub_100005560();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(FMFFenceUpdateOperation *)self identifier];
    *(_DWORD *)buf = 138412546;
    v42 = v10;
    __int16 v43 = 2112;
    id v44 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation: %@ updateWithFences: %@", buf, 0x16u);
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v32 = v4;
  id v11 = [v32 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v11)
  {
    int v14 = (void *)v31;
    goto LABEL_31;
  }
  id v12 = v11;
  v28 = v8;
  v29 = self;
  id v30 = v4;
  uint64_t v13 = *(void *)v37;
  int v14 = (void *)v31;
  v15 = v32;
  uint64_t v34 = *(void *)v37;
  while (2)
  {
    __int16 v16 = 0;
    id v35 = v12;
    do
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(v15);
      }
      id v17 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v16);
      v18 = [v17 trigger:v28];
      v19 = [v14 trigger];
      if (![v18 isEqualToString:v19]) {
        goto LABEL_19;
      }
      objc_super v20 = [v17 recipients];
      v21 = [v14 recipients];
      if (![v20 isEqualToArray:v21]) {
        goto LABEL_18;
      }
      v22 = [v17 type];
      __int16 v23 = [v14 type];
      if (![v22 isEqualToString:v23])
      {

        uint64_t v13 = v34;
        id v12 = v35;
LABEL_18:

LABEL_19:
        goto LABEL_20;
      }
      v24 = [v17 placemark];
      v25 = [v14 placemark];
      unsigned int v33 = [v24 isEqual:v25];

      int v14 = (void *)v31;
      v15 = v32;

      uint64_t v13 = v34;
      id v12 = v35;
      if (v33)
      {
        v26 = sub_100005560();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "FMFFenceUpdateOperation: found fence matching current fence.", buf, 2u);
        }

        id v8 = v17;
        self = v29;
        [(FMFFenceUpdateOperation *)v29 setUpdatedFence:v8];
        id v4 = v30;
        goto LABEL_31;
      }
LABEL_20:
      __int16 v16 = (char *)v16 + 1;
    }
    while (v12 != v16);
    id v12 = [v15 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v12) {
      continue;
    }
    break;
  }
  self = v29;
  id v4 = v30;
  id v8 = v28;
LABEL_31:

  [(FMFFenceUpdateOperation *)self finishWithFence:v8 error:0];
LABEL_32:
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (FMFFence)fence
{
  return self->_fence;
}

- (void)setFence:(id)a3
{
}

- (FMFFence)updatedFence
{
  return self->_updatedFence;
}

- (void)setUpdatedFence:(id)a3
{
}

- (unint64_t)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(unint64_t)a3
{
  self->_operationType = a3;
}

- (FMFClientSession)clientSession
{
  return self->_clientSession;
}

- (void)setClientSession:(id)a3
{
}

- (id)updateCompletionBlock
{
  return self->_updateCompletionBlock;
}

- (void)setUpdateCompletionBlock:(id)a3
{
}

- (id)executionCompletionBlock
{
  return self->_executionCompletionBlock;
}

- (void)setExecutionCompletionBlock:(id)a3
{
}

- (BOOL)isUpdateGeoFenceCompleted
{
  return self->_isUpdateGeoFenceCompleted;
}

- (void)setIsUpdateGeoFenceCompleted:(BOOL)a3
{
  self->_isUpdateGeoFenceCompleted = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_executionCompletionBlock, 0);
  objc_storeStrong(&self->_updateCompletionBlock, 0);
  objc_storeStrong((id *)&self->_clientSession, 0);
  objc_storeStrong((id *)&self->_updatedFence, 0);
  objc_storeStrong((id *)&self->_fence, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end