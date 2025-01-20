@interface _UIBackdropEffectView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_UIBackdropEffectView)init;
- (double)zoom;
- (id)valueForUndefinedKey:(id)a3;
- (void)setBackdropLayer:(id)a3;
- (void)setContentScaleFactor:(double)a3;
- (void)setZoom:(double)a3;
@end

@implementation _UIBackdropEffectView

- (void)setContentScaleFactor:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBackdropEffectView;
  [(UIView *)&v5 setContentScaleFactor:a3];
  v4 = [(UIView *)self layer];
  [v4 setRasterizationScale:1.0];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"] & 1) != 0
    || ([v4 isEqualToString:@"filters.gaussianBlur.inputQuality"] & 1) != 0
    || ([v4 isEqualToString:@"filters.colorSaturate.inputAmount"] & 1) != 0
    || ([v4 isEqualToString:@"filters.colorMatrix.inputColorMatrix"] & 1) != 0
    || ([v4 isEqualToString:@"enabled"] & 1) != 0
    || ([v4 isEqualToString:@"meshTransform"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIBackdropEffectView;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (_UIBackdropEffectView)init
{
  v7.receiver = self;
  v7.super_class = (Class)_UIBackdropEffectView;
  v2 = -[UIView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v3 = v2;
  if (v2)
  {
    [(UIView *)v2 setAutoresizingMask:18];
    [(UIView *)v3 setOpaque:0];
    [(UIView *)v3 setUserInteractionEnabled:0];
    id v4 = [(_UIBackdropEffectView *)v3 backdropLayer];
    [v4 setEnabled:1];

    BOOL v5 = v3;
  }

  return v3;
}

- (void)setZoom:(double)a3
{
  if (self->_zoom != a3)
  {
    BOOL v5 = MeshTransformForZoom(a3);
    v6 = [(_UIBackdropEffectView *)self backdropLayer];
    [v6 setMeshTransform:v5];

    self->_zoom = a3;
  }
}

- (void).cxx_destruct
{
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4 = a3;
  NSLog(&cfstr_WarningCalling.isa, v4);
  if ([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"])
  {
    BOOL v5 = (__CFString *)&unk_1ED3F2C40;
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"filters.gaussianBlur.inputQuality"])
  {
    BOOL v5 = @"default";
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"filters.colorSaturate.inputAmount"]) {
    goto LABEL_9;
  }
  if (![v4 isEqualToString:@"filters.colorMatrix.inputColorMatrix"])
  {
    if (([v4 isEqualToString:@"enabled"] & 1) == 0)
    {
      v8.receiver = self;
      v8.super_class = (Class)_UIBackdropEffectView;
      uint64_t v6 = [(_UIBackdropEffectView *)&v8 valueForUndefinedKey:v4];
      goto LABEL_11;
    }
LABEL_9:
    BOOL v5 = (__CFString *)&unk_1ED3F2C58;
    goto LABEL_12;
  }
  int v9 = 1065353216;
  uint64_t v11 = 0;
  uint64_t v10 = 0;
  uint64_t v12 = 0x3F80000000000000;
  uint64_t v14 = 0;
  uint64_t v13 = 0;
  uint64_t v15 = 0x3F80000000000000;
  uint64_t v17 = 0;
  uint64_t v16 = 0;
  int v18 = 0;
  uint64_t v19 = 1065353216;
  uint64_t v6 = [MEMORY[0x1E4F29238] valueWithCAColorMatrix:&v9];
LABEL_11:
  BOOL v5 = (__CFString *)v6;
LABEL_12:

  return v5;
}

- (void)setBackdropLayer:(id)a3
{
}

- (double)zoom
{
  return self->_zoom;
}

@end