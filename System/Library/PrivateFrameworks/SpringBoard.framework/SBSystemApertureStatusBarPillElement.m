@interface SBSystemApertureStatusBarPillElement
+ (id)backgroundActivityIdentifiersThatIgnoreSystemChromeSuppression;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isAssociatedWithApplicationWithBundleIdentifier:(id)a3;
- (BOOL)acceptsFullScreenTransitionFromSceneWithIdentifier:(id)a3 ofBundleId:(id)a4;
- (BOOL)handleElementViewEvent:(int64_t)a3;
- (BOOL)hasActivityBehavior;
- (BOOL)shouldIgnoreSystemChromeSuppression;
- (BOOL)shouldSuppressElementWhileOnCoversheet;
- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3;
- (BOOL)shouldSuppressElementWhileProximityReaderPresent;
- (CGSize)_sizeForPillWithImageName;
- (NSSet)associatedApplications;
- (NSSet)representedBackgroundActivityIdentifiers;
- (NSString)activeSymbolName;
- (NSString)elementIdentifier;
- (SAUILayoutHosting)layoutHost;
- (SBSystemApertureStatusBarPillElement)initWithBackgroundActivityIdentifier:(id)a3;
- (UIColor)activeTintColor;
- (UIView)leadingView;
- (UIView)trailingView;
- (id)_accessibilityLabel;
- (id)_imageName;
- (id)_packageName;
- (id)_representedVisualDescriptor;
- (id)_textLabel;
- (id)_viewWithImageName:(id)a3 systemApertureSize:(CGSize)a4 tintColor:(id)a5;
- (id)_viewWithPackageName:(id)a3;
- (id)_viewWithSymbolName:(id)a3 tintColor:(id)a4;
- (id)_viewWithTextLabel:(id)a3 tintColor:(id)a4;
- (id)clientStorage;
- (int64_t)layoutMode;
- (int64_t)maximumSupportedLayoutMode;
- (int64_t)minimumSupportedLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)_representedStatusBarStyleOverrides;
- (void)setAssociatedApplications:(id)a3;
- (void)setClientStorage:(id)a3;
- (void)setLayoutHost:(id)a3;
- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4;
@end

@implementation SBSystemApertureStatusBarPillElement

+ (id)backgroundActivityIdentifiersThatIgnoreSystemChromeSuppression
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FA95D0], *MEMORY[0x1E4FA96C8], *MEMORY[0x1E4FA96D0], 0);
}

- (SBSystemApertureStatusBarPillElement)initWithBackgroundActivityIdentifier:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)SBSystemApertureStatusBarPillElement;
  v5 = [(SBSystemApertureStatusBarPillElement *)&v21 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    representedBackgroundActivityIdentifier = v5->_representedBackgroundActivityIdentifier;
    v5->_representedBackgroundActivityIdentifier = (NSString *)v6;

    v8 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FA95D0], *MEMORY[0x1E4FA9620], *MEMORY[0x1E4FA96C8], *MEMORY[0x1E4FA9628], *MEMORY[0x1E4FA9698], *MEMORY[0x1E4FA96A8], *MEMORY[0x1E4FA96A0], @"com.apple.systemstatus.background-activity.CallRecording", 0);
    v9 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA96B8]];
    if ([v8 containsObject:v5->_representedBackgroundActivityIdentifier])
    {
      v10 = (id *)MEMORY[0x1E4FA7EF8];
    }
    else
    {
      if (![v9 containsObject:v5->_representedBackgroundActivityIdentifier])
      {
        v13 = NSString;
        v14 = (objc_class *)objc_opt_class();
        v12 = NSStringFromClass(v14);
        v15 = STBackgroundActivityIdentifierDescription();
        uint64_t v16 = [v13 stringWithFormat:@"%@ - %@", v12, v15];
        elementIdentifier = v5->_elementIdentifier;
        v5->_elementIdentifier = (NSString *)v16;

        goto LABEL_8;
      }
      v10 = (id *)MEMORY[0x1E4FA7F10];
    }
    v11 = (NSString *)*v10;
    v12 = v5->_elementIdentifier;
    v5->_elementIdentifier = v11;
