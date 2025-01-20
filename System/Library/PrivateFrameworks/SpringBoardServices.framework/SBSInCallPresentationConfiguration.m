@interface SBSInCallPresentationConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)isScreenSharingPresentation;
- (BOOL)isUserInitiated;
- (BOOL)requiresDismissedPresentationmode;
- (BOOL)shouldPreferContinuityDisplayForFullScreenPresentation;
- (BOOL)shouldPreventBannersWhenPresentedAsOverlay;
- (BOOL)supportsAmbient;
- (BOOL)supportsSystemAperture;
- (NSString)sceneBundleIdentifier;
- (NSUUID)identifier;
- (SBSInCallPresentationConfiguration)initWithCoder:(id)a3;
- (SBSInCallPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3;
- (double)preferredBannerHeight;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)preferredPresentationMode;
- (void)encodeWithCoder:(id)a3;
- (void)setPreferredBannerHeight:(double)a3;
- (void)setPreferredPresentationMode:(int64_t)a3;
- (void)setRequiresDismissedPresentationmode:(BOOL)a3;
- (void)setScreenSharingPresentation:(BOOL)a3;
- (void)setShouldPreferContinuityDisplayForFullScreenPresentation:(BOOL)a3;
- (void)setShouldPreventBannersWhenPresentedAsOverlay:(BOOL)a3;
- (void)setSupportsAmbient:(BOOL)a3;
- (void)setSupportsSystemAperture:(BOOL)a3;
- (void)setUserInitiated:(BOOL)a3;
@end

@implementation SBSInCallPresentationConfiguration

- (SBSInCallPresentationConfiguration)initWithSceneBundleIdentifier:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SBSInCallPresentationConfiguration;
  v5 = [(SBSInCallPresentationConfiguration *)&v12 init];
  v6 = v5;
  if (v5)
  {
    v5->_preferredPresentationMode = 1;
    uint64_t v7 = [v4 copy];
    sceneBundleIdentifier = v6->_sceneBundleIdentifier;
    v6->_sceneBundleIdentifier = (NSString *)v7;

    uint64_t v9 = [MEMORY[0x1E4F29128] UUID];
    identifier = v6->_identifier;
    v6->_identifier = (NSUUID *)v9;
  }
  return v6;
}

- (SBSInCallPresentationConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sceneBundleIdentifier"];
  if (v5)
  {
    v6 = [(SBSInCallPresentationConfiguration *)self initWithSceneBundleIdentifier:v5];
    if (v6)
    {
      [v4 decodeDoubleForKey:@"preferredBannerHeight"];
      v6->_preferredBannerHeight = v7;
      v6->_preferredPresentationMode = [v4 decodeIntegerForKey:@"preferredPresentationMode"];
      v6->_userInitiated = [v4 decodeBoolForKey:@"userInitiated"];
      v6->_screenSharingPresentation = [v4 decodeBoolForKey:@"screenSharingPresentation"];
      uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v8;

      v6->_supportsSystemAperture = [v4 decodeBoolForKey:@"supportsSystemAperture"];
      v6->_shouldPreventBannersWhenPresentedAsOverlay = [v4 decodeBoolForKey:@"preventsBannersWhenPresentedAsOverlay"];
      v6->_supportsAmbient = [v4 decodeBoolForKey:@"supportsAmbient"];
      v6->_shouldPreferContinuityDisplayForFullScreenPresentation = [v4 decodeBoolForKey:@"prefersContinuityDisplayForFullScreenPresentation"];
      v6->_requiresDismissedPresentationmode = [v4 decodeBoolForKey:@"requiresDismissedPresentationmode"];
    }
    self = v6;
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  sceneBundleIdentifier = self->_sceneBundleIdentifier;
  id v6 = a3;
  [v6 encodeObject:sceneBundleIdentifier forKey:@"sceneBundleIdentifier"];
  [v6 encodeDouble:@"preferredBannerHeight" forKey:self->_preferredBannerHeight];
  [v6 encodeInteger:self->_preferredPresentationMode forKey:@"preferredPresentationMode"];
  [v6 encodeBool:self->_userInitiated forKey:@"userInitiated"];
  [v6 encodeBool:self->_screenSharingPresentation forKey:@"screenSharingPresentation"];
  v5 = [(SBSInCallPresentationConfiguration *)self identifier];
  [v6 encodeObject:v5 forKey:@"identifier"];

  [v6 encodeBool:self->_supportsSystemAperture forKey:@"supportsSystemAperture"];
  [v6 encodeBool:self->_shouldPreventBannersWhenPresentedAsOverlay forKey:@"preventsBannersWhenPresentedAsOverlay"];
  [v6 encodeBool:self->_supportsAmbient forKey:@"supportsAmbient"];
  [v6 encodeBool:self->_shouldPreferContinuityDisplayForFullScreenPresentation forKey:@"prefersContinuityDisplayForFullScreenPresentation"];
  [v6 encodeBool:self->_requiresDismissedPresentationmode forKey:@"requiresDismissedPresentationmode"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  return [(SBSInCallPresentationConfiguration *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSInCallPresentationConfiguration *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBSInCallPresentationConfiguration *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(SBSInCallPresentationConfiguration *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __76__SBSInCallPresentationConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E566BB08;
  id v5 = v4;
  id v10 = v5;
  v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

id __76__SBSInCallPresentationConfiguration_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) appendString:*(void *)(*(void *)(a1 + 40) + 32) withName:@"sceneBundleIdentifier"];
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(*(void *)(a1 + 40) + 40) UUIDString];
  [v2 appendString:v3 withName:@"identifier"];

  unint64_t v4 = *(void *)(*(void *)(a1 + 40) + 24);
  if (v4 > 3) {
    id v5 = @"unknown";
  }
  else {
    id v5 = off_1E566BEA0[v4];
  }
  [*(id *)(a1 + 32) appendString:v5 withName:@"preferredPresentationMode"];
  id v6 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 8) withName:@"isUserInitiated" ifEqualTo:1];
  id v7 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 9) withName:@"isScreenSharingPresentation" ifEqualTo:1];
  id v8 = (id)[*(id *)(a1 + 32) appendDouble:@"preferredBannerHeight" withName:2 decimalPrecision:*(double *)(*(void *)(a1 + 40) + 16)];
  id v9 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 10) withName:@"supportsSystemAperture" ifEqualTo:1];
  id v10 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 11) withName:@"shouldPreventBannersWhenPresentedAsOverlay" ifEqualTo:1];
  id v11 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 12) withName:@"supportsAmbient" ifEqualTo:1];
  id v12 = (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 13) withName:@"prefersContinuityDisplayForFullScreenPresentation" ifEqualTo:1];
  return (id)[*(id *)(a1 + 32) appendBool:*(unsigned __int8 *)(*(void *)(a1 + 40) + 14) withName:@"requiresDismissedPresentationmode" ifEqualTo:1];
}

