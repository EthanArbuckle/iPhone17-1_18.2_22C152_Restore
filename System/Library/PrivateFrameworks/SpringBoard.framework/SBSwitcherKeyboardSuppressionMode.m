@interface SBSwitcherKeyboardSuppressionMode
+ (id)newSuppressionModeForSwitcherScenesFromAppLayouts:(id)a3;
+ (id)suppressionModeForAllScenes;
+ (id)suppressionModeNone;
- (BOOL)applyAssertionEvenIfAppIsHostingTheKeyboard;
- (BOOL)isEqual:(id)a3;
- (BOOL)suppressesAllScenes;
- (BOOL)suppressesNoScenes;
- (BOOL)suppressesSwitcherScenesOnly;
- (NSSet)appLayouts;
- (NSString)description;
- (id)_initWithAppLayouts:(id)a3 suppressionType:(int64_t)a4;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)type;
- (unint64_t)hash;
- (void)setApplyAssertionEvenIfAppIsHostingTheKeyboard:(BOOL)a3;
- (void)setType:(int64_t)a3;
@end

@implementation SBSwitcherKeyboardSuppressionMode

- (BOOL)isEqual:(id)a3
{
  v4 = (SBSwitcherKeyboardSuppressionMode *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      int64_t type = self->_type;
      if (type == [(SBSwitcherKeyboardSuppressionMode *)v5 type])
      {
        v7 = [(SBSwitcherKeyboardSuppressionMode *)v5 appLayouts];
        char v8 = BSEqualSets();
      }
      else
      {
        char v8 = 0;
      }
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)suppressesSwitcherScenesOnly
{
  return self->_type == 2;
}

- (BOOL)applyAssertionEvenIfAppIsHostingTheKeyboard
{
  return self->_applyAssertionEvenIfAppIsHostingTheKeyboard;
}

- (BOOL)suppressesAllScenes
{
  return self->_type == 1;
}

+ (id)suppressionModeNone
{
  if (suppressionModeNone_onceToken != -1) {
    dispatch_once(&suppressionModeNone_onceToken, &__block_literal_global_237);
  }
  v2 = (void *)suppressionModeNone___noScenesSuppressionMode;
  return v2;
}

+ (id)suppressionModeForAllScenes
{
  if (suppressionModeForAllScenes_onceToken != -1) {
    dispatch_once(&suppressionModeForAllScenes_onceToken, &__block_literal_global_8_1);
  }
  v2 = (void *)suppressionModeForAllScenes___allScenesSuppressionMode;
  return v2;
}

- (id)_initWithAppLayouts:(id)a3 suppressionType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherKeyboardSuppressionMode;
  char v8 = [(SBSwitcherKeyboardSuppressionMode *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_appLayouts, a3);
    v9->_int64_t type = a4;
  }

  return v9;
}

+ (id)newSuppressionModeForSwitcherScenesFromAppLayouts:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:a1 file:@"SBSwitcherKeyboardSuppressionMode.m" lineNumber:45 description:@"appLayouts cannot be nil."];
  }
  id v6 = [[SBSwitcherKeyboardSuppressionMode alloc] _initWithAppLayouts:v5 suppressionType:2];

  return v6;
}

void __56__SBSwitcherKeyboardSuppressionMode_suppressionModeNone__block_invoke()
{
  v0 = [SBSwitcherKeyboardSuppressionMode alloc];
  id v3 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v1 = [(SBSwitcherKeyboardSuppressionMode *)v0 _initWithAppLayouts:v3 suppressionType:0];
  v2 = (void *)suppressionModeNone___noScenesSuppressionMode;
  suppressionModeNone___noScenesSuppressionMode = v1;
}

void __64__SBSwitcherKeyboardSuppressionMode_suppressionModeForAllScenes__block_invoke()
{
  v0 = [SBSwitcherKeyboardSuppressionMode alloc];
  id v3 = [MEMORY[0x1E4F1CAD0] set];
  uint64_t v1 = [(SBSwitcherKeyboardSuppressionMode *)v0 _initWithAppLayouts:v3 suppressionType:1];
  v2 = (void *)suppressionModeForAllScenes___allScenesSuppressionMode;
  suppressionModeForAllScenes___allScenesSuppressionMode = v1;
}

- (BOOL)suppressesNoScenes
{
  return self->_type == 0;
}

- (unint64_t)hash
{
  return self->_type + [(NSSet *)self->_appLayouts hash];
}

- (NSString)description
{
  return (NSString *)[(SBSwitcherKeyboardSuppressionMode *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBSwitcherKeyboardSuppressionMode *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = v3;
  int64_t type = self->_type;
  id v6 = @"none";
  if (type == 1) {
    id v6 = @"allScenes";
  }
  if (type == 2) {
    id v7 = @"switcherScenesOnly";
  }
  else {
    id v7 = v6;
  }
  [v3 appendString:v7 withName:@"type"];
  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(SBSwitcherKeyboardSuppressionMode *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (NSSet)appLayouts
{
  return self->_appLayouts;
}

- (void)setApplyAssertionEvenIfAppIsHostingTheKeyboard:(BOOL)a3
{
  self->_applyAssertionEvenIfAppIsHostingTheKeyboard = a3;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (void).cxx_destruct
{
}

@end