@interface _UIDirectionalRotationView
+ (Class)layerClass;
- (BOOL)isCounterTransformView;
- (BOOL)isInverseTransformView;
- (void)setCounterTransformView:(BOOL)a3;
- (void)setInverseTransformView:(BOOL)a3;
@end

@implementation _UIDirectionalRotationView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isCounterTransformView
{
  v2 = [(_UIDirectionalRotationView *)self drLayer];
  char v3 = [v2 isCounterTransformLayer];

  return v3;
}

- (BOOL)isInverseTransformView
{
  v2 = [(_UIDirectionalRotationView *)self drLayer];
  char v3 = [v2 isInverseTransformLayer];

  return v3;
}

- (void)setCounterTransformView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIDirectionalRotationView *)self drLayer];
  [v4 setCounterTransformLayer:v3];
}

- (void)setInverseTransformView:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(_UIDirectionalRotationView *)self drLayer];
  [v4 setInverseTransformLayer:v3];
}

@end