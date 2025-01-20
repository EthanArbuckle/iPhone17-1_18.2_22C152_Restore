@interface CdQwUTvJnDEPQgR8
+ (id)scorerWithContext:(id)a3;
- (CdQwUTvJnDEPQgR8)initWithContext:(id)a3;
- (NSData)preparedBlob;
- (NSError)prepareError;
- (NSString)lastScoreIdentifier;
- (OS_dispatch_queue)callback_queue;
- (OS_dispatch_queue)score_id_queue;
- (id)VkBISyFszEu5z9lr:(id)a3 error:(id *)a4;
- (id)handler;
- (id)settingsFromContext:(id)a3;
- (jprL7AuZZkLkFoBK)context;
- (void)MHcqy8dNQyXvA5JC:(id)a3;
- (void)_safeCallbackWithMessage:(id)a3 uuid:(id)a4 error:(id)a5;
- (void)prepareScoreMessage;
- (void)scoreWithScoreRequest:(id)a3 completionHandler:(id)a4;
- (void)setCallback_queue:(id)a3;
- (void)setContext:(id)a3;
- (void)setHandler:(id)a3;
- (void)setLastScoreIdentifier:(id)a3;
- (void)setPrepareError:(id)a3;
- (void)setPreparedBlob:(id)a3;
- (void)setScore_id_queue:(id)a3;
- (void)stop;
@end

@implementation CdQwUTvJnDEPQgR8

+ (id)scorerWithContext:(id)a3
{
  id v3 = a3;
  v4 = [[CdQwUTvJnDEPQgR8 alloc] initWithContext:v3];

  return v4;
}

- (CdQwUTvJnDEPQgR8)initWithContext:(id)a3
{
  v4 = (jprL7AuZZkLkFoBK *)a3;
  v15.receiver = self;
  v15.super_class = (Class)CdQwUTvJnDEPQgR8;
  v5 = [(CdQwUTvJnDEPQgR8 *)&v15 init];
  context = v5->_context;
  v5->_context = v4;
  v7 = v4;

  dispatch_queue_t v8 = dispatch_queue_create("com.apple.libCoreAS.callback", 0);
  callback_queue = v5->_callback_queue;
  v5->_callback_queue = (OS_dispatch_queue *)v8;

  dispatch_queue_t v10 = dispatch_queue_create("com.apple.libCoreAS.sid", 0);
  score_id_queue = v5->_score_id_queue;
  v5->_score_id_queue = (OS_dispatch_queue *)v10;

  uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
  identifier2UUID = v5->_identifier2UUID;
  v5->_identifier2UUID = (NSMutableDictionary *)v12;

  return v5;
}

- (id)settingsFromContext:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v3 serverEndpointIdentifier];
  [v4 setEndpointIdentifier:v5];

  objc_msgSend(v4, "setSettingsType:", objc_msgSend(v3, "eventFrequency") == 2);
  v6 = [v3 phoneNumber];
  [v4 setPhone:v6];

  v7 = [v3 emailAddress];
  [v4 setEmail:v7];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  dispatch_queue_t v8 = objc_msgSend(v3, "identities", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v29 + 1) + 8 * v12);
        v14 = [v13 fullName];
        if (v14 || ([v13 firstName], (v14 = objc_claimAutoreleasedReturnValue()) != 0))
        {
        }
        else
        {
          v26 = [v13 lastName];

          if (!v26) {
            goto LABEL_13;
          }
        }
        if (![v13 type])
        {
          uint64_t v15 = [v4 name];
          if (!v15 || (v16 = (void *)v15, uint64_t v17 = [v13 source], v16, v17 == 2))
          {
            v18 = objc_opt_new();
            v19 = [v13 firstName];
            [v18 setFirstName:v19];

            v20 = [v13 lastName];
            [v18 setLastName:v20];

            v21 = [v13 fullName];
            [v18 setFullName:v21];

            [v4 setName:v18];
          }
        }
LABEL_13:
        v22 = [v13 phoneNumber];
        if (v22)
        {
        }
        else
        {
          v23 = [v13 emailAddress];

          if (!v23) {
            goto LABEL_21;
          }
        }
        if ([v13 type] == 1)
        {
          v24 = [v13 phoneNumber];
          [v4 setPPhone:v24];

          v25 = [v13 emailAddress];
          [v4 setPEmail:v25];
        }
        else
        {
          if ([v13 type]) {
            goto LABEL_21;
          }
          v25 = [v13 phoneNumber];
          [v4 setPhone:v25];
        }

