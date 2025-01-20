@interface SDDaemonCommon
+ (id)_allowListedXPCClientInterface;
+ (id)_allowListedXPCServerInterface;
@end

@implementation SDDaemonCommon

+ (id)_allowListedXPCServerInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38ECAA8];
  v3 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v3 forSelector:sel_getCurrentDevice_ argumentIndex:0 ofReply:1];

  v4 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v4 forSelector:sel_enrollDevice_inProgram_completion_ argumentIndex:0 ofReply:0];

  v5 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v5 forSelector:sel_enrollDevice_inProgram_completion_ argumentIndex:1 ofReply:0];

  v6 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v6 forSelector:sel_enrollDevice_inProgram_completion_ argumentIndex:0 ofReply:1];

  v7 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  [v2 setClasses:v9 forSelector:sel_getDevicesForPlatforms_completion_ argumentIndex:0 ofReply:1];

  v10 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v13 = objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  [v2 setClasses:v13 forSelector:sel_queryProgramsForSystemAccountsWithPlatforms_completion_ argumentIndex:0 ofReply:1];

  v14 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v14 forSelector:sel_isDeviceEnrolledInBetaProgram_completion_ argumentIndex:0 ofReply:0];

  v15 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v15 forSelector:sel_enrolledBetaProgramForDevice_completion_ argumentIndex:0 ofReply:0];

  v16 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v16 forSelector:sel_enrolledBetaProgramForDevice_completion_ argumentIndex:0 ofReply:1];

  v17 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v17 forSelector:sel_unenrollDevice_completion_ argumentIndex:0 ofReply:0];

  v18 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v18 forSelector:sel_canFileFeedbackOnDevice_completion_ argumentIndex:0 ofReply:0];

  v19 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v19 forSelector:sel_getCurrentSeedingAppleIDForDevice_completion_ argumentIndex:0 ofReply:0];

  v20 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v20 forSelector:sel_getCurrentSeedingAppleIDForDevice_completion_ argumentIndex:0 ofReply:1];

  v21 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v21 forSelector:sel_getCurrentSeedingAppleIDForDevice_completion_ argumentIndex:0 ofReply:0];

  v22 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v22 forSelector:sel_getCurrentSeedingAppleIDForDevice_completion_ argumentIndex:0 ofReply:1];

  v23 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v23 forSelector:sel_setAppleAccountIdentifierFromAlternateDSID_forDevice_completion_ argumentIndex:0 ofReply:0];

  v24 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v24 forSelector:sel_setAppleAccountIdentifierFromAlternateDSID_forDevice_completion_ argumentIndex:1 ofReply:0];

  v25 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v25 forSelector:sel_setAppleAccountIdentifierFromAlternateDSID_forDevice_completion_ argumentIndex:0 ofReply:1];

  v26 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v26 forSelector:sel_deleteSeedingAppleAccountForDevice_completion_ argumentIndex:0 ofReply:0];

  v27 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v27 forSelector:sel_deleteSeedingAppleAccountForDevice_completion_ argumentIndex:0 ofReply:1];

  v28 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  [v2 setClasses:v28 forSelector:sel_loadMDMConfigurationWithCompletion_ argumentIndex:1 ofReply:1];

  return v2;
}

+ (id)_allowListedXPCClientInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F38EEB60];
}

@end