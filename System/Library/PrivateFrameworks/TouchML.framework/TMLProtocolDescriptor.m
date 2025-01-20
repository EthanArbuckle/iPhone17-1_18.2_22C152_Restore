@interface TMLProtocolDescriptor
+ (id)decode:(const ProtobufCMessage *)a3;
- (BOOL)isEqual:(id)a3;
- (NSDictionary)signals;
- (NSSet)implementsProtocols;
- (NSString)objcProtocolName;
- (NSString)protocolName;
- (Protocol)objcProtocol;
- (TMLProtocolDescriptor)initWithName:(id)a3 implementsProtocols:(id)a4;
- (void)addSignal:(id)a3;
- (void)encode:(ProtobufCMessage *)a3;
- (void)setObjcProtocolName:(id)a3;
@end

@implementation TMLProtocolDescriptor

- (TMLProtocolDescriptor)initWithName:(id)a3 implementsProtocols:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)TMLProtocolDescriptor;
  v9 = [(TMLProtocolDescriptor *)&v20 init];
  if (v9)
  {
    uint64_t v11 = objc_msgSend_copy(v6, v8, v10);
    protocolName = v9->_protocolName;
    v9->_protocolName = (NSString *)v11;

    uint64_t v15 = objc_msgSend_copy(v7, v13, v14);
    implementsProtocols = v9->_implementsProtocols;
    v9->_implementsProtocols = (NSSet *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    signals = v9->_signals;
    v9->_signals = v17;
  }
  return v9;
}

