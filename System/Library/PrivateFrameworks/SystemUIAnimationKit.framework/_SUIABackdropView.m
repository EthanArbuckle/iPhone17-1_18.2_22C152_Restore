@interface _SUIABackdropView
+ (Class)layerClass;
- (id)backdropLayer;
@end

@implementation _SUIABackdropView

+ (Class)layerClass
{
  return (Class)self;
}

- (id)backdropLayer
{
  v2 = [(_SUIABackdropView *)self layer];
  uint64_t v3 = objc_opt_class();
  id v4 = v2;
  if (v3)
  {
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  id v6 = v5;

  return v6;
}

@end