@interface SBTraitsAmbientPresentationDefaultResolver
- (NSString)thresholdRole;
- (SBTraitsAmbientPresentationDefaultResolver)init;
- (SBTraitsAmbientPresentationDefaultResolver)initWithComponentOrder:(id)a3;
- (SBTraitsAmbientPresentationDefaultResolver)initWithThresholdRole:(id)a3 componentOrder:(id)a4;
- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4;
- (void)setThresholdRole:(id)a3;
@end

@implementation SBTraitsAmbientPresentationDefaultResolver

uint64_t __97__SBTraitsAmbientPresentationDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  [a2 currentZOrderLevel];
  v6 = objc_msgSend(v4, "numberWithDouble:");
  v7 = NSNumber;
  [v5 currentZOrderLevel];
  double v9 = v8;

  v10 = [v7 numberWithDouble:v9];
  uint64_t v11 = [v6 compare:v10];

  return v11;
}

- (void)resolveStagePreferencesWithContext:(id)a3 preferencesTree:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = [v5 acquiredParticipants];
  v7 = [v6 sortedArrayUsingComparator:&__block_literal_global_84];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v7;
  uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    int v10 = 0;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        v14 = [v13 role];
        int v15 = [v14 isEqualToString:self->_thresholdRole];

        v10 |= v15;
        if (v10)
        {
          char v16 = 0;
        }
        else
        {
          if ([v13 currentAmbientPresentedFlag] == 0x7FFFFFFFFFFFFFFFLL) {
            continue;
          }
          char v16 = 1;
        }
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __97__SBTraitsAmbientPresentationDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke_2;
        v18[3] = &unk_1E6AFC410;
        char v20 = v16;
        id v19 = v5;
        [v13 updateAmbientPresentationSettingsWithBlock:v18];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v9);
  }
}

- (SBTraitsAmbientPresentationDefaultResolver)initWithThresholdRole:(id)a3 componentOrder:(id)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBTraitsAmbientPresentationDefaultResolver;
  uint64_t v8 = [(SBTraitsAmbientPresentationStageComponent *)&v11 initWithComponentOrder:a4];
  uint64_t v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_thresholdRole, a3);
  }

  return v9;
}

- (SBTraitsAmbientPresentationDefaultResolver)initWithComponentOrder:(id)a3
{
  return [(SBTraitsAmbientPresentationDefaultResolver *)self initWithThresholdRole:0 componentOrder:a3];
}

- (SBTraitsAmbientPresentationDefaultResolver)init
{
  return [(SBTraitsAmbientPresentationDefaultResolver *)self initWithThresholdRole:0 componentOrder:&unk_1F3349C68];
}

void __97__SBTraitsAmbientPresentationDefaultResolver_resolveStagePreferencesWithContext_preferencesTree___block_invoke_2(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v5 = a2;
    [v5 setAmbientPresentationInputs:0];
  }
  else
  {
    v2 = *(void **)(a1 + 32);
    id v3 = a2;
    id v5 = [v2 validatedInputs];
    v4 = [v5 ambientPresentationInputs];
    [v3 setAmbientPresentationInputs:v4];
  }
}

- (NSString)thresholdRole
{
  return self->_thresholdRole;
}

- (void)setThresholdRole:(id)a3
{
}

- (void).cxx_destruct
{
}

@end