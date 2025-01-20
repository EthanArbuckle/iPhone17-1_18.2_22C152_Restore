@interface VTUIStyle
+ (id)sharedStyle;
- (BOOL)bluetoothDeviceSupportsHeySiri;
- (BOOL)currentLocaleSupportsCompactVoiceTrigger;
- (BOOL)isBuddyOrFollowUp;
- (BOOL)isEdgeToEdgePhone;
- (BOOL)isFloatingWithReducedWidth;
- (BOOL)isGreenTeaCapableDevice;
- (BOOL)isHeySiriAlwaysOn;
- (BOOL)isIPadWithVolumePowerSameSide;
- (BOOL)isIpad;
- (BOOL)isSmallestOnboardingDeviceInBuddy;
- (BOOL)proxAccessorySupportsCompactTrigger;
- (BOOL)shouldIncludeHomePodInCompactTriggerDisclosure;
- (BOOL)shouldPresentDisclosureForCompactVoiceTrigger;
- (BOOL)shouldPresentEducationView;
- (BOOL)shouldSetupForMultipleTriggerPhrases;
- (BOOL)shouldShowVoiceTriggerConfirmationInBuddy;
- (BOOL)supportSideButtonActivation;
- (BOOL)supportsSideButtonActivation;
- (BOOL)supportsSiriConversationsAndBargeIn;
- (CGSize)educationAssetSize;
- (NSString)audioAccessoryName;
- (VTUIStyle)init;
- (double)PRXdismissButtonDefaultMargin;
- (double)PRXdismissButtonEdgeToEdgeMargin;
- (double)PRXdismissButtonMargin;
- (double)PRXtitleTopPadding;
- (double)bottomOfContinueToNotNowFirstBaseline;
- (double)continueButtonFromBottom;
- (double)continueButtonFromBottomTwoButtons;
- (double)continueButtonOffset;
- (double)continueButtonPaddingTop;
- (double)finishEnrollmentFromBottom;
- (double)footerButtonMaximumWidth;
- (double)footerHorizontalPadding;
- (double)footerSkipButtonBaselineFromBottom;
- (double)footerTextBaselineFromTop;
- (double)footerTextBottomPadding;
- (double)headerTitleLinespacing;
- (double)horizontalPaddingLandscape;
- (double)horizontalPaddingPortrait;
- (double)horizontalTextPadding;
- (double)imageViewTopOffsetLandscape;
- (double)imageViewTopOffsetPortrait;
- (double)instructionOffsetFromTopTrainingForGM;
- (double)laterButtonBaselinePadding;
- (double)minimumImageViewHeight;
- (double)orbImageLength;
- (double)orbImageOffsetFromTopEnrollment;
- (double)orbImagePadding;
- (double)orbLength;
- (double)orbOffsetFromTopEnrollment;
- (double)orbOffsetFromTopTraining;
- (double)paddingFromTop;
- (double)primaryButtonHeight;
- (double)primaryButtonHorizontalInset;
- (double)proxAboutLinkFirstBaselineFromTop;
- (double)proxBottomPaddingVoiceSelectionOptions;
- (double)proxChooseForMeTopPaddingFromContinueButton;
- (double)proxContainerCornerRadius;
- (double)proxContainerHorizontalVerticalPadding;
- (double)proxIntroOrbFromTopLandscape;
- (double)proxIntroOrbImageFromTopLandscape;
- (double)proxIntroTitleFromTop;
- (double)proxIntroTitleFromTopLandscape;
- (double)proxLeading;
- (double)proxLeadingLandscape;
- (double)proxPaddingDataSharingSubtitle;
- (double)proxPaddingFootnoteButton;
- (double)proxPaddingFromBottom;
- (double)proxPaddingFromTop;
- (double)proxPaddingIntroSubtitle;
- (double)proxPaddingIntroSubtitleLandscape;
- (double)proxPaddingSkipButtonPageLabel;
- (double)proxPaddingSuccessFromBottom;
- (double)proxPaddingSuccessFromBottomLandscape;
- (double)proxPaddingSuccessSubtitle;
- (double)proxPaddingSuccessTitleLandscape;
- (double)proxPaddingTrainingTitle;
- (double)proxPaddingTrainingTitleLandscape;
- (double)proxPaddingTryAgainTitleLandscape;
- (double)proxPageFirstBaselineBottom;
- (double)proxPrimaryButtonHeight;
- (double)proxSettingsLabelBottomMargin;
- (double)proxSiriLogoHeightWidth;
- (double)proxSiriLogoHeightWidthSmall;
- (double)proxSkipButtonBaselineBottomMargin;
- (double)proxStatusLabelMaxHeight;
- (double)proxTitleFirstBaselineFromTop;
- (double)proxTitleTrailingLandscape;
- (double)proxTopPaddingVoiceSelectionOptions;
- (double)proxTrailing;
- (double)proxTrailingLandscape;
- (double)proxTrainingDismissButtonHorizontalPadding;
- (double)proxTrainingDismissButtonPhoneLandscapeHorizontalPadding;
- (double)proxTrainingDismissButtonVerticalPaddingBottom;
- (double)proxTrainingDismissButtonVerticalPaddingTop;
- (double)proxTrainingDismissButtonWidthOrHeight;
- (double)proxTrainingInstructionLabelHorizontalOffset;
- (double)proxViewHeight;
- (double)proxViewHeightPhoneLandscape;
- (double)proxViewLanguageOptionsHeight;
- (double)proxViewLanguageOptionsHeightPhoneLandscape;
- (double)proxViewMaxWidth;
- (double)proxViewMaxWidthPhoneLandscape;
- (double)radarBtnHorizontalPadding;
- (double)radarBtnVerticalPadding;
- (double)secondaryButtonBaselinePadding;
- (double)skipButtonBaselineBottomMarginLandscape;
- (double)skipButtonBaselineBottomMarginPortrait;
- (double)statusLabelMinHeight;
- (double)statusLabelVerticalOffsetFromCenter;
- (double)subtitle1BaselineOffset;
- (double)subtitle2BaselineOffset;
- (double)textOverlayLabelWidth;
- (double)textOverlayOffsetFromTop;
- (double)titleBaselineOffsetFromTop;
- (double)titleOffsetFromOrb;
- (double)titleOffsetFromOrbImage;
- (double)turnOnSiriContinueButtonHeight;
- (double)turnOnSiriContinueButtonWidth;
- (double)turnOnSiriFooterOffset;
- (double)turnOnSiriImageOffsetFromTop;
- (double)turnOnSiriSubtitle1BaselineOffset;
- (double)turnOnSiriSubtitle2BaselineOffset;
- (float)educationAssetTopPadding;
- (id)PRXcancelFont;
- (id)PRXheaderColor;
- (id)PRXheaderFont;
- (id)PRXpageFont;
- (id)ProxCardKitTitleFontDescriptor;
- (id)VTUIDeviceSpecificAudioHintFileName:(id)a3;
- (id)VTUIDeviceSpecificString:(id)a3;
- (id)buttonTextColor;
- (id)dynamicColorWithLightColor:(id)a3 darkColor:(id)a4;
- (id)educationAssetNameForTraitCollection:(id)a3;
- (id)educationViewDetailText;
- (id)educationViewTitleText;
- (id)footerButtonFont;
- (id)footerFont;
- (id)footerLabelFont;
- (id)footerTextColor;
- (id)homeAppTintColor;
- (id)instructionLabelFont;
- (id)instructionPreAndPostfixFont;
- (id)paneBackgroundColor;
- (id)primaryButtonFont;
- (id)proxCancelFont;
- (id)proxFooterFont;
- (id)proxHSDescription:(id)a3;
- (id)proxHeaderColor;
- (id)proxHeaderFont;
- (id)proxInstructionColor;
- (id)proxInstructionFont;
- (id)proxInstructionPreAndPostfixFont;
- (id)proxPageFont;
- (id)proxPageLabelColor;
- (id)proxPrimaryButtonColor;
- (id)proxPrimaryButtonFont;
- (id)proxSubtitleColor;
- (id)proxSubtitleFont;
- (id)secondaryButtonFont;
- (id)siriIconImage;
- (id)smallestDeviceOnboardingAsset;
- (id)subtitleFont;
- (id)turnOnSiriContinueButtonFont;
- (int64_t)audioProductID;
- (int64_t)enrollmentMode;
- (void)_createStringSuffixesForDevice;
- (void)_prefetchHomePodInfo;
- (void)dealloc;
- (void)setAudioAccessoryName:(id)a3;
- (void)setAudioProductID:(int64_t)a3;
- (void)setBluetoothDeviceSupportsHeySiri:(BOOL)a3;
- (void)setEnrollmentMode:(int64_t)a3;
- (void)setIsBuddyOrFollowUp:(BOOL)a3;
- (void)setIsFloatingWithReducedWidth:(BOOL)a3;
- (void)setIsHeySiriAlwaysOn:(BOOL)a3;
- (void)setShouldIncludeHomePodInCompactTriggerDisclosure:(BOOL)a3;
- (void)setSupportSideButtonActivation:(BOOL)a3;
@end

