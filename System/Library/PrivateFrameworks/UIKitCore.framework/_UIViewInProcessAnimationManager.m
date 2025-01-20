@interface _UIViewInProcessAnimationManager
+ (BOOL)_isInvalidated;
+ (BOOL)usesMainThreadExecution;
+ (void)_advanceWithTime:(double)a3;
+ (void)_applicationBecameActive;
+ (void)_applicationDidEnterBackground;
+ (void)_cancelAllAnimationsImmediately;
+ (void)_setCurrentMediaTime:(double)a3;
+ (void)_setExternalAnimationDriver:(id)a3;
+ (void)setAdvancingOnCommitDisabled:(BOOL)a3;
+ (void)setUsesMainThreadExecution:(BOOL)a3;
- (_UIViewInProcessAnimationManager)init;
@end

@implementation _UIViewInProcessAnimationManager

+ (BOOL)usesMainThreadExecution
{
  return sub_185A7139C();
}

+ (void)setUsesMainThreadExecution:(BOOL)a3
{
  if (qword_1E8FB0100 != -1) {
    swift_once();
  }
  sub_1858B9668();
}

+ (void)_cancelAllAnimationsImmediately
{
}

+ (void)_setExternalAnimationDriver:(id)a3
{
  uint64_t v4 = 0;
  if (a3)
  {
    type metadata accessor for ManagerDriverShimPresenter();
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a3;
    v5 = &off_1ED0E06B0;
  }
  else
  {
    v5 = 0;
  }
  qword_1E8FD5AD8 = v4;
  qword_1E8FD5AE0 = (uint64_t)v5;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

+ (void)_advanceWithTime:(double)a3
{
  if (qword_1E8FB0100 != -1) {
    swift_once();
  }
  sub_1856AC0E8(0, 0, (uint64_t)signpost_c2_removePresentationModifier_end, 0, (uint64_t)signpost_c2_removePresentationModifier_end, 0, a3, a3);
}

+ (void)_setCurrentMediaTime:(double)a3
{
  if (qword_1E8FB0100 != -1) {
    swift_once();
  }
  *(double *)(qword_1E8FD58B0 + 224) = a3;
}

+ (BOOL)_isInvalidated
{
  if (qword_1E8FB0100 != -1) {
    swift_once();
  }
  sub_186A1EFAC();
  return v3;
}

+ (void)_applicationDidEnterBackground
{
}

+ (void)_applicationBecameActive
{
}

+ (void)setAdvancingOnCommitDisabled:(BOOL)a3
{
  if (qword_1E8FB0100 != -1) {
    swift_once();
  }
  *(unsigned char *)(qword_1E8FD58B0 + 24) = a3;
}

- (_UIViewInProcessAnimationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIViewInProcessAnimationManager;
  return [(_UIViewInProcessAnimationManager *)&v3 init];
}

@end