- (double)preferredBannerHeight
{
  return self->_preferredBannerHeight;
}

- (void)setPreferredBannerHeight:(double)a3
{
  self->_preferredBannerHeight = a3;
}

- (int64_t)preferredPresentationMode
{
  return self->_preferredPresentationMode;
}

- (void)setPreferredPresentationMode:(int64_t)a3
{
  self->_preferredPresentationMode = a3;
}

- (BOOL)isUserInitiated
{
  return self->_userInitiated;
}

- (void)setUserInitiated:(BOOL)a3
{
  self->_userInitiated = a3;
}

- (NSString)sceneBundleIdentifier
{
  return self->_sceneBundleIdentifier;
}

- (BOOL)isScreenSharingPresentation
{
  return self->_screenSharingPresentation;
}

- (void)setScreenSharingPresentation:(BOOL)a3
{
  self->_screenSharingPresentation = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (BOOL)supportsSystemAperture
{
  return self->_supportsSystemAperture;
}

- (void)setSupportsSystemAperture:(BOOL)a3
{
  self->_supportsSystemAperture = a3;
}

- (BOOL)shouldPreventBannersWhenPresentedAsOverlay
{
  return self->_shouldPreventBannersWhenPresentedAsOverlay;
}

- (void)setShouldPreventBannersWhenPresentedAsOverlay:(BOOL)a3
{
  self->_shouldPreventBannersWhenPresentedAsOverlay = a3;
}

- (BOOL)supportsAmbient
{
  return self->_supportsAmbient;
}

- (void)setSupportsAmbient:(BOOL)a3
{
  self->_supportsAmbient = a3;
}

- (BOOL)shouldPreferContinuityDisplayForFullScreenPresentation
{
  return self->_shouldPreferContinuityDisplayForFullScreenPresentation;
}

- (void)setShouldPreferContinuityDisplayForFullScreenPresentation:(BOOL)a3
{
  self->_shouldPreferContinuityDisplayForFullScreenPresentation = a3;
}

- (BOOL)requiresDismissedPresentationmode
{
  return self->_requiresDismissedPresentationmode;
}

- (void)setRequiresDismissedPresentationmode:(BOOL)a3
{
  self->_requiresDismissedPresentationmode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_sceneBundleIdentifier, 0);
}

@end