@implementation VTUIStyle

+ (id)sharedStyle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __24__VTUIStyle_sharedStyle__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedStyle_onceToken != -1) {
    dispatch_once(&sharedStyle_onceToken, block);
  }
  v2 = (void *)sharedStyle__instance;
  return v2;
}

uint64_t __24__VTUIStyle_sharedStyle__block_invoke()
{
  objc_opt_class();
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedStyle__instance;
  sharedStyle__instance = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (VTUIStyle)init
{
  v19.receiver = self;
  v19.super_class = (Class)VTUIStyle;
  v2 = [(VTUIStyle *)&v19 init];
  if (v2)
  {
    uint64_t v3 = +[MGWrapper sharedMGWrapper];
    mgWrapper = v2->_mgWrapper;
    v2->_mgWrapper = (MGWrapper *)v3;

    uint64_t v5 = [MEMORY[0x263F82770] metricsForTextStyle:*MEMORY[0x263F83570]];
    bodyMetricsForScaling = v2->_bodyMetricsForScaling;
    v2->_bodyMetricsForScaling = (UIFontMetrics *)v5;

    uint64_t v7 = [(MGWrapper *)v2->_mgWrapper deviceClass];
    deviceClass = v2->_deviceClass;
    v2->_deviceClass = (NSString *)v7;

    BOOL v9 = [(MGWrapper *)v2->_mgWrapper isDeviceIPad];
    v2->_isIpad = v9;
    if (v9)
    {
      v10 = [MEMORY[0x263F82B60] mainScreen];
      [v10 bounds];
      v2->_isLargeIpad = v11 >= 1366.0;
    }
    else
    {
      v2->_isLargeIpad = 0;
    }
    v2->_supportsSideButtonActivation = [(MGWrapper *)v2->_mgWrapper supportsSideButtonActivation];
    v2->_isHeySiriAlwaysOn = [(MGWrapper *)v2->_mgWrapper isHeySiriAlwaysOn];
    v2->_supportSideButtonActivation = [(MGWrapper *)v2->_mgWrapper supportsSideButtonActivation];
    v12 = [MEMORY[0x263EFF960] currentLocale];
    v13 = [v12 objectForKey:*MEMORY[0x263EFF508]];

    v2->_needMoreLineSpacing = [v13 isEqual:@"th"];
    [(VTUIStyle *)v2 _createStringSuffixesForDevice];
    v14 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x263F285E0]);
    settingsConnection = v2->_settingsConnection;
    v2->_settingsConnection = v14;

    dispatch_queue_t v16 = dispatch_queue_create("com.apple.siri.voicetrigger.homepod", 0);
    settingsQueue = v2->_settingsQueue;
    v2->_settingsQueue = (OS_dispatch_queue *)v16;

    [(VTUIStyle *)v2 _prefetchHomePodInfo];
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VTUIStyle;
  [(VTUIStyle *)&v4 dealloc];
}

- (id)subtitleFont
{
  return (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
}

- (id)footerFont
{
  return (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83590]];
}

- (id)proxFooterFont
{
  return (id)[MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83590]];
}

- (id)primaryButtonFont
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  uint64_t v3 = [v2 traitCollection];
  objc_super v4 = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v4)
    && (uint64_t v5 = *MEMORY[0x263F83408],
        UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x263F83408]) == NSOrderedDescending))
  {
    v6 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:v5];
    uint64_t v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0] compatibleWithTraitCollection:v6];
    v8 = [v7 fontDescriptor];
    BOOL v9 = [v8 fontDescriptorWithSymbolicTraits:0x8000];

    v10 = [MEMORY[0x263F81708] fontWithDescriptor:v9 size:0.0];
  }
  else
  {
    v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
    double v11 = [v6 fontDescriptor];
    uint64_t v7 = [v11 fontDescriptorWithSymbolicTraits:0x8000];

    v10 = [MEMORY[0x263F81708] fontWithDescriptor:v7 size:0.0];
  }

  return v10;
}

- (id)secondaryButtonFont
{
  v2 = [MEMORY[0x263F82B60] mainScreen];
  uint64_t v3 = [v2 traitCollection];
  objc_super v4 = [v3 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory(v4)
    && (uint64_t v5 = *MEMORY[0x263F83450],
        UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x263F83450]) == NSOrderedDescending))
  {
    v6 = [MEMORY[0x263F82DA0] traitCollectionWithPreferredContentSizeCategory:v5];
    uint64_t v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570] compatibleWithTraitCollection:v6];
    v8 = [v7 fontDescriptor];
    BOOL v9 = [v8 fontDescriptorWithSymbolicTraits:0x8000];

    v10 = [v9 fontDescriptorWithSymbolicTraits:2];
    double v11 = [MEMORY[0x263F81708] fontWithDescriptor:v10 size:0.0];
  }
  else
  {
    v6 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
    v12 = [v6 fontDescriptor];
    uint64_t v7 = [v12 fontDescriptorWithSymbolicTraits:0x8000];

    BOOL v9 = [v7 fontDescriptorWithSymbolicTraits:2];
    double v11 = [MEMORY[0x263F81708] fontWithDescriptor:v9 size:0.0];
  }

  return v11;
}

