@interface RBSXPCMessage
+ (RBSXPCMessage)messageWithEncoder:(uint64_t)a1;
+ (id)messageForMethod:(SEL)a3 varguments:(id)a4;
+ (id)messageForXPCMessage:(id)a3;
+ (void)messageForMethod:(void *)a3 arguments:;
- (BOOL)isEmpty;
- (RBSXPCMessage)init;
- (RBSXPCMessageReply)reply;
- (SEL)invokeOnConnection:(uint64_t)a3 withReturnClass:(void *)a4 error:;
- (SEL)method;
- (id)_initWithMessage:(id *)a1;
- (id)decodeArgumentCollection:(Class)a3 withClass:(Class)a4 atIndex:(unint64_t)a5 allowNil:(BOOL)a6 error:(id *)a7;
- (id)decodeArgumentWithClass:(Class)a3 atIndex:(unint64_t)a4 allowNil:(BOOL)a5 error:(id *)a6;
- (id)error;
- (id)invokeOnConnection:(uint64_t)a3 withReturnCollectionClass:(uint64_t)a4 entryClass:(void *)a5 error:;
- (id)sendToConnection:(id)a3 error:(id *)a4;
- (void)sendToConnection:(id)a3;
- (void)sendToConnection:(id)a3 completion:(id)a4;
- (void)sendToConnection:(id)a3 replyQueue:(id)a4 completion:(id)a5;
@end

@implementation RBSXPCMessage

- (BOOL)isEmpty
{
  return xpc_dictionary_get_count(self->_xpc_message) == 0;
}

void __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (!v5) {
    goto LABEL_4;
  }
  if (MEMORY[0x192FECA30]() == MEMORY[0x1E4F14590])
  {
    v4 = +[RBSXPCMessage messageForXPCMessage:v5];
    v3 = -[RBSXPCMessage error](v4);
  }
  else
  {
    if (MEMORY[0x192FECA30](v5) != MEMORY[0x1E4F145A8])
    {
LABEL_4:
      v3 = 0;
      goto LABEL_7;
    }
    v3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4101 userInfo:0];
  }
LABEL_7:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)error
{
  if (a1)
  {
    a1 = [a1[2] decodeObjectOfClass:objc_opt_class() forKey:@"__RBSXPCError__"];
    uint64_t v1 = vars8;
  }
  return a1;
}

+ (id)messageForMethod:(SEL)a3 varguments:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x1E4F1CA48] array];
  v12 = (id *)&v14;
  if (v5)
  {
    uint64_t v7 = 0;
    do
    {
      [v6 insertObject:v5 atIndex:v7];
      v8 = v12++;
      id v9 = *v8;

      ++v7;
      id v5 = v9;
    }
    while (v9);
  }
  v10 = +[RBSXPCMessage messageForMethod:arguments:]((uint64_t)RBSXPCMessage, (uint64_t)a3, v6);

  return v10;
}

+ (void)messageForMethod:(void *)a3 arguments:
{
  id v4 = a3;
  uint64_t v5 = self;
  if (!a2)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:sel_messageForMethod_arguments_ object:v5 file:@"RBSXPCUtilities.m" lineNumber:165 description:@"method must be specified"];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__RBSXPCMessage_messageForMethod_arguments___block_invoke;
  v10[3] = &unk_1E5741930;
  id v11 = v4;
  v12 = sel_messageForMethod_arguments_;
  uint64_t v13 = v5;
  uint64_t v14 = a2;
  id v6 = v4;
  uint64_t v7 = +[RBSXPCMessage messageWithEncoder:]((uint64_t)RBSXPCMessage, v10);
  v7[3] = a2;

  return v7;
}

+ (RBSXPCMessage)messageWithEncoder:(uint64_t)a1
{
  v2 = a2;
  self;
  v3 = objc_alloc_init(RBSXPCMessage);
  id v4 = v3;
  if (v2) {
    ((void (**)(id, RBSXPCCoder *))v2)[2](v2, v3->_payload);
  }

  return v4;
}

