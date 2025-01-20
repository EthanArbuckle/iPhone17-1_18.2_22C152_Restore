@interface SYNotesActivationCommandSynapseImpl
+ (void)_activateWithActivity:(id)a3 completion:(id)a4;
+ (void)activateWithDomainIdentifier:(id)a3 noteIdentifier:(id)a4 completion:(id)a5;
@end

@implementation SYNotesActivationCommandSynapseImpl

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
  v6 = (void (**)(id, SYNotesActivationClient *))a4;
  if (SYIsPhone() && (SYIsQuickNoteOnPhoneEnabled() & 1) != 0)
  {
    v7 = objc_alloc_init(SYNotesActivationClient);
    [(SYNotesActivationClient *)v7 activateNotesWithUserActivity:v5 completion:v6];
LABEL_8:

    goto LABEL_9;
  }
  id v8 = os_log_create("com.apple.synapse", "");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    +[SYNotesActivationCommandSynapseImpl _activateWithActivity:completion:](v8);
  }

  if (v6)
  {
    v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.synapse" code:-127 userInfo:0];
    v6[2](v6, v7);
    goto LABEL_8;
  }
LABEL_9:
}

+ (void)_activateWithActivity:(os_log_t)log completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_ERROR, "Feature flag is not enabled", v1, 2u);
}

@end