- (id)instructionLabelFont
{
  uint64_t v3 = (void *)MEMORY[0x263F81708];
  objc_super v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83608]];
  [v4 pointSize];
  double v5 = *MEMORY[0x263F81800];
  v6 = objc_msgSend(v3, "systemFontOfSize:weight:");

  [v6 pointSize];
  if (v7 > 50.0
    && ([(MGWrapper *)self->_mgWrapper isPlusIPhone]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:0]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:17]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:18]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:26]))
  {
    uint64_t v8 = 0x4049000000000000;
LABEL_11:
    double v10 = *(double *)&v8;
LABEL_12:
    uint64_t v11 = [MEMORY[0x263F81708] systemFontOfSize:v10 weight:v5];

    v6 = (void *)v11;
    goto LABEL_15;
  }
  [v6 pointSize];
  if (v9 > 40.0 && [(MGWrapper *)self->_mgWrapper isSmallIPhone])
  {
    uint64_t v8 = 0x4044000000000000;
    goto LABEL_11;
  }
  [v6 pointSize];
  double v10 = 30.0;
  if (v12 > 30.0 && [(MGWrapper *)self->_mgWrapper isSmallestIPhone]) {
    goto LABEL_12;
  }
LABEL_15:
  return v6;
}

- (id)instructionPreAndPostfixFont
{
  uint64_t v3 = (void *)MEMORY[0x263F81708];
  objc_super v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83628]];
  [v4 pointSize];
  double v5 = *MEMORY[0x263F81800];
  v6 = objc_msgSend(v3, "systemFontOfSize:weight:");

  [v6 pointSize];
  if (v7 > 50.0
    && ([(MGWrapper *)self->_mgWrapper isPlusIPhone]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:0]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:17]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:18]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:26]))
  {
    uint64_t v8 = 0x4049000000000000;
LABEL_11:
    double v10 = *(double *)&v8;
LABEL_12:
    uint64_t v11 = [MEMORY[0x263F81708] systemFontOfSize:v10 weight:v5];

    v6 = (void *)v11;
    goto LABEL_15;
  }
  [v6 pointSize];
  if (v9 > 40.0 && [(MGWrapper *)self->_mgWrapper isSmallIPhone])
  {
    uint64_t v8 = 0x4044000000000000;
    goto LABEL_11;
  }
  [v6 pointSize];
  double v10 = 30.0;
  if (v12 > 30.0 && [(MGWrapper *)self->_mgWrapper isSmallestIPhone]) {
    goto LABEL_12;
  }
LABEL_15:
  return v6;
}

- (id)proxInstructionPreAndPostfixFont
{
  uint64_t v3 = (void *)MEMORY[0x263F81708];
  objc_super v4 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F835D0]];
  [v4 pointSize];
  double v5 = *MEMORY[0x263F81800];
  v6 = objc_msgSend(v3, "systemFontOfSize:weight:");

  [v6 pointSize];
  if (v7 > 50.0
    && ([(MGWrapper *)self->_mgWrapper isPlusIPhone]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:0]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:17]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:18]
     || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:26]))
  {
    uint64_t v8 = 0x4049000000000000;
LABEL_11:
    double v10 = *(double *)&v8;
LABEL_12:
    uint64_t v11 = [MEMORY[0x263F81708] systemFontOfSize:v10 weight:v5];

    v6 = (void *)v11;
    goto LABEL_15;
  }
  [v6 pointSize];
  if (v9 > 40.0 && [(MGWrapper *)self->_mgWrapper isSmallIPhone])
  {
    uint64_t v8 = 0x4044000000000000;
    goto LABEL_11;
  }
  [v6 pointSize];
  double v10 = 30.0;
  if (v12 > 30.0 && [(MGWrapper *)self->_mgWrapper isSmallestIPhone]) {
    goto LABEL_12;
  }
LABEL_15:
  return v6;
}

- (id)buttonTextColor
{
  return (id)[MEMORY[0x263F825C8] systemBlueColor];
}

- (id)paneBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] systemBlackColor];
}

- (id)homeAppTintColor
{
  return (id)[MEMORY[0x263F825C8] systemOrangeColor];
}

- (double)PRXtitleTopPadding
{
  return 40.0;
}

- (id)ProxCardKitTitleFontDescriptor
{
  v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83610]];
  uint64_t v3 = objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v2, "symbolicTraits") | 2);

  return v3;
}

- (id)PRXheaderFont
{
  v2 = (void *)MEMORY[0x263F81708];
  uint64_t v3 = [(VTUIStyle *)self ProxCardKitTitleFontDescriptor];
  objc_super v4 = [v2 fontWithDescriptor:v3 size:27.0];

  return v4;
}

- (id)PRXheaderColor
{
  return (id)[MEMORY[0x263F825C8] systemBlackColor];
}

- (id)PRXcancelFont
{
  v2 = (void *)MEMORY[0x263F81708];
  uint64_t v3 = [(VTUIStyle *)self ProxCardKitTitleFontDescriptor];
  objc_super v4 = [v2 fontWithDescriptor:v3 size:17.0];

  return v4;
}

- (id)PRXpageFont
{
  v2 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F83610]];
  uint64_t v3 = objc_msgSend(v2, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v2, "symbolicTraits") | 2);

  objc_super v4 = [MEMORY[0x263F81708] fontWithDescriptor:v3 size:17.0];

  return v4;
}

- (BOOL)isEdgeToEdgePhone
{
  if (self->_isIpad) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x263F82B60] mainScreen];
  objc_super v4 = [v3 traitCollection];
  [v4 displayCornerRadius];
  BOOL v2 = v5 > 0.0;

  return v2;
}

- (double)PRXdismissButtonEdgeToEdgeMargin
{
  return 32.0;
}

- (double)PRXdismissButtonDefaultMargin
{
  return 24.0;
}

- (double)PRXdismissButtonMargin
{
  if ([(VTUIStyle *)self isEdgeToEdgePhone])
  {
    [(VTUIStyle *)self PRXdismissButtonEdgeToEdgeMargin];
  }
  else
  {
    [(VTUIStyle *)self PRXdismissButtonDefaultMargin];
  }
  return result;
}

- (double)orbLength
{
  return 198.0;
}

- (double)orbImageLength
{
  return 64.0;
}

- (double)orbImagePadding
{
  return 27.0;
}

- (double)orbOffsetFromTopEnrollment
{
  double result = -33.0;
  if (self->_isIpad) {
    return 12.0;
  }
  return result;
}

- (double)orbImageOffsetFromTopEnrollment
{
  if (self->_isIpad) {
    return 79.0;
  }
  BOOL v3 = [(MGWrapper *)self->_mgWrapper isDeviceVision];
  double result = 34.0;
  if (v3) {
    return 0.0;
  }
  return result;
}

- (double)orbOffsetFromTopTraining
{
  double result = 130.0;
  if (!self->_isIpad) {
    return 40.0;
  }
  return result;
}

