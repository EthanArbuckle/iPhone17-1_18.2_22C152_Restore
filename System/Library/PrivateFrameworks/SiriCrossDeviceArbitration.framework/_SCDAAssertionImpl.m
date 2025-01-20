@interface _SCDAAssertionImpl
- (NSString)description;
- (NSUUID)uuid;
- (SCDAAssertionContext)context;
- (_SCDAAssertionImpl)initWithUUID:(id)a3 context:(id)a4 relinquishmentHandler:(id)a5;
- (void)invokeRelinquishmentHandlerWithContext:(id)a3 error:(id)a4;
@end

@implementation _SCDAAssertionImpl

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_relinquishmentHandler, 0);
}

- (SCDAAssertionContext)context
{
  return self->_context;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSString)description
{
  id v3 = [NSString alloc];
  v8.receiver = self;
  v8.super_class = (Class)_SCDAAssertionImpl;
  v4 = [(_SCDAAssertionImpl *)&v8 description];
  v5 = _SCDAAssertionCreateDescriptionOfProperties(self);
  v6 = (void *)[v3 initWithFormat:@"%@ {%@}", v4, v5];

  return (NSString *)v6;
}

- (void)invokeRelinquishmentHandlerWithContext:(id)a3 error:(id)a4
{
}

- (_SCDAAssertionImpl)initWithUUID:(id)a3 context:(id)a4 relinquishmentHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)_SCDAAssertionImpl;
  v11 = [(_SCDAAssertionImpl *)&v23 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    uuid = v11->_uuid;
    v11->_uuid = (NSUUID *)v12;

    uint64_t v14 = [v9 copy];
    context = v11->_context;
    v11->_context = (SCDAAssertionContext *)v14;

    v16 = [SCDATwoArgumentSafetyBlock alloc];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __65___SCDAAssertionImpl_initWithUUID_context_relinquishmentHandler___block_invoke;
    v21[3] = &unk_2654B75F8;
    id v22 = v10;
    v17 = [MEMORY[0x263F087E8] errorWithDomain:@"kSCDAErrorDomain" code:40 userInfo:0];
    uint64_t v18 = [(SCDATwoArgumentSafetyBlock *)v16 initWithBlock:v21 defaultValue1:0 defaultValue2:v17];
    relinquishmentHandler = v11->_relinquishmentHandler;
    v11->_relinquishmentHandler = (SCDATwoArgumentSafetyBlock *)v18;
  }
  return v11;
}

@end