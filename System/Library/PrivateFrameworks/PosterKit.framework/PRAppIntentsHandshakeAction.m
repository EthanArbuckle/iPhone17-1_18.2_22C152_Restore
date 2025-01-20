@interface PRAppIntentsHandshakeAction
- (PRAppIntentsHandshakeAction)initWithHandler:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (void)respondWithListenerEndpoint:(id)a3 error:(id)a4;
@end

@implementation PRAppIntentsHandshakeAction

- (PRAppIntentsHandshakeAction)initWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
  v6 = (void *)MEMORY[0x1E4F4F670];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__PRAppIntentsHandshakeAction_initWithHandler___block_invoke;
  v12[3] = &unk_1E54DCF78;
  id v13 = v4;
  id v7 = v4;
  v8 = [v6 responderWithHandler:v12];
  v11.receiver = self;
  v11.super_class = (Class)PRAppIntentsHandshakeAction;
  v9 = [(PRAppIntentsHandshakeAction *)&v11 initWithInfo:v5 responder:v8];

  return v9;
}

void __47__PRAppIntentsHandshakeAction_initWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  v3 = [v11 info];
  id v4 = [v3 objectForSetting:1];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [v11 error];
  }
  id v7 = v6;

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = [v3 objectForSetting:2];
  v10 = [v11 auditToken];
  (*(void (**)(uint64_t, void *, void *, void *))(v8 + 16))(v8, v9, v10, v7);
}

- (void)respondWithListenerEndpoint:(id)a3 error:(id)a4
{
  unint64_t v11 = (unint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (!(v11 | v7))
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PRAppIntentsHandshakeAction.m" lineNumber:31 description:@"One of either an endpoint or an error is required"];
  }
  if ([(PRAppIntentsHandshakeAction *)self isValid]
    && [(PRAppIntentsHandshakeAction *)self canSendResponse])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F4F7A0]);
    [v8 setObject:v11 forSetting:2];
    [v8 setObject:v7 forSetting:1];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F4F678]) initWithInfo:v8 error:0];
    [(PRAppIntentsHandshakeAction *)self sendResponse:v9];
  }
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v3 = @"endpoint";
  if (a3 != 2) {
    v3 = 0;
  }
  if (a3 == 1) {
    return @"error";
  }
  else {
    return v3;
  }
}

@end