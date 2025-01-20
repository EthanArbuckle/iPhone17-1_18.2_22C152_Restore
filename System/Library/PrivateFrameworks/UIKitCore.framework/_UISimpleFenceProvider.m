@interface _UISimpleFenceProvider
+ (_UISimpleFenceProvider)sharedInstance;
- (BOOL)isTrackingAnySystemAnimationFence;
- (BOOL)trackSystemAnimationFence:(id)a3;
- (_UISimpleFenceProvider)init;
- (id)requestSystemAnimationFence;
- (void)synchronizeSystemAnimationFencesWithCleanUpBlock:(id)a3;
@end

@implementation _UISimpleFenceProvider

+ (_UISimpleFenceProvider)sharedInstance
{
  if (qword_1EB25F158 != -1) {
    dispatch_once(&qword_1EB25F158, &__block_literal_global_51);
  }
  v2 = (void *)_MergedGlobals_960;
  return (_UISimpleFenceProvider *)v2;
}

- (BOOL)trackSystemAnimationFence:(id)a3
{
  id v5 = a3;
  if (pthread_main_np() != 1)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"_UISimpleFenceProvider.m" lineNumber:51 description:@"main thread only"];
  }
  if (self->_synchronizing)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"_UISimpleFenceProvider.m" lineNumber:52 description:@"cannot start tracking a new fence while we are synchronizing"];
  }
  int v6 = [v5 isUsable];
  if (v6) {
    self->_trackingAny = 1;
  }

  return v6;
}

- (id)requestSystemAnimationFence
{
  v2 = (void *)MEMORY[0x1E4F4F220];
  v3 = (void *)[MEMORY[0x1E4F39BB8] newFenceFromDefaultServer];
  v4 = (void *)[v2 newFenceHandleForCAFenceHandle:v3];

  return v4;
}

- (_UISimpleFenceProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UISimpleFenceProvider;
  return [(_UISimpleFenceProvider *)&v3 init];
}

- (void)synchronizeSystemAnimationFencesWithCleanUpBlock:(id)a3
{
  id v8 = a3;
  if (pthread_main_np() != 1)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"_UISimpleFenceProvider.m" lineNumber:63 description:@"main thread only"];
  }
  *(_WORD *)&self->_trackingAny = 256;
  id v5 = v8;
  if (v8)
  {
    int v6 = (void *)MEMORY[0x18C108260]();
    (*((void (**)(id, void))v8 + 2))(v8, 0);
    id v5 = v8;
  }
  self->_synchronizing = 0;
}

- (BOOL)isTrackingAnySystemAnimationFence
{
  if (pthread_main_np() != 1)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"_UISimpleFenceProvider.m" lineNumber:45 description:@"main thread only"];
  }
  return self->_trackingAny;
}

@end