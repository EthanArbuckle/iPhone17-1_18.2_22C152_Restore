@interface PTDefaults
+ (id)sharedInstance;
- (BOOL)_eventShowsUI:(int64_t)a3;
- (BOOL)activeTestRecipeEatsEvent:(int64_t)a3;
- (BOOL)canEditShowsUIForEvent:(int64_t)a3;
- (BOOL)displayedShowsUIValueForEvent:(int64_t)a3;
- (BOOL)prototypingServerWantsEvent:(int64_t)a3;
- (BOOL)testRecipeEatsRingerButton;
- (BOOL)testRecipeIsActive;
- (id)_eventDefaults;
- (id)_testRecipeDefaults;
- (id)activeTestRecipeDescription;
- (id)activeTestRecipeEventDescription;
- (id)activeTestRecipeIdentifier;
- (id)observeEventDefaultsOnQueue:(id)a3 withBlock:(id)a4;
- (id)observeShowUISwitchDefaultsOnQueue:(id)a3 withBlock:(id)a4;
- (id)observeTestRecipeDefaultsOnQueue:(id)a3 withBlock:(id)a4;
- (void)_bindAndRegisterDefaults;
- (void)deactivateTestRecipe;
- (void)setShowsUI:(BOOL)a3 forEvent:(int64_t)a4;
- (void)setTestRecipeEatsRingerButton:(BOOL)a3;
@end

@implementation PTDefaults

