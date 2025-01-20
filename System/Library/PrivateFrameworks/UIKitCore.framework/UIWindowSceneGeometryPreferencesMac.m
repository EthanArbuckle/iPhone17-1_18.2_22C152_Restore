@interface UIWindowSceneGeometryPreferencesMac
+ (double)defaultSystemFrameAnimationDuration;
+ (int64_t)defaultSystemFrameAnimationCurve;
- (BOOL)isEqual:(id)a3;
- (CGRect)systemFrame;
- (UIWindowSceneGeometryPreferencesMac)init;
- (UIWindowSceneGeometryPreferencesMac)initWithSystemFrame:(CGRect)systemFrame;
- (int64_t)_type;
- (unint64_t)hash;
- (void)setSystemFrame:(CGRect)systemFrame;
@end

@implementation UIWindowSceneGeometryPreferencesMac

+ (double)defaultSystemFrameAnimationDuration
{
  return 0.25;
}

+ (int64_t)defaultSystemFrameAnimationCurve
{
  return 5;
}

- (UIWindowSceneGeometryPreferencesMac)init
{
  v4.receiver = self;
  v4.super_class = (Class)UIWindowSceneGeometryPreferencesMac;
  result = [(UIWindowSceneGeometryPreferences *)&v4 _init];
  if (result)
  {
    CGSize v3 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_systemFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_systemFrame.size = v3;
  }
  return result;
}

- (UIWindowSceneGeometryPreferencesMac)initWithSystemFrame:(CGRect)systemFrame
{
  CGFloat height = systemFrame.size.height;
  CGFloat width = systemFrame.size.width;
  CGFloat y = systemFrame.origin.y;
  CGFloat x = systemFrame.origin.x;
  result = [(UIWindowSceneGeometryPreferencesMac *)self init];
  if (result)
  {
    result->_systemFrame.origin.CGFloat x = x;
    result->_systemFrame.origin.CGFloat y = y;
    result->_systemFrame.size.CGFloat width = width;
    result->_systemFrame.size.CGFloat height = height;
  }
  return result;
}

- (int64_t)_type
{
  return 1;
}

- (unint64_t)hash
{
  int8x16_t v2 = veorq_s8((int8x16_t)vcvtq_u64_f64((float64x2_t)self->_systemFrame.origin), (int8x16_t)vcvtq_u64_f64((float64x2_t)self->_systemFrame.size));
  return (unint64_t)veor_s8(*(int8x8_t *)v2.i8, (int8x8_t)*(_OWORD *)&vextq_s8(v2, v2, 8uLL));
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIWindowSceneGeometryPreferencesMac;
  if ([(UIWindowSceneGeometryPreferences *)&v11 isEqual:v4])
  {
    [v4 systemFrame];
    v12.origin.CGFloat x = v5;
    v12.origin.CGFloat y = v6;
    v12.size.CGFloat width = v7;
    v12.size.CGFloat height = v8;
    BOOL v9 = CGRectEqualToRect(self->_systemFrame, v12);
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (CGRect)systemFrame
{
  double x = self->_systemFrame.origin.x;
  double y = self->_systemFrame.origin.y;
  double width = self->_systemFrame.size.width;
  double height = self->_systemFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSystemFrame:(CGRect)systemFrame
{
  self->_systemFrame = systemFrame;
}

@end