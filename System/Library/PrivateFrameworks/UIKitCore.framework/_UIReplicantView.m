@interface _UIReplicantView
+ (Class)layerClass;
- (_UIReplicantLayer)_layer;
- (_UIReplicantView)initWithFrame:(CGRect)a3;
- (_UIReplicantView)initWithSurface:(const _UIRenderingSurface *)a3;
- (id)initAsCopyOf:(id)a3;
@end

@implementation _UIReplicantView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_UIReplicantView)initWithFrame:(CGRect)a3
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v6.receiver = self;
  v6.super_class = (Class)_UIReplicantView;
  return -[UIView initWithFrame:](&v6, sel_initWithFrame_, v3, v4, a3.size.width, a3.size.height);
}

- (_UIReplicantView)initWithSurface:(const _UIRenderingSurface *)a3
{
  double v4 = -[_UIReplicantView initWithFrame:](self, "initWithFrame:", a3->var0.origin.x, a3->var0.origin.y, a3->var0.size.width, a3->var0.size.height);
  if (v4)
  {
    double var1 = a3->var1;
    objc_super v6 = -[_UISlotId initWithSize:]([_UISlotId alloc], "initWithSize:", a3->var0.size.width * var1, a3->var0.size.height * var1);
    v7 = [(_UIReplicantView *)v4 _layer];
    [v7 _setSlotId:v6];

    [(UIView *)v4 setContentScaleFactor:a3->var1];
  }
  return v4;
}

- (id)initAsCopyOf:(id)a3
{
  id v4 = a3;
  [v4 frame];
  v5 = -[_UIReplicantView initWithFrame:](self, "initWithFrame:");
  if (v5)
  {
    objc_super v6 = [v4 _layer];
    v7 = [v6 _slotId];
    v8 = [(_UIReplicantView *)v5 _layer];
    [v8 _setSlotId:v7];

    [v4 contentScaleFactor];
    -[UIView setContentScaleFactor:](v5, "setContentScaleFactor:");
    -[UIView setAccessibilityIgnoresInvertColors:](v5, "setAccessibilityIgnoresInvertColors:", [v4 accessibilityIgnoresInvertColors]);
  }

  return v5;
}

- (_UIReplicantLayer)_layer
{
  v4.receiver = self;
  v4.super_class = (Class)_UIReplicantView;
  v2 = [(UIView *)&v4 layer];
  return (_UIReplicantLayer *)v2;
}

@end