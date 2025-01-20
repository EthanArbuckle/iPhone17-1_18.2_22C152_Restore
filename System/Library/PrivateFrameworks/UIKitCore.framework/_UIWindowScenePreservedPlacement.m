@interface _UIWindowScenePreservedPlacement
+ (unint64_t)_placementType;
- (BOOL)_preserveLayout;
- (BOOL)isEqual:(id)a3;
- (BOOL)keepInBackground;
- (_UIWindowScenePreservedPlacement)init;
- (id)_createConfigurationWithError:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)setKeepInBackground:(BOOL)a3;
@end

@implementation _UIWindowScenePreservedPlacement

+ (unint64_t)_placementType
{
  return 3;
}

- (_UIWindowScenePreservedPlacement)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIWindowScenePreservedPlacement;
  result = [(UIWindowScenePlacement *)&v3 _init];
  if (result) {
    result->_keepInBackground = 0;
  }
  return result;
}

- (id)_createConfigurationWithError:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB3448]);
  objc_msgSend(v4, "setKeepInBackground:", -[_UIWindowScenePreservedPlacement keepInBackground](self, "keepInBackground"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIWindowScenePreservedPlacement;
  id v4 = [(UIWindowScenePlacement *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "setKeepInBackground:", -[_UIWindowScenePreservedPlacement keepInBackground](self, "keepInBackground"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIWindowScenePreservedPlacement;
  if ([(UIWindowScenePlacement *)&v8 isEqual:v4])
  {
    BOOL v5 = [(_UIWindowScenePreservedPlacement *)self keepInBackground];
    int v6 = v5 ^ [v4 keepInBackground] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_preserveLayout
{
  return 1;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)_UIWindowScenePreservedPlacement;
  id v4 = a3;
  BOOL v5 = [(UIWindowScenePlacement *)&v12 descriptionBuilderWithMultilinePrefix:v4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74___UIWindowScenePreservedPlacement_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E52D9F98;
  id v6 = v5;
  id v10 = v6;
  v11 = self;
  [v6 appendBodySectionWithName:&stru_1ED0E84C0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

- (BOOL)keepInBackground
{
  return self->_keepInBackground;
}

- (void)setKeepInBackground:(BOOL)a3
{
  self->_keepInBackground = a3;
}

@end