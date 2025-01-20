@interface NCUserNotificationsUIKitDefaults
+ (id)standardDefaults;
- (BOOL)_activeDefault:(id)a3;
- (CGRect)listDebugHUDFrame;
- (NCUserNotificationsUIKitDefaults)init;
- (id)configurationActions;
- (id)observeDefault:(id)a3 onQueue:(id)a4 withBlock:(id)a5;
- (id)observeDefaults:(id)a3 onQueue:(id)a4 withBlock:(id)a5;
- (void)_bind:(id)a3 key:(id)a4 defaultValue:(BOOL)a5;
- (void)_bind:(id)a3 key:(id)a4 defaultValue:(BOOL)a5 onlyIf:(BOOL)a6;
- (void)_bind:(id)a3 key:(id)a4 value:(id)a5 options:(unint64_t)a6;
- (void)_bind:(id)a3 key:(id)a4 value:(id)a5 options:(unint64_t)a6 onlyIf:(BOOL)a7;
- (void)_bindAndRegisterDefaults;
- (void)setListDebugHUDFrame:(CGRect)a3;
@end

@implementation NCUserNotificationsUIKitDefaults

+ (id)standardDefaults
{
  if (standardDefaults___once != -1) {
    dispatch_once(&standardDefaults___once, &__block_literal_global_27);
  }
  v2 = (void *)standardDefaults___instance;

  return v2;
}

void __52__NCUserNotificationsUIKitDefaults_standardDefaults__block_invoke()
{
  v0 = objc_alloc_init(NCUserNotificationsUIKitDefaults);
  v1 = (void *)standardDefaults___instance;
  standardDefaults___instance = (uint64_t)v0;
}

- (NCUserNotificationsUIKitDefaults)init
{
  return (NCUserNotificationsUIKitDefaults *)[(BSAbstractDefaultDomain *)self _initWithDomain:@"com.apple.springboard"];
}

- (id)configurationActions
{
  configurationMenuProperties = self->_configurationMenuProperties;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__NCUserNotificationsUIKitDefaults_configurationActions__block_invoke;
  v5[3] = &unk_1E6A93F18;
  v5[4] = self;
  v3 = [(NSMutableArray *)configurationMenuProperties bs_map:v5];

  return v3;
}

id __56__NCUserNotificationsUIKitDefaults_configurationActions__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) valueForKey:v3];
  unsigned int v5 = [v4 BOOLValue];

  v6 = (void *)MEMORY[0x1E4FB13F0];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __56__NCUserNotificationsUIKitDefaults_configurationActions__block_invoke_2;
  v13 = &unk_1E6A93D78;
  uint64_t v14 = *(void *)(a1 + 32);
  id v15 = v3;
  id v7 = v3;
  v8 = [v6 actionWithTitle:v7 image:0 identifier:0 handler:&v10];
  objc_msgSend(v8, "setState:", v5, v10, v11, v12, v13, v14);

  return v8;
}

void __56__NCUserNotificationsUIKitDefaults_configurationActions__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) valueForKey:*(void *)(a1 + 40)];
  int v3 = [v2 BOOLValue];

  v4 = *(void **)(a1 + 32);
  id v5 = [NSNumber numberWithBool:v3 ^ 1u];
  [v4 setValue:v5 forKey:*(void *)(a1 + 40)];
}