- (void)addSignal:(id)a3
{
  signals = self->_signals;
  id v4 = a3;
  objc_msgSend_signalName(v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKey_(signals, v7, v8, v4, v9);
}

- (Protocol)objcProtocol
{
  objcProtocol = self->_objcProtocol;
  if (!objcProtocol)
  {
    uint64_t v5 = objc_msgSend_length(self->_objcProtocolName, a2, v2);
    uint64_t v6 = 40;
    if (!v5) {
      uint64_t v6 = 8;
    }
    NSProtocolFromString(*(NSString **)((char *)&self->super.isa + v6));
    objcProtocol = (Protocol *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_objcProtocol;
    self->_objcProtocol = objcProtocol;
  }
  return objcProtocol;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5 = (TMLProtocolDescriptor *)a3;
  if (self == v5)
  {
    char isEqualToDictionary = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = v5;
      protocolName = self->_protocolName;
      double v10 = objc_msgSend_protocolName(v6, v8, v9);
      if (!objc_msgSend_isEqualToString_(protocolName, v11, v12, v10))
      {
        char isEqualToDictionary = 0;
LABEL_13:

        goto LABEL_14;
      }
      implementsProtocols = self->_implementsProtocols;
      objc_msgSend_implementsProtocols(v6, v13, v14);
      v17 = (NSSet *)objc_claimAutoreleasedReturnValue();
      if (implementsProtocols == v17
        || (v19 = self->_implementsProtocols,
            objc_msgSend_implementsProtocols(v6, v16, v18),
            v3 = objc_claimAutoreleasedReturnValue(),
            objc_msgSend_isEqualToSet_(v19, v20, v21, v3)))
      {
        signals = self->_signals;
        v24 = objc_msgSend_signals(v6, v16, v18);
        char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(signals, v25, v26, v24);

        if (implementsProtocols == v17)
        {
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {
        char isEqualToDictionary = 0;
      }

      goto LABEL_12;
    }
    char isEqualToDictionary = 0;
  }
LABEL_14:

  return isEqualToDictionary;
}

- (void)encode:(ProtobufCMessage *)a3
{
  double v5 = sub_239852D3C((uint64_t)a3);
  id v7 = (const char *)objc_msgSend_UTF8String(self->_protocolName, v6, v5);
  a3[1].var0 = (ProtobufCMessageDescriptor *)strdup(v7);
  double v10 = objc_msgSend_allObjects(self->_implementsProtocols, v8, v9);
  uint64_t v13 = objc_msgSend_count(v10, v11, v12);
  *(void *)&a3[1].var1 = v13;
  if (v13) {
    uint64_t v13 = (uint64_t)malloc_type_malloc(8 * v13, 0x10040436913F5uLL);
  }
  a3[1].var2 = (ProtobufCMessageUnknownField *)v13;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = sub_23985D448;
  v27[3] = &unk_264DADB78;
  v27[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v10, v14, v15, v27);
  objcProtocolName = (ProtobufCMessageDescriptor *)self->_objcProtocolName;
  if (objcProtocolName)
  {
    v19 = (const char *)objc_msgSend_UTF8String(objcProtocolName, v16, v17);
    objcProtocolName = (ProtobufCMessageDescriptor *)strdup(v19);
  }
  a3[2].var0 = objcProtocolName;
  objc_super v20 = objc_msgSend_allValues(self->_signals, v16, v17);
  uint64_t v23 = objc_msgSend_count(v20, v21, v22);
  *(void *)&a3[2].var1 = v23;
  if (v23) {
    uint64_t v23 = (uint64_t)malloc_type_malloc(8 * v23, 0x2004093837F09uLL);
  }
  a3[2].var2 = (ProtobufCMessageUnknownField *)v23;
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = sub_23985D488;
  v26[3] = &unk_264DADB98;
  v26[4] = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v20, v24, v25, v26);
}

+ (id)decode:(const ProtobufCMessage *)a3
{
  id v7 = objc_msgSend_stringWithUTF8String_(NSString, a2, v3, a3[1].var0);
  if (*(void *)&a3[1].var1)
  {
    id v9 = objc_alloc(MEMORY[0x263EFF9C0]);
    double v12 = objc_msgSend_initWithCapacity_(v9, v10, v11, *(void *)&a3[1].var1);
  }
  else
  {
    double v12 = 0;
  }
  if (*(void *)&a3[1].var1)
  {
    unint64_t v13 = 0;
    do
    {
      double v14 = objc_msgSend_stringWithUTF8String_(NSString, v6, v8, *((void *)a3[1].var2 + v13));
      objc_msgSend_addObject_(v12, v15, v16, v14);

      ++v13;
    }
    while (v13 < *(void *)&a3[1].var1);
  }
  id v17 = objc_alloc((Class)a1);
  objc_super v20 = objc_msgSend_copy(v12, v18, v19);
  uint64_t v23 = objc_msgSend_initWithName_implementsProtocols_(v17, v21, v22, v7, v20);

  if (a3[2].var0)
  {
    double v26 = objc_msgSend_stringWithUTF8String_(NSString, v24, v25);
    objc_msgSend_setObjcProtocolName_(v23, v27, v28, v26);
  }
  if (*(void *)&a3[2].var1)
  {
    unint64_t v29 = 0;
    do
    {
      uint64_t v30 = *((void *)a3[2].var2 + v29);
      v31 = objc_opt_class();
      v34 = objc_msgSend_decode_(v31, v32, v33, v30);
      objc_msgSend_addSignal_(v23, v35, v36, v34);

      ++v29;
    }
    while (v29 < *(void *)&a3[2].var1);
  }

  return v23;
}

- (NSString)protocolName
{
  return self->_protocolName;
}

- (NSSet)implementsProtocols
{
  return self->_implementsProtocols;
}

- (NSDictionary)signals
{
  return &self->_signals->super;
}

- (NSString)objcProtocolName
{
  return self->_objcProtocolName;
}

- (void)setObjcProtocolName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objcProtocolName, 0);
  objc_storeStrong((id *)&self->_objcProtocol, 0);
  objc_storeStrong((id *)&self->_signals, 0);
  objc_storeStrong((id *)&self->_implementsProtocols, 0);
  objc_storeStrong((id *)&self->_protocolName, 0);
}

@end