- (double)titleOffsetFromOrb
{
  return -41.0;
}

- (double)titleOffsetFromOrbImage
{
  return 26.0;
}

- (double)instructionOffsetFromTopTrainingForGM
{
  return 200.0;
}

- (double)titleBaselineOffsetFromTop
{
  BOOL v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4;

  double v6 = 44.0;
  if (v5 <= 320.0) {
    double v6 = 36.0;
  }
  bodyMetricsForScaling = self->_bodyMetricsForScaling;
  [(UIFontMetrics *)bodyMetricsForScaling scaledValueForValue:v6];
  return result;
}

- (double)textOverlayOffsetFromTop
{
  return 80.0;
}

- (double)subtitle1BaselineOffset
{
  return 15.0;
}

- (double)subtitle2BaselineOffset
{
  double v2 = 44.0;
  if (!self->_isIpad) {
    double v2 = 28.0;
  }
  [(UIFontMetrics *)self->_bodyMetricsForScaling scaledValueForValue:v2];
  return result;
}

- (double)continueButtonOffset
{
  return 24.0;
}

- (double)imageViewTopOffsetPortrait
{
  if ([(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:0]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:17]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:18]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:26]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:29])
  {
    return 88.0;
  }
  BOOL v4 = [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:30];
  double result = 64.0;
  if (v4) {
    return 88.0;
  }
  return result;
}

- (double)imageViewTopOffsetLandscape
{
  if ([(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:0]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:17]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:18]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:26]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:29])
  {
    return 58.0;
  }
  BOOL v4 = [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:30];
  double result = 34.0;
  if (v4) {
    return 58.0;
  }
  return result;
}

- (double)horizontalTextPadding
{
  double v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  double v4 = v3;

  double result = 8.0;
  if (v4 <= 320.0) {
    return 0.0;
  }
  return result;
}

- (double)horizontalPaddingPortrait
{
  if (self->_isIpad)
  {
    if (self->_isFloatingWithReducedWidth)
    {
      return 74.0;
    }
    else
    {
      double result = 244.0;
      if (!self->_isLargeIpad) {
        return 116.0;
      }
    }
  }
  else
  {
    double v3 = [MEMORY[0x263F82B60] mainScreen];
    [v3 bounds];
    double v5 = v4;

    double result = 24.0;
    if (v5 <= 320.0) {
      return 16.0;
    }
  }
  return result;
}

- (double)horizontalPaddingLandscape
{
  if (!self->_isIpad) {
    return 24.0;
  }
  if (self->_isFloatingWithReducedWidth) {
    return 74.0;
  }
  return dbl_2388E58B0[!self->_isLargeIpad];
}

- (double)headerTitleLinespacing
{
  double result = 12.0;
  if (!self->_needMoreLineSpacing) {
    return 0.0;
  }
  return result;
}

- (double)primaryButtonHeight
{
  return 50.0;
}

- (double)primaryButtonHorizontalInset
{
  return 24.0;
}

- (double)textOverlayLabelWidth
{
  return 70.0;
}

- (double)minimumImageViewHeight
{
  return 100.0;
}

- (double)statusLabelMinHeight
{
  return 200.0;
}

- (double)statusLabelVerticalOffsetFromCenter
{
  return -50.0;
}

- (double)proxSkipButtonBaselineBottomMargin
{
  return 28.0;
}

- (double)skipButtonBaselineBottomMarginPortrait
{
  if ([(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:0]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:17]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:18]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:26]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:29])
  {
    return 36.0;
  }
  BOOL v4 = [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:30];
  double result = 36.0;
  if (!v4) {
    return 24.0;
  }
  return result;
}

