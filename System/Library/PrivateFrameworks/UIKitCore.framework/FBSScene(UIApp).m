@interface FBSScene(UIApp)
- (BOOL)isPersistable;
- (BOOL)uiAlwaysSupportsAllInterfaceOrientations;
- (id)uiClientSettings;
- (id)uiSettings;
- (uint64_t)uiCanReceiveDeviceOrientationEvents;
- (void)updateUIClientSettingsWithBlock:()UIApp;
- (void)updateUIClientSettingsWithTransitionBlock:()UIApp;
@end

@implementation FBSScene(UIApp)

- (uint64_t)uiCanReceiveDeviceOrientationEvents
{
  v1 = [a1 settings];
  if ([v1 isUISubclass]) {
    uint64_t v2 = [v1 deviceOrientationEventsEnabled];
  }
  else {
    uint64_t v2 = 1;
  }

  return v2;
}

- (id)uiSettings
{
  v4 = [a1 settings];
  if (([v4 isUISubclass] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"FBSScene+UIApp.m", 32, @"settings is of an unexpected class : %@", v4 object file lineNumber description];
  }
  return v4;
}

- (id)uiClientSettings
{
  v4 = [a1 clientSettings];
  if (([v4 isUISubclass] & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"FBSScene+UIApp.m", 38, @"clientSettings is of an unexpected class : %@", v4 object file lineNumber description];
  }
  return v4;
}

- (void)updateUIClientSettingsWithTransitionBlock:()UIApp
{
  id v5 = a3;
  if ((dyld_program_sdk_at_least() & 1) == 0 && pthread_main_np() != 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__FBSScene_UIApp__updateUIClientSettingsWithTransitionBlock___block_invoke;
    block[3] = &unk_1E52DA160;
    block[4] = a1;
    id v11 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v6 = v11;
    goto LABEL_7;
  }
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __61__FBSScene_UIApp__updateUIClientSettingsWithTransitionBlock___block_invoke_2;
    v7[3] = &unk_1E52DAB80;
    uint64_t v9 = a2;
    v7[4] = a1;
    id v8 = v5;
    [a1 updateClientSettingsWithTransitionBlock:v7];
    v6 = v8;
LABEL_7:

    goto LABEL_8;
  }
  [a1 updateClientSettingsWithTransitionBlock:0];
LABEL_8:
}

- (void)updateUIClientSettingsWithBlock:()UIApp
{
  id v5 = a3;
  if ((dyld_program_sdk_at_least() & 1) == 0 && pthread_main_np() != 1)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__FBSScene_UIApp__updateUIClientSettingsWithBlock___block_invoke;
    block[3] = &unk_1E52DA160;
    block[4] = a1;
    id v11 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
    v6 = v11;
    goto LABEL_7;
  }
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __51__FBSScene_UIApp__updateUIClientSettingsWithBlock___block_invoke_2;
    v7[3] = &unk_1E52EF448;
    uint64_t v9 = a2;
    v7[4] = a1;
    id v8 = v5;
    [a1 updateClientSettingsWithBlock:v7];
    v6 = v8;
LABEL_7:

    goto LABEL_8;
  }
  [a1 updateClientSettingsWithBlock:0];
LABEL_8:
}

- (BOOL)isPersistable
{
  uint64_t v2 = [a1 settings];
  if ([v2 isUISubclass])
  {
    v3 = [a1 uiSettings];
    v4 = [v3 persistenceIdentifier];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)uiAlwaysSupportsAllInterfaceOrientations
{
  v1 = [a1 settings];
  if ([v1 isUISubclass]) {
    BOOL v2 = [v1 interfaceOrientationMode] == 2;
  }
  else {
    BOOL v2 = 1;
  }

  return v2;
}

@end