- (RBSXPCMessage)init
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id v4 = (RBSXPCMessage *)-[RBSXPCMessage _initWithMessage:]((id *)&self->super.isa, v3);

  return v4;
}

void __44__RBSXPCMessage_messageForMethod_arguments___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([*(id *)(a1 + 32) count])
  {
    xpc_object_t v3 = [*(id *)(a1 + 32) objectAtIndex:0];
    [v7 encodeObject:v3 forKey:@"rbs_argument_0"];
  }
  else
  {
    xpc_object_t v3 = 0;
  }
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 2)
  {
    uint64_t v4 = [*(id *)(a1 + 32) objectAtIndex:1];

    [v7 encodeObject:v4 forKey:@"rbs_argument_1"];
    xpc_object_t v3 = (void *)v4;
  }
  if ((unint64_t)[*(id *)(a1 + 32) count] >= 3)
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 48) file:@"RBSXPCUtilities.m" lineNumber:177 description:@"Only up to two arguments supported by RBSXPCMessage"];
  }
  uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 56));
  [v7 encodeObject:v5 forKey:@"rbs_selector"];
}

+ (id)messageForXPCMessage:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && MEMORY[0x192FECA30](v3) == MEMORY[0x1E4F14590]) {
    uint64_t v5 = -[RBSXPCMessage _initWithMessage:]((id *)[RBSXPCMessage alloc], v4);
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (RBSXPCMessageReply)reply
{
  if (xpc_dictionary_expects_reply() && (xpc_object_t reply = xpc_dictionary_create_reply(self->_xpc_message)) != 0)
  {
    uint64_t v4 = reply;
    uint64_t v5 = -[RBSXPCMessageReply _initWithMessage:]([RBSXPCMessageReply alloc], reply);
  }
  else
  {
    uint64_t v5 = 0;
  }
  return (RBSXPCMessageReply *)v5;
}

- (SEL)method
{
  return self->_method;
}

- (id)_initWithMessage:(id *)a1
{
  id v4 = a2;
  uint64_t v5 = v4;
  if (a1)
  {
    if (!v4 || MEMORY[0x192FECA30](v4) != MEMORY[0x1E4F14590])
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:sel__initWithMessage_ object:a1 file:@"RBSXPCUtilities.m" lineNumber:209 description:@"can only init messages with dictionaries"];
    }
    v12.receiver = a1;
    v12.super_class = (Class)RBSXPCMessage;
    id v6 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v6;
    if (v6)
    {
      objc_storeStrong(v6 + 1, a2);
      uint64_t v7 = +[RBSXPCCoder coderWithMessage:v5];
      id v8 = a1[2];
      a1[2] = (id)v7;

      id v9 = [a1[2] decodeStringForKey:@"rbs_selector"];
      a1[3] = (id)NSSelectorFromString(v9);
    }
  }

  return a1;
}

- (void)sendToConnection:(id)a3 replyQueue:(id)a4 completion:(id)a5
{
  id v9 = (_xpc_connection_s *)a3;
  v10 = a4;
  id v11 = a5;
  if (v10)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v10 = +[RBSWorkloop sharedBackgroundWorkloop];
    if (v9)
    {
LABEL_3:
      method = self->_method;
      if (method)
      {
        uint64_t v13 = NSStringFromSelector(method);
        char v14 = [v13 hasPrefix:@"async_"];

        if ((v14 & 1) == 0)
        {
          v17 = [MEMORY[0x1E4F28B00] currentHandler];
          v18 = NSStringFromSelector(self->_method);
          [v17 handleFailureInMethod:a2, self, @"RBSXPCUtilities.m", 293, @"syncronous method cannot be sent async: %@", v18 object file lineNumber description];
        }
      }
      v15 = [(RBSXPCCoder *)self->_payload createMessage];
      if (!v11)
      {
        xpc_connection_send_message(v9, v15);

        goto LABEL_13;
      }
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke_2;
      handler[3] = &unk_1E5741980;
      id v20 = v11;
      xpc_connection_send_message_with_reply(v9, v15, v10, handler);

      v16 = v20;
      goto LABEL_11;
    }
  }
  if (v11)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke;
    block[3] = &unk_1E5741958;
    id v22 = v11;
    dispatch_async(v10, block);
    v16 = v22;
