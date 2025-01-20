@interface _UIMTCaptureView
+ (Class)layerClass;
- (BOOL)_hasBackgroundMaterial;
- (_UIMTCaptureView)initWithFrame:(CGRect)a3;
- (id)_backdropLayer;
- (id)mt_captureGroupName;
@end

@implementation _UIMTCaptureView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)_backdropLayer
{
  return self->super._layer;
}

- (_UIMTCaptureView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_UIMTCaptureView;
  v3 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(_UIMTCaptureView *)v3 _backdropLayer];
    [v5 setCaptureOnly:1];
    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v6 stringWithFormat:@"<%p: %@>", v4, v8];
    [v5 setGroupName:v9];
  }
  return v4;
}

- (id)mt_captureGroupName
{
  v2 = [(_UIMTCaptureView *)self _backdropLayer];
  v3 = [v2 groupName];

  return v3;
}

- (BOOL)_hasBackgroundMaterial
{
  return 1;
}

@end