LABEL_8:

    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    trailingView = v5->_trailingView;
    v5->_trailingView = v18;
  }
  return v5;
}

- (void)setAssociatedApplications:(id)a3
{
  id v7 = a3;
  if ((BSEqualSets() & 1) == 0)
  {
    id v4 = (NSSet *)[v7 copy];
    associatedApplications = self->_associatedApplications;
    self->_associatedApplications = v4;

    uint64_t v6 = [(SBSystemApertureStatusBarPillElement *)self layoutHost];
    [v6 preferredLayoutModeDidInvalidateForLayoutSpecifier:self];
  }
}

- (BOOL)hasActivityBehavior
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)handleElementViewEvent:(int64_t)a3
{
  if ((unint64_t)a3 <= 3)
  {
    representedBackgroundActivityIdentifier = self->_representedBackgroundActivityIdentifier;
    v5 = [(SBSystemApertureStatusBarPillElement *)self leadingView];
    uint64_t v6 = [v5 _sbWindowScene];
    SBWorkspaceHandleStatusBarReturnActionFromApp(0, 0, representedBackgroundActivityIdentifier, v6);
  }
  return (unint64_t)a3 < 4;
}

- (int64_t)preferredLayoutMode
{
  return 2;
}

- (int64_t)minimumSupportedLayoutMode
{
  return 1;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 2;
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  self->_layoutMode = a3;
}

- (UIView)leadingView
{
  leadingView = self->_leadingView;
  if (!leadingView)
  {
    id v4 = [(SBSystemApertureStatusBarPillElement *)self _packageName];
    v5 = [(SBSystemApertureStatusBarPillElement *)self activeSymbolName];
    uint64_t v6 = [(SBSystemApertureStatusBarPillElement *)self _imageName];
    uint64_t v7 = [(SBSystemApertureStatusBarPillElement *)self _textLabel];
    v8 = (void *)v7;
    if (v4)
    {
      v9 = [(SBSystemApertureStatusBarPillElement *)self _viewWithPackageName:v4];
      v10 = self->_leadingView;
      self->_leadingView = v9;
    }
    else if (v5)
    {
      v10 = [(SBSystemApertureStatusBarPillElement *)self activeSymbolName];
      v11 = [(SBSystemApertureStatusBarPillElement *)self activeTintColor];
      v12 = [(SBSystemApertureStatusBarPillElement *)self _viewWithSymbolName:v10 tintColor:v11];
      v13 = self->_leadingView;
      self->_leadingView = v12;
    }
    else
    {
      if (v6)
      {
        [(SBSystemApertureStatusBarPillElement *)self _sizeForPillWithImageName];
        double v15 = v14;
        double v17 = v16;
        v10 = [(SBSystemApertureStatusBarPillElement *)self activeTintColor];
        -[SBSystemApertureStatusBarPillElement _viewWithImageName:systemApertureSize:tintColor:](self, "_viewWithImageName:systemApertureSize:tintColor:", v6, v10, v15, v17);
        v18 = (UIView *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!v7)
        {
LABEL_12:
          v20 = self->_leadingView;
          objc_super v21 = [(SBSystemApertureStatusBarPillElement *)self accessibilityLabel];
          [(UIView *)v20 setAccessibilityLabel:v21];

          leadingView = self->_leadingView;
          goto LABEL_13;
        }
        v10 = [(SBSystemApertureStatusBarPillElement *)self activeTintColor];
        v18 = [(SBSystemApertureStatusBarPillElement *)self _viewWithTextLabel:v8 tintColor:v10];
      }
      v19 = self->_leadingView;
      self->_leadingView = v18;
    }
    goto LABEL_12;
  }
LABEL_13:
  return leadingView;
}

