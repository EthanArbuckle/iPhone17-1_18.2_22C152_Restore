@interface TMLSignalHandlerFunction
+ (id)decode:(const ProtobufCMessage *)a3;
- (NSString)signalName;
- (TMLSignalHandlerFunction)initWithSignalName:(id)a3 functionName:(id)a4 body:(id)a5;
- (void)encode:(ProtobufCMessage *)a3;
@end

@implementation TMLSignalHandlerFunction

- (TMLSignalHandlerFunction)initWithSignalName:(id)a3 functionName:(id)a4 body:(id)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TMLSignalHandlerFunction;
  v10 = [(TMLFunction *)&v15 initWithName:a4 body:a5];
  if (v10)
  {
    uint64_t v12 = objc_msgSend_copy(v8, v9, v11);
    signalName = v10->_signalName;
    v10->_signalName = (NSString *)v12;
  }
  return v10;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5 = sub_239853344((uint64_t)a3);
  v7 = (const char *)objc_msgSend_UTF8String(self->_signalName, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  objc_msgSend_functionName(self, v8, v9);
  id v10 = objc_claimAutoreleasedReturnValue();
  v13 = (const char *)objc_msgSend_UTF8String(v10, v11, v12);
  *(void *)&a3[1].var1 = strdup(v13);

  objc_msgSend_functionBody(self, v14, v15);
  id v19 = objc_claimAutoreleasedReturnValue();
  v18 = (const char *)objc_msgSend_UTF8String(v19, v16, v17);
  a3[1].var2 = (ProtobufCMessageUnknownField *)strdup(v18);
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  v6 = objc_msgSend_stringWithUTF8String_(NSString, a2, v3, a3[1].var0);
  double v9 = objc_msgSend_stringWithUTF8String_(NSString, v7, v8, *(void *)&a3[1].var1);
  double v12 = objc_msgSend_stringWithUTF8String_(NSString, v10, v11, a3[1].var2);
  id v13 = objc_alloc((Class)a1);
  v16 = objc_msgSend_initWithSignalName_functionName_body_(v13, v14, v15, v6, v9, v12);

  return v16;
}

- (NSString)signalName
{
  return self->_signalName;
}

- (void).cxx_destruct
{
}

@end