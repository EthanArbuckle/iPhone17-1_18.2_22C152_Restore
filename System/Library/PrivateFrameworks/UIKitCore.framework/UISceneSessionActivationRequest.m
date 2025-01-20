@interface UISceneSessionActivationRequest
+ (UISceneSessionActivationRequest)request;
+ (UISceneSessionActivationRequest)requestWithRole:(UISceneSessionRole)role;
+ (UISceneSessionActivationRequest)requestWithSession:(UISceneSession *)session;
- (NSString)debugDescription;
- (NSUserActivity)userActivity;
- (UISceneActivationRequestOptions)options;
- (UISceneSession)session;
- (UISceneSessionRole)role;
- (id)_initWithSession:(id)a3 role:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescriptionWithMultilinePrefix:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setOptions:(UISceneActivationRequestOptions *)options;
- (void)setUserActivity:(NSUserActivity *)userActivity;
@end

@implementation UISceneSessionActivationRequest

- (id)_initWithSession:(id)a3 role:(id)a4
{
  unint64_t v7 = (unint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  if (os_variant_has_internal_diagnostics())
  {
    if (!(v7 | v8))
    {
      v15 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v15, OS_LOG_TYPE_FAULT, "Request cannot be initialized without a role or an existing scene session.", buf, 2u);
      }
    }
  }
  else if (!(v7 | v8))
  {
    v16 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_initWithSession_role____s_category) + 8);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "Request cannot be initialized without a role or an existing scene session.", buf, 2u);
    }
  }
  v17.receiver = self;
  v17.super_class = (Class)UISceneSessionActivationRequest;
  v9 = [(UISceneSessionActivationRequest *)&v17 init];
  if (v9)
  {
    v10 = [(id)v7 role];
    v11 = v10;
    if (v10) {
      v12 = v10;
    }
    else {
      v12 = (NSString *)[(id)v8 copy];
    }
    role = v9->_role;
    v9->_role = v12;

    objc_storeStrong((id *)&v9->_session, a3);
  }

  return v9;
}

+ (UISceneSessionActivationRequest)request
{
  id v2 = [[UISceneSessionActivationRequest alloc] _initWithSession:0 role:@"UIWindowSceneSessionRoleApplication"];
  return (UISceneSessionActivationRequest *)v2;
}

+ (UISceneSessionActivationRequest)requestWithRole:(UISceneSessionRole)role
{
  v3 = role;
  id v4 = [[UISceneSessionActivationRequest alloc] _initWithSession:0 role:v3];

  return (UISceneSessionActivationRequest *)v4;
}

+ (UISceneSessionActivationRequest)requestWithSession:(UISceneSession *)session
{
  v3 = session;
  id v4 = [[UISceneSessionActivationRequest alloc] _initWithSession:v3 role:0];

  return (UISceneSessionActivationRequest *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [UISceneSessionActivationRequest alloc];
  v5 = [(UISceneSessionActivationRequest *)self session];
  v6 = [(UISceneSessionActivationRequest *)self role];
  id v7 = [(UISceneSessionActivationRequest *)v4 _initWithSession:v5 role:v6];

  unint64_t v8 = [(UISceneSessionActivationRequest *)self userActivity];
  [v7 setUserActivity:v8];

  v9 = [(UISceneSessionActivationRequest *)self options];
  v10 = (void *)[v9 copy];
  [v7 setOptions:v10];

  return v7;
}

- (NSString)debugDescription
{
  return (NSString *)[(UISceneSessionActivationRequest *)self debugDescriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  id v2 = [(UISceneSessionActivationRequest *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__UISceneSessionActivationRequest_succinctDescriptionBuilder__block_invoke;
  v7[3] = &unk_1E52D9F98;
  id v4 = v3;
  id v8 = v4;
  v9 = self;
  [v4 appendProem:0 block:v7];
  id v5 = v4;

  return v5;
}

void __61__UISceneSessionActivationRequest_succinctDescriptionBuilder__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) role];
  [v1 appendString:v2 withName:@"role"];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  id v5 = [(UISceneSessionActivationRequest *)self succinctDescriptionBuilder];
  [v5 setActiveMultilinePrefix:v4];
  v6 = [(UISceneSessionActivationRequest *)self session];
  if (v6
    || ([(UISceneSessionActivationRequest *)self role], (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(UISceneSessionActivationRequest *)self userActivity],
        (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_5:
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __73__UISceneSessionActivationRequest_descriptionBuilderWithMultilinePrefix___block_invoke;
    v9[3] = &unk_1E52D9F98;
    id v10 = v5;
    v11 = self;
    [v10 appendBodySectionWithName:&stru_1ED0E84C0 multilinePrefix:v4 block:v9];

    goto LABEL_6;
  }
  id v8 = [(UISceneSessionActivationRequest *)self options];

  if (v8) {
    goto LABEL_5;
  }
LABEL_6:

  return v5;
}

void __73__UISceneSessionActivationRequest_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) session];
  id v4 = (id)[v2 appendObject:v3 withName:@"session" skipIfNil:1];

  id v5 = *(void **)(a1 + 32);
  v6 = [*(id *)(a1 + 40) userActivity];
  id v7 = (id)[v5 appendObject:v6 withName:@"userActivity" skipIfNil:1];

  id v8 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) options];
  id v9 = (id)[v8 appendObject:v10 withName:@"options" skipIfNil:1];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UISceneSessionActivationRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  v3 = [(UISceneSessionActivationRequest *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (UISceneSessionRole)role
{
  return self->_role;
}

- (UISceneSession)session
{
  return self->_session;
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(NSUserActivity *)userActivity
{
}

- (UISceneActivationRequestOptions)options
{
  return self->_options;
}

- (void)setOptions:(UISceneActivationRequestOptions *)options
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_role, 0);
}

@end