LABEL_11:
  }
LABEL_13:
}

- (id)decodeArgumentCollection:(Class)a3 withClass:(Class)a4 atIndex:(unint64_t)a5 allowNil:(BOOL)a6 error:(id *)a7
{
  v26[3] = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    if (a5 != 1)
    {
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v14 = *MEMORY[0x1E4F28588];
      v26[0] = @"requested argument index not supported";
      v25[0] = v14;
      v25[1] = @"method-name";
      v15 = NSStringFromSelector(self->_method);
      v26[1] = v15;
      v25[2] = @"argument-index";
      v16 = [NSNumber numberWithUnsignedInteger:a5];
      v26[2] = v16;
      v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:3];
      v18 = [v13 errorWithDomain:@"RBSXPCCodingErrorDomain" code:1 userInfo:v17];
      v19 = 0;
      goto LABEL_12;
    }
    id v11 = @"rbs_argument_1";
  }
  else
  {
    id v11 = @"rbs_argument_0";
  }
  payload = self->_payload;
  if (a3) {
    [(RBSXPCCoder *)payload decodeCollectionOfClass:a3 containingClass:a4 forKey:v11];
  }
  else {
  v19 = [(RBSXPCCoder *)payload decodeObjectOfClass:a4 forKey:v11];
  }
  if (v19 || a6) {
    goto LABEL_13;
  }
  id v20 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v21 = *MEMORY[0x1E4F28588];
  v24[0] = @"nil argument when nonnil expected";
  v23[0] = v21;
  v23[1] = @"method-name";
  v15 = NSStringFromSelector(self->_method);
  v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", a5, v23[0], @"method-name", @"argument-index", @"nil argument when nonnil expected", v15);
  v24[2] = v16;
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
  v18 = [v20 errorWithDomain:@"RBSXPCCodingErrorDomain" code:1 userInfo:v17];
LABEL_12:
  *a7 = v18;

LABEL_13:
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_xpc_message, 0);
}

- (id)sendToConnection:(id)a3 error:(id *)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = (_xpc_connection_s *)a3;
  if (!v6)
  {
    if (a4)
    {
      v10 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v11 = *MEMORY[0x1E4F281F8];
      uint64_t v21 = *MEMORY[0x1E4F28588];
      v22[0] = @"The connection does not exist";
      objc_super v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      *a4 = [v10 errorWithDomain:v11 code:4099 userInfo:v12];
    }
    goto LABEL_6;
  }
  uint64_t v7 = NSStringFromSelector(self->_method);
  int v8 = [v7 hasPrefix:@"async_"];

  if (v8)
  {
    id v9 = [(RBSXPCCoder *)self->_payload createMessage];
    xpc_connection_send_message(v6, v9);

LABEL_6:
    uint64_t v13 = 0;
    goto LABEL_22;
  }
  uint64_t v14 = NSStringFromSelector(self->_method);
  int v15 = [v14 hasPrefix:@"void_"];

  v16 = [(RBSXPCCoder *)self->_payload createMessage];
  xpc_object_t v17 = xpc_connection_send_message_with_reply_sync(v6, v16);

  if (v15)
  {
    if (!v17) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v17)
  {
    if (MEMORY[0x192FECA30](v17) == MEMORY[0x1E4F14590])
    {
      uint64_t v13 = +[RBSXPCCoder coderWithMessage:v17];
      if (!a4) {
        goto LABEL_21;
      }
      v19 = [v13 decodeObjectOfClass:objc_opt_class() forKey:@"__RBSXPCError__"];
      goto LABEL_20;
    }
LABEL_12:
    if (MEMORY[0x192FECA30](v17) != MEMORY[0x1E4F145A8]) {
      goto LABEL_13;
    }
    v18 = rbs_connection_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[RBSXPCMessage sendToConnection:error:](v18);
    }

    if (!a4) {
      goto LABEL_13;
    }
    v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4101 userInfo:0];
    uint64_t v13 = 0;
