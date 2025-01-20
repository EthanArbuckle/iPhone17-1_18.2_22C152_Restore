@interface _UIViewServiceFencingControlProxy
+ (id)proxyWithTarget:(id)a3 exportedProtocol:(id)a4 fencingBatchController:(id)a5;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)__finishParticipatingInSystemAnimationFence:(id)a3;
- (void)__participateInSystemAnimationFence:(id)a3 timing:(_UIUpdateTiming *)a4;
@end

@implementation _UIViewServiceFencingControlProxy

+ (id)proxyWithTarget:(id)a3 exportedProtocol:(id)a4 fencingBatchController:(id)a5
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __93___UIViewServiceFencingControlProxy_proxyWithTarget_exportedProtocol_fencingBatchController___block_invoke;
  v6[3] = &unk_1E530E2D0;
  v6[4] = a4;
  return (id)objc_msgSend(a1, "proxyWithTarget:shouldSuspendInvocationBlock:", a3, v6, a5);
}

- (id)methodSignatureForSelector:(SEL)a3
{
  if ((unint64_t)protocol_getMethodDescription((Protocol *)&unk_1ED686E58, a3, 1, 1).name)
  {
    v5 = (void *)MEMORY[0x1E4F1CA38];
    v6 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v6, a3);
    TypeEncoding = method_getTypeEncoding(InstanceMethod);
    return (id)[v5 signatureWithObjCTypes:TypeEncoding];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_UIViewServiceFencingControlProxy;
    return [(_UITargetedProxy *)&v10 methodSignatureForSelector:a3];
  }
}

- (void)__participateInSystemAnimationFence:(id)a3 timing:(_UIUpdateTiming *)a4
{
  if (_UIUpdateCycleEnabled())
  {
    ++*((_DWORD *)off_1EB256BF8 + 191);
    *(void *)&double v6 = _UIUpdateSchedulerRequestUpdate((uint64_t)&_UIUpdateCycleMainScheduler, (uint64_t)a4, &v7).n128_u64[0];
  }
  +[UIScene _synchronizeDrawingWithFence:](UIScene, "_synchronizeDrawingWithFence:", a3, v6);
  [a3 invalidate];
}

- (void)__finishParticipatingInSystemAnimationFence:(id)a3
{
  +[UIScene _synchronizeDrawingWithFence:](UIScene, "_synchronizeDrawingWithFence:");
  [a3 invalidate];
  if (_UIUpdateCycleEnabled())
  {
    int v4 = *((_DWORD *)off_1EB256BF8 + 191) - 1;
    *((_DWORD *)off_1EB256BF8 + 191) = v4;
    if (!v4)
    {
      signalChanges((uint64_t)&_UIUpdateCycleMainScheduler, 1);
    }
  }
}

@end