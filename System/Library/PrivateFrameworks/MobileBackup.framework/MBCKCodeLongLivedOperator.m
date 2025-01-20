@interface MBCKCodeLongLivedOperator
- (BOOL)reconfigureLongLivedOperation:(id)a3;
- (Class)responseType;
- (MBCKCodeLongLivedOperator)initWithService:(id)a3 function:(id)a4 responseType:(Class)a5 callback:(id)a6;
- (NSString)functionName;
- (NSString)serviceName;
- (id)longLivedOperationForRequest:(id)a3;
- (id)operationIdentifier;
- (id)responseCallback;
- (void)setResponseCallback:(id)a3;
@end

@implementation MBCKCodeLongLivedOperator

- (MBCKCodeLongLivedOperator)initWithService:(id)a3 function:(id)a4 responseType:(Class)a5 callback:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)MBCKCodeLongLivedOperator;
  v14 = [(MBCKCodeLongLivedOperator *)&v20 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_serviceName, a3);
    objc_storeStrong((id *)&v15->_functionName, a4);
    objc_storeStrong((id *)&v15->_responseType, a5);
    id v16 = objc_retainBlock(v13);
    id responseCallback = v15->_responseCallback;
    v15->_id responseCallback = v16;

    v18 = [(MBCKCodeLongLivedOperator *)v15 operationIdentifier];
    MBCKRegisterLongLivedOperator(v18, v15);
  }
  return v15;
}

- (BOOL)reconfigureLongLivedOperation:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    [(MBCKCodeLongLivedOperator *)self responseType];
    v6 = [(MBCKCodeLongLivedOperator *)self responseCallback];
    sub_1002B0EB0(v4, v6);
  }
  else
  {
    v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = objc_opt_class();
      __int16 v11 = 2112;
      id v12 = (id)objc_opt_class();
      id v7 = v12;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Unexpected operation class %@, expected %@", buf, 0x16u);

      objc_opt_class();
      objc_opt_class();
      _MBLog();
    }
  }

  return isKindOfClass & 1;
}

- (id)operationIdentifier
{
  v3 = [(MBCKCodeLongLivedOperator *)self serviceName];
  id v4 = [(MBCKCodeLongLivedOperator *)self functionName];
  v5 = +[NSString stringWithFormat:@"MBCKCodeLongLivedOperator|%@|%@", v3, v4];

  return v5;
}

- (id)longLivedOperationForRequest:(id)a3
{
  id v4 = a3;
  v5 = [(MBCKCodeLongLivedOperator *)self serviceName];
  v6 = [(MBCKCodeLongLivedOperator *)self functionName];
  id v7 = sub_1002B0E10(v4, v5, v6, (uint64_t)[(MBCKCodeLongLivedOperator *)self responseType]);

  [(MBCKCodeLongLivedOperator *)self responseType];
  v8 = [(MBCKCodeLongLivedOperator *)self responseCallback];
  sub_1002B0EB0(v7, v8);

  v9 = [(MBCKCodeLongLivedOperator *)self operationIdentifier];
  [v7 setName:v9];

  return v7;
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (Class)responseType
{
  return self->_responseType;
}

- (id)responseCallback
{
  return self->_responseCallback;
}

- (void)setResponseCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_responseCallback, 0);
  objc_storeStrong((id *)&self->_responseType, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end