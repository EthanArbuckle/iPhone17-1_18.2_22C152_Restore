@interface TSDTrackerManipulatorCoordinator
+ (void)p_dynamicallySubclassGRForNotification:(id)a3;
+ (void)p_removeDynamicSubclass:(id)a3;
- (BOOL)hasRegisteredTrackerManipulator:(id)a3;
- (BOOL)relinquishTrackerManipulatorControl:(id)a3;
- (BOOL)takeControlWithTrackerManipulator:(id)a3;
- (TSDTrackerManipulator)controllingTM;
- (TSDTrackerManipulatorCoordinator)init;
- (void)dealloc;
- (void)operationDidEnd;
- (void)operationWillEnd;
- (void)p_notifyControlChange;
- (void)registerTrackerManipulator:(id)a3;
- (void)unregisterTrackerManipulator:(id)a3;
@end

@implementation TSDTrackerManipulatorCoordinator

- (TSDTrackerManipulatorCoordinator)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSDTrackerManipulatorCoordinator;
  v2 = [(TSDTrackerManipulatorCoordinator *)&v4 init];
  if (v2) {
    v2->mRegisteredTMs = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSDTrackerManipulatorCoordinator;
  [(TSDTrackerManipulatorCoordinator *)&v3 dealloc];
}

- (void)registerTrackerManipulator:(id)a3
{
}

- (void)unregisterTrackerManipulator:(id)a3
{
}

- (BOOL)hasRegisteredTrackerManipulator:(id)a3
{
  return [(NSMutableSet *)self->mRegisteredTMs containsObject:a3];
}

- (BOOL)takeControlWithTrackerManipulator:(id)a3
{
  if (self->mControllingTM == a3)
  {
LABEL_16:
    LOBYTE(v9) = 1;
    return v9;
  }
  if (a3
    && ![(TSDTrackerManipulatorCoordinator *)self hasRegisteredTrackerManipulator:a3])
  {
    v5 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v6 = [NSString stringWithUTF8String:"-[TSDTrackerManipulatorCoordinator takeControlWithTrackerManipulator:]"];
    [v5 handleFailureInFunction:v6, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTrackerManipulatorCoordinator.m"), 76, @"attempting to take control with an unregistered TM %@", a3 file lineNumber description];
  }
  mControllingTM = self->mControllingTM;
  if (mControllingTM) {
    BOOL v8 = mControllingTM == a3;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
LABEL_13:
    objc_msgSend((id)objc_opt_class(), "p_dynamicallySubclassGRForNotification:", a3);
    self->mControllingTM = (TSDTrackerManipulator *)a3;
    if (objc_opt_respondsToSelector()) {
      [(TSDTrackerManipulator *)self->mControllingTM willTakeControl];
    }
    [(TSDTrackerManipulatorCoordinator *)self p_notifyControlChange];
    goto LABEL_16;
  }
  int v9 = [(TSDTrackerManipulator *)mControllingTM allowTrackerManipulatorToTakeControl:a3];
  if (v9)
  {
    if (objc_opt_respondsToSelector()) {
      [(TSDTrackerManipulator *)self->mControllingTM didRelinquishControl];
    }
    objc_msgSend((id)objc_opt_class(), "p_removeDynamicSubclass:", self->mControllingTM);

    self->mControllingTM = 0;
    goto LABEL_13;
  }
  return v9;
}

- (BOOL)relinquishTrackerManipulatorControl:(id)a3
{
  if (self->mControllingTM == a3)
  {
    int v3 = [a3 allowTrackerManipulatorToTakeControl:0];
    if (v3)
    {
      if (objc_opt_respondsToSelector()) {
        [(TSDTrackerManipulator *)self->mControllingTM didRelinquishControl];
      }
      objc_msgSend((id)objc_opt_class(), "p_removeDynamicSubclass:", self->mControllingTM);

      self->mControllingTM = 0;
      [(TSDTrackerManipulatorCoordinator *)self p_notifyControlChange];
      LOBYTE(v3) = 1;
    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (void)operationWillEnd
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = (id)[(NSMutableSet *)self->mRegisteredTMs copy];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 operationWillEnd];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)operationDidEnd
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = (id)[(NSMutableSet *)self->mRegisteredTMs copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v7++) operationDidEnd];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  [(NSMutableSet *)self->mRegisteredTMs removeAllObjects];
  [(TSDTrackerManipulatorCoordinator *)self relinquishTrackerManipulatorControl:self->mControllingTM];
  if (self->mControllingTM)
  {
    long long v8 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v9 = [NSString stringWithUTF8String:"-[TSDTrackerManipulatorCoordinator operationDidEnd]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTrackerManipulatorCoordinator.m"];
    long long v11 = (objc_class *)objc_opt_class();
    [v8 handleFailureInFunction:v9, v10, 151, @"Controlling TM %@ would not give up control at the end of an operation", NSStringFromClass(v11) file lineNumber description];
  }
}

