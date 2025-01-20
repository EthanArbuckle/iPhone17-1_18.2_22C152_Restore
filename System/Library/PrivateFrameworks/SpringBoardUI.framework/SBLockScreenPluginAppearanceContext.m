@interface SBLockScreenPluginAppearanceContext
- (BOOL)isHidden;
- (CGRect)presentationRegion;
- (NSArray)elementOverrides;
- (NSString)description;
- (SBLockScreenLegibilitySettings)legibilitySettings;
- (SBLockScreenPluginAppearanceContext)initWithAppearance:(id)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)backgroundStyle;
- (int64_t)notificationBehavior;
- (int64_t)presentationStyle;
- (unint64_t)restrictedCapabilities;
- (void)setBackgroundStyle:(int64_t)a3;
- (void)setElementOverrides:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setNotificationBehavior:(int64_t)a3;
- (void)setPresentationRegion:(CGRect)a3;
- (void)setPresentationStyle:(int64_t)a3;
- (void)setRestrictedCapabilities:(unint64_t)a3;
@end

@implementation SBLockScreenPluginAppearanceContext

- (SBLockScreenPluginAppearanceContext)initWithAppearance:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBLockScreenPluginAppearanceContext;
  v5 = [(SBLockScreenPluginAppearanceContext *)&v9 init];
  if (v5)
  {
    -[SBLockScreenPluginAppearanceContext setHidden:](v5, "setHidden:", [v4 isHidden]);
    -[SBLockScreenPluginAppearanceContext setRestrictedCapabilities:](v5, "setRestrictedCapabilities:", [v4 restrictedCapabilities]);
    -[SBLockScreenPluginAppearanceContext setBackgroundStyle:](v5, "setBackgroundStyle:", [v4 backgroundStyle]);
    -[SBLockScreenPluginAppearanceContext setPresentationStyle:](v5, "setPresentationStyle:", [v4 presentationStyle]);
    -[SBLockScreenPluginAppearanceContext setNotificationBehavior:](v5, "setNotificationBehavior:", [v4 notificationBehavior]);
    v6 = [v4 legibilitySettings];
    [(SBLockScreenPluginAppearanceContext *)v5 setLegibilitySettings:v6];

    v7 = [v4 elementOverrides];
    [(SBLockScreenPluginAppearanceContext *)v5 setElementOverrides:v7];

    [v4 presentationRegion];
    -[SBLockScreenPluginAppearanceContext setPresentationRegion:](v5, "setPresentationRegion:");
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[(SBLockScreenPluginAppearanceContext *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBLockScreenPluginAppearanceContext *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBLockScreenPluginAppearanceContext isHidden](self, "isHidden"), @"hidden");
  v5 = NSStringFromLockScreenPluginBackgroundStyle([(SBLockScreenPluginAppearanceContext *)self backgroundStyle]);
  id v6 = (id)[v3 appendObject:v5 withName:@"backgroundStyle" skipIfNil:1];

  v7 = NSStringFromLockScreenPluginPresentationStyle([(SBLockScreenPluginAppearanceContext *)self presentationStyle]);
  id v8 = (id)[v3 appendObject:v7 withName:@"presentationStyle" skipIfNil:1];

  objc_super v9 = NSStringFromLockScreenPluginNotificationBehavior([(SBLockScreenPluginAppearanceContext *)self notificationBehavior]);
  id v10 = (id)[v3 appendObject:v9 withName:@"notificationBehavior" skipIfNil:1];

  [(SBLockScreenPluginAppearanceContext *)self presentationRegion];
  v11 = NSStringFromCGRect(v15);
  id v12 = (id)[v3 appendObject:v11 withName:@"presentationRegion"];

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBLockScreenPluginAppearanceContext *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  v5 = [(SBLockScreenPluginAppearanceContext *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__SBLockScreenPluginAppearanceContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_2645D4318;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __77__SBLockScreenPluginAppearanceContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSStringFromLockScreenCapabilities([*(id *)(a1 + 40) restrictedCapabilities]);
  [v2 appendString:v3 withName:@"restrictions" skipIfEmpty:1];

  id v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) legibilitySettings];
  id v6 = (id)[v4 appendObject:v5 withName:@"legibilitySettings" skipIfNil:1];

  id v7 = *(void **)(a1 + 32);
  id v8 = [*(id *)(a1 + 40) elementOverrides];
  [v7 appendArraySection:v8 withName:@"elementOverrides" skipIfEmpty:1];

  objc_super v9 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) presentationRegion];
  NSStringFromCGRect(v13);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = (id)[v9 appendObject:v11 withName:@"presentationRegion"];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [SBLockScreenPluginMutableAppearanceContext alloc];

  return [(SBLockScreenPluginAppearanceContext *)v4 initWithAppearance:self];
}

- (BOOL)isHidden
{
  return self->hidden;
}

- (void)setHidden:(BOOL)a3
{
  self->hidden = a3;
}

- (unint64_t)restrictedCapabilities
{
  return self->restrictedCapabilities;
}

- (void)setRestrictedCapabilities:(unint64_t)a3
{
  self->restrictedCapabilities = a3;
}

- (int64_t)backgroundStyle
{
  return self->backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->backgroundStyle = a3;
}

- (int64_t)presentationStyle
{
  return self->presentationStyle;
}

- (void)setPresentationStyle:(int64_t)a3
{
  self->presentationStyle = a3;
}

- (int64_t)notificationBehavior
{
  return self->notificationBehavior;
}

- (void)setNotificationBehavior:(int64_t)a3
{
  self->notificationBehavior = a3;
}

- (SBLockScreenLegibilitySettings)legibilitySettings
{
  return self->legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (NSArray)elementOverrides
{
  return self->elementOverrides;
}

- (void)setElementOverrides:(id)a3
{
}

- (CGRect)presentationRegion
{
  double x = self->presentationRegion.origin.x;
  double y = self->presentationRegion.origin.y;
  double width = self->presentationRegion.size.width;
  double height = self->presentationRegion.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentationRegion:(CGRect)a3
{
  self->presentationRegion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->elementOverrides, 0);

  objc_storeStrong((id *)&self->legibilitySettings, 0);
}

@end