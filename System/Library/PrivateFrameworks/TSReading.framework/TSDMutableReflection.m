@interface TSDMutableReflection
- (void)setFadeAcceleration:(double)a3;
- (void)setOpacity:(double)a3;
@end

@implementation TSDMutableReflection

- (void)setOpacity:(double)a3
{
  TSUClamp();
  self->super.mOpacity = v4;
}

- (void)setFadeAcceleration:(double)a3
{
  self->super.mFadeAcceleration = a3;
}

@end