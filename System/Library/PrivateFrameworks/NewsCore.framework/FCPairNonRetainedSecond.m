@interface FCPairNonRetainedSecond
- (void)p_SetSecond:(id)a3;
@end

@implementation FCPairNonRetainedSecond

- (void)p_SetSecond:(id)a3
{
  id v5 = a3;
  id mSecond = self->super.mSecond;
  p_id mSecond = &self->super.mSecond;
  if (mSecond != v5)
  {
    id v8 = v5;
    objc_storeStrong(p_mSecond, a3);
    id v5 = v8;
  }
}

@end