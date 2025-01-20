@interface UVFenceHandle
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)createForAllScenes;
+ (id)createForScene:(id)a3;
- (BKSAnimationFenceHandle)underlying;
- (UVFenceHandle)initWithBSXPCCoder:(id)a3;
- (UVFenceHandle)initWithUnderlying:(id)a3;
- (id)copy;
- (unint64_t)fenceName;
- (void)applyToAllScenes;
- (void)applyToScene:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)invalidate;
@end

@implementation UVFenceHandle

- (UVFenceHandle)initWithUnderlying:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UVFenceHandle;
  v6 = [(UVFenceHandle *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_underlying, a3);
  }

  return v7;
}

- (void)applyToAllScenes
{
}

- (void)applyToScene:(id)a3
{
}

+ (id)createForAllScenes
{
  v2 = [MEMORY[0x263F82B30] _synchronizedDrawingFence];
  if (v2)
  {
    v3 = [[UVFenceHandle alloc] initWithUnderlying:v2];
  }
  else
  {
    v4 = UVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23995F000, v4, OS_LOG_TYPE_DEFAULT, "+[UIScene _synchronizedDrawingFence] returned nil", v6, 2u);
    }

    v3 = 0;
  }

  return v3;
}

+ (id)createForScene:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 _synchronizedDrawingFence];
  if (v4)
  {
    id v5 = [[UVFenceHandle alloc] initWithUnderlying:v4];
  }
  else
  {
    v6 = UVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_23995F000, v6, OS_LOG_TYPE_DEFAULT, "-[UIScene _synchronizedDrawingFence] returned nil: scene = %@", (uint8_t *)&v8, 0xCu);
    }

    id v5 = 0;
  }

  return v5;
}

- (void)invalidate
{
}

- (id)copy
{
  id v3 = [UVFenceHandle alloc];
  v4 = (void *)[(BKSAnimationFenceHandle *)self->_underlying copy];
  id v5 = [(UVFenceHandle *)v3 initWithUnderlying:v4];

  return v5;
}

- (unint64_t)fenceName
{
  return [(BKSAnimationFenceHandle *)self->_underlying fenceName];
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
}

- (UVFenceHandle)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UVFenceHandle;
  id v5 = [(UVFenceHandle *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"underlying"];
    underlying = v5->_underlying;
    v5->_underlying = (BKSAnimationFenceHandle *)v6;

    if (!v5->_underlying) {
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0] format:@"UVFenceHandle missing fence handle"];
    }
  }

  return v5;
}

- (BKSAnimationFenceHandle)underlying
{
  return self->_underlying;
}

- (void).cxx_destruct
{
}

@end