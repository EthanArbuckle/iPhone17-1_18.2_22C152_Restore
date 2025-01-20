@interface CRLTrackerManipulatorCoordinator
+ (void)p_dynamicallySubclassGRForNotification:(id)a3;
+ (void)p_removeDynamicSubclass:(id)a3;
- (BOOL)hasRegisteredTrackerManipulator:(id)a3;
- (BOOL)relinquishTrackerManipulatorControl:(id)a3;
- (BOOL)takeControlWithTrackerManipulator:(id)a3;
- (CRLTrackerManipulator)controllingTM;
- (CRLTrackerManipulatorCoordinator)init;
- (void)operationDidEnd;
- (void)operationWillEnd;
- (void)p_notifyControlChange;
- (void)registerTrackerManipulator:(id)a3;
- (void)unregisterTrackerManipulator:(id)a3;
@end

@implementation CRLTrackerManipulatorCoordinator

- (CRLTrackerManipulatorCoordinator)init
{
  v6.receiver = self;
  v6.super_class = (Class)CRLTrackerManipulatorCoordinator;
  v2 = [(CRLTrackerManipulatorCoordinator *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    mRegisteredTMs = v2->mRegisteredTMs;
    v2->mRegisteredTMs = v3;
  }
  return v2;
}

- (void)registerTrackerManipulator:(id)a3
{
  id v4 = a3;
  if (qword_101719CC8 != -1) {
    dispatch_once(&qword_101719CC8, &stru_1014EE210);
  }
  v5 = off_10166D810;
  if (os_log_type_enabled((os_log_t)off_10166D810, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "registering %@", (uint8_t *)&v9, 0xCu);
  }
  [(NSMutableSet *)self->mRegisteredTMs addObject:v4];
}

- (void)unregisterTrackerManipulator:(id)a3
{
  id v4 = a3;
  if (qword_101719CC8 != -1) {
    dispatch_once(&qword_101719CC8, &stru_1014EE230);
  }
  v5 = off_10166D810;
  if (os_log_type_enabled((os_log_t)off_10166D810, OS_LOG_TYPE_INFO))
  {
    objc_super v6 = v5;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    int v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "unregistering %@", (uint8_t *)&v9, 0xCu);
  }
  [(NSMutableSet *)self->mRegisteredTMs removeObject:v4];
}

- (BOOL)hasRegisteredTrackerManipulator:(id)a3
{
  return [(NSMutableSet *)self->mRegisteredTMs containsObject:a3];
}

- (BOOL)takeControlWithTrackerManipulator:(id)a3
{
  v5 = (CRLTrackerManipulator *)a3;
  objc_super v6 = v5;
  p_mControllingTM = (id *)&self->mControllingTM;
  if (self->mControllingTM != v5)
  {
    if (v5
      && ![(CRLTrackerManipulatorCoordinator *)self hasRegisteredTrackerManipulator:v5])
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE250);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109EF08();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE270);
      }
      v8 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109EE5C(v8);
      }
      int v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTrackerManipulatorCoordinator takeControlWithTrackerManipulator:]");
      v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTrackerManipulatorCoordinator.m"];
      +[CRLAssertionHandler handleFailureInFunction:v9, v10, 55, 0, "attempting to take control with an unregistered TM %@", v6 file lineNumber isFatal description];
    }
    if (qword_101719CC8 != -1) {
      dispatch_once(&qword_101719CC8, &stru_1014EE290);
    }
    v11 = off_10166D810;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_INFO))
    {
      if (v6)
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v13 = @"(null)";
      }
      id v14 = *p_mControllingTM;
      if (*p_mControllingTM)
      {
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = @"(null)";
      }
      *(_DWORD *)buf = 138412546;
      v28 = v13;
      __int16 v29 = 2112;
      v30 = v16;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v11, OS_LOG_TYPE_INFO, "attempting to take control with %@ from controllingTM %@", buf, 0x16u);
      if (v14) {

      }
      if (v6) {
    }
      }

    v17 = (CRLTrackerManipulator *)*p_mControllingTM;
    if (!*p_mControllingTM || v17 == v6) {
      goto LABEL_32;
    }
    if ([(CRLTrackerManipulator *)v17 allowTrackerManipulatorToTakeControl:v6])
    {
      if (objc_opt_respondsToSelector()) {
        [*p_mControllingTM didRelinquishControl];
      }
      [objc_opt_class() p_removeDynamicSubclass:self->mControllingTM];
      mControllingTM = self->mControllingTM;
      self->mControllingTM = 0;

LABEL_32:
      [objc_opt_class() p_dynamicallySubclassGRForNotification:v6];
      objc_storeStrong((id *)&self->mControllingTM, a3);
      if (objc_opt_respondsToSelector()) {
        [*p_mControllingTM willTakeControl];
      }
      [(CRLTrackerManipulatorCoordinator *)self p_notifyControlChange];
      goto LABEL_35;
    }
    if (qword_101719CC8 != -1) {
      dispatch_once(&qword_101719CC8, &stru_1014EE2B0);
    }
    v21 = off_10166D810;
    if (!os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_INFO))
    {
LABEL_49:

      BOOL v19 = 0;
      goto LABEL_36;
    }
    id v22 = *p_mControllingTM;
    if (v22)
    {
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
LABEL_42:
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_45:
        *(_DWORD *)buf = 138412546;
        v28 = v24;
        __int16 v29 = 2112;
        v30 = v26;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)v21, OS_LOG_TYPE_INFO, "ControllingTM %@ will not release control to %@", buf, 0x16u);
        if (v6) {

        }
        if (v22) {
        goto LABEL_49;
        }
      }
    }
    else
    {
      v24 = @"(null)";
      if (v6) {
        goto LABEL_42;
      }
    }
    v26 = @"(null)";
    goto LABEL_45;
  }
