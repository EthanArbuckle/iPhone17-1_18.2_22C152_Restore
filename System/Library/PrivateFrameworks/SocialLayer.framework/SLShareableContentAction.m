@interface SLShareableContentAction
+ (BOOL)supportsSecureCoding;
+ (id)actionWithBSAction:(id)a3;
- (BSAction)action;
- (NSString)sceneIdentifier;
- (SLShareableContentAction)initWithAction:(id)a3;
- (SLShareableContentAction)initWithCoder:(id)a3;
- (SLShareableContentAction)initWithInfo:(id)a3 responseHandler:(id)a4;
- (SLShareableContentAction)initWithSceneIdentifier:(id)a3 responseHandler:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)fail;
- (void)failWithError:(id)a3;
- (void)fulfillWithResponse:(id)a3;
@end

@implementation SLShareableContentAction

+ (id)actionWithBSAction:(id)a3
{
  id v3 = a3;
  v4 = [v3 info];
  v5 = [v4 objectForSetting:30295];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v6 = NSClassFromString(v5),
        [(objc_class *)v6 isSubclassOfClass:objc_opt_class()])
    && [(objc_class *)v6 instancesRespondToSelector:sel_initWithAction_])
  {
    v7 = (void *)[[v6 alloc] initWithAction:v3];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SLShareableContentAction)initWithAction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLShareableContentAction;
  v6 = [(SLShareableContentAction *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_action, a3);
  }

  return v7;
}

- (SLShareableContentAction)initWithInfo:(id)a3 responseHandler:(id)a4
{
  id v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  [v9 applySettings:v8];

  v10 = (objc_class *)objc_opt_class();
  v11 = NSStringFromClass(v10);
  [v9 setObject:v11 forSetting:30295];

  v12 = (void *)MEMORY[0x1E4F4F670];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __57__SLShareableContentAction_initWithInfo_responseHandler___block_invoke;
  v18[3] = &unk_1E58A9760;
  id v19 = v6;
  id v13 = v6;
  v14 = [v12 responderWithHandler:v18];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F4F668]) initWithInfo:v9 responder:v14];
  v16 = [(SLShareableContentAction *)self initWithAction:v15];

  return v16;
}

void __57__SLShareableContentAction_initWithInfo_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 error];

  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = [v3 error];

    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v7);
  }
  else
  {
    id v6 = [v3 info];

    id v7 = [v6 objectForSetting:2];

    (*(void (**)(void, id, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v7, 0);
  }
}

- (SLShareableContentAction)initWithSceneIdentifier:(id)a3 responseHandler:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_alloc_init(v6);
  [v9 setObject:v8 forSetting:1];

  v10 = [(SLShareableContentAction *)self initWithInfo:v9 responseHandler:v7];
  return v10;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(SLShareableContentAction *)self sceneIdentifier];
  [v3 appendFormat:@" sceneIdentifier=%@", v4];

  [v3 appendString:@">"];
  uint64_t v5 = (void *)[v3 copy];

  return v5;
}

- (NSString)sceneIdentifier
{
  p_sceneIdentifier = &self->_sceneIdentifier;
  sceneIdentifier = self->_sceneIdentifier;
  if (!sceneIdentifier)
  {
    uint64_t v5 = [(SLShareableContentAction *)self action];
    id v6 = [v5 info];
    id v7 = [v6 objectForSetting:1];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      objc_storeStrong((id *)p_sceneIdentifier, v7);
    }

    sceneIdentifier = *p_sceneIdentifier;
  }
  return sceneIdentifier;
}

- (void)fulfillWithResponse:(id)a3
{
  v4 = (objc_class *)MEMORY[0x1E4F4F7A0];
  id v5 = a3;
  id v8 = objc_alloc_init(v4);
  [v8 setObject:v5 forSetting:2];

  id v6 = [(SLShareableContentAction *)self action];
  id v7 = [MEMORY[0x1E4F4F678] responseWithInfo:v8];
  [v6 sendResponse:v7];
}

- (void)failWithError:(id)a3
{
  id v4 = a3;
  id v9 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:1 userInfo:0];
  }
  id v6 = v5;
  id v7 = [(SLShareableContentAction *)self action];
  id v8 = [MEMORY[0x1E4F4F678] responseForError:v6];
  [v7 sendResponse:v8];
}

- (void)fail
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SLShareableContentAction *)self init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    id v7 = NSStringFromSelector(sel_sceneIdentifier);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    sceneIdentifier = v5->_sceneIdentifier;
    v5->_sceneIdentifier = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(SLShareableContentAction *)self sceneIdentifier];
  id v5 = NSStringFromSelector(sel_sceneIdentifier);
  [v4 encodeObject:v6 forKey:v5];
}

- (BSAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end