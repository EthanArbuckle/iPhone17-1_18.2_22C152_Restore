@interface SKUIJSRestrictions
- (BOOL)isRestrictedApp:(id)a3;
- (SKUIJSRestrictions)initWithAppContext:(id)a3 clientContext:(id)a4;
- (int64_t)_explicitRestrictionAlertTypeForTypeString:(id)a3;
- (void)didDisplayExplicitRestrictionAlertOfType:(id)a3;
- (void)isExplicitContentDisallowedInCurrentStoreFront:(id)a3;
- (void)isExplicitContentRestrictedByDefaultInCurrentStoreFront:(id)a3;
- (void)isRestrictionsPasscodeSet:(id)a3;
- (void)presentExplicitRestrictionAlertIfNeededOfType:(id)a3 :(id)a4;
- (void)setAllowExplicitContent;
- (void)shouldDisplayExplicitRestrictionAlertOfType:(id)a3 :(id)a4;
@end

@implementation SKUIJSRestrictions

- (SKUIJSRestrictions)initWithAppContext:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIJSRestrictions initWithAppContext:clientContext:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIJSRestrictions;
  v8 = [(IKJSObject *)&v11 initWithAppContext:v6];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_clientContext, a4);
  }

  return v9;
}

- (BOOL)isRestrictedApp:(id)a3
{
  id v3 = a3;
  if ([MEMORY[0x1E4FB8870] isRestrictedAppBundleIdentifier:v3])
  {
    LOBYTE(v4) = 1;
  }
  else if ([v3 isEqualToString:@"com.apple.facetime"])
  {
    int v5 = MGGetBoolAnswer();
    int v4 = v5 & MGGetBoolAnswer() ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)isExplicitContentRestrictedByDefaultInCurrentStoreFront:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F30928];
  id v5 = a3;
  id v6 = [v4 managedValueWithValue:v5];
  id v7 = [v5 context];

  v8 = [v7 virtualMachine];

  [v8 addManagedReference:v6 withOwner:self];
  v9 = [(IKJSObject *)self appContext];
  v10 = (void *)MEMORY[0x1E4FA82B0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __78__SKUIJSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke;
  v14[3] = &unk_1E6423D80;
  id v15 = v9;
  id v16 = v6;
  id v17 = v8;
  v18 = self;
  id v11 = v8;
  id v12 = v6;
  id v13 = v9;
  [v10 isExplicitContentRestrictedByDefaultInCurrentStoreFront:v14];
}

void __78__SKUIJSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke(uint64_t a1, char a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__SKUIJSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke_2;
  v7[3] = &unk_1E6423D58;
  int v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  char v11 = a2;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v5;
  uint64_t v10 = v6;
  [v4 evaluate:v7 completionBlock:0];
}

void __78__SKUIJSRestrictions_isExplicitContentRestrictedByDefaultInCurrentStoreFront___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) value];
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v6[0] = v3;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v5 = (id)[v2 callWithArguments:v4];

  [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 48)];
}

- (void)isExplicitContentDisallowedInCurrentStoreFront:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F30928];
  id v5 = a3;
  uint64_t v6 = [v4 managedValueWithValue:v5];
  id v7 = [v5 context];

  id v8 = [v7 virtualMachine];

  [v8 addManagedReference:v6 withOwner:self];
  id v9 = [(IKJSObject *)self appContext];
  uint64_t v10 = (void *)MEMORY[0x1E4FA82B0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __69__SKUIJSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke;
  v14[3] = &unk_1E6423D80;
  id v15 = v9;
  id v16 = v6;
  id v17 = v8;
  v18 = self;
  id v11 = v8;
  id v12 = v6;
  id v13 = v9;
  [v10 isExplicitContentDisallowedInCurrentStoreFront:v14];
}

void __69__SKUIJSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke(uint64_t a1, char a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SKUIJSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke_2;
  v7[3] = &unk_1E6423D58;
  int v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  char v11 = a2;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v5;
  uint64_t v10 = v6;
  [v4 evaluate:v7 completionBlock:0];
}

void __69__SKUIJSRestrictions_isExplicitContentDisallowedInCurrentStoreFront___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) value];
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v6[0] = v3;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v5 = (id)[v2 callWithArguments:v4];

  [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 48)];
}

- (void)isRestrictionsPasscodeSet:(id)a3
{
  int v4 = (void *)MEMORY[0x1E4F30928];
  id v5 = a3;
  uint64_t v6 = [v4 managedValueWithValue:v5];
  id v7 = [v5 context];

  id v8 = [v7 virtualMachine];

  [v8 addManagedReference:v6 withOwner:self];
  id v9 = [(IKJSObject *)self appContext];
  uint64_t v10 = (void *)MEMORY[0x1E4FA82B0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__SKUIJSRestrictions_isRestrictionsPasscodeSet___block_invoke;
  v14[3] = &unk_1E6423D80;
  id v15 = v9;
  id v16 = v6;
  id v17 = v8;
  v18 = self;
  id v11 = v8;
  id v12 = v6;
  id v13 = v9;
  [v10 isRestrictionsPasscodeSet:v14];
}

void __48__SKUIJSRestrictions_isRestrictionsPasscodeSet___block_invoke(uint64_t a1, char a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__SKUIJSRestrictions_isRestrictionsPasscodeSet___block_invoke_2;
  v7[3] = &unk_1E6423D58;
  int v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  char v11 = a2;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v5;
  uint64_t v10 = v6;
  [v4 evaluate:v7 completionBlock:0];
}

void __48__SKUIJSRestrictions_isRestrictionsPasscodeSet___block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) value];
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v6[0] = v3;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v5 = (id)[v2 callWithArguments:v4];

  [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 48)];
}