- (double)skipButtonBaselineBottomMarginLandscape
{
  double v3 = 24.0;
  if (![(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:0]
    && ![(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:17]
    && ![(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:18]
    && ![(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:26])
  {
    if ([(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:29])
    {
      return 36.0;
    }
    else if ([(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfType:30])
    {
      return 36.0;
    }
    else
    {
      return 24.0;
    }
  }
  return v3;
}

- (id)educationViewTitleText
{
  double v2 = +[VTUIStringsHelper sharedStringsHelper];
  double v3 = [v2 uiLocalizedStringForKey:@"ASK_SIRI"];

  return v3;
}

- (id)educationViewDetailText
{
  BOOL v2 = [(MGWrapper *)self->_mgWrapper supportsSideButtonActivation];
  double v3 = +[VTUIStringsHelper sharedStringsHelper];
  BOOL v4 = v3;
  if (v2) {
    double v5 = @"SIRI_SIDE_BUTTON_ACTIVATION_INSTRUCTIONS";
  }
  else {
    double v5 = @"SIRI_HOME_BUTTON_ACTIVATION_INSTRUCTIONS";
  }
  double v6 = [v3 uiLocalizedStringForKey:v5];

  return v6;
}

- (BOOL)shouldPresentEducationView
{
  if ([(MGWrapper *)self->_mgWrapper isDeviceIPod]
    || (int v3 = [(MGWrapper *)self->_mgWrapper isDeviceIPhone]) != 0)
  {
    if (self->_isBuddyOrFollowUp) {
      LOBYTE(v3) = _os_feature_enabled_impl() ^ 1;
    }
    else {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (id)educationAssetNameForTraitCollection:(id)a3
{
  id v4 = a3;
  if ([(MGWrapper *)self->_mgWrapper supportsSideButtonActivation])
  {
    double v5 = @"SiriEducationHomeAffordance";
  }
  else if ([(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfTypes:&unk_26EB98E78])
  {
    double v5 = [@"SiriEducationHomeButton" stringByAppendingString:@"_3x_"];
  }
  else
  {
    double v5 = @"SiriEducationHomeButton";
  }
  if ([v4 userInterfaceStyle] == 2) {
    double v6 = @"Dark";
  }
  else {
    double v6 = @"Light";
  }
  double v7 = [(__CFString *)v5 stringByAppendingString:v6];

  return v7;
}

- (float)educationAssetTopPadding
{
  if ([(MGWrapper *)self->_mgWrapper supportsSideButtonActivation]) {
    float v3 = 60.0;
  }
  else {
    float v3 = 30.0;
  }
  id v4 = [MEMORY[0x263EFF980] arrayWithArray:&unk_26EB98E90];
  [v4 addObject:&unk_26EB992B0];
  if ([(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfTypes:v4])
  {
    float v5 = 40.0;
  }
  else
  {
    float v5 = 20.0;
    if (![(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfTypes:&unk_26EB98EA8])
    {
      if ([(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfTypes:&unk_26EB98EC0]) {
        float v5 = 15.0;
      }
      else {
        float v5 = v3;
      }
    }
  }

  return v5;
}

- (CGSize)educationAssetSize
{
  BOOL v3 = [(MGWrapper *)self->_mgWrapper supportsSideButtonActivation];
  if (v3) {
    double v4 = 263.3;
  }
  else {
    double v4 = 153.0;
  }
  if (v3) {
    double v5 = 332.67;
  }
  else {
    double v5 = 313.33;
  }
  double v6 = [MEMORY[0x263EFF980] arrayWithArray:&unk_26EB98ED8];
  [v6 addObject:&unk_26EB992B0];
  if ([(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfTypes:v6]
    || [(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfTypes:&unk_26EB98EF0])
  {
    double v7 = 0.9;
  }
  else
  {
    if (![(MGWrapper *)self->_mgWrapper MGIsDeviceOneOfTypes:&unk_26EB98F08]) {
      goto LABEL_11;
    }
    double v7 = 0.74;
  }
  double v5 = v5 * v7;
  double v4 = v4 * v7;
LABEL_11:

  double v8 = v4;
  double v9 = v5;
  result.height = v9;
  result.width = v8;
  return result;
}

- (double)footerTextBaselineFromTop
{
  return 11.0;
}

- (double)footerTextBottomPadding
{
  return 15.0;
}

- (double)paddingFromTop
{
  return 15.0;
}

- (double)continueButtonFromBottom
{
  return 44.0;
}

- (double)continueButtonFromBottomTwoButtons
{
  return 60.0;
}

- (double)finishEnrollmentFromBottom
{
  return 60.0;
}

- (double)footerSkipButtonBaselineFromBottom
{
  return 15.0;
}

- (id)footerLabelFont
{
  double v2 = 13.0;
  if (!self->_isIpad) {
    double v2 = 12.0;
  }
  BOOL v3 = [MEMORY[0x263F81708] systemFontOfSize:v2];
  return v3;
}

- (double)footerHorizontalPadding
{
  BOOL v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4;

  if (v5 <= 320.0) {
    return 3.5;
  }
  [(VTUIStyle *)self horizontalPadding];
  return result;
}

- (id)footerButtonFont
{
  return (id)[MEMORY[0x263F81708] _lightSystemFontOfSize:17.0];
}

- (id)footerTextColor
{
  return (id)[MEMORY[0x263F825C8] systemGrayColor];
}

- (double)footerButtonMaximumWidth
{
  double v2 = [MEMORY[0x263F82B60] mainScreen];
  [v2 bounds];
  double v4 = v3;

  double result = 340.0;
  if (v4 <= 320.0) {
    return 288.0;
  }
  return result;
}

- (double)laterButtonBaselinePadding
{
  return 36.0;
}

- (double)secondaryButtonBaselinePadding
{
  return 36.0;
}

- (id)proxHeaderFont
{
  return (id)[MEMORY[0x263F81708] systemFontOfSize:30.0 weight:*MEMORY[0x263F81800]];
}

- (id)proxHeaderColor
{
  return (id)[MEMORY[0x263F825C8] labelColor];
}

- (id)proxPageLabelColor
{
  return (id)[MEMORY[0x263F825C8] secondaryLabelColor];
}

- (id)proxInstructionFont
{
  return (id)[MEMORY[0x263F81708] systemFontOfSize:28.0 weight:*MEMORY[0x263F81800]];
}

- (id)proxInstructionColor
{
  return (id)[MEMORY[0x263F825C8] labelColor];
}

- (id)proxSubtitleFont
{
  return (id)[MEMORY[0x263F81708] systemFontOfSize:15.0];
}

- (id)proxSubtitleColor
{
  return (id)[MEMORY[0x263F825C8] secondaryLabelColor];
}

- (id)proxPrimaryButtonFont
{
  return (id)[MEMORY[0x263F81708] systemFontOfSize:17.0 weight:*MEMORY[0x263F81828]];
}

- (id)proxCancelFont
{
  return (id)[MEMORY[0x263F81708] systemFontOfSize:17.0 weight:*MEMORY[0x263F81828]];
}

- (id)proxPrimaryButtonColor
{
  return (id)[MEMORY[0x263F825C8] lightGrayColor];
}

- (double)proxPrimaryButtonHeight
{
  return 50.0;
}

- (double)proxLeading
{
  return 36.0;
}

- (double)proxLeadingLandscape
{
  return 16.0;
}

- (double)proxTrailing
{
  return 36.0;
}

- (double)proxTitleTrailingLandscape
{
  return 46.0;
}

- (double)proxTrailingLandscape
{
  return 16.0;
}

- (double)proxPaddingFromBottom
{
  return 36.0;
}

- (double)proxPaddingSuccessFromBottom
{
  return 28.0;
}

- (double)proxPaddingSuccessFromBottomLandscape
{
  return 16.0;
}

- (double)proxTopPaddingVoiceSelectionOptions
{
  return 16.0;
}

- (double)proxBottomPaddingVoiceSelectionOptions
{
  return 16.0;
}

- (double)proxChooseForMeTopPaddingFromContinueButton
{
  return 8.0;
}

- (double)proxTitleFirstBaselineFromTop
{
  return 56.0;
}

- (double)proxIntroOrbFromTopLandscape
{
  return -43.0;
}

- (double)proxIntroOrbImageFromTopLandscape
{
  return 24.0;
}

- (double)proxIntroTitleFromTop
{
  return 30.0;
}

- (double)proxIntroTitleFromTopLandscape
{
  return 30.0;
}

- (double)proxPaddingFromTop
{
  return 0.0;
}

- (double)proxPaddingIntroSubtitleLandscape
{
  return 12.0;
}

- (double)proxPaddingTrainingTitle
{
  return 0.0;
}

- (double)proxPaddingTrainingTitleLandscape
{
  return -28.0;
}

- (double)proxPaddingDataSharingSubtitle
{
  return 20.0;
}

- (double)proxPaddingIntroSubtitle
{
  return 6.0;
}

- (double)proxPaddingSuccessTitleLandscape
{
  return 170.0;
}

- (double)proxPaddingSuccessSubtitle
{
  return 6.0;
}

- (double)proxPaddingFootnoteButton
{
  return 10.0;
}

- (double)proxPaddingSkipButtonPageLabel
{
  return 24.0;
}

- (double)proxPaddingTryAgainTitleLandscape
{
  return 170.0;
}

- (double)proxViewMaxWidth
{
  return 400.0;
}

- (double)proxViewHeight
{
  return 390.0;
}

- (double)proxViewMaxWidthPhoneLandscape
{
  return 320.0;
}

- (double)proxViewHeightPhoneLandscape
{
  return 370.0;
}

- (id)proxPageFont
{
  return (id)[MEMORY[0x263F81708] systemFontOfSize:17.0 weight:*MEMORY[0x263F81840]];
}

- (double)proxStatusLabelMaxHeight
{
  return 200.0;
}

- (double)proxPageFirstBaselineBottom
{
  return 22.0;
}

- (double)proxSiriLogoHeightWidth
{
  return 76.0;
}

- (double)proxSiriLogoHeightWidthSmall
{
  return 54.0;
}

- (double)proxContainerHorizontalVerticalPadding
{
  return 6.0;
}

- (double)proxContainerCornerRadius
{
  double v2 = +[MGWrapper sharedMGWrapper];
  if ([v2 isDeviceIPad])
  {

    return 13.0;
  }
  else
  {
    double v4 = +[MGWrapper sharedMGWrapper];
    int v5 = [v4 supportsSideButtonActivation];

    double result = 34.0;
    if (!v5) {
      return 13.0;
    }
  }
  return result;
}

- (double)proxViewLanguageOptionsHeight
{
  return 110.0;
}

- (double)proxViewLanguageOptionsHeightPhoneLandscape
{
  return 80.0;
}

- (double)proxSettingsLabelBottomMargin
{
  return 5.0;
}

- (double)proxTrainingInstructionLabelHorizontalOffset
{
  return 5.0;
}

- (double)proxTrainingDismissButtonHorizontalPadding
{
  return -32.0;
}

- (double)proxTrainingDismissButtonVerticalPaddingBottom
{
  return 28.0;
}

- (double)proxTrainingDismissButtonVerticalPaddingTop
{
  return 32.0;
}

- (double)proxTrainingDismissButtonWidthOrHeight
{
  return 24.0;
}

- (double)proxTrainingDismissButtonPhoneLandscapeHorizontalPadding
{
  return 12.0;
}

- (double)proxAboutLinkFirstBaselineFromTop
{
  return 16.0;
}

- (id)proxHSDescription:(id)a3
{
  id v4 = a3;
  int v5 = [(VTUIStyle *)self VTUIDeviceSpecificString:v4];
  int64_t v6 = [(VTUIStyle *)self audioProductID];
  int64_t v7 = v6;
  if ((unint64_t)(v6 - 8202) <= 0x1B && ((1 << (v6 - 10)) & 0xC2AB71F) != 0)
  {
    double v8 = NSString;
    goto LABEL_4;
  }
  if ((v6 - 8212) <= 0x10 && ((1 << (v6 - 20)) & 0x116A1) != 0)
  {
    int v12 = _os_feature_enabled_impl();
    double v8 = NSString;
    if (v12)
    {
      [NSString stringWithFormat:@"SIRI_AND_%@_PID_%ld", v4, v7];
      goto LABEL_5;
    }
LABEL_4:
    [v8 stringWithFormat:@"%@_PID_%ld", v4, v7];
    double v9 = LABEL_5:;
    uint64_t v10 = [(VTUIStyle *)self VTUIDeviceSpecificString:v9];

    int v5 = (void *)v10;
  }

  return v5;
}

- (BOOL)proxAccessorySupportsCompactTrigger
{
  int v2 = [(VTUIStyle *)self audioProductID];
  int v3 = _os_feature_enabled_impl();
  if (v3)
  {
    id v4 = +[VTUIStyle sharedStyle];
    int v5 = [v4 currentLocaleSupportsCompactVoiceTrigger];

    if (v5)
    {
      if ((v2 - 8212) <= 0x10) {
        LOBYTE(v3) = (0x116A1u >> (v2 - 20)) & 1;
      }
      else {
        LOBYTE(v3) = 0;
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (double)turnOnSiriImageOffsetFromTop
{
  int v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4;

  if (v5 <= 668.0) {
    return 0.0;
  }
  [(VTUIStyle *)self orbImageOffsetFromTopEnrollment];
  return result;
}

- (id)turnOnSiriContinueButtonFont
{
  return (id)[MEMORY[0x263F81708] boldSystemFontOfSize:18.0];
}

- (double)turnOnSiriContinueButtonWidth
{
  return 250.0;
}

- (double)turnOnSiriContinueButtonHeight
{
  return 50.0;
}

- (double)bottomOfContinueToNotNowFirstBaseline
{
  return 36.0;
}

- (double)turnOnSiriSubtitle1BaselineOffset
{
  double result = 34.0;
  if (!self->_isIpad) {
    return 14.0;
  }
  return result;
}

- (double)turnOnSiriSubtitle2BaselineOffset
{
  double result = 34.0;
  if (!self->_isIpad) {
    return 14.0;
  }
  return result;
}

- (double)turnOnSiriFooterOffset
{
  return 10.0;
}

- (double)continueButtonPaddingTop
{
  return 10.0;
}

- (BOOL)supportsSideButtonActivation
{
  return [(MGWrapper *)self->_mgWrapper supportsSideButtonActivation];
}

- (BOOL)isIpad
{
  return [(MGWrapper *)self->_mgWrapper isDeviceIPad];
}

- (BOOL)isIPadWithVolumePowerSameSide
{
  return [(MGWrapper *)self->_mgWrapper isIPadWithVolumePowerSameSide];
}

- (void)_createStringSuffixesForDevice
{
  int v3 = [MEMORY[0x263EFF980] array];
  id v4 = objc_alloc_init(MEMORY[0x263F28818]);
  id v9 = [v4 spokenLanguageCode];

  int v5 = [v9 hasSuffix:@"US"];
  BOOL v6 = [(VTUIStyle *)self isHeySiriAlwaysOn];
  if (v6) {
    [(NSArray *)v3 addObject:@"_AOP"];
  }
  if ([(NSString *)self->_deviceClass isEqualToString:@"iPod"])
  {
    [(NSArray *)v3 addObject:@"_IPOD"];
    goto LABEL_23;
  }
  if ([(NSString *)self->_deviceClass isEqualToString:@"iPhone"])
  {
    if (v5)
    {
      [(NSArray *)v3 addObject:@"_IPHONE"];
      if (!v6) {
        goto LABEL_23;
      }
    }
    else
    {
      [(NSArray *)v3 addObject:@"_NONUS_IPHONE"];
      [(NSArray *)v3 addObject:@"_IPHONE"];
      if (!v6) {
        goto LABEL_23;
      }
      [(NSArray *)v3 insertObject:@"_NONUS_AOP_IPHONE" atIndex:0];
    }
    [(NSArray *)v3 insertObject:@"_AOP_IPHONE" atIndex:0];
    if (!self->_supportSideButtonActivation) {
      goto LABEL_23;
    }
    int64_t v7 = @"_AOP_SIDE_BUTTON";
LABEL_22:
    [(NSArray *)v3 insertObject:v7 atIndex:0];
    goto LABEL_23;
  }
  if (![(NSString *)self->_deviceClass isEqualToString:@"iPad"]) {
    goto LABEL_23;
  }
  if (!v5)
  {
    [(NSArray *)v3 addObject:@"_NONUS_IPAD"];
    [(NSArray *)v3 addObject:@"_IPAD"];
    if (!v6) {
      goto LABEL_23;
    }
    [(NSArray *)v3 insertObject:@"_NONUS_AOP_IPAD" atIndex:0];
    goto LABEL_19;
  }
  [(NSArray *)v3 addObject:@"_IPAD"];
  if (v6)
  {
LABEL_19:
    if (self->_supportSideButtonActivation) {
      [(NSArray *)v3 insertObject:@"_AOP_TOP_BUTTON" atIndex:0];
    }
    int64_t v7 = @"_AOP_IPAD";
    goto LABEL_22;
  }
LABEL_23:
  deviceStringSuffixes = self->_deviceStringSuffixes;
  self->_deviceStringSuffixes = v3;
}

- (double)radarBtnVerticalPadding
{
  return 10.0;
}

- (double)radarBtnHorizontalPadding
{
  return 5.0;
}

- (id)VTUIDeviceSpecificString:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    int v5 = [MEMORY[0x263EFF980] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    BOOL v6 = self->_deviceStringSuffixes;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v27 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = [v4 stringByAppendingString:*(void *)(*((void *)&v26 + 1) + 8 * i)];
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v8);
    }

    [v5 addObject:v4];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      v15 = 0;
      uint64_t v16 = *(void *)v23;
LABEL_11:
      uint64_t v17 = 0;
      v18 = v15;
      while (1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v12);
        }
        uint64_t v19 = *(void *)(*((void *)&v22 + 1) + 8 * v17);
        v20 = +[VTUIStringsHelper sharedStringsHelper];
        v15 = [v20 uiLocalizedStringForKey:v19];

        if (![v15 isEqualToString:v19]) {
          break;
        }
        ++v17;
        v18 = v15;
        if (v14 == v17)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v14) {
            goto LABEL_11;
          }
          break;
        }
      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)VTUIDeviceSpecificAudioHintFileName:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    BOOL v6 = 0;
    goto LABEL_11;
  }
  if ([(NSArray *)self->_deviceStringSuffixes containsObject:@"_IPHONE"])
  {
    int v5 = @"_IPHONE";
  }
  else if ([(NSArray *)self->_deviceStringSuffixes containsObject:@"_IPAD"])
  {
    int v5 = @"_IPAD";
  }
  else
  {
    if (![(NSArray *)self->_deviceStringSuffixes containsObject:@"_IPOD"])
    {
      id v7 = v4;
      goto LABEL_10;
    }
    int v5 = @"_IPOD";
  }
  id v7 = [v4 stringByAppendingString:v5];
LABEL_10:
  BOOL v6 = v7;
LABEL_11:

  return v6;
}

- (id)siriIconImage
{
  int v2 = (void *)[objc_alloc(MEMORY[0x263F4B540]) initWithBundleIdentifier:@"com.apple.siri"];
  id v3 = objc_alloc_init(MEMORY[0x263F4B558]);
  [v3 setShape:0];
  id v4 = [v2 imageForDescriptor:v3];
  if ([v4 placeholder])
  {
    uint64_t v5 = [v2 prepareImageForDescriptor:v3];

    id v4 = (void *)v5;
  }
  BOOL v6 = objc_msgSend(objc_alloc(MEMORY[0x263F827E8]), "initWithCGImage:", objc_msgSend(v4, "CGImage"));

  return v6;
}

- (BOOL)isSmallestOnboardingDeviceInBuddy
{
  id v3 = [MEMORY[0x263F82B60] mainScreen];
  [v3 bounds];
  double v5 = v4;

  return v5 <= 568.0 && self->_isBuddyOrFollowUp;
}

- (id)smallestDeviceOnboardingAsset
{
  int v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v3 = [MEMORY[0x263F827E8] imageNamed:@"SiriOnboarding" inBundle:v2 compatibleWithTraitCollection:0];

  return v3;
}

- (BOOL)isGreenTeaCapableDevice
{
  if (isGreenTeaCapableDevice___greenTeaCapabilityToken != -1) {
    dispatch_once(&isGreenTeaCapableDevice___greenTeaCapabilityToken, &__block_literal_global_4);
  }
  return (isGreenTeaCapableDevice___greenTea | CFPreferencesGetAppBooleanValue(@"fakeGreenTea", @"com.apple.VoiceTriggerUI.cn", 0)) != 0;
}

uint64_t __36__VTUIStyle_isGreenTeaCapableDevice__block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  isGreenTeaCapableDevice___greenTea = result;
  return result;
}

- (id)dynamicColorWithLightColor:(id)a3 darkColor:(id)a4
{
  v15[3] = *MEMORY[0x263EF8340];
  double v5 = (void *)MEMORY[0x263F82DA0];
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v5 traitCollectionWithUserInterfaceStyle:0];
  v14[0] = v8;
  v15[0] = v7;
  uint64_t v9 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:1];
  v14[1] = v9;
  v15[1] = v7;
  uint64_t v10 = [MEMORY[0x263F82DA0] traitCollectionWithUserInterfaceStyle:2];
  v14[2] = v10;
  v15[2] = v6;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:3];

  id v12 = [MEMORY[0x263F825C8] _dynamicColorWithColorsByTraitCollection:v11];

  return v12;
}

- (BOOL)shouldSetupForMultipleTriggerPhrases
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl())
  {
    if ([(VTUIStyle *)self currentLocaleSupportsCompactVoiceTrigger]) {
      int v3 = AFDeviceSupportsANE();
    }
    else {
      int v3 = 0;
    }
    double v4 = [MEMORY[0x263F85AF0] sharedPreferences];
    uint64_t v5 = [v4 getUserPreferredVoiceTriggerPhraseTypeForDeviceType:0 endpointId:0 error:0];

    if (v5 != 1) {
      int v3 = 0;
    }
  }
  else
  {
    int v3 = 0;
  }
  id v6 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"Should NOT";
    if (v3) {
      id v7 = @"Should";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[VTUIStyle shouldSetupForMultipleTriggerPhrases]";
    __int16 v11 = 2112;
    id v12 = v7;
    _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_DEFAULT, "%s %@ set up for multiple triggers", (uint8_t *)&v9, 0x16u);
  }
  return v3;
}

- (BOOL)shouldShowVoiceTriggerConfirmationInBuddy
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  int v2 = [MEMORY[0x263F85AF0] sharedPreferences];
  int v3 = [v2 voiceTriggerEnabled];

  double v4 = @"not needed";
  uint64_t v5 = &stru_26EB8DDE0;
  if (v3)
  {
    id v6 = [MEMORY[0x263F78BB8] sharedInstance];
    int v7 = [v6 isVoiceTriggerRepromptRequired];

    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"forceNeedsConfirmation", @"com.apple.VoiceTriggerUI.vtconf", 0);
    if (v7) {
      double v4 = @"needed";
    }
    if (AppBooleanValue) {
      BOOL v9 = 1;
    }
    else {
      BOOL v9 = v7;
    }
    if (AppBooleanValue) {
      uint64_t v5 = @"(forced)";
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  uint64_t v10 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315650;
    uint64_t v16 = "-[VTUIStyle shouldShowVoiceTriggerConfirmationInBuddy]";
    __int16 v17 = 2112;
    v18 = v4;
    __int16 v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_238878000, v10, OS_LOG_TYPE_DEFAULT, "%s VT confirmation is %@ %@", (uint8_t *)&v15, 0x20u);
  }
  __int16 v11 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = @"Will not show";
    if (v9) {
      id v12 = @"Will show";
    }
    int v15 = 136315650;
    uint64_t v16 = "-[VTUIStyle shouldShowVoiceTriggerConfirmationInBuddy]";
    __int16 v17 = 2112;
    v18 = v12;
    if (v3) {
      uint64_t v13 = @"enabled";
    }
    else {
      uint64_t v13 = @"not enabled";
    }
    __int16 v19 = 2112;
    v20 = v13;
    _os_log_impl(&dword_238878000, v11, OS_LOG_TYPE_DEFAULT, "%s %@ VT confirmation - voice trigger is %@", (uint8_t *)&v15, 0x20u);
  }
  return v9;
}

- (BOOL)supportsSiriConversationsAndBargeIn
{
  int v2 = [MEMORY[0x263F37F88] sharedPreferences];
  char v3 = [v2 isFlexibleFollowupsSupported];

  return v3;
}

- (BOOL)shouldPresentDisclosureForCompactVoiceTrigger
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (_os_feature_enabled_impl()
    && [(VTUIStyle *)self currentLocaleSupportsCompactVoiceTrigger])
  {
    char v3 = [MEMORY[0x263F285A0] sharedPreferences];
    int v4 = [v3 assistantIsEnabled];

    uint64_t v5 = [MEMORY[0x263F85AF0] sharedPreferences];
    int v6 = [v5 voiceTriggerEnabled];

    int v7 = [MEMORY[0x263F78BB8] sharedInstance];
    uint64_t v8 = [MEMORY[0x263F285A0] sharedPreferences];
    BOOL v9 = [v8 languageCode];
    int v10 = [v7 isSATEnrolledForSiriProfileId:0 forLanguageCode:v9];

    __int16 v11 = [MEMORY[0x263F285A0] sharedPreferences];
    char v12 = [v11 hasPresentedCompactVoiceTriggerDisclosure];

    int v13 = 0;
    if (self->_isBuddyOrFollowUp && v4 && v6 && v10 && (v12 & 1) == 0) {
      int v13 = AFDeviceSupportsANE();
    }
  }
  else
  {
    int v13 = 0;
  }
  uint64_t v14 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = @"should NOT present";
    if (v13) {
      int v15 = @"should present";
    }
    int v17 = 136315394;
    v18 = "-[VTUIStyle shouldPresentDisclosureForCompactVoiceTrigger]";
    __int16 v19 = 2112;
    v20 = v15;
    _os_log_impl(&dword_238878000, v14, OS_LOG_TYPE_DEFAULT, "%s Compact trigger disclosure check: %@", (uint8_t *)&v17, 0x16u);
  }
  return v13;
}