- (BOOL)shouldIgnoreSystemChromeSuppression
{
  v3 = [(id)objc_opt_class() backgroundActivityIdentifiersThatIgnoreSystemChromeSuppression];
  id v4 = [(SBSystemApertureStatusBarPillElement *)self representedBackgroundActivityIdentifiers];
  char v5 = [v3 intersectsSet:v4];

  return v5;
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (BOOL)shouldSuppressElementWhileProximityReaderPresent
{
  v2 = [(SBSystemApertureStatusBarPillElement *)self elementIdentifier];
  char v3 = [v2 isEqual:*MEMORY[0x1E4FA7EF8]] ^ 1;

  return v3;
}

- (BOOL)acceptsFullScreenTransitionFromSceneWithIdentifier:(id)a3 ofBundleId:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(SBSystemApertureStatusBarPillElement *)self representedBackgroundActivityIdentifiers];
  BOOL v7 = ([v6 containsObject:*MEMORY[0x1E4FA9668]] & 1) == 0
    && [(SBSystemApertureStatusBarPillElement *)self _isAssociatedWithApplicationWithBundleIdentifier:v5];

  return v7;
}

- (BOOL)shouldSuppressElementWhilePresentingAppWithBundleId:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(NSSet *)self->_associatedApplications count] <= 1
    && [(SBSystemApertureStatusBarPillElement *)self _isAssociatedWithApplicationWithBundleIdentifier:v4];

  return v5;
}

- (NSSet)representedBackgroundActivityIdentifiers
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithObject:self->_representedBackgroundActivityIdentifier];
}

- (BOOL)_isAssociatedWithApplicationWithBundleIdentifier:(id)a3
{
  id v4 = a3;
  associatedApplications = self->_associatedApplications;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __89__SBSystemApertureStatusBarPillElement__isAssociatedWithApplicationWithBundleIdentifier___block_invoke;
  v8[3] = &unk_1E6B02090;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(associatedApplications) = [(NSSet *)associatedApplications bs_containsObjectPassingTest:v8];

  return (char)associatedApplications;
}

uint64_t __89__SBSystemApertureStatusBarPillElement__isAssociatedWithApplicationWithBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  char v3 = [a2 bundleIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (id)_viewWithPackageName:(id)a3
{
  char v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  BOOL v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F4F8A0]) initWithPackageName:v4 inBundle:v5];

  return v6;
}

- (id)_viewWithSymbolName:(id)a3 tintColor:(id)a4
{
  BOOL v5 = (void *)MEMORY[0x1E4F42A98];
  id v6 = a3;
  BOOL v7 = [v5 configurationWithHierarchicalColor:a4];
  v8 = [MEMORY[0x1E4F42A80] _systemImageNamed:v6 withConfiguration:v7];

  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v8];
  return v9;
}

- (id)_viewWithImageName:(id)a3 systemApertureSize:(CGSize)a4 tintColor:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  v8 = (void *)MEMORY[0x1E4F42A80];
  id v9 = (void *)MEMORY[0x1E4F28B50];
  id v10 = a5;
  id v11 = a3;
  v12 = [v9 bundleForClass:objc_opt_class()];
  v13 = [v8 imageNamed:v11 inBundle:v12];

  double v14 = [v13 _imageThatSuppressesAccessibilityHairlineThickening];

  double v15 = [v14 imageWithRenderingMode:2];

  double v16 = [[SBSystemAperturePillImageView alloc] initWithImage:v15];
  -[SBSystemAperturePillImageView setSystemApertureSize:](v16, "setSystemApertureSize:", width, height);
  [(SBSystemAperturePillImageView *)v16 setTintColor:v10];

  [(SBSystemAperturePillImageView *)v16 setContentMode:1];
  return v16;
}

- (id)_viewWithTextLabel:(id)a3 tintColor:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    id v6 = v5;
    id v7 = a3;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F428B8];
    id v9 = a3;
    id v6 = [v8 systemWhiteColor];
  }
  id v10 = objc_alloc(MEMORY[0x1E4F28B18]);
  uint64_t v25 = *MEMORY[0x1E4F42510];
  v26[0] = v6;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  v12 = (void *)[v10 initWithString:a3 attributes:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F42A58]);
  [v12 size];
  double v14 = objc_msgSend(v13, "initWithSize:");
  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  v22 = __69__SBSystemApertureStatusBarPillElement__viewWithTextLabel_tintColor___block_invoke;
  v23 = &unk_1E6B020B8;
  id v24 = v12;
  id v15 = v12;
  double v16 = [v14 imageWithActions:&v20];
  id v17 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v18 = objc_msgSend(v17, "initWithImage:", v16, v20, v21, v22, v23);

  return v18;
}

