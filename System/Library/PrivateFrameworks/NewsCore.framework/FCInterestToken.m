@interface FCInterestToken
+ (FCInterestToken)interestTokenWithCallbackQueue:(id)a3 removeInterestBlock:(id)a4;
+ (FCInterestToken)interestTokenWithRemoveInterestBlock:(id)a3;
- (FCInterestToken)init;
- (FCInterestToken)initWithCallbackQueue:(id)a3 removeInterestBlock:(id)a4;
- (id)removeInterestBlock;
- (void)dealloc;
- (void)setRemoveInterestBlock:(id)a3;
@end

@implementation FCInterestToken

+ (FCInterestToken)interestTokenWithRemoveInterestBlock:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCallbackQueue:0 removeInterestBlock:v3];

  return (FCInterestToken *)v4;
}

- (FCInterestToken)initWithCallbackQueue:(id)a3 removeInterestBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v14 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "removeInterestBlock != nil");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCInterestToken initWithCallbackQueue:removeInterestBlock:]";
    __int16 v21 = 2080;
    v22 = "FCInterestToken.m";
    __int16 v23 = 1024;
    int v24 = 44;
    __int16 v25 = 2114;
    v26 = v14;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v18.receiver = self;
  v18.super_class = (Class)FCInterestToken;
  v8 = [(FCInterestToken *)&v18 init];
  if (v8)
  {
    if (v6)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __61__FCInterestToken_initWithCallbackQueue_removeInterestBlock___block_invoke;
      aBlock[3] = &unk_1E5B4CC80;
      id v16 = v6;
      id v17 = v7;
      v9 = _Block_copy(aBlock);
      id removeInterestBlock = v8->_removeInterestBlock;
      v8->_id removeInterestBlock = v9;

      id v11 = v16;
    }
    else
    {
      v12 = _Block_copy(v7);
      id v11 = v8->_removeInterestBlock;
      v8->_id removeInterestBlock = v12;
    }
  }
  return v8;
}

- (void).cxx_destruct
{
}

- (void)dealloc
{
  (*((void (**)(void))self->_removeInterestBlock + 2))();
  v3.receiver = self;
  v3.super_class = (Class)FCInterestToken;
  [(FCInterestToken *)&v3 dealloc];
}

- (FCInterestToken)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Abstract method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCInterestToken init]";
    __int16 v9 = 2080;
    v10 = "FCInterestToken.m";
    __int16 v11 = 1024;
    int v12 = 39;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Abstract method", "-[FCInterestToken init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

void __61__FCInterestToken_initWithCallbackQueue_removeInterestBlock___block_invoke(uint64_t a1)
{
}

+ (FCInterestToken)interestTokenWithCallbackQueue:(id)a3 removeInterestBlock:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithCallbackQueue:v6 removeInterestBlock:v5];

  return (FCInterestToken *)v7;
}

- (id)removeInterestBlock
{
  return self->_removeInterestBlock;
}

- (void)setRemoveInterestBlock:(id)a3
{
}

@end