LABEL_21:
        ++v12;
      }
      while (v10 != v12);
      uint64_t v27 = [v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
      uint64_t v10 = v27;
    }
    while (v27);
  }

  return v4;
}

- (id)VkBISyFszEu5z9lr:(id)a3 error:(id *)a4
{
  v13 = 0;
  id v5 = a3;
  bcgsyabc74vz12([v5 bytes], objc_msgSend(v5, "length"), (uint64_t)&v13);
  if (v6)
  {
    int v7 = v6;
    dispatch_queue_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = [NSString stringWithUTF8String:kCoreASErrorDomainCADecrypt];
    *a4 = [v8 errorWithDomain:v9 code:v7 userInfo:0];

    uint64_t v10 = 0;
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    uint64_t v10 = objc_msgSend(v11, "initWithBytes:length:", v13, objc_msgSend(v5, "length"));
  }
  free(v13);

  return v10;
}

- (void)prepareScoreMessage
{
  self->_prepared = 1;
  id v3 = +[LZHbEqKhcixce9PA sharedInstance];
  v4 = [(CdQwUTvJnDEPQgR8 *)self context];
  id v5 = [(CdQwUTvJnDEPQgR8 *)self settingsFromContext:v4];

  score_id_queue = self->_score_id_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__CdQwUTvJnDEPQgR8_prepareScoreMessage__block_invoke;
  block[3] = &unk_1E56D8020;
  id v10 = v3;
  id v11 = v5;
  uint64_t v12 = self;
  id v7 = v5;
  id v8 = v3;
  dispatch_async(score_id_queue, block);
}

void __39__CdQwUTvJnDEPQgR8_prepareScoreMessage__block_invoke(void *a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__CdQwUTvJnDEPQgR8_prepareScoreMessage__block_invoke_2;
  v6[3] = &unk_1E56D7FF8;
  v6[4] = a1[6];
  dispatch_semaphore_t v7 = v2;
  id v5 = v2;
  [v3 JI0A3nkqsab9cUj8:v4 completion:v6];
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
}

void __39__CdQwUTvJnDEPQgR8_prepareScoreMessage__block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v8 = a3;
  id v9 = a4;
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 64), a2);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a4);
  if (v10) {
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v8 forKey:v10];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)_safeCallbackWithMessage:(id)a3 uuid:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  callback_queue = self->_callback_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__CdQwUTvJnDEPQgR8__safeCallbackWithMessage_uuid_error___block_invoke;
  v15[3] = &unk_1E56D8048;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(callback_queue, v15);
}

void *__56__CdQwUTvJnDEPQgR8__safeCallbackWithMessage_uuid_error___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (!*(unsigned char *)(v1 + 8))
  {
    *(unsigned char *)(v1 + 8) = 1;
    uint64_t v2 = *(void *)(result[4] + 40);
    if (v2) {
      return (void *)(*(uint64_t (**)(void, void, void, void))(v2 + 16))(*(void *)(result[4] + 40), result[5], result[6], result[7]);
    }
  }
  return result;
}

- (void)scoreWithScoreRequest:(id)a3 completionHandler:(id)a4
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
    -[CdQwUTvJnDEPQgR8 scoreWithScoreRequest:completionHandler:]();
  }
  id v8 = _Block_copy(v7);
  id handler = self->_handler;
  self->_id handler = v8;

  if (self->_prepared)
  {
    id v10 = +[LZHbEqKhcixce9PA sharedInstance];
    score_id_queue = self->_score_id_queue;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __60__CdQwUTvJnDEPQgR8_scoreWithScoreRequest_completionHandler___block_invoke;
    v16[3] = &unk_1E56D8020;
    v16[4] = self;
    id v17 = v6;
    id v18 = v10;
    id v12 = v10;
    dispatch_async(score_id_queue, v16);
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F28C58];
    id v14 = [NSString stringWithUTF8String:kCoreASErrorDomainCA];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    v20[0] = @"prepareScoreMessage wasn't called prior to scoreMessageWithNonce:completionHandler:";
    uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    id v12 = [v13 errorWithDomain:v14 code:-21 userInfo:v15];

    [(CdQwUTvJnDEPQgR8 *)self _safeCallbackWithMessage:0 uuid:0 error:v12];
  }
}

