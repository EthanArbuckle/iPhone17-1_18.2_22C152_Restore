@interface WFRemoteExecutionAlertRequest
+ (int64_t)version;
- (BOOL)readMessageFromData:(id)a3 error:(id *)a4;
- (NSString)associatedRunRequestIdentifier;
- (WFAlert)alert;
- (WFREPBAlert)pbAlert;
- (WFRemoteExecutionAlertRequest)initWithAlert:(id)a3 associatedRunRequestIdentifier:(id)a4;
- (id)writeMessageToWriter:(id)a3 error:(id *)a4;
- (void)inflateAlertWithBlock:(id)a3;
- (void)setPbAlert:(id)a3;
@end

@implementation WFRemoteExecutionAlertRequest

+ (int64_t)version
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pbAlert, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_associatedRunRequestIdentifier, 0);
}

- (void)setPbAlert:(id)a3
{
}

- (WFREPBAlert)pbAlert
{
  return self->_pbAlert;
}

- (WFAlert)alert
{
  return self->_alert;
}

- (NSString)associatedRunRequestIdentifier
{
  return self->_associatedRunRequestIdentifier;
}

- (id)writeMessageToWriter:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  v5 = objc_opt_new();
  v6 = [(WFRemoteExecutionAlertRequest *)self associatedRunRequestIdentifier];
  [v5 setAssociatedRunRequestIdentifier:v6];

  v7 = objc_opt_new();
  v8 = [(WFRemoteExecutionAlertRequest *)self alert];
  v9 = [v8 title];
  [v7 setTitle:v9];

  v10 = [(WFRemoteExecutionAlertRequest *)self alert];
  v11 = [v10 message];
  [v7 setMessage:v11];

  v12 = [(WFRemoteExecutionAlertRequest *)self alert];
  objc_msgSend(v7, "setPreferredStyle:", objc_msgSend(v12, "preferredStyle"));

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v13 = [(WFRemoteExecutionAlertRequest *)self alert];
  v14 = [v13 buttons];

  uint64_t v15 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v26 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v20 = objc_opt_new();
        v21 = [v19 title];
        [v20 setTitle:v21];

        objc_msgSend(v20, "setPreferred:", objc_msgSend(v19, "isPreferred"));
        objc_msgSend(v20, "setStyle:", objc_msgSend(v19, "style"));
        [v7 addButtons:v20];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v16);
  }

  [v5 setAlert:v7];
  [v5 writeTo:v24];
  v22 = [v24 immutableData];

  return v22;
}

- (BOOL)readMessageFromData:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v5 = (objc_class *)MEMORY[0x1E4F94090];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithData:v6];

  v8 = objc_alloc_init(WFREPBAlertRequest);
  id v16 = 0;
  BOOL v9 = [(PBCodable *)v8 readFrom:v7 error:&v16];
  id v10 = v16;
  if (v9)
  {
    v11 = [(WFREPBAlertRequest *)v8 associatedRunRequestIdentifier];
    associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier;
    self->_associatedRunRequestIdentifier = v11;

    v13 = [(WFREPBAlertRequest *)v8 alert];
    p_super = &self->_pbAlert->super.super;
    self->_pbAlert = v13;
  }
  else
  {
    p_super = getWFRemoteExecutionLogObject();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFRemoteExecutionAlertRequest readMessageFromData:error:]";
      __int16 v19 = 2114;
      id v20 = v10;
      _os_log_impl(&dword_1C7F0A000, p_super, OS_LOG_TYPE_FAULT, "%s Failed to read alert request protobuf, %{public}@", buf, 0x16u);
    }
  }

  return v9;
}

- (void)inflateAlertWithBlock:(id)a3
{
  id v5 = a3;
  id v8 = [(WFRemoteExecutionAlertRequest *)self pbAlert];
  (*((void (**)(id, id))a3 + 2))(v5, v8);
  id v6 = (WFAlert *)objc_claimAutoreleasedReturnValue();

  alert = self->_alert;
  self->_alert = v6;
}

- (WFRemoteExecutionAlertRequest)initWithAlert:(id)a3 associatedRunRequestIdentifier:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"WFRemoteExecutionAlertRequest.m", 27, @"Invalid parameter not satisfying: %@", @"alert" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  id v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"WFRemoteExecutionAlertRequest.m", 28, @"Invalid parameter not satisfying: %@", @"runRequestIdentifier" object file lineNumber description];

LABEL_3:
  v11 = [(WFRemoteExecutionRequest *)self init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_associatedRunRequestIdentifier, a4);
    objc_storeStrong((id *)&v12->_alert, a3);
    v13 = v12;
  }

  return v12;
}

@end