- (CGRect)listDebugHUDFrame
{
  v2 = [(NCUserNotificationsUIKitDefaults *)self listDebugHUDRectString];
  int v3 = v2;
  if (v2)
  {
    CGRect v12 = CGRectFromString(v2);
    CGFloat x = v12.origin.x;
    CGFloat y = v12.origin.y;
    CGFloat width = v12.size.width;
    CGFloat height = v12.size.height;
  }
  else
  {
    CGFloat x = *MEMORY[0x1E4F1DB28];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  double v8 = x;
  double v9 = y;
  double v10 = width;
  double v11 = height;
  result.size.CGFloat height = v11;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (void)setListDebugHUDFrame:(CGRect)a3
{
  NSStringFromCGRect(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(NCUserNotificationsUIKitDefaults *)self setListDebugHUDRectString:v4];
}

- (void)_bindAndRegisterDefaults
{
  uint64_t v3 = _os_feature_enabled_impl();
  id v4 = [NSString stringWithUTF8String:"showListDebugHUD"];
  [(NCUserNotificationsUIKitDefaults *)self _bind:v4 key:@"NCShowNotificationListDebugHUD" defaultValue:0];

  id v5 = [NSString stringWithUTF8String:"listDebugGuides"];
  [(NCUserNotificationsUIKitDefaults *)self _bind:v5 key:@"NCListDebugGuides" defaultValue:0];

  v6 = [NSString stringWithUTF8String:"shouldForceHapticTouchForPreview"];
  [(NCUserNotificationsUIKitDefaults *)self _bind:v6 key:@"NCForceHapticTouchForPreview" defaultValue:0];

  id v7 = [NSString stringWithUTF8String:"shouldUseReactiveList"];
  [(NCUserNotificationsUIKitDefaults *)self _bind:v7 key:@"NCUseModernList" defaultValue:1 onlyIf:v3];

  double v8 = [NSString stringWithUTF8String:"showClockInList"];
  [(NCUserNotificationsUIKitDefaults *)self _bind:v8 key:@"NCShowClockInList" defaultValue:1 onlyIf:v3];

  double v9 = [NSString stringWithUTF8String:"highlightPlatterLightEnabled"];
  [(NCUserNotificationsUIKitDefaults *)self _bind:v9 key:@"NCHighlightsPlatterLightEnabled" defaultValue:1 onlyIf:v3];

  double v10 = [NSString stringWithUTF8String:"allowStackingInHighlights"];
  [(NCUserNotificationsUIKitDefaults *)self _bind:v10 key:@"NCAllowStackingInHighlights" defaultValue:1 onlyIf:v3];

  double v11 = [NSString stringWithUTF8String:"highlightDispersingProminentContentCount"];
  [(NCUserNotificationsUIKitDefaults *)self _bind:v11 key:@"NCHighlightDispersingProminentContentCount" value:&unk_1F2F843D0 options:1];

  CGRect v12 = [NSString stringWithUTF8String:"listDebugHUDPage"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v12 withDefaultKey:@"NCListDebugHUDPage" toDefaultValue:&unk_1F2F843E8 options:4];

  id v13 = [NSString stringWithUTF8String:"listDebugHUDRectString"];
  [(BSAbstractDefaultDomain *)self _bindProperty:v13 withDefaultKey:@"NCListDebugHUDRectString" toDefaultValue:0 options:4];
}

- (id)observeDefault:(id)a3 onQueue:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(NCUserNotificationsUIKitDefaults *)self _activeDefault:v8])
  {
    v13.receiver = self;
    v13.super_class = (Class)NCUserNotificationsUIKitDefaults;
    double v11 = [(BSAbstractDefaultDomain *)&v13 observeDefault:v8 onQueue:v9 withBlock:v10];
  }
  else
  {
    double v11 = 0;
  }

  return v11;
}

- (id)observeDefaults:(id)a3 onQueue:(id)a4 withBlock:(id)a5
{
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __70__NCUserNotificationsUIKitDefaults_observeDefaults_onQueue_withBlock___block_invoke;
  v14[3] = &unk_1E6A93F18;
  v14[4] = self;
  id v8 = a5;
  id v9 = a4;
  id v10 = objc_msgSend(a3, "bs_compactMap:", v14);
  v13.receiver = self;
  v13.super_class = (Class)NCUserNotificationsUIKitDefaults;
  double v11 = [(BSAbstractDefaultDomain *)&v13 observeDefaults:v10 onQueue:v9 withBlock:v8];

  return v11;
}

id __70__NCUserNotificationsUIKitDefaults_observeDefaults_onQueue_withBlock___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  if ([v2 _activeDefault:v3]) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;

  return v5;
}

- (void)_bind:(id)a3 key:(id)a4 defaultValue:(BOOL)a5
{
}

- (void)_bind:(id)a3 key:(id)a4 defaultValue:(BOOL)a5 onlyIf:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = NSNumber;
  id v11 = a4;
  id v12 = a3;
  id v13 = [v10 numberWithBool:v7];
  [(NCUserNotificationsUIKitDefaults *)self _bind:v12 key:v11 value:v13 options:4 onlyIf:v6];
}

- (void)_bind:(id)a3 key:(id)a4 value:(id)a5 options:(unint64_t)a6
{
}

- (void)_bind:(id)a3 key:(id)a4 value:(id)a5 options:(unint64_t)a6 onlyIf:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:");
  if (self->_configurationMenuProperties)
  {
    if (!v7) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  configurationMenuProperties = self->_configurationMenuProperties;
  self->_configurationMenuProperties = v9;

  if (v7) {
LABEL_3:
  }
    [(NSMutableArray *)self->_configurationMenuProperties addObject:v11];
LABEL_4:
}

- (BOOL)_activeDefault:(id)a3
{
  id v4 = a3;
  configurationMenuProperties = self->_configurationMenuProperties;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__NCUserNotificationsUIKitDefaults__activeDefault___block_invoke;
  v8[3] = &unk_1E6A93F40;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(configurationMenuProperties) = [(NSMutableArray *)configurationMenuProperties bs_containsObjectPassingTest:v8];

  return (char)configurationMenuProperties;
}

uint64_t __51__NCUserNotificationsUIKitDefaults__activeDefault___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToString:*(void *)(a1 + 32)];
}

- (void).cxx_destruct
{
}

@end