- (BOOL)currentLocaleSupportsCompactVoiceTrigger
{
  int v2 = [MEMORY[0x263F285A0] sharedPreferences];
  char v3 = [v2 languageCode];

  if (!v3)
  {
    int v4 = [MEMORY[0x263F285A0] sharedPreferences];
    char v3 = [v4 bestSupportedLanguageCodeForLanguageCode:0];
  }
  uint64_t v5 = [MEMORY[0x263F85AF0] sharedPreferences];
  char v6 = [v5 isCompactVoiceTriggerAvailableForLanguageCode:v3];

  return v6;
}

- (void)_prefetchHomePodInfo
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  char v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[VTUIStyle _prefetchHomePodInfo]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Fetch of HomePod Info", buf, 0xCu);
  }
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak((id *)buf, self);
    settingsQueue = self->_settingsQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __33__VTUIStyle__prefetchHomePodInfo__block_invoke;
    block[3] = &unk_264D4C258;
    objc_copyWeak(&v6, (id *)buf);
    dispatch_async(settingsQueue, block);
    objc_destroyWeak(&v6);
    objc_destroyWeak((id *)buf);
  }
}

void __33__VTUIStyle__prefetchHomePodInfo__block_invoke(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = (void *)*((void *)WeakRetained + 6);
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __33__VTUIStyle__prefetchHomePodInfo__block_invoke_2;
    v5[3] = &unk_264D4CB30;
    objc_copyWeak(&v6, v1);
    [v4 isJustSiriEnabledInTheHome:v5];
    objc_destroyWeak(&v6);
  }
}

