@interface MBCKCodeOperator
- (Class)responseType;
- (MBCKCodeOperator)initWithService:(id)a3 function:(id)a4 responseType:(Class)a5;
- (NSString)functionName;
- (NSString)serviceName;
- (id)operationForRequest:(id)a3 callback:(id)a4;
@end

@implementation MBCKCodeOperator

- (MBCKCodeOperator)initWithService:(id)a3 function:(id)a4 responseType:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MBCKCodeOperator;
  v11 = [(MBCKCodeOperator *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_serviceName, a3);
    objc_storeStrong((id *)&v12->_functionName, a4);
    objc_storeStrong((id *)&v12->_responseType, a5);
  }

  return v12;
}

- (id)operationForRequest:(id)a3 callback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [v13 handleFailureInMethod:a2 object:self file:@"MBCKCodeOperator.m" lineNumber:51 description:@"request is required"];
  }
  id v9 = [(MBCKCodeOperator *)self serviceName];
  id v10 = [(MBCKCodeOperator *)self functionName];
  v11 = sub_1002B0E10(v7, v9, v10, (uint64_t)[(MBCKCodeOperator *)self responseType]);

  [(MBCKCodeOperator *)self responseType];
  sub_1002B0EB0(v11, v8);

  return v11;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseType, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end