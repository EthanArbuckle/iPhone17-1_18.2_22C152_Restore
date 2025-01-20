@interface SBSAElementViewInteractionResult
+ (Class)mutatorClass;
+ (id)instanceWithBlock:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSString)elementIdentifier;
- (SBSAElementViewInteractionResult)initWithIdentity:(id)a3 interactionSource:(unint64_t)a4 viewInteractionResult:(int64_t)a5;
- (id)copyWithBlock:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)viewInteractionResult;
- (unint64_t)hash;
- (unint64_t)interactionSource;
- (void)_setClientIdentifier:(id)a3;
- (void)_setElementIdentifier:(id)a3;
- (void)_setInteractionSource:(unint64_t)a3;
- (void)_setViewInteractionResult:(int64_t)a3;
@end

@implementation SBSAElementViewInteractionResult

- (SBSAElementViewInteractionResult)initWithIdentity:(id)a3 interactionSource:(unint64_t)a4 viewInteractionResult:(int64_t)a5
{
  id v8 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBSAElementViewInteractionResult;
  v9 = [(SBSAElementViewInteractionResult *)&v17 init];
  if (v9)
  {
    v10 = [v8 clientIdentifier];
    uint64_t v11 = [v10 copy];
    clientIdentifier = v9->_clientIdentifier;
    v9->_clientIdentifier = (NSString *)v11;

    v13 = [v8 elementIdentifier];
    uint64_t v14 = [v13 copy];
    elementIdentifier = v9->_elementIdentifier;
    v9->_elementIdentifier = (NSString *)v14;

    v9->_interactionSource = a4;
    v9->_viewInteractionResult = a5;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F4F738] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  clientIdentifier = self->_clientIdentifier;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __44__SBSAElementViewInteractionResult_isEqual___block_invoke;
  v29[3] = &unk_1E6AF9E90;
  id v7 = v4;
  id v30 = v7;
  id v8 = [v5 appendObject:clientIdentifier counterpart:v29];
  elementIdentifier = self->_elementIdentifier;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __44__SBSAElementViewInteractionResult_isEqual___block_invoke_2;
  v27[3] = &unk_1E6AF9E90;
  id v10 = v7;
  id v28 = v10;
  uint64_t v11 = [v8 appendObject:elementIdentifier counterpart:v27];
  unint64_t interactionSource = self->_interactionSource;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __44__SBSAElementViewInteractionResult_isEqual___block_invoke_3;
  v25[3] = &unk_1E6AF9660;
  id v13 = v10;
  id v26 = v13;
  uint64_t v14 = [v11 appendInteger:interactionSource counterpart:v25];
  int64_t viewInteractionResult = self->_viewInteractionResult;
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __44__SBSAElementViewInteractionResult_isEqual___block_invoke_4;
  v23 = &unk_1E6AF9660;
  id v24 = v13;
  id v16 = v13;
  objc_super v17 = [v14 appendInteger:viewInteractionResult counterpart:&v20];
  char v18 = objc_msgSend(v17, "isEqual", v20, v21, v22, v23);

  return v18;
}

uint64_t __44__SBSAElementViewInteractionResult_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) clientIdentifier];
}

uint64_t __44__SBSAElementViewInteractionResult_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) elementIdentifier];
}

uint64_t __44__SBSAElementViewInteractionResult_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) interactionSource];
}

uint64_t __44__SBSAElementViewInteractionResult_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) viewInteractionResult];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = [v3 appendObject:self->_clientIdentifier];
  v5 = [v4 appendObject:self->_elementIdentifier];
  v6 = [v5 appendInteger:self->_interactionSource];
  id v7 = [v6 appendInteger:self->_viewInteractionResult];
  unint64_t v8 = [v7 hash];

  return v8;
}

- (NSString)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  clientIdentifier = self->_clientIdentifier;
  elementIdentifier = self->_elementIdentifier;
  unint64_t interactionSource = self->_interactionSource;
  if (interactionSource > 2) {
    unint64_t v8 = @"[Invalid]";
  }
  else {
    unint64_t v8 = off_1E6AF9EB0[interactionSource];
  }
  v9 = SAUIStringFromElementViewInteractionResult();
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; clientIdentifier: %@; elementIdentifier: %@; interaction source: %@; view interaction result: %@>",
    v4,
    self,
    clientIdentifier,
    elementIdentifier,
    v8,
  id v10 = v9);

  return (NSString *)v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unint64_t interactionSource = self->_interactionSource;
  int64_t viewInteractionResult = self->_viewInteractionResult;
  return (id)[v4 initWithIdentity:self interactionSource:interactionSource viewInteractionResult:viewInteractionResult];
}

+ (id)instanceWithBlock:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)[v4 copyWithBlock:v3];

  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  v5 = (void *)[(SBSAElementViewInteractionResult *)self copy];
  if (v4)
  {
    v6 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithElementViewInteractionResult:", v5);
    v4[2](v4, v6);
  }
  return v5;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)_setClientIdentifier:(id)a3
{
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)_setElementIdentifier:(id)a3
{
}

- (unint64_t)interactionSource
{
  return self->_interactionSource;
}

- (void)_setInteractionSource:(unint64_t)a3
{
  self->_unint64_t interactionSource = a3;
}

- (int64_t)viewInteractionResult
{
  return self->_viewInteractionResult;
}

- (void)_setViewInteractionResult:(int64_t)a3
{
  self->_int64_t viewInteractionResult = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end