@interface UISIntentForwardingActionResponse
+ (id)responseWithIntentForwardingActionResponse:(id)a3;
+ (id)responseWithIntentResponse:(id)a3;
- (INIntentForwardingActionResponse)intentForwardingActionResponse;
- (INIntentResponse)intentResponse;
- (UISIntentForwardingActionResponse)initWithIntentForwardingActionResponse:(id)a3;
- (UISIntentForwardingActionResponse)initWithIntentResponse:(id)a3;
- (id)keyDescriptionForSetting:(unint64_t)a3;
@end

@implementation UISIntentForwardingActionResponse

- (UISIntentForwardingActionResponse)initWithIntentForwardingActionResponse:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F62860]);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v6 encodeObject:v4 forKey:@"INIntentForwardingActionResponseObjectKey"];
  v7 = [v6 encodedData];
  [v5 setObject:v7 forSetting:4];

  v8 = [(UISIntentForwardingActionResponse *)self initWithInfo:v5 error:0];
  return v8;
}

+ (id)responseWithIntentForwardingActionResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithIntentForwardingActionResponse:v4];

  return v5;
}

- (UISIntentForwardingActionResponse)initWithIntentResponse:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F62860]);
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
  [v6 encodeObject:v4 forKey:@"INIntentResponseObjectKey"];
  v7 = [v6 encodedData];
  [v5 setObject:v7 forSetting:2];

  v8 = [(UISIntentForwardingActionResponse *)self initWithInfo:v5 error:0];
  return v8;
}

+ (id)responseWithIntentResponse:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithIntentResponse:v4];

  return v5;
}

- (INIntentResponse)intentResponse
{
  cachedIntentResponse = self->_cachedIntentResponse;
  if (cachedIntentResponse)
  {
LABEL_6:
    v11 = cachedIntentResponse;
    goto LABEL_7;
  }
  id v4 = [(UISIntentForwardingActionResponse *)self info];
  id v5 = [v4 objectForSetting:2];

  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:0];
    [v6 setRequiresSecureCoding:1];
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v7 = (void *)getINIntentResponseClass_softClass;
    uint64_t v17 = getINIntentResponseClass_softClass;
    if (!getINIntentResponseClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getINIntentResponseClass_block_invoke;
      v13[3] = &unk_1E5735260;
      v13[4] = &v14;
      __getINIntentResponseClass_block_invoke((uint64_t)v13);
      v7 = (void *)v15[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v14, 8);
    v9 = [v6 decodeObjectOfClass:v8 forKey:@"INIntentResponseObjectKey"];
    v10 = self->_cachedIntentResponse;
    self->_cachedIntentResponse = v9;

    [v6 finishDecoding];
    cachedIntentResponse = self->_cachedIntentResponse;
    goto LABEL_6;
  }
  NSLog(&cfstr_SInvalidUisint_0.isa, "-[UISIntentForwardingActionResponse intentResponse]", self);
  v11 = 0;
LABEL_7:
  return v11;
}

- (INIntentForwardingActionResponse)intentForwardingActionResponse
{
  cachedIntentForwardingActionResponse = self->_cachedIntentForwardingActionResponse;
  if (cachedIntentForwardingActionResponse)
  {
LABEL_6:
    v11 = cachedIntentForwardingActionResponse;
    goto LABEL_7;
  }
  id v4 = [(UISIntentForwardingActionResponse *)self info];
  id v5 = [v4 objectForSetting:4];

  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v5 error:0];
    [v6 setRequiresSecureCoding:1];
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x2050000000;
    v7 = (void *)getINIntentForwardingActionResponseClass_softClass;
    uint64_t v17 = getINIntentForwardingActionResponseClass_softClass;
    if (!getINIntentForwardingActionResponseClass_softClass)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __getINIntentForwardingActionResponseClass_block_invoke;
      v13[3] = &unk_1E5735260;
      v13[4] = &v14;
      __getINIntentForwardingActionResponseClass_block_invoke((uint64_t)v13);
      v7 = (void *)v15[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v14, 8);
    v9 = [v6 decodeObjectOfClass:v8 forKey:@"INIntentForwardingActionResponseObjectKey"];
    v10 = self->_cachedIntentForwardingActionResponse;
    self->_cachedIntentForwardingActionResponse = v9;

    [v6 finishDecoding];
    cachedIntentForwardingActionResponse = self->_cachedIntentForwardingActionResponse;
    goto LABEL_6;
  }
  NSLog(&cfstr_SInvalidUisint_0.isa, "-[UISIntentForwardingActionResponse intentForwardingActionResponse]", self);
  v11 = 0;
LABEL_7:
  return v11;
}

- (id)keyDescriptionForSetting:(unint64_t)a3
{
  v3 = @"intent forwarding action response";
  if (a3 != 4) {
    v3 = 0;
  }
  if (a3 == 2) {
    return @"intent response";
  }
  else {
    return v3;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIntentForwardingActionResponse, 0);
  objc_storeStrong((id *)&self->_cachedIntentResponse, 0);
}

@end