uint64_t __69__SBSystemApertureStatusBarPillElement__viewWithTextLabel_tintColor___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (id)_packageName
{
  uint64_t v2 = [(SBSystemApertureStatusBarPillElement *)self _representedStatusBarStyleOverrides];
  id result = 0;
  if (v2 > 63)
  {
    if (v2 <= 1023)
    {
      if (v2 != 64 && v2 != 128) {
        return result;
      }
    }
    else
    {
      if (v2 == 1024) {
        return @"AudioRecording-D73";
      }
      if (v2 != 2048)
      {
        if (v2 != 0x4000000) {
          return result;
        }
        return @"AudioRecording-D73";
      }
    }
    return @"Navigation-D73";
  }
  if (v2 <= 7)
  {
    if (v2 == 1) {
      return @"InCall-D73";
    }
    if (v2 != 4) {
      return result;
    }
    return @"AudioRecording-D73";
  }
  id v4 = @"VideoCall-D73";
  id v5 = @"AirPlay-D73";
  if (v2 != 32) {
    id v5 = 0;
  }
  if (v2 != 16) {
    id v4 = v5;
  }
  if (v2 == 8) {
    return @"Tethering-D73";
  }
  else {
    return v4;
  }
}

- (unint64_t)_representedStatusBarStyleOverrides
{
  uint64_t v2 = [(SBSystemApertureStatusBarPillElement *)self representedBackgroundActivityIdentifiers];
  unint64_t v3 = STUIStyleOverridesForBackgroundActivityIdentifiers();

  return v3;
}

- (id)_imageName
{
  unint64_t v2 = [(SBSystemApertureStatusBarPillElement *)self _representedStatusBarStyleOverrides];
  unint64_t v3 = @"FallbackPill_SOS";
  if (v2 != 0x10000) {
    unint64_t v3 = 0;
  }
  if (v2 == 0x20000000) {
    id v4 = @"FallbackPill_satellite";
  }
  else {
    id v4 = v3;
  }
  if (v2 == 0x800000000) {
    return @"FallbackPill_satellite-disconnected";
  }
  else {
    return v4;
  }
}

