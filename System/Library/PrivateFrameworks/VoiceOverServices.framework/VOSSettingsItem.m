@interface VOSSettingsItem
+ (NSArray)allSettingsItems;
+ (VOSSettingsItem)Activities;
+ (VOSSettingsItem)AudioDucking;
+ (VOSSettingsItem)BrailleAlerts;
+ (VOSSettingsItem)BrailleAutoAdvanceDuration;
+ (VOSSettingsItem)BrailleFormatting;
+ (VOSSettingsItem)BrailleInput;
+ (VOSSettingsItem)BrailleOutput;
+ (VOSSettingsItem)CaptionPanel;
+ (VOSSettingsItem)DirectTouch;
+ (VOSSettingsItem)DuckingAmount;
+ (VOSSettingsItem)GestureDirection;
+ (VOSSettingsItem)HardwareTypingFeedback;
+ (VOSSettingsItem)Hints;
+ (VOSSettingsItem)ImageDescriptions;
+ (VOSSettingsItem)LargeCursor;
+ (VOSSettingsItem)LiveRegions;
+ (VOSSettingsItem)MediaDescriptions;
+ (VOSSettingsItem)NavigateImages;
+ (VOSSettingsItem)NavigationStyle;
+ (VOSSettingsItem)PhoneticFeedback;
+ (VOSSettingsItem)Pitch;
+ (VOSSettingsItem)Punctuation;
+ (VOSSettingsItem)RotorActionConfirmation;
+ (VOSSettingsItem)ScreenRecognition;
+ (VOSSettingsItem)SendToHDMI;
+ (VOSSettingsItem)SlideToType;
+ (VOSSettingsItem)SoftwareTypingFeedback;
+ (VOSSettingsItem)SoundCurtain;
+ (VOSSettingsItem)Sounds;
+ (VOSSettingsItem)SpeakNotifications;
+ (VOSSettingsItem)SpeakingRate;
+ (VOSSettingsItem)TypingStyle;
+ (VOSSettingsItem)Voice;
+ (VOSSettingsItem)Volume;
+ (id)settingsIDtoItemMap:(id)a3;
- (AXQuickSettingsData)settingsData;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)localizedName;
- (id)_initWithIdentifier:(id)a3 itemType:(int64_t)a4;
- (id)description;
- (int64_t)itemType;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
- (void)setItemType:(int64_t)a3;
- (void)setSettingsData:(id)a3;
@end

@implementation VOSSettingsItem

- (id)_initWithIdentifier:(id)a3 itemType:(int64_t)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)VOSSettingsItem;
  v7 = [(VOSSettingsItem *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(VOSSettingsItem *)v7 setIdentifier:v6];
    [(VOSSettingsItem *)v8 setItemType:a4];
  }

  return v8;
}

