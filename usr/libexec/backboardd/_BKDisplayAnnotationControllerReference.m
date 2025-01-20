@interface _BKDisplayAnnotationControllerReference
- (BKDisplayAnnotationController)controller;
- (_BKDisplayAnnotationControllerReference)initWithController:(id)a3;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)dealloc;
- (void)setController:(id)a3;
@end

@implementation _BKDisplayAnnotationControllerReference

- (void).cxx_destruct
{
}

- (void)setController:(id)a3
{
}

- (BKDisplayAnnotationController)controller
{
  return self->_controller;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  return self->_controller;
}

- (void)dealloc
{
  controller = self->_controller;
  if (controller)
  {
    p_lock = &controller->_lock;
    os_unfair_lock_lock(&controller->_lock);
    uint64_t lock_externalReferenceCount = controller->_lock_externalReferenceCount;
    controller->_uint64_t lock_externalReferenceCount = lock_externalReferenceCount - 1;
    if (lock_externalReferenceCount <= 0)
    {
      v14 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"_lock_externalReferenceCount >= 0"];
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector("removeExternalReference");
        v15 = (BKDisplayAnnotationController *)objc_claimAutoreleasedReturnValue();
        v16 = (objc_class *)objc_opt_class();
        v17 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138544642;
        v20 = v15;
        __int16 v21 = 2114;
        v22 = v17;
        __int16 v23 = 2048;
        v24 = controller;
        __int16 v25 = 2114;
        CFStringRef v26 = @"BKDisplayAnnotationController.m";
        __int16 v27 = 1024;
        int v28 = 282;
        __int16 v29 = 2114;
        v30 = v14;
        _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
      }
      [v14 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x10004FEB4);
    }
    if (lock_externalReferenceCount == 1)
    {
      displayController = controller->_displayController;
      v7 = controller;
      if (displayController)
      {
        v8 = sub_10005FB14();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v20 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "removing last reference to %{public}@", buf, 0xCu);
        }

        os_unfair_lock_lock(&displayController->_lock);
        v9 = [(BKDisplayAnnotationController *)v7 display];
        id v10 = [v9 uniqueId];
        id v11 = [v10 length];
        v12 = (void *)BKSDisplayUUIDMainKey;
        if (v11) {
          v12 = v10;
        }
        id v13 = v12;

        [(NSMutableDictionary *)displayController->_lock_displayToAnnotationContext removeObjectForKey:v13];
        os_unfair_lock_unlock(&displayController->_lock);
      }
      [(BKDisplayAnnotationController *)v7 _lock_invalidate];
    }
    os_unfair_lock_unlock(p_lock);
  }
  v18.receiver = self;
  v18.super_class = (Class)_BKDisplayAnnotationControllerReference;
  [(_BKDisplayAnnotationControllerReference *)&v18 dealloc];
}

- (_BKDisplayAnnotationControllerReference)initWithController:(id)a3
{
  v5 = (os_unfair_lock_s *)a3;
  v9.receiver = self;
  v9.super_class = (Class)_BKDisplayAnnotationControllerReference;
  v6 = [(_BKDisplayAnnotationControllerReference *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_controller, a3);
    if (v5)
    {
      os_unfair_lock_lock(v5 + 8);
      ++*(void *)&v5[10]._os_unfair_lock_opaque;
      os_unfair_lock_unlock(v5 + 8);
    }
  }

  return v7;
}

@end