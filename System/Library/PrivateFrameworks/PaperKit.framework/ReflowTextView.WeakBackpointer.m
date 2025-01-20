@interface ReflowTextView.WeakBackpointer
- (void)stepAnimation;
@end

@implementation ReflowTextView.WeakBackpointer

- (void)stepAnimation
{
  uint64_t v2 = MEMORY[0x210550400](self->reflowView, a2);
  if (v2)
  {
    v3 = (void *)v2;
    swift_retain();
    ReflowTextView.stepAnimation()();

    swift_release();
  }
}

@end