- (id)description
{
  v2 = NSString;
  v3 = [(VOSSettingsItem *)self identifier];
  v4 = [v2 stringWithFormat:@"VOSSettingsItem '%@'", v3];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [(VOSSettingsItem *)self identifier];
    id v6 = [v4 identifier];
    char v7 = [v5 isEqualToString:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(VOSSettingsItem *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

+ (VOSSettingsItem)Sounds
{
  if (Sounds_onceToken != -1) {
    dispatch_once(&Sounds_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)Sounds__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __25__VOSSettingsItem_Sounds__block_invoke()
{
  Sounds__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"Sounds" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)AudioDucking
{
  if (AudioDucking_onceToken != -1) {
    dispatch_once(&AudioDucking_onceToken, &__block_literal_global_274_0);
  }
  v2 = (void *)AudioDucking__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __31__VOSSettingsItem_AudioDucking__block_invoke()
{
  AudioDucking__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"AudioDucking" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)Volume
{
  if (Volume_onceToken != -1) {
    dispatch_once(&Volume_onceToken, &__block_literal_global_279_0);
  }
  v2 = (void *)Volume__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __25__VOSSettingsItem_Volume__block_invoke()
{
  Volume__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"Volume" itemType:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)Pitch
{
  if (Pitch_onceToken != -1) {
    dispatch_once(&Pitch_onceToken, &__block_literal_global_284_0);
  }
  v2 = (void *)Pitch__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __24__VOSSettingsItem_Pitch__block_invoke()
{
  Pitch__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"Pitch" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)PhoneticFeedback
{
  if (PhoneticFeedback_onceToken != -1) {
    dispatch_once(&PhoneticFeedback_onceToken, &__block_literal_global_289_0);
  }
  v2 = (void *)PhoneticFeedback__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __35__VOSSettingsItem_PhoneticFeedback__block_invoke()
{
  PhoneticFeedback__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"PhoneticFeedback" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)SendToHDMI
{
  if (SendToHDMI_onceToken != -1) {
    dispatch_once(&SendToHDMI_onceToken, &__block_literal_global_294);
  }
  v2 = (void *)SendToHDMI__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __29__VOSSettingsItem_SendToHDMI__block_invoke()
{
  SendToHDMI__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"SendToHDMI" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)SpeakNotifications
{
  if (SpeakNotifications_onceToken != -1) {
    dispatch_once(&SpeakNotifications_onceToken, &__block_literal_global_299);
  }
  v2 = (void *)SpeakNotifications__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __37__VOSSettingsItem_SpeakNotifications__block_invoke()
{
  SpeakNotifications__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"SpeakNotifications" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)SoundCurtain
{
  if (SoundCurtain_onceToken != -1) {
    dispatch_once(&SoundCurtain_onceToken, &__block_literal_global_304);
  }
  v2 = (void *)SoundCurtain__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __31__VOSSettingsItem_SoundCurtain__block_invoke()
{
  SoundCurtain__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"SoundCurtain" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)SpeakingRate
{
  if (SpeakingRate_onceToken != -1) {
    dispatch_once(&SpeakingRate_onceToken, &__block_literal_global_309);
  }
  v2 = (void *)SpeakingRate__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __31__VOSSettingsItem_SpeakingRate__block_invoke()
{
  SpeakingRate__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"SpeakingRate" itemType:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)Voice
{
  if (Voice_onceToken != -1) {
    dispatch_once(&Voice_onceToken, &__block_literal_global_314);
  }
  v2 = (void *)Voice__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __24__VOSSettingsItem_Voice__block_invoke()
{
  Voice__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"Voice" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)DuckingAmount
{
  if (DuckingAmount_onceToken != -1) {
    dispatch_once(&DuckingAmount_onceToken, &__block_literal_global_319);
  }
  v2 = (void *)DuckingAmount__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __32__VOSSettingsItem_DuckingAmount__block_invoke()
{
  DuckingAmount__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"DuckingAmount" itemType:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)Hints
{
  if (Hints_onceToken != -1) {
    dispatch_once(&Hints_onceToken, &__block_literal_global_324);
  }
  v2 = (void *)Hints__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __24__VOSSettingsItem_Hints__block_invoke()
{
  Hints__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"Hints" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)MediaDescriptions
{
  if (MediaDescriptions_onceToken != -1) {
    dispatch_once(&MediaDescriptions_onceToken, &__block_literal_global_329);
  }
  v2 = (void *)MediaDescriptions__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __36__VOSSettingsItem_MediaDescriptions__block_invoke()
{
  MediaDescriptions__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"MediaDescriptions" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)RotorActionConfirmation
{
  if (RotorActionConfirmation_onceToken != -1) {
    dispatch_once(&RotorActionConfirmation_onceToken, &__block_literal_global_334);
  }
  v2 = (void *)RotorActionConfirmation__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __42__VOSSettingsItem_RotorActionConfirmation__block_invoke()
{
  RotorActionConfirmation__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"RotorActionConfirmation" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)Activities
{
  if (Activities_onceToken != -1) {
    dispatch_once(&Activities_onceToken, &__block_literal_global_339);
  }
  v2 = (void *)Activities__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __29__VOSSettingsItem_Activities__block_invoke()
{
  Activities__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"Activities" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)Punctuation
{
  if (Punctuation_onceToken != -1) {
    dispatch_once(&Punctuation_onceToken, &__block_literal_global_344);
  }
  v2 = (void *)Punctuation__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __30__VOSSettingsItem_Punctuation__block_invoke()
{
  Punctuation__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"Punctuation" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)ScreenRecognition
{
  if (ScreenRecognition_onceToken != -1) {
    dispatch_once(&ScreenRecognition_onceToken, &__block_literal_global_349);
  }
  v2 = (void *)ScreenRecognition__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __36__VOSSettingsItem_ScreenRecognition__block_invoke()
{
  ScreenRecognition__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"ScreenRecognition" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)ImageDescriptions
{
  if (ImageDescriptions_onceToken != -1) {
    dispatch_once(&ImageDescriptions_onceToken, &__block_literal_global_354);
  }
  v2 = (void *)ImageDescriptions__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __36__VOSSettingsItem_ImageDescriptions__block_invoke()
{
  ImageDescriptions__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"ImageDescriptions" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)DirectTouch
{
  if (DirectTouch_onceToken != -1) {
    dispatch_once(&DirectTouch_onceToken, &__block_literal_global_359);
  }
  v2 = (void *)DirectTouch__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __30__VOSSettingsItem_DirectTouch__block_invoke()
{
  DirectTouch__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"DirectTouch" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)NavigationStyle
{
  if (NavigationStyle_onceToken != -1) {
    dispatch_once(&NavigationStyle_onceToken, &__block_literal_global_364);
  }
  v2 = (void *)NavigationStyle__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __34__VOSSettingsItem_NavigationStyle__block_invoke()
{
  NavigationStyle__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"NavigationStyle" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)NavigateImages
{
  if (NavigateImages_onceToken != -1) {
    dispatch_once(&NavigateImages_onceToken, &__block_literal_global_369);
  }
  v2 = (void *)NavigateImages__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __33__VOSSettingsItem_NavigateImages__block_invoke()
{
  NavigateImages__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"NavigateImages" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)GestureDirection
{
  if (GestureDirection_onceToken != -1) {
    dispatch_once(&GestureDirection_onceToken, &__block_literal_global_374);
  }
  v2 = (void *)GestureDirection__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __35__VOSSettingsItem_GestureDirection__block_invoke()
{
  GestureDirection__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"GestureDirection" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)TypingStyle
{
  if (TypingStyle_onceToken != -1) {
    dispatch_once(&TypingStyle_onceToken, &__block_literal_global_379);
  }
  v2 = (void *)TypingStyle__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __30__VOSSettingsItem_TypingStyle__block_invoke()
{
  TypingStyle__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"TypingStyle" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)SoftwareTypingFeedback
{
  if (SoftwareTypingFeedback_onceToken != -1) {
    dispatch_once(&SoftwareTypingFeedback_onceToken, &__block_literal_global_384);
  }
  v2 = (void *)SoftwareTypingFeedback__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __41__VOSSettingsItem_SoftwareTypingFeedback__block_invoke()
{
  SoftwareTypingFeedback__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"SoftwareTypingFeedback" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)HardwareTypingFeedback
{
  if (HardwareTypingFeedback_onceToken != -1) {
    dispatch_once(&HardwareTypingFeedback_onceToken, &__block_literal_global_389);
  }
  v2 = (void *)HardwareTypingFeedback__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __41__VOSSettingsItem_HardwareTypingFeedback__block_invoke()
{
  HardwareTypingFeedback__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"HardwareTypingFeedback" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)SlideToType
{
  if (SlideToType_onceToken != -1) {
    dispatch_once(&SlideToType_onceToken, &__block_literal_global_394);
  }
  v2 = (void *)SlideToType__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __30__VOSSettingsItem_SlideToType__block_invoke()
{
  SlideToType__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"SlideToType" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)CaptionPanel
{
  if (CaptionPanel_onceToken != -1) {
    dispatch_once(&CaptionPanel_onceToken, &__block_literal_global_399);
  }
  v2 = (void *)CaptionPanel__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __31__VOSSettingsItem_CaptionPanel__block_invoke()
{
  CaptionPanel__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"CaptionPanel" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)LargeCursor
{
  if (LargeCursor_onceToken != -1) {
    dispatch_once(&LargeCursor_onceToken, &__block_literal_global_404);
  }
  v2 = (void *)LargeCursor__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __30__VOSSettingsItem_LargeCursor__block_invoke()
{
  LargeCursor__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"LargeCursor" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)BrailleAlerts
{
  if (BrailleAlerts_onceToken != -1) {
    dispatch_once(&BrailleAlerts_onceToken, &__block_literal_global_409);
  }
  v2 = (void *)BrailleAlerts__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __32__VOSSettingsItem_BrailleAlerts__block_invoke()
{
  BrailleAlerts__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"BrailleAlerts" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)BrailleFormatting
{
  if (BrailleFormatting_onceToken != -1) {
    dispatch_once(&BrailleFormatting_onceToken, &__block_literal_global_414);
  }
  v2 = (void *)BrailleFormatting__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __36__VOSSettingsItem_BrailleFormatting__block_invoke()
{
  BrailleFormatting__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"BrailleFormatting" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)BrailleAutoAdvanceDuration
{
  if (BrailleAutoAdvanceDuration_onceToken != -1) {
    dispatch_once(&BrailleAutoAdvanceDuration_onceToken, &__block_literal_global_419);
  }
  v2 = (void *)BrailleAutoAdvanceDuration__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __45__VOSSettingsItem_BrailleAutoAdvanceDuration__block_invoke()
{
  BrailleAutoAdvanceDuration__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"BrailleAutoAdvanceDuration" itemType:1];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)BrailleOutput
{
  if (BrailleOutput_onceToken != -1) {
    dispatch_once(&BrailleOutput_onceToken, &__block_literal_global_424);
  }
  v2 = (void *)BrailleOutput__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __32__VOSSettingsItem_BrailleOutput__block_invoke()
{
  BrailleOutput__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"BrailleOutput" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)BrailleInput
{
  if (BrailleInput_onceToken != -1) {
    dispatch_once(&BrailleInput_onceToken, &__block_literal_global_429);
  }
  v2 = (void *)BrailleInput__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __31__VOSSettingsItem_BrailleInput__block_invoke()
{
  BrailleInput__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"BrailleInput" itemType:2];

  return MEMORY[0x270F9A758]();
}

+ (VOSSettingsItem)LiveRegions
{
  if (LiveRegions_onceToken != -1) {
    dispatch_once(&LiveRegions_onceToken, &__block_literal_global_434);
  }
  v2 = (void *)LiveRegions__SettingsItem;

  return (VOSSettingsItem *)v2;
}

uint64_t __30__VOSSettingsItem_LiveRegions__block_invoke()
{
  LiveRegions__SettingsItem = [[VOSSettingsItem alloc] _initWithIdentifier:@"LiveRegions" itemType:0];

  return MEMORY[0x270F9A758]();
}

+ (NSArray)allSettingsItems
{
  if (allSettingsItems_onceToken != -1) {
    dispatch_once(&allSettingsItems_onceToken, &__block_literal_global_439);
  }
  v2 = (void *)allSettingsItems_FinalList;

  return (NSArray *)v2;
}

void __35__VOSSettingsItem_allSettingsItems__block_invoke()
{
  v40[34] = *MEMORY[0x263EF8340];
  v39 = +[VOSSettingsItem Sounds];
  v40[0] = v39;
  v38 = +[VOSSettingsItem AudioDucking];
  v40[1] = v38;
  v37 = +[VOSSettingsItem Volume];
  v40[2] = v37;
  v36 = +[VOSSettingsItem Pitch];
  v40[3] = v36;
  v35 = +[VOSSettingsItem PhoneticFeedback];
  v40[4] = v35;
  v34 = +[VOSSettingsItem SendToHDMI];
  v40[5] = v34;
  v33 = +[VOSSettingsItem SpeakNotifications];
  v40[6] = v33;
  v32 = +[VOSSettingsItem SoundCurtain];
  v40[7] = v32;
  v31 = +[VOSSettingsItem SpeakingRate];
  v40[8] = v31;
  v30 = +[VOSSettingsItem Voice];
  v40[9] = v30;
  v29 = +[VOSSettingsItem DuckingAmount];
  v40[10] = v29;
  v28 = +[VOSSettingsItem Hints];
  v40[11] = v28;
  v27 = +[VOSSettingsItem MediaDescriptions];
  v40[12] = v27;
  v26 = +[VOSSettingsItem RotorActionConfirmation];
  v40[13] = v26;
  v25 = +[VOSSettingsItem Activities];
  v40[14] = v25;
  v24 = +[VOSSettingsItem Punctuation];
  v40[15] = v24;
  v23 = +[VOSSettingsItem ScreenRecognition];
  v40[16] = v23;
  v22 = +[VOSSettingsItem ImageDescriptions];
  v40[17] = v22;
  v21 = +[VOSSettingsItem DirectTouch];
  v40[18] = v21;
  v20 = +[VOSSettingsItem NavigationStyle];
  v40[19] = v20;
  v19 = +[VOSSettingsItem NavigateImages];
  v40[20] = v19;
  v18 = +[VOSSettingsItem GestureDirection];
  v40[21] = v18;
  v17 = +[VOSSettingsItem TypingStyle];
  v40[22] = v17;
  v15 = +[VOSSettingsItem SoftwareTypingFeedback];
  v40[23] = v15;
  v14 = +[VOSSettingsItem HardwareTypingFeedback];
  v40[24] = v14;
  v0 = +[VOSSettingsItem SlideToType];
  v40[25] = v0;
  v1 = +[VOSSettingsItem CaptionPanel];
  v40[26] = v1;
  v2 = +[VOSSettingsItem LargeCursor];
  v40[27] = v2;
  unint64_t v3 = +[VOSSettingsItem BrailleAlerts];
  v40[28] = v3;
  id v4 = +[VOSSettingsItem BrailleFormatting];
  v40[29] = v4;
  v5 = +[VOSSettingsItem BrailleAutoAdvanceDuration];
  v40[30] = v5;
  id v6 = +[VOSSettingsItem BrailleOutput];
  v40[31] = v6;
  char v7 = +[VOSSettingsItem BrailleInput];
  v40[32] = v7;
  v8 = +[VOSSettingsItem LiveRegions];
  v40[33] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v40 count:34];
  v16 = (void *)[v9 mutableCopy];

  uint64_t v10 = objc_msgSend(v16, "ax_filteredArrayUsingBlock:", &__block_literal_global_443);
  v11 = (void *)allSettingsItems_FinalList;
  allSettingsItems_FinalList = v10;

  uint64_t v12 = [(id)allSettingsItems_FinalList sortedArrayUsingComparator:&__block_literal_global_447_0];
  v13 = (void *)allSettingsItems_FinalList;
  allSettingsItems_FinalList = v12;
}

uint64_t __35__VOSSettingsItem_allSettingsItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  unint64_t v3 = +[VOSSettingsHelper sharedInstance];
  uint64_t v4 = [v3 isItemSupported:v2];

  return v4;
}

uint64_t __35__VOSSettingsItem_allSettingsItems__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = +[VOSSettingsHelper sharedInstance];
  char v7 = [v6 nameForItem:v5];

  v8 = +[VOSSettingsHelper sharedInstance];
  v9 = [v8 nameForItem:v4];

  uint64_t v10 = [v7 localizedStandardCompare:v9];
  return v10;
}

+ (id)settingsIDtoItemMap:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [MEMORY[0x263EFF9A0] dictionary];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "identifier", (void)v13);
        [v4 setObject:v10 forKeyedSubscript:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)localizedName
{
  id v2 = NSString;
  id v3 = [(VOSSettingsItem *)self identifier];
  id v4 = [v2 stringWithFormat:@"VOSSettingsItem.%@", v3];

  id v5 = VOSLocString(v4);

  return (NSString *)v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(int64_t)a3
{
  self->_itemType = a3;
}

- (AXQuickSettingsData)settingsData
{
  return self->_settingsData;
}

- (void)setSettingsData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end