void __33__VTUIStyle__prefetchHomePodInfo__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  if (v5)
  {
    id v6 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR)) {
      __33__VTUIStyle__prefetchHomePodInfo__block_invoke_2_cold_1((uint64_t)v5, v6);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      uint64_t v8 = WeakRetained;
      uint64_t v9 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = @"not enabled";
        if (a3) {
          int v10 = @"enabled";
        }
        int v11 = 136315394;
        char v12 = "-[VTUIStyle _prefetchHomePodInfo]_block_invoke";
        __int16 v13 = 2112;
        uint64_t v14 = v10;
        _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s Fetch of HomePod compact trigger enablement completed with result: %@", (uint8_t *)&v11, 0x16u);
      }
      v8[69] = a3;
    }
  }
}

- (int64_t)enrollmentMode
{
  return self->_enrollmentMode;
}

- (void)setEnrollmentMode:(int64_t)a3
{
  self->_enrollmentMode = a3;
}

- (BOOL)isBuddyOrFollowUp
{
  return self->_isBuddyOrFollowUp;
}

- (void)setIsBuddyOrFollowUp:(BOOL)a3
{
  self->_isBuddyOrFollowUp = a3;
}

- (BOOL)isHeySiriAlwaysOn
{
  return self->_isHeySiriAlwaysOn;
}

