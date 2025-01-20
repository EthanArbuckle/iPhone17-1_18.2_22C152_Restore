@interface PLXPCResponderOperatorComposition
- (NSDictionary)registration;
- (OS_dispatch_queue)workQueue;
- (PLOperator)operator;
- (PLXPCResponderOperatorComposition)initWithOperator:(id)a3 withRegistration:(id)a4 withBlock:(id)a5;
- (PLXPCResponderOperatorComposition)initWithWorkQueue:(id)a3 withRegistration:(id)a4 withBlock:(id)a5;
- (id)description;
- (id)operatorBlock;
- (id)respondToRequestForClientID:(signed __int16)a3 withProcessName:(id)a4 withKey:(id)a5 withPayload:(id)a6;
- (void)setOperator:(id)a3;
- (void)setOperatorBlock:(id)a3;
- (void)setWorkQueue:(id)a3;
@end

@implementation PLXPCResponderOperatorComposition

- (PLXPCResponderOperatorComposition)initWithOperator:(id)a3 withRegistration:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  v11 = [v8 workQueue];
  v12 = [(PLXPCResponderOperatorComposition *)self initWithWorkQueue:v11 withRegistration:v10 withBlock:v9];

  if (v12) {
    objc_storeWeak((id *)&v12->_operator, v8);
  }

  return v12;
}

- (PLXPCResponderOperatorComposition)initWithWorkQueue:(id)a3 withRegistration:(id)a4 withBlock:(id)a5
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PLXPCResponderOperatorComposition;
  v12 = [(PLXPCResponderOperatorComposition *)&v18 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    uint64_t v14 = MEMORY[0x1C1869370](v11);
    id operatorBlock = v13->_operatorBlock;
    v13->_id operatorBlock = (id)v14;

    objc_storeStrong((id *)&v13->_registration, a4);
    v19[0] = @"type";
    v19[1] = @"registration";
    v20[0] = @"Query";
    v20[1] = v10;
    v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    +[PLUtilities postNotificationName:@"register.PLXPCService" object:v13 userInfo:v16];
  }
  return v13;
}

- (id)respondToRequestForClientID:(signed __int16)a3 withProcessName:(id)a4 withKey:(id)a5 withPayload:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  id v30 = 0;
  v13 = [(PLXPCResponderOperatorComposition *)self workQueue];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __101__PLXPCResponderOperatorComposition_respondToRequestForClientID_withProcessName_withKey_withPayload___block_invoke;
  v19[3] = &unk_1E6253A78;
  id v22 = v12;
  v23 = &v25;
  signed __int16 v24 = a3;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(v13, v19);

  id v17 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v17;
}

void __101__PLXPCResponderOperatorComposition_respondToRequestForClientID_withProcessName_withKey_withPayload___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1C1869120]();
  v3 = [*(id *)(a1 + 32) operatorBlock];
  uint64_t v4 = v3[2](v3, *(__int16 *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  uint64_t v5 = *(void *)(*(void *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(PLXPCResponderOperatorComposition *)self operator];
  uint64_t v5 = [v4 className];
  v6 = [(PLXPCResponderOperatorComposition *)self registration];
  v7 = [v6 description];
  id v8 = [v7 stringByReplacingOccurrencesOfString:@"\n" withString:&stru_1F15208F0];
  id v9 = [v8 stringByReplacingOccurrencesOfString:@"\t" withString:&stru_1F15208F0];
  id v10 = [v3 stringWithFormat:@"<PLXPCResponderOperatorComposition(%@-%@): %p>", v5, v9, self];

  return v10;
}

- (NSDictionary)registration
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (void)setOperatorBlock:(id)a3
{
}

- (PLOperator)operator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_operator);
  return (PLOperator *)WeakRetained;
}

- (void)setOperator:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (void)setWorkQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_operator);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_registration, 0);
}

@end