LABEL_35:
  BOOL v19 = 1;
LABEL_36:

  return v19;
}

- (BOOL)relinquishTrackerManipulatorControl:(id)a3
{
  if (self->mControllingTM != a3) {
    goto LABEL_2;
  }
  if ([a3 allowTrackerManipulatorToTakeControl:0])
  {
    if (objc_opt_respondsToSelector()) {
      [(CRLTrackerManipulator *)self->mControllingTM didRelinquishControl];
    }
    [objc_opt_class() p_removeDynamicSubclass:self->mControllingTM];
    mControllingTM = self->mControllingTM;
    self->mControllingTM = 0;

    [(CRLTrackerManipulatorCoordinator *)self p_notifyControlChange];
    LOBYTE(v3) = 1;
  }
  else
  {
    if (qword_101719CC8 != -1) {
      dispatch_once(&qword_101719CC8, &stru_1014EE2D0);
    }
    objc_super v6 = off_10166D810;
    BOOL v3 = os_log_type_enabled((os_log_t)off_10166D810, OS_LOG_TYPE_INFO);
    if (v3)
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      int v9 = NSStringFromClass(v8);
      int v11 = 138412290;
      v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "ControllingTM %@ will not relinquish control", (uint8_t *)&v11, 0xCu);

LABEL_2:
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)operationWillEnd
{
  if (qword_101719CC8 != -1) {
    dispatch_once(&qword_101719CC8, &stru_1014EE2F0);
  }
  BOOL v3 = off_10166D810;
  if (os_log_type_enabled((os_log_t)off_10166D810, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138412290;
    BOOL v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "operation will end with controllingTM: %@", buf, 0xCu);
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = [(NSMutableSet *)self->mRegisteredTMs copy];
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v12 operationWillEnd];
        }
      }
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)operationDidEnd
{
  if (qword_101719CC8 != -1) {
    dispatch_once(&qword_101719CC8, &stru_1014EE310);
  }
  BOOL v3 = off_10166D810;
  if (os_log_type_enabled((os_log_t)off_10166D810, OS_LOG_TYPE_INFO))
  {
    id v4 = v3;
    v5 = (objc_class *)objc_opt_class();
    objc_super v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "operation did end with controllingTM: %@", buf, 0xCu);
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = [(NSMutableSet *)self->mRegisteredTMs copy];
  id v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) operationDidEnd];
      }
      id v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  [(NSMutableSet *)self->mRegisteredTMs removeAllObjects];
  p_mControllingTM = &self->mControllingTM;
  [(CRLTrackerManipulatorCoordinator *)self relinquishTrackerManipulatorControl:self->mControllingTM];
  if (self->mControllingTM)
  {
    int v13 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE330);
    }
    long long v14 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109EF90((uint64_t)p_mControllingTM, v14, v13);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014EE350);
    }
    long long v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10109EE5C(v15);
    }
    long long v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTrackerManipulatorCoordinator operationDidEnd]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTrackerManipulatorCoordinator.m"];
    v18 = (objc_class *)objc_opt_class();
    BOOL v19 = NSStringFromClass(v18);
    +[CRLAssertionHandler handleFailureInFunction:v16, v17, 126, 0, "Controlling TM %@ would not give up control at the end of an operation", v19 file lineNumber isFatal description];
  }
}

