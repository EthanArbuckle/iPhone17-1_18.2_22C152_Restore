@interface UISIntentForwardingAction
- (INIntent)intent;
- (INIntentForwardingAction)intentForwardingAction;
- (UISIntentForwardingAction)initWithIntent:(id)a3 reply:(id)a4;
- (UISIntentForwardingAction)initWithIntentForwardingAction:(id)a3 responseHandler:(id)a4;
- (id)keyDescriptionForSetting:(unint64_t)a3;
- (int64_t)UIActionType;
@end

@implementation UISIntentForwardingAction

- (UISIntentForwardingAction)initWithIntentForwardingAction:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F62860]);
  if ([v6 conformsToProtocol:&unk_1EE297430])
  {
    [v8 setObject:v6 forSetting:5];
  }
  else
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v9 encodeObject:v6 forKey:@"INIntentForwardingActionObjectKey"];
    v10 = [v9 encodedData];
    [v8 setObject:v10 forSetting:3];
  }
  v11 = (void *)MEMORY[0x1E4F627D0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__UISIntentForwardingAction_initWithIntentForwardingAction_responseHandler___block_invoke;
  v16[3] = &unk_1E57355D0;
  id v17 = v7;
  id v12 = v7;
  v13 = [v11 responderWithHandler:v16];
  objc_msgSend(v13, "setTimeout:", dispatch_time(0, 10000000000));
  v14 = [(UISIntentForwardingAction *)self initWithInfo:v8 responder:v13];

  return v14;
}

void __76__UISIntentForwardingAction_initWithIntentForwardingAction_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [v5 intentForwardingActionResponse];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

- (UISIntentForwardingAction)initWithIntent:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F62860]);
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v9 encodeObject:v6 forKey:@"INIntentObjectKey"];
  v10 = [v9 encodedData];
  [v8 setObject:v10 forSetting:1];

  v11 = (void *)MEMORY[0x1E4F627D0];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __50__UISIntentForwardingAction_initWithIntent_reply___block_invoke;
  v16[3] = &unk_1E57355D0;
  id v17 = v7;
  id v12 = v7;
  v13 = [v11 responderWithHandler:v16];
  objc_msgSend(v13, "setTimeout:", dispatch_time(0, 10000000000));
  v14 = [(UISIntentForwardingAction *)self initWithInfo:v8 responder:v13];

  return v14;
}

void __50__UISIntentForwardingAction_initWithIntent_reply___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = *(void *)(a1 + 32);
    v4 = [v5 intentResponse];
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
}

- (INIntent)intent
{
  cachedIntent = self->_cachedIntent;
  if (cachedIntent)
  {
LABEL_6:
    v11 = cachedIntent;
    goto LABEL_7;
  }
  v4 = [(UISIntentForwardingAction *)self info];
  id v5 = [v4 objectForSetting:1];

  if (v5)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:0];
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    id v7 = (void *)getINIntentClass_softClass;
    uint64_t v17 = getINIntentClass_softClass;
    if (!getINIntentClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getINIntentClass_block_invoke;
      v13[3] = &unk_1E5735260;
      v13[4] = &v14;
      __getINIntentClass_block_invoke((uint64_t)v13);
      id v7 = (void *)v15[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v14, 8);
    v9 = [v6 decodeObjectOfClass:v8 forKey:@"INIntentObjectKey"];
    v10 = self->_cachedIntent;
    self->_cachedIntent = v9;

    [v6 finishDecoding];
    cachedIntent = self->_cachedIntent;
    goto LABEL_6;
  }
  NSLog(&cfstr_SInvalidUisint.isa, "-[UISIntentForwardingAction intent]", self);
  v11 = 0;
LABEL_7:
  return v11;
}

- (INIntentForwardingAction)intentForwardingAction
{
  p_cachedIntentForwardingAction = &self->_cachedIntentForwardingAction;
  cachedIntentForwardingAction = self->_cachedIntentForwardingAction;
  if (cachedIntentForwardingAction) {
    goto LABEL_9;
  }
  id v5 = [(UISIntentForwardingAction *)self info];
  id v6 = [v5 objectForSetting:5];

  if (v6)
  {
    objc_storeStrong((id *)p_cachedIntentForwardingAction, v6);
LABEL_8:

    cachedIntentForwardingAction = *p_cachedIntentForwardingAction;
LABEL_9:
    uint64_t v14 = cachedIntentForwardingAction;
    goto LABEL_10;
  }
  id v7 = [(UISIntentForwardingAction *)self info];
  id v8 = [v7 objectForSetting:3];

  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:0];
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2050000000;
    v10 = (void *)getINIntentForwardingActionClass_softClass;
    uint64_t v20 = getINIntentForwardingActionClass_softClass;
    if (!getINIntentForwardingActionClass_softClass)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __getINIntentForwardingActionClass_block_invoke;
      v16[3] = &unk_1E5735260;
      void v16[4] = &v17;
      __getINIntentForwardingActionClass_block_invoke((uint64_t)v16);
      v10 = (void *)v18[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v17, 8);
    uint64_t v12 = [v9 decodeObjectOfClass:v11 forKey:@"INIntentForwardingActionObjectKey"];
    v13 = *p_cachedIntentForwardingAction;
    *p_cachedIntentForwardingAction = (INIntentForwardingAction *)v12;

    [v9 finishDecoding];
    goto LABEL_8;
  }
  NSLog(&cfstr_SInvalidUisint.isa, "-[UISIntentForwardingAction intentForwardingAction]", self);
  uint64_t v14 = 0;
LABEL_10:
  return v14;
}

- (int64_t)UIActionType
{
  return 27;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  uint64_t v3 = @"intent forwarding action";
  if (a3 != 3) {
    uint64_t v3 = 0;
  }
  if (a3 == 1) {
    return @"intent";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIntentForwardingAction, 0);
  objc_storeStrong((id *)&self->_cachedIntent, 0);
}

@end