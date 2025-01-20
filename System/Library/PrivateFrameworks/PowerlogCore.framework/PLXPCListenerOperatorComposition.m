@interface PLXPCListenerOperatorComposition
- (NSDictionary)registration;
- (PLOperator)operator;
- (PLXPCListenerOperatorComposition)initWithOperator:(id)a3 withRegistration:(id)a4 withBlock:(id)a5;
- (id)description;
- (id)operatorBlock;
- (void)messageRecievedForClientID:(signed __int16)a3 withProcessName:(id)a4 withKey:(id)a5 withPayload:(id)a6;
- (void)setOperator:(id)a3;
- (void)setOperatorBlock:(id)a3;
@end

@implementation PLXPCListenerOperatorComposition

void __99__PLXPCListenerOperatorComposition_messageRecievedForClientID_withProcessName_withKey_withPayload___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C1869120]();
  v3 = [*(id *)(a1 + 32) operatorBlock];
  v3[2](v3, *(__int16 *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (void)messageRecievedForClientID:(signed __int16)a3 withProcessName:(id)a4 withKey:(id)a5 withPayload:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [(PLXPCListenerOperatorComposition *)self operator];
  v14 = [v13 workQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__PLXPCListenerOperatorComposition_messageRecievedForClientID_withProcessName_withKey_withPayload___block_invoke;
  block[3] = &unk_1E6255920;
  signed __int16 v22 = a3;
  block[4] = self;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  dispatch_async(v14, block);
}

- (PLOperator)operator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operator);
  return (PLOperator *)WeakRetained;
}

- (PLXPCListenerOperatorComposition)initWithOperator:(id)a3 withRegistration:(id)a4 withBlock:(id)a5
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PLXPCListenerOperatorComposition;
  id v11 = [(PLXPCListenerOperatorComposition *)&v17 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_operator, v8);
    uint64_t v13 = MEMORY[0x1C1869370](v10);
    id operatorBlock = v12->_operatorBlock;
    v12->_id operatorBlock = (id)v13;

    objc_storeStrong((id *)&v12->_registration, a4);
    v18[0] = @"type";
    v18[1] = @"registration";
    v19[0] = @"Post";
    v19[1] = v9;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    +[PLUtilities postNotificationName:@"register.PLXPCService" object:v12 userInfo:v15];
  }
  return v12;
}

- (id)description
{
  v3 = NSString;
  v4 = [(PLXPCListenerOperatorComposition *)self operator];
  v5 = [v4 className];
  v6 = [(PLXPCListenerOperatorComposition *)self registration];
  v7 = [v6 description];
  id v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F15208F0];
  id v9 = [v8 stringByReplacingOccurrencesOfString:@"\t" withString:&stru_1F15208F0];
  id v10 = [v3 stringWithFormat:@"<PLXPCListenerOperatorComposition(%@-%@): %p>", v5, v9, self];

  return v10;
}

- (NSDictionary)registration
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOperatorBlock:(id)a3
{
}

- (void)setOperator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_operator);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_registration, 0);
}

@end