+ (id)sharedInstance
{
  if (sharedInstance___once != -1) {
    dispatch_once(&sharedInstance___once, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

uint64_t __28__PTDefaults_sharedInstance__block_invoke()
{
  id v0 = [(BSAbstractDefaultDomain *)[PTDefaults alloc] _initWithDomain:@"com.apple.PrototypeTools"];
  uint64_t v1 = sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)_bindAndRegisterDefaults
{
  v3 = [NSString stringWithUTF8String:"prototypeSettingsEnabled"];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(BSAbstractDefaultDomain *)self _bindProperty:v3 withDefaultKey:@"PrototypeSettingsEnabled" toDefaultValue:MEMORY[0x1E4F1CC28] options:1];

  v5 = [NSString stringWithUTF8String:"activePrototypingEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v5 withDefaultKey:@"ActivePrototypingEnabled" toDefaultValue:v4 options:1];

  v6 = [NSString stringWithUTF8String:"remotePrototypingEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v6 withDefaultKey:@"RemotePrototypingEnabled" toDefaultValue:v4 options:1];

  v7 = [NSString stringWithUTF8String:"multiWindowEnabled"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v7 withDefaultKey:@"MultiWindowEnabled" toDefaultValue:v4 options:1];

  v8 = [NSString stringWithUTF8String:"volumeUpShowsUI"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v8 withDefaultKey:@"VolumeUpShowsUI" toDefaultValue:MEMORY[0x1E4F1CC38] options:1];

  v9 = [NSString stringWithUTF8String:"volumeDownShowsUI"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v9 withDefaultKey:@"VolumeDownShowsUI" toDefaultValue:v4 options:1];

  v10 = [NSString stringWithUTF8String:"ringerSwitchShowsUI"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v10 withDefaultKey:@"RingerSwitchShowsUI" toDefaultValue:v4 options:1];

  v11 = [NSString stringWithUTF8String:"ringerButtonShowsUI"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v11 withDefaultKey:@"RingerButtonShowsUI" toDefaultValue:v4 options:1];

  v12 = [NSString stringWithUTF8String:"testRecipeIdentifier"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"TestRecipeIdentifier" toDefaultValue:0 options:1];

  v13 = [NSString stringWithUTF8String:"testRecipeDescription"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v13 withDefaultKey:@"TestRecipeDescription" toDefaultValue:0 options:1];

  v14 = [NSString stringWithUTF8String:"testRecipeEatsVolumeUp"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v14 withDefaultKey:@"TestRecipeEatsVolumeUp" toDefaultValue:v4 options:1];

  v15 = [NSString stringWithUTF8String:"testRecipeEatsVolumeDown"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v15 withDefaultKey:@"TestRecipeEatsVolumeDown" toDefaultValue:v4 options:1];

  v16 = [NSString stringWithUTF8String:"testRecipeEatsRingerSwitch"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v16 withDefaultKey:@"TestRecipeEatsRingerSwitch" toDefaultValue:v4 options:1];

  v17 = [NSString stringWithUTF8String:"testRecipeEatsRingerButton"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v17 withDefaultKey:@"TestRecipeEatsRingerButton" toDefaultValue:v4 options:1];

  v18 = [NSString stringWithUTF8String:"shouldClearSettingsArchivesForMigration"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v18 withDefaultKey:@"ClearSettingsArchivesForMigration" toDefaultValue:v4 options:1];

  id v19 = [NSString stringWithUTF8String:"shouldClearPrototypeCachesForMigration"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v19 withDefaultKey:@"ClearPrototypeCachesForMigration" toDefaultValue:v4 options:1];
}

- (BOOL)canEditShowsUIForEvent:(int64_t)a3
{
  return ![(PTDefaults *)self activeTestRecipeEatsEvent:a3];
}

- (BOOL)displayedShowsUIValueForEvent:(int64_t)a3
{
  BOOL v5 = -[PTDefaults _eventShowsUI:](self, "_eventShowsUI:");
  if (v5) {
    LOBYTE(v5) = ![(PTDefaults *)self activeTestRecipeEatsEvent:a3];
  }
  return v5;
}

- (void)setShowsUI:(BOOL)a3 forEvent:(int64_t)a4
{
  switch(a4)
  {
    case 1:
      [(PTDefaults *)self setVolumeUpShowsUI:a3];
      break;
    case 2:
      [(PTDefaults *)self setVolumeDownShowsUI:a3];
      break;
    case 3:
      [(PTDefaults *)self setRingerSwitchShowsUI:a3];
      break;
    case 4:
      [(PTDefaults *)self setRingerButtonShowsUI:a3];
      break;
    default:
      return;
  }
}

- (id)observeShowUISwitchDefaultsOnQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PTDefaults *)self _eventDefaults];
  v9 = [(BSAbstractDefaultDomain *)self observeDefaults:v8 onQueue:v7 withBlock:v6];

  return v9;
}

- (BOOL)testRecipeIsActive
{
  if (![(PTDefaults *)self activePrototypingEnabled]) {
    return 0;
  }
  v3 = [(PTDefaults *)self testRecipeIdentifier];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)activeTestRecipeIdentifier
{
  if ([(PTDefaults *)self testRecipeIsActive])
  {
    v3 = [(PTDefaults *)self testRecipeIdentifier];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)activeTestRecipeDescription
{
  if ([(PTDefaults *)self testRecipeIsActive])
  {
    v3 = [(PTDefaults *)self testRecipeDescription];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)activeTestRecipeEatsEvent:(int64_t)a3
{
  if (![(PTDefaults *)self testRecipeIsActive]) {
    return 0;
  }
  switch(a3)
  {
    case 1:
      BOOL result = [(PTDefaults *)self testRecipeEatsVolumeUp];
      break;
    case 2:
      BOOL result = [(PTDefaults *)self testRecipeEatsVolumeDown];
      break;
    case 3:
      BOOL result = [(PTDefaults *)self testRecipeEatsRingerSwitch];
      break;
    case 4:
      BOOL result = [(PTDefaults *)self testRecipeEatsRingerButton];
      break;
    default:
      return 0;
  }
  return result;
}

- (id)activeTestRecipeEventDescription
{
  v3 = [MEMORY[0x1E4F28E60] indexSet];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PTDefaults_activeTestRecipeEventDescription__block_invoke;
  v7[3] = &unk_1E63BC790;
  v7[4] = self;
  id v8 = v3;
  id v4 = v3;
  PTPrototypingEnumerateHardwareEventsWithBlock(v7);
  BOOL v5 = PTPrototypingEventsDescription(v4);

  return v5;
}

uint64_t __46__PTDefaults_activeTestRecipeEventDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = [*(id *)(a1 + 32) activeTestRecipeEatsEvent:a2];
  if (result)
  {
    BOOL v5 = *(void **)(a1 + 40);
    return [v5 addIndex:a2];
  }
  return result;
}

- (void)deactivateTestRecipe
{
  [(PTDefaults *)self setTestRecipeIdentifier:0];
  [(PTDefaults *)self setTestRecipeDescription:0];
  [(PTDefaults *)self setTestRecipeEatsVolumeUp:0];
  [(PTDefaults *)self setTestRecipeEatsVolumeDown:0];
  [(PTDefaults *)self setTestRecipeEatsRingerSwitch:0];
  [(PTDefaults *)self setTestRecipeEatsRingerButton:0];
}

- (id)observeTestRecipeDefaultsOnQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PTDefaults *)self _testRecipeDefaults];
  v9 = [(BSAbstractDefaultDomain *)self observeDefaults:v8 onQueue:v7 withBlock:v6];

  return v9;
}

