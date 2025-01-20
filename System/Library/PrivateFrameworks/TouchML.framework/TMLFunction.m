@interface TMLFunction
+ (id)decode:(const ProtobufCMessage *)a3;
- (NSString)functionBody;
- (NSString)functionName;
- (TMLFunction)initWithName:(id)a3 body:(id)a4;
- (void)encode:(ProtobufCMessage *)a3;
@end

@implementation TMLFunction

- (TMLFunction)initWithName:(id)a3 body:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TMLFunction;
  v9 = [(TMLFunction *)&v18 init];
  if (v9)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v10);
    functionName = v9->_functionName;
    v9->_functionName = (NSString *)v11;

    uint64_t v15 = objc_msgSend_copy(v7, v13, v14);
    functionBody = v9->_functionBody;
    v9->_functionBody = (NSString *)v15;
  }
  return v9;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5 = sub_239853220((uint64_t)a3);
  id v7 = (const char *)objc_msgSend_UTF8String(self->_functionName, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  double v10 = (const char *)objc_msgSend_UTF8String(self->_functionBody, v8, v9);
  *(void *)&a3[1].var1 = strdup(v10);
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  id v6 = objc_msgSend_stringWithUTF8String_(NSString, a2, v3, a3[1].var0);
  double v9 = objc_msgSend_stringWithUTF8String_(NSString, v7, v8, *(void *)&a3[1].var1);
  id v10 = objc_alloc((Class)a1);
  v13 = objc_msgSend_initWithName_body_(v10, v11, v12, v6, v9);

  return v13;
}

- (NSString)functionName
{
  return self->_functionName;
}

- (NSString)functionBody
{
  return self->_functionBody;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionBody, 0);
  objc_storeStrong((id *)&self->_functionName, 0);
}

@end