- (CGSize)_sizeForPillWithImageName
{
  uint64_t v2 = [(SBSystemApertureStatusBarPillElement *)self _representedStatusBarStyleOverrides];
  double v3 = 20.0;
  double v4 = 40.0;
  if (v2 > 0x1FFFFFFF)
  {
    if (v2 != 0x20000000 && v2 != 0x800000000)
    {
LABEL_7:
      double v4 = *MEMORY[0x1E4F1DB30];
      double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
  }
  else
  {
    if (v2 == 512)
    {
      double v4 = 24.0;
      double v3 = 24.0;
      goto LABEL_9;
    }
    if (v2 != 0x10000) {
      goto LABEL_7;
    }
  }
LABEL_9:
  result.double height = v3;
  result.double width = v4;
  return result;
}

- (id)_accessibilityLabel
{
  if ([(SBSystemApertureStatusBarPillElement *)self _representedStatusBarStyleOverrides] == 0x10000)uint64_t v2 = @"SOS"; {
  else
  }
    uint64_t v2 = 0;
  return v2;
}

- (UIColor)activeTintColor
{
  uint64_t v3 = [(SBSystemApertureStatusBarPillElement *)self _representedStatusBarStyleOverrides];
  if (v3 <= 127)
  {
    if (v3 > 15)
    {
      if (v3 != 16)
      {
        if (v3 == 32)
        {
          double v4 = (void *)MEMORY[0x1E4F428B8];
          double v7 = 0.117647059;
          double v5 = 0.619607843;
          goto LABEL_25;
        }
        if (v3 != 64) {
          goto LABEL_31;
        }
        goto LABEL_19;
      }
    }
    else if (v3 != 1)
    {
      if (v3 == 4) {
        goto LABEL_15;
      }
      if (v3 != 8) {
        goto LABEL_31;
      }
    }
    double v4 = (void *)MEMORY[0x1E4F428B8];
    double v7 = 0.22745098;
    double v6 = 0.352941176;
    double v5 = 1.0;
    goto LABEL_26;
  }
  if (v3 <= 2047)
  {
    if (v3 != 128)
    {
      if (v3 == 256) {
        goto LABEL_23;
      }
      if (v3 != 1024) {
        goto LABEL_31;
      }
LABEL_15:
      double v4 = (void *)MEMORY[0x1E4F428B8];
      double v5 = 0.592156863;
      double v6 = 0.0509803922;
      double v7 = 1.0;
LABEL_26:
      uint64_t v8 = [v4 colorWithRed:v7 green:v5 blue:v6 alpha:1.0];
      goto LABEL_27;
    }
LABEL_19:
    double v4 = (void *)MEMORY[0x1E4F428B8];
    double v7 = 0.160784314;
    double v5 = 0.517647059;
LABEL_25:
    double v6 = 1.0;
    goto LABEL_26;
  }
  if (v3 <= 0x7FFFFFFFFLL)
  {
    if (v3 != 2048)
    {
      if (v3 != 0x4000000) {
        goto LABEL_31;
      }
      goto LABEL_15;
    }
    goto LABEL_19;
  }
  if (v3 == 0x800000000 || v3 == 0x10000000000)
  {
LABEL_23:
    uint64_t v8 = [MEMORY[0x1E4F428B8] systemGrayColor];
LABEL_27:
    id v9 = (void *)v8;
    goto LABEL_28;
  }
LABEL_31:
  id v11 = [(SBSystemApertureStatusBarPillElement *)self _representedVisualDescriptor];
  v12 = v11;
  if (!v11)
  {
    id v9 = 0;
    goto LABEL_37;
  }
  id v9 = [v11 backgroundColor];
  id v13 = [MEMORY[0x1E4F428B8] clearColor];
  if (![v9 isEqual:v13]) {
    goto LABEL_35;
  }
  double v14 = [v12 preferredVisualEffectName];
  int v15 = [v14 isEqualToString:*MEMORY[0x1E4FA96E8]];

  if (v15)
  {
    [MEMORY[0x1E4F428B8] systemGrayColor];
    id v9 = v13 = v9;
LABEL_35:
  }
LABEL_37:

LABEL_28:
  return (UIColor *)v9;
}

- (NSString)activeSymbolName
{
  uint64_t v3 = [(SBSystemApertureStatusBarPillElement *)self _representedStatusBarStyleOverrides];
  double v4 = 0;
  if (v3 > 0x1FFFFFFF)
  {
    if (v3 != 0x20000000 && v3 != 0x800000000)
    {
LABEL_7:
      double v5 = [(SBSystemApertureStatusBarPillElement *)self _representedVisualDescriptor];
      double v6 = v5;
      if (v5)
      {
        double v4 = [v5 systemImageName];
      }
      else
      {
        double v4 = @"questionmark";
      }
    }
  }
  else if (v3 == 0x4000)
  {
    double v4 = @"shareplay";
  }
  else if (v3 != 0x10000)
  {
    goto LABEL_7;
  }
  return (NSString *)v4;
}

- (id)_textLabel
{
  uint64_t v2 = [(SBSystemApertureStatusBarPillElement *)self _representedVisualDescriptor];
  uint64_t v3 = v2;
  if (v2)
  {
    double v4 = [v2 textLabel];
  }
  else
  {
    double v4 = 0;
  }

  return v4;
}

- (id)_representedVisualDescriptor
{
  uint64_t v3 = [MEMORY[0x1E4FA9348] sharedInstance];
  double v4 = [v3 visualDescriptorForBackgroundActivityWithIdentifier:self->_representedBackgroundActivityIdentifier];

  return v4;
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (SAUILayoutHosting)layoutHost
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  return (SAUILayoutHosting *)WeakRetained;
}

- (void)setLayoutHost:(id)a3
{
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (UIView)trailingView
{
  return self->_trailingView;
}

- (NSSet)associatedApplications
{
  return self->_associatedApplications;
}

- (id)clientStorage
{
  return self->_clientStorage;
}

- (void)setClientStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_clientStorage, 0);
  objc_storeStrong((id *)&self->_associatedApplications, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_representedBackgroundActivityIdentifier, 0);
}

@end