LABEL_20:
    *a4 = v19;
    goto LABEL_21;
  }
LABEL_13:
  uint64_t v13 = 0;
LABEL_21:

LABEL_22:
  return v13;
}

- (id)invokeOnConnection:(uint64_t)a3 withReturnCollectionClass:(uint64_t)a4 entryClass:(void *)a5 error:
{
  id v9 = a2;
  if (a1)
  {
    if (!a1[3])
    {
      v16 = [MEMORY[0x1E4F28B00] currentHandler];
      [v16 handleFailureInMethod:sel_invokeOnConnection_withReturnCollectionClass_entryClass_error_ object:a1 file:@"RBSXPCUtilities.m" lineNumber:317 description:@"must initialize message with a method to use this mechanism"];
    }
    v10 = [(SEL *)a1 sendToConnection:v9 error:a5];
    uint64_t v11 = v10;
    if (a5 && [v10 containsValueForKey:@"__RBSXPCError__"])
    {
      *a5 = [v11 decodeObjectOfClass:objc_opt_class() forKey:@"__RBSXPCError__"];
    }
    if ([v11 containsValueForKey:@"return-value"])
    {
      if (a3) {
        [v11 decodeCollectionOfClass:a3 containingClass:a4 forKey:@"return-value"];
      }
      else {
      objc_super v12 = [v11 decodeObjectOfClass:a4 forKey:@"return-value"];
      }
      if (v12) {
        goto LABEL_14;
      }
      uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v14 = NSStringFromSelector(a1[3]);
      [v13 handleFailureInMethod:sel_invokeOnConnection_withReturnCollectionClass_entryClass_error_, a1, @"RBSXPCUtilities.m", 332, @"failed to decode return value for %@", v14 object file lineNumber description];
    }
    objc_super v12 = 0;
LABEL_14:

    goto LABEL_15;
  }
  objc_super v12 = 0;
LABEL_15:

  return v12;
}

- (SEL)invokeOnConnection:(uint64_t)a3 withReturnClass:(void *)a4 error:
{
  if (a1)
  {
    -[RBSXPCMessage invokeOnConnection:withReturnCollectionClass:entryClass:error:](a1, a2, 0, a3, a4);
    a1 = (SEL *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = vars8;
  }
  return a1;
}

- (id)decodeArgumentWithClass:(Class)a3 atIndex:(unint64_t)a4 allowNil:(BOOL)a5 error:(id *)a6
{
  return [(RBSXPCMessage *)self decodeArgumentCollection:0 withClass:a3 atIndex:a4 allowNil:a5 error:a6];
}

- (void)sendToConnection:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[RBSWorkloop sharedBackgroundWorkloop];
  [(RBSXPCMessage *)self sendToConnection:v7 replyQueue:v8 completion:v6];
}

- (void)sendToConnection:(id)a3
{
}

void __56__RBSXPCMessage_sendToConnection_replyQueue_completion___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4F281F8];
  uint64_t v6 = *MEMORY[0x1E4F28588];
  v7[0] = @"The connection does not exist";
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:4099 userInfo:v4];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v5);
}

- (void)sendToConnection:(os_log_t)log error:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_191FE8000, log, OS_LOG_TYPE_ERROR, "XPC message send failed", v1, 2u);
}

@end