- (BOOL)prototypingServerWantsEvent:(int64_t)a3
{
  if (-[PTDefaults _eventShowsUI:](self, "_eventShowsUI:")) {
    return 1;
  }
  return [(PTDefaults *)self activeTestRecipeEatsEvent:a3];
}

- (id)observeEventDefaultsOnQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(PTDefaults *)self _eventDefaults];
  v9 = [(BSAbstractDefaultDomain *)self observeDefaults:v8 onQueue:v7 withBlock:v6];

  return v9;
}

- (BOOL)_eventShowsUI:(int64_t)a3
{
  if (![(PTDefaults *)self activePrototypingEnabled]) {
    return 0;
  }
  switch(a3)
  {
    case 1:
      BOOL result = [(PTDefaults *)self volumeUpShowsUI];
      break;
    case 2:
      BOOL result = [(PTDefaults *)self volumeDownShowsUI];
      break;
    case 3:
      BOOL result = [(PTDefaults *)self ringerSwitchShowsUI];
      break;
    case 4:
      BOOL result = [(PTDefaults *)self ringerButtonShowsUI];
      break;
    default:
      return 0;
  }
  return result;
}

- (id)_eventDefaults
{
  v15[11] = *MEMORY[0x1E4F143B8];
  v14 = [NSString stringWithUTF8String:"activePrototypingEnabled"];
  v15[0] = v14;
  v13 = [NSString stringWithUTF8String:"remotePrototypingEnabled"];
  v15[1] = v13;
  v2 = [NSString stringWithUTF8String:"volumeUpShowsUI"];
  v15[2] = v2;
  v3 = [NSString stringWithUTF8String:"volumeDownShowsUI"];
  v15[3] = v3;
  id v4 = [NSString stringWithUTF8String:"ringerSwitchShowsUI"];
  v15[4] = v4;
  BOOL v5 = [NSString stringWithUTF8String:"ringerButtonShowsUI"];
  v15[5] = v5;
  id v6 = [NSString stringWithUTF8String:"testRecipeIdentifier"];
  v15[6] = v6;
  id v7 = [NSString stringWithUTF8String:"testRecipeEatsVolumeUp"];
  v15[7] = v7;
  id v8 = [NSString stringWithUTF8String:"testRecipeEatsVolumeDown"];
  v15[8] = v8;
  v9 = [NSString stringWithUTF8String:"testRecipeEatsRingerSwitch"];
  v15[9] = v9;
  v10 = [NSString stringWithUTF8String:"testRecipeEatsRingerButton"];
  v15[10] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:11];

  return v11;
}

- (id)_testRecipeDefaults
{
  v12[8] = *MEMORY[0x1E4F143B8];
  v2 = [NSString stringWithUTF8String:"activePrototypingEnabled"];
  v12[0] = v2;
  v3 = [NSString stringWithUTF8String:"remotePrototypingEnabled"];
  v12[1] = v3;
  id v4 = [NSString stringWithUTF8String:"testRecipeIdentifier"];
  v12[2] = v4;
  BOOL v5 = [NSString stringWithUTF8String:"testRecipeDescription"];
  v12[3] = v5;
  id v6 = [NSString stringWithUTF8String:"testRecipeEatsVolumeUp"];
  v12[4] = v6;
  id v7 = [NSString stringWithUTF8String:"testRecipeEatsVolumeDown"];
  v12[5] = v7;
  id v8 = [NSString stringWithUTF8String:"testRecipeEatsRingerSwitch"];
  v12[6] = v8;
  v9 = [NSString stringWithUTF8String:"testRecipeEatsRingerButton"];
  v12[7] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:8];

  return v10;
}

- (BOOL)testRecipeEatsRingerButton
{
  return self->_testRecipeEatsRingerButton;
}

- (void)setTestRecipeEatsRingerButton:(BOOL)a3
{
  self->_testRecipeEatsRingerButton = a3;
}

@end