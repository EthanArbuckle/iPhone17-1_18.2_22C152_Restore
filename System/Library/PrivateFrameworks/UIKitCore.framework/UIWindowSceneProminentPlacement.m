@interface UIWindowSceneProminentPlacement
+ (UIWindowSceneProminentPlacement)prominentPlacement;
+ (id)_largeProminentPlacement;
+ (unint64_t)_placementType;
- (BOOL)_prefersLargeSize;
- (BOOL)_requestCenterSlot;
- (BOOL)isEqual:(id)a3;
- (id)_createConfigurationWithError:(id *)a3;
- (id)_init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)_setPrefersLargeSize:(BOOL)a3;
@end

@implementation UIWindowSceneProminentPlacement

+ (unint64_t)_placementType
{
  return 2;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)UIWindowSceneProminentPlacement;
  id result = [(UIWindowScenePlacement *)&v3 _init];
  if (result) {
    *((unsigned char *)result + 8) = 0;
  }
  return result;
}

+ (UIWindowSceneProminentPlacement)prominentPlacement
{
  v2 = (void *)[objc_alloc((Class)a1) _init];
  return (UIWindowSceneProminentPlacement *)v2;
}

+ (id)_largeProminentPlacement
{
  v2 = [a1 prominentPlacement];
  [v2 _setPrefersLargeSize:1];
  return v2;
}

- (id)_createConfigurationWithError:(id *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x1E4FB3450]);
  objc_msgSend(v4, "setPrefersLargeSize:", -[UIWindowSceneProminentPlacement _prefersLargeSize](self, "_prefersLargeSize"));
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)UIWindowSceneProminentPlacement;
  id v4 = [(UIWindowScenePlacement *)&v6 copyWithZone:a3];
  objc_msgSend(v4, "_setPrefersLargeSize:", -[UIWindowSceneProminentPlacement _prefersLargeSize](self, "_prefersLargeSize"));
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UIWindowSceneProminentPlacement;
  if ([(UIWindowScenePlacement *)&v8 isEqual:v4])
  {
    BOOL v5 = [(UIWindowSceneProminentPlacement *)self _prefersLargeSize];
    int v6 = v5 ^ [v4 _prefersLargeSize] ^ 1;
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (BOOL)_requestCenterSlot
{
  return 1;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UIWindowSceneProminentPlacement;
  objc_super v3 = [(UIWindowScenePlacement *)&v5 descriptionBuilderWithMultilinePrefix:a3];
  return v3;
}

- (BOOL)_prefersLargeSize
{
  return self->_prefersLargeSize;
}

- (void)_setPrefersLargeSize:(BOOL)a3
{
  self->_prefersLargeSize = a3;
}

@end