- (void)setAllowExplicitContent
{
}

- (void)shouldDisplayExplicitRestrictionAlertOfType:(id)a3 :(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F30928];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 managedValueWithValue:v7];
  uint64_t v10 = [v7 context];

  char v11 = [v10 virtualMachine];

  [v11 addManagedReference:v9 withOwner:self];
  id v12 = [(IKJSObject *)self appContext];
  int64_t v13 = [(SKUIJSRestrictions *)self _explicitRestrictionAlertTypeForTypeString:v8];

  if (v13 < 0)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __67__SKUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke_3;
    v21[3] = &unk_1E6423DA8;
    id v15 = &v22;
    id v16 = (id *)v23;
    v22 = v9;
    v23[0] = v11;
    v23[1] = self;
    id v19 = v11;
    id v20 = v9;
    [v12 evaluate:v21 completionBlock:0];
  }
  else
  {
    v14 = (void *)MEMORY[0x1E4FA82B0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __67__SKUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke;
    v24[3] = &unk_1E6423D80;
    id v15 = &v25;
    id v16 = &v26;
    id v25 = v12;
    v26 = v9;
    id v27 = v11;
    v28 = self;
    id v17 = v11;
    id v18 = v9;
    [v14 shouldDisplayExplicitRestrictionAlertOfType:v13 completionBlock:v24];
  }
}

void __67__SKUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke(uint64_t a1, char a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__SKUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke_2;
  v7[3] = &unk_1E6423D58;
  int v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  char v11 = a2;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v5;
  uint64_t v10 = v6;
  [v4 evaluate:v7 completionBlock:0];
}

void __67__SKUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) value];
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v6[0] = v3;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v5 = (id)[v2 callWithArguments:v4];

  [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 48)];
}

void __67__SKUIJSRestrictions_shouldDisplayExplicitRestrictionAlertOfType::__block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) value];
  id v2 = (id)[v3 callWithArguments:&unk_1F1D62000];
  [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 48)];
}

- (void)didDisplayExplicitRestrictionAlertOfType:(id)a3
{
  int64_t v3 = [(SKUIJSRestrictions *)self _explicitRestrictionAlertTypeForTypeString:a3];
  if ((v3 & 0x8000000000000000) == 0)
  {
    int64_t v4 = v3;
    id v5 = (void *)MEMORY[0x1E4FA82B0];
    [v5 didDisplayExplicitRestrictionAlertOfType:v4];
  }
}

- (void)presentExplicitRestrictionAlertIfNeededOfType:(id)a3 :(id)a4
{
  uint64_t v6 = (void *)MEMORY[0x1E4F30928];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 managedValueWithValue:v7];
  uint64_t v10 = [v7 context];

  char v11 = [v10 virtualMachine];

  [v11 addManagedReference:v9 withOwner:self];
  id v12 = [(IKJSObject *)self appContext];
  int64_t v13 = [(SKUIJSRestrictions *)self _explicitRestrictionAlertTypeForTypeString:v8];

  if (v13 < 0)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__SKUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke_3;
    v17[3] = &unk_1E6423DA8;
    id v18 = v9;
    id v19 = v11;
    id v20 = self;
    id v16 = v11;
    v14 = v9;
    [v12 evaluate:v17 completionBlock:0];

    id v15 = v18;
  }
  else
  {
    v14 = [[SKUIExplicitRestrictionAlertController alloc] initWithClientContext:self->_clientContext];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __69__SKUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke;
    v21[3] = &unk_1E6423D80;
    id v22 = v12;
    id v23 = v9;
    id v24 = v11;
    id v25 = self;
    id v15 = v11;
    id v16 = v9;
    [(SKUIExplicitRestrictionAlertController *)v14 presentExplicitRestrictionAlertIfNeededOfType:v13 completionBlock:v21];
  }
}

void __69__SKUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke(uint64_t a1, char a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__SKUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke_2;
  v7[3] = &unk_1E6423D58;
  int64_t v4 = *(void **)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  char v11 = a2;
  id v5 = *(id *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  id v9 = v5;
  uint64_t v10 = v6;
  [v4 evaluate:v7 completionBlock:0];
}

void __69__SKUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke_2(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) value];
  int64_t v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 56)];
  v6[0] = v3;
  int64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v5 = (id)[v2 callWithArguments:v4];

  [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 48)];
}

void __69__SKUIJSRestrictions_presentExplicitRestrictionAlertIfNeededOfType::__block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) value];
  id v2 = (id)[v3 callWithArguments:&unk_1F1D62018];
  [*(id *)(a1 + 40) removeManagedReference:*(void *)(a1 + 32) withOwner:*(void *)(a1 + 48)];
}

- (int64_t)_explicitRestrictionAlertTypeForTypeString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"onLaunch"])
  {
    int64_t v4 = 0;
  }
  else if ([v3 isEqualToString:@"onContainerLoad"])
  {
    int64_t v4 = 1;
  }
  else if ([v3 isEqualToString:@"onPlay"])
  {
    int64_t v4 = 2;
  }
  else if ([v3 isEqualToString:@"onPurchase"])
  {
    int64_t v4 = 3;
  }
  else if ([v3 isEqualToString:@"onAddToLibrary"])
  {
    int64_t v4 = 4;
  }
  else if ([v3 isEqualToString:@"onOpen"])
  {
    int64_t v4 = 5;
  }
  else
  {
    int64_t v4 = -1;
  }

  return v4;
}

- (void).cxx_destruct
{
}

- (void)initWithAppContext:clientContext:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIJSRestrictions initWithAppContext:clientContext:]";
}

@end