- (void)setIsHeySiriAlwaysOn:(BOOL)a3
{
  self->_isHeySiriAlwaysOn = a3;
}

- (BOOL)bluetoothDeviceSupportsHeySiri
{
  return self->_bluetoothDeviceSupportsHeySiri;
}

- (void)setBluetoothDeviceSupportsHeySiri:(BOOL)a3
{
  self->_bluetoothDeviceSupportsHeySiruint64_t i = a3;
}

- (BOOL)supportSideButtonActivation
{
  return self->_supportSideButtonActivation;
}

- (void)setSupportSideButtonActivation:(BOOL)a3
{
  self->_supportSideButtonActivation = a3;
}

- (BOOL)isFloatingWithReducedWidth
{
  return self->_isFloatingWithReducedWidth;
}

- (void)setIsFloatingWithReducedWidth:(BOOL)a3
{
  self->_isFloatingWithReducedWidth = a3;
}

- (BOOL)shouldIncludeHomePodInCompactTriggerDisclosure
{
  return self->_shouldIncludeHomePodInCompactTriggerDisclosure;
}

- (void)setShouldIncludeHomePodInCompactTriggerDisclosure:(BOOL)a3
{
  self->_shouldIncludeHomePodInCompactTriggerDisclosure = a3;
}

- (int64_t)audioProductID
{
  return self->_audioProductID;
}

- (void)setAudioProductID:(int64_t)a3
{
  self->_audioProductID = a3;
}

- (NSString)audioAccessoryName
{
  return self->_audioAccessoryName;
}

- (void)setAudioAccessoryName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioAccessoryName, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_mgWrapper, 0);
  objc_storeStrong((id *)&self->_bodyMetricsForScaling, 0);
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_deviceStringSuffixes, 0);
}

void __33__VTUIStyle__prefetchHomePodInfo__block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  char v3 = "-[VTUIStyle _prefetchHomePodInfo]_block_invoke_2";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_238878000, a2, OS_LOG_TYPE_ERROR, "%s Fetch of HomePod compact trigger enablement failed with error:%@", (uint8_t *)&v2, 0x16u);
}

@end