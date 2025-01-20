@interface VUIJSSportsInterface
- (VUIJSSportsInterface)initWithAppContext:(id)a3;
- (id)checkActivityExists:(id)a3;
- (id)getTierType:(id)a3;
- (id)isPlayByPlayEnabled:(id)a3;
- (id)isSportsFeatureEnabled:(id)a3 :(id)a4;
- (id)registerForSportsCanonical:(id)a3 :(id)a4 :(id)a5;
@end

@implementation VUIJSSportsInterface

- (VUIJSSportsInterface)initWithAppContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIJSSportsInterface;
  v5 = [(VUIJSObject *)&v11 initWithAppContext:v4];
  if (v5)
  {
    v6 = [VUIJSSportsJavascriptInterface alloc];
    v7 = [v4 jsContext];
    uint64_t v8 = [(VUIJSSportsJavascriptInterface *)v6 initWithContext:v7];
    implementation = v5->_implementation;
    v5->_implementation = (VUIJSSportsJavascriptInterface *)v8;
  }
  return v5;
}

- (id)checkActivityExists:(id)a3
{
  return [(VUIJSSportsJavascriptInterface *)self->_implementation checkActivityExistsFor:a3];
}

- (id)getTierType:(id)a3
{
  return [(VUIJSSportsJavascriptInterface *)self->_implementation getTierTypeWithLeagueId:a3];
}

- (id)isPlayByPlayEnabled:(id)a3
{
  return [(VUIJSSportsJavascriptInterface *)self->_implementation isPlayByPlayEnabledWithLeagueId:a3];
}

- (id)isSportsFeatureEnabled:(id)a3 :(id)a4
{
  return [(VUIJSSportsJavascriptInterface *)self->_implementation isSportsFeatureEnabledWithLeagueId:a3 featureName:a4];
}

- (id)registerForSportsCanonical:(id)a3 :(id)a4 :(id)a5
{
  id v8 = a4;
  id v9 = a5;
  implementation = self->_implementation;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__VUIJSSportsInterface_registerForSportsCanonical_::__block_invoke;
  v23[3] = &unk_1E6DF7EA8;
  id v24 = v8;
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __53__VUIJSSportsInterface_registerForSportsCanonical_::__block_invoke_2;
  v21 = &unk_1E6DF7ED0;
  id v22 = v9;
  id v11 = v9;
  id v12 = v8;
  [(VUIJSSportsJavascriptInterface *)implementation registerWithRequest:a3 successHandler:v23 errorHandler:&v18];
  v13 = (void *)MEMORY[0x1E4F30938];
  v14 = [(VUIJSObject *)self appContext];
  v15 = [v14 jsContext];
  v16 = [v13 valueWithObject:@"test_identifier" inContext:v15];

  return v16;
}

void __53__VUIJSSportsInterface_registerForSportsCanonical_::__block_invoke(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  v5 = *(void **)(a1 + 32);
  if (v3)
  {
    v9[0] = v3;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v7 = (id)[v5 callWithArguments:v6];
  }
  else
  {
    id v8 = (id)[v5 callWithArguments:MEMORY[0x1E4F1CBF0]];
  }
}

void __53__VUIJSSportsInterface_registerForSportsCanonical_::__block_invoke_2(uint64_t a1, void *a2)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    id v3 = [a2 localizedDescription];
    v7[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    id v5 = (id)[v2 callWithArguments:v4];
  }
  else
  {
    id v6 = (id)[*(id *)(a1 + 32) callWithArguments:MEMORY[0x1E4F1CBF0]];
  }
}

- (void).cxx_destruct
{
}

@end