- (void)p_notifyControlChange
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = (id)[(NSMutableSet *)self->mRegisteredTMs copy];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if (objc_opt_respondsToSelector()) {
          [v8 trackerManipulatorDidTakeControl:self->mControllingTM];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (void)p_dynamicallySubclassGRForNotification:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return;
  }
  uint64_t v4 = objc_opt_class();
  objc_sync_enter(v4);
  if (!sClassMap) {
    sClassMap = (uint64_t)objc_alloc_init(MEMORY[0x263F7C880]);
  }
  Class = object_getClass(a3);
  if (objc_msgSend((id)objc_msgSend((id)sClassMap, "allValues"), "containsObject:", Class))
  {
    uint64_t v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"+[TSDTrackerManipulatorCoordinator p_dynamicallySubclassGRForNotification:]"];
    [v6 handleFailureInFunction:v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTrackerManipulatorCoordinator.m"), 208, @"trying to subclass something that is already subclassed %@", a3 file lineNumber description];
  }
  else
  {
    long long v8 = (objc_class *)[(id)sClassMap objectForKey:Class];
    if (!v8)
    {
      long long v9 = (const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"__TSDResetNotifying%s", class_getName(Class)), "UTF8String");
      long long v10 = (objc_class *)objc_opt_class();
      ClassPair = objc_allocateClassPair(v10, v9, 0);
      long long v8 = ClassPair;
      if (!ClassPair)
      {
        long long v12 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
        uint64_t v13 = [NSString stringWithUTF8String:"+[TSDTrackerManipulatorCoordinator p_dynamicallySubclassGRForNotification:]"];
        uint64_t v14 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTrackerManipulatorCoordinator.m"];
        long long v15 = (objc_class *)objc_opt_class();
        [v12 handleFailureInFunction:v13, v14, 227, @"No dynamic subclass for %@!", NSStringFromClass(v15) file lineNumber description];
        goto LABEL_11;
      }
      class_addMethod(ClassPair, sel_reset, (IMP)universalReset, "v@:");
      objc_registerClassPair(v8);
      [(id)sClassMap setObject:v8 forUncopiedKey:Class];
    }
    object_setClass(a3, v8);
  }
LABEL_11:

  objc_sync_exit(v4);
}

+ (void)p_removeDynamicSubclass:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = objc_opt_class();
    objc_sync_enter(v4);
    Class = object_getClass(a3);
    if (objc_msgSend((id)objc_msgSend((id)sClassMap, "allValues"), "containsObject:", Class))
    {
      Superclass = class_getSuperclass(Class);
      object_setClass(a3, Superclass);
    }
    else
    {
      uint64_t v7 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v8 = [NSString stringWithUTF8String:"+[TSDTrackerManipulatorCoordinator p_removeDynamicSubclass:]"];
      [v7 handleFailureInFunction:v8, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/drawables/TSDTrackerManipulatorCoordinator.m"), 242, @"removing dynamic subclass from GR %@ that doesn't have one!", a3 file lineNumber description];
    }
    objc_sync_exit(v4);
  }
}

- (TSDTrackerManipulator)controllingTM
{
  return self->mControllingTM;
}

@end