- (void)p_notifyControlChange
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = [(NSMutableSet *)self->mRegisteredTMs copy];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * (void)v7);
        if (objc_opt_respondsToSelector()) {
          [v8 trackerManipulatorDidTakeControl:self->mControllingTM];
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

+ (void)p_dynamicallySubclassGRForNotification:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_opt_class();
    objc_sync_enter(v4);
    if (!qword_1016A9670)
    {
      id v5 = [objc_alloc((Class)NSMapTable) initWithKeyOptions:0 valueOptions:0 capacity:0];
      uint64_t v6 = (void *)qword_1016A9670;
      qword_1016A9670 = (uint64_t)v5;
    }
    Class = object_getClass(v3);
    id v8 = [(id)qword_1016A9670 dictionaryRepresentation];
    long long v9 = [v8 allValues];
    unsigned int v10 = [v9 containsObject:Class];

    if (v10)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE398);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109F0B8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE3B8);
      }
      long long v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_10109F070();
      }

      long long v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLTrackerManipulatorCoordinator p_dynamicallySubclassGRForNotification:]");
      int v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTrackerManipulatorCoordinator.m"];
      +[CRLAssertionHandler handleFailureInFunction:v12, v13, 179, 0, "trying to subclass something that is already subclassed %@", v3 file lineNumber isFatal description];
LABEL_14:

LABEL_19:
      objc_sync_exit(v4);

      goto LABEL_20;
    }
    long long v14 = (objc_class *)[(id)qword_1016A9670 objectForKey:Class];
    if (!v14)
    {
      id v15 = +[NSString stringWithFormat:@"__TSDResetNotifying%s", class_getName(Class)];
      long long v16 = (const char *)[v15 UTF8String];

      v17 = (objc_class *)objc_opt_class();
      ClassPair = objc_allocateClassPair(v17, v16, 0);
      long long v14 = ClassPair;
      if (!ClassPair)
      {
        +[CRLAssertionHandler _atomicIncrementAssertCount];
        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EE3D8);
        }
        BOOL v19 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_ERROR))
        {
          long long v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          objc_claimAutoreleasedReturnValue();
          sub_10109F140();
        }

        if (qword_101719A70 != -1) {
          dispatch_once(&qword_101719A70, &stru_1014EE3F8);
        }
        long long v21 = off_10166B4A0;
        if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
        {
          +[CRLAssertionHandler packedBacktraceString];
          objc_claimAutoreleasedReturnValue();
          sub_10109F070();
        }

        long long v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLTrackerManipulatorCoordinator p_dynamicallySubclassGRForNotification:]");
        int v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTrackerManipulatorCoordinator.m"];
        long long v22 = (objc_class *)objc_opt_class();
        long long v23 = NSStringFromClass(v22);
        +[CRLAssertionHandler handleFailureInFunction:v12, v13, 198, 0, "No dynamic subclass for %@!", v23 file lineNumber isFatal description];

        goto LABEL_14;
      }
      class_addMethod(ClassPair, "reset", (IMP)sub_100321DF4, "v@:");
      objc_registerClassPair(v14);
      [(id)qword_1016A9670 setObject:v14 forKey:Class];
    }
    object_setClass(v3, v14);
    goto LABEL_19;
  }
LABEL_20:
}

+ (void)p_removeDynamicSubclass:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = objc_opt_class();
    objc_sync_enter(v4);
    Class = object_getClass(v3);
    uint64_t v6 = [(id)qword_1016A9670 dictionaryRepresentation];
    id v7 = [v6 allValues];
    unsigned __int8 v8 = [v7 containsObject:Class];

    if (v8)
    {
      Superclass = class_getSuperclass(Class);
      object_setClass(v3, Superclass);
    }
    else
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE418);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10109F1D4();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014EE438);
      }
      unsigned int v10 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
      {
        +[CRLAssertionHandler packedBacktraceString];
        objc_claimAutoreleasedReturnValue();
        sub_10109F070();
      }

      long long v11 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLTrackerManipulatorCoordinator p_removeDynamicSubclass:]");
      long long v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLTrackerManipulatorCoordinator.m"];
      +[CRLAssertionHandler handleFailureInFunction:v11, v12, 212, 0, "removing dynamic subclass from GR %@ that doesn't have one!", v3 file lineNumber isFatal description];
    }
    objc_sync_exit(v4);
  }
}

- (CRLTrackerManipulator)controllingTM
{
  return self->mControllingTM;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mControllingTM, 0);

  objc_storeStrong((id *)&self->mRegisteredTMs, 0);
}

@end