void __60__CdQwUTvJnDEPQgR8_scoreWithScoreRequest_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 72))
  {
    objc_msgSend((id)v2, "_safeCallbackWithMessage:uuid:error:", 0, 0);
    return;
  }
  id v3 = [*(id *)(v2 + 32) serverEndpointIdentifier];
  if ([v3 isEqualToString:@"enable"])
  {
    uint64_t v4 = [*(id *)(a1 + 40) nonce];

    if (!v4)
    {
      id v5 = (void *)MEMORY[0x1E4F28C58];
      id v6 = [NSString stringWithUTF8String:kCoreASErrorDomainCA];
      id v7 = v5;
      id v8 = v6;
      uint64_t v9 = -701;
LABEL_24:
      id v23 = [v7 errorWithDomain:v8 code:v9 userInfo:0];

      [*(id *)(a1 + 32) _safeCallbackWithMessage:0 uuid:0 error:v23];

      return;
    }
  }
  else
  {
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (!*(void *)(v10 + 64))
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    id v6 = [NSString stringWithUTF8String:kCoreASErrorDomainCA];
    id v7 = v21;
    id v8 = v6;
    uint64_t v9 = -710;
    goto LABEL_24;
  }
  id v11 = objc_msgSend(*(id *)(v10 + 16), "objectForKey:");
  id v22 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 64);
  id v13 = [*(id *)(a1 + 40) hostChallenge];
  id v14 = v13;
  if (!v13)
  {
    id v14 = [*(id *)(*(void *)(a1 + 32) + 32) hostChallenge];
  }
  uint64_t v15 = [*(id *)(a1 + 40) challengeResponse];
  id v16 = v15;
  if (!v15)
  {
    id v16 = [*(id *)(*(void *)(a1 + 32) + 32) challengeResponse];
  }
  id v17 = [*(id *)(a1 + 40) seid];
  id v18 = v17;
  if (!v17)
  {
    id v18 = [*(id *)(*(void *)(a1 + 32) + 32) seid];
  }
  uint64_t v19 = [*(id *)(a1 + 40) nonce];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __60__CdQwUTvJnDEPQgR8_scoreWithScoreRequest_completionHandler___block_invoke_2;
  v24[3] = &unk_1E56D8070;
  v24[4] = *(void *)(a1 + 32);
  id v25 = v11;
  id v20 = v11;
  [v22 QeMnG23X94qgz7jT:v12 hostChallenge:v14 challengeResponse:v16 seid:v18 nonce:v19 completion:v24];

  if (!v17) {
  if (!v15)
  }

  if (!v13) {
}
  }

void __60__CdQwUTvJnDEPQgR8_scoreWithScoreRequest_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (!a2 || a3)
  {
    uint64_t v7 = *(void *)(a1 + 40);
    [v4 _safeCallbackWithMessage:a2 uuid:v7 error:a3];
  }
  else
  {
    id v8 = 0;
    id v5 = [v4 VkBISyFszEu5z9lr:a2 error:&v8];
    id v6 = v8;
    [*(id *)(a1 + 32) _safeCallbackWithMessage:v5 uuid:*(void *)(a1 + 40) error:v6];
  }
}

- (void)stop
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v4 = [NSString stringWithUTF8String:kCoreASErrorDomainCA];
  uint64_t v7 = *MEMORY[0x1E4F28568];
  v8[0] = @"Timeout Error";
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [v3 errorWithDomain:v4 code:40000 userInfo:v5];
  [(CdQwUTvJnDEPQgR8 *)self _safeCallbackWithMessage:0 uuid:0 error:v6];
}

- (void)MHcqy8dNQyXvA5JC:(id)a3
{
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_190E10000, logger, OS_LOG_TYPE_INFO, "confirmFinished", v4, 2u);
  }
}

- (jprL7AuZZkLkFoBK)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (OS_dispatch_queue)callback_queue
{
  return self->_callback_queue;
}

- (void)setCallback_queue:(id)a3
{
}

- (OS_dispatch_queue)score_id_queue
{
  return self->_score_id_queue;
}

- (void)setScore_id_queue:(id)a3
{
}

- (NSString)lastScoreIdentifier
{
  return self->_lastScoreIdentifier;
}

- (void)setLastScoreIdentifier:(id)a3
{
}

- (NSError)prepareError
{
  return self->_prepareError;
}

- (void)setPrepareError:(id)a3
{
}

- (NSData)preparedBlob
{
  return self->_preparedBlob;
}

- (void)setPreparedBlob:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preparedBlob, 0);
  objc_storeStrong((id *)&self->_prepareError, 0);
  objc_storeStrong((id *)&self->_lastScoreIdentifier, 0);
  objc_storeStrong((id *)&self->_score_id_queue, 0);
  objc_storeStrong((id *)&self->_callback_queue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_identifier2UUID, 0);
}

- (void)scoreWithScoreRequest:completionHandler:.cold.1()
{
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_190E10000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "-scoreWithScoreRequest:completionHandler is deprecated.", v0, 2u);
}

@end