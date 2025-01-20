@interface PFSPairNonRetainedValue
- (void)p_SetValue:(id)a3;
@end

@implementation PFSPairNonRetainedValue

- (void)p_SetValue:(id)a3
{
  if (self->super.mValue != a3) {
    self->super.mValue = a3;
  }
}

@end