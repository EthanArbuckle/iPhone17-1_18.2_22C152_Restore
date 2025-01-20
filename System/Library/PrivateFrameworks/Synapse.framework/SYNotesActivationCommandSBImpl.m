@interface SYNotesActivationCommandSBImpl
+ (void)_activateWithActivity:(id)a3 completion:(id)a4;
+ (void)activateWithDomainIdentifier:(id)a3 noteIdentifier:(id)a4 completion:(id)a5;
@end

@implementation SYNotesActivationCommandSBImpl

+ (void)activateWithDomainIdentifier:(id)a3 noteIdentifier:(id)a4 completion:(id)a5
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = 0;
  if (a3 && a4)
  {
    v16[0] = a3;
    v10 = (void *)MEMORY[0x1E4F1C978];
    id v11 = a4;
    id v12 = a3;
    v13 = [v10 arrayWithObjects:v16 count:1];
    id v15 = v11;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];

    v9 = SYMakeEditNoteUserActivity(v13, v14);
  }
  [a1 _activateWithActivity:v9 completion:v8];
}

+ (void)_activateWithActivity:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v7 = (void *)getSBSSystemNotesPresentationConfigurationClass_softClass_0;
  uint64_t v23 = getSBSSystemNotesPresentationConfigurationClass_softClass_0;
  if (!getSBSSystemNotesPresentationConfigurationClass_softClass_0)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __getSBSSystemNotesPresentationConfigurationClass_block_invoke_0;
    v18 = &unk_1E64635F8;
    v19 = &v20;
    __getSBSSystemNotesPresentationConfigurationClass_block_invoke_0((uint64_t)&v15);
    v7 = (void *)v21[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v20, 8);
  v9 = (void *)[[v8 alloc] initWithSceneBundleIdentifier:@"com.apple.mobilenotes" userActivity:v5 preferredPresentationMode:0];
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2050000000;
  v10 = (void *)getSBSSystemNotesPresentationRequestClass_softClass;
  uint64_t v23 = getSBSSystemNotesPresentationRequestClass_softClass;
  if (!getSBSSystemNotesPresentationRequestClass_softClass)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __getSBSSystemNotesPresentationRequestClass_block_invoke;
    v18 = &unk_1E64635F8;
    v19 = &v20;
    __getSBSSystemNotesPresentationRequestClass_block_invoke((uint64_t)&v15);
    v10 = (void *)v21[3];
  }
  id v11 = v10;
  _Block_object_dispose(&v20, 8);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__SYNotesActivationCommandSBImpl__activateWithActivity_completion___block_invoke;
  v13[3] = &unk_1E64636F0;
  id v14 = v6;
  id v12 = v6;
  [v11 performPresentationWithConfiguration:v9 completion:v13];
}

void __67__SYNotesActivationCommandSBImpl__activateWithActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", "");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1C2C5F000, v4, OS_LOG_TYPE_DEFAULT, "Error received requesting backlink indicator: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

@end