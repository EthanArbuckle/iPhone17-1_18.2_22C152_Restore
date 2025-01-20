@interface BKDisplayRenderOverlay
- (BKDisplayRenderOverlay)initWithOverlayDescriptor:(id)a3 level:(float)a4;
- (BKDisplayRenderOverlayPersistenceCoordinator)_persistenceCoordinator;
- (BKSDisplayProgressIndicatorProperties)progressIndicatorProperties;
- (BKSDisplayRenderOverlayDescriptor)descriptor;
- (BOOL)_presentWithAnimationSettings:(id)a3;
- (BOOL)animates;
- (BOOL)disablesDisplayUpdates;
- (BOOL)isFrozen;
- (BOOL)isInterstitial;
- (BOOL)lockBacklight;
- (BOOL)presentWithAnimationSettings:(id)a3;
- (CADisplay)display;
- (NSString)description;
- (NSString)name;
- (double)_scale;
- (float)level;
- (id)_initWithPersistenceData:(id)a3;
- (id)_persistenceData;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)interfaceOrientation;
- (int64_t)type;
- (void)_setPersistenceCoordinator:(id)a3;
- (void)_setScale:(double)a3;
- (void)_setType:(int64_t)a3;
- (void)_wrapInCATransaction:(id)a3;
- (void)dealloc;
- (void)dismissWithAnimationSettings:(id)a3;
- (void)freeze;
- (void)setAnimates:(BOOL)a3;
@end

@implementation BKDisplayRenderOverlay

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceCoordinator, 0);

  objc_storeStrong((id *)&self->_descriptor, 0);
}

- (void)_setScale:(double)a3
{
  self->_scale = a3;
}

- (double)_scale
{
  return self->_scale;
}

- (void)_setPersistenceCoordinator:(id)a3
{
}

- (BKDisplayRenderOverlayPersistenceCoordinator)_persistenceCoordinator
{
  return self->_persistenceCoordinator;
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (BOOL)animates
{
  return self->_animates;
}

- (BOOL)disablesDisplayUpdates
{
  return self->_disablesDisplayUpdates;
}

- (void)_setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (float)level
{
  return self->_level;
}

- (BKSDisplayRenderOverlayDescriptor)descriptor
{
  return self->_descriptor;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  [(BKDisplayRenderOverlay *)self succinctDescriptionBuilder];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100042658;
  v8[3] = &unk_1000F8E50;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v5;
  v10 = self;
  [v5 appendBodySectionWithName:0 multilinePrefix:v4 block:v8];

  id v6 = v5;
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKDisplayRenderOverlay *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = +[BSDescriptionBuilder builderWithObject:self];
  id v4 = [v3 appendFloat:@"level" withName:0 decimalPrecision:self->_level];

  return v3;
}

- (id)succinctDescription
{
  v2 = [(BKDisplayRenderOverlay *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (NSString)description
{
  return (NSString *)[(BKDisplayRenderOverlay *)self descriptionWithMultilinePrefix:0];
}

- (void)_wrapInCATransaction:(id)a3
{
  if (a3)
  {
    v3 = (void (**)(void))a3;
    +[CATransaction begin];
    v3[2](v3);

    +[CATransaction commit];
  }
}

- (id)_persistenceData
{
  v3 = objc_alloc_init(_BKDisplayRenderOverlayPersistenceData);
  [(_BKDisplayRenderOverlayPersistenceData *)v3 setOverlayType:[(BKDisplayRenderOverlay *)self type]];
  [(_BKDisplayRenderOverlayPersistenceData *)v3 setDescriptor:self->_descriptor];
  *(float *)&double v4 = self->_level;
  [(_BKDisplayRenderOverlayPersistenceData *)v3 setLevel:v4];

  return v3;
}

- (BOOL)_presentWithAnimationSettings:(id)a3
{
  return 1;
}

- (void)dismissWithAnimationSettings:(id)a3
{
  id v4 = a3;
  if (self->_visible)
  {
    id v5 = sub_10005FD84();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(BKDisplayRenderOverlay *)self succinctDescription];
      *(_DWORD *)buf = 138543618;
      v10 = v6;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing render overlay %{public}@ with animation settings: %{public}@", buf, 0x16u);
    }
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100042A00;
    v7[3] = &unk_1000F8E50;
    v7[4] = self;
    id v8 = v4;
    [(BKDisplayRenderOverlay *)self _wrapInCATransaction:v7];
    self->_visible = 0;
  }
}

- (void)freeze
{
  if (!self->_visible)
  {
    id v6 = +[NSString stringWithFormat:@"Can't freeze a hidden overlay"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v7 = NSStringFromSelector(a2);
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138544642;
      id v12 = v7;
      __int16 v13 = 2114;
      v14 = v9;
      __int16 v15 = 2048;
      v16 = self;
      __int16 v17 = 2114;
      CFStringRef v18 = @"BKDisplayRenderOverlay.m";
      __int16 v19 = 1024;
      int v20 = 144;
      __int16 v21 = 2114;
      v22 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v6 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100042C5CLL);
  }
  if (!self->_frozen)
  {
    self->_frozen = 1;
    v3 = sub_10005FD84();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(BKDisplayRenderOverlay *)self succinctDescription];
      *(_DWORD *)buf = 138543362;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Freezing overlay: %{public}@", buf, 0xCu);
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100042C64;
    v10[3] = &unk_1000F8E78;
    v10[4] = self;
    [(BKDisplayRenderOverlay *)self _wrapInCATransaction:v10];
  }
}

- (BOOL)presentWithAnimationSettings:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  __int16 v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 1;
  if (self->_visible) {
    goto LABEL_5;
  }
  id v5 = sub_10005FD84();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(BKDisplayRenderOverlay *)self succinctDescription];
    *(_DWORD *)buf = 138543618;
    __int16 v17 = v6;
    __int16 v18 = 2114;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Presenting overlay: %{public}@ with animation settings: %{public}@", buf, 0x16u);
  }
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100042E40;
  v9[3] = &unk_1000F8EF0;
  __int16 v11 = &v12;
  v9[4] = self;
  id v10 = v4;
  [(BKDisplayRenderOverlay *)self _wrapInCATransaction:v9];
  self->_visible = 1;

  if (*((unsigned char *)v13 + 24))
  {
LABEL_5:
    +[CATransaction flush];
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)setAnimates:(BOOL)a3
{
  if (self->_animates != a3)
  {
    self->_animates = a3;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100042F20;
    v3[3] = &unk_1000F8E78;
    v3[4] = self;
    [(BKDisplayRenderOverlay *)self _wrapInCATransaction:v3];
  }
}

- (BOOL)isInterstitial
{
  return [(BKSDisplayRenderOverlayDescriptor *)self->_descriptor isInterstitial];
}

- (BKSDisplayProgressIndicatorProperties)progressIndicatorProperties
{
  return (BKSDisplayProgressIndicatorProperties *)[(BKSDisplayRenderOverlayDescriptor *)self->_descriptor progressIndicatorProperties];
}

- (BOOL)lockBacklight
{
  return [(BKSDisplayRenderOverlayDescriptor *)self->_descriptor lockBacklight];
}

- (int64_t)interfaceOrientation
{
  return (int64_t)[(BKSDisplayRenderOverlayDescriptor *)self->_descriptor interfaceOrientation];
}

- (CADisplay)display
{
  return (CADisplay *)[(BKSDisplayRenderOverlayDescriptor *)self->_descriptor display];
}

- (NSString)name
{
  return (NSString *)[(BKSDisplayRenderOverlayDescriptor *)self->_descriptor name];
}

- (void)dealloc
{
  if (self->_visible)
  {
    id v4 = +[NSString stringWithFormat:@"Must dismiss before releasing"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v5 = NSStringFromSelector(a2);
      id v6 = (objc_class *)objc_opt_class();
      BOOL v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544642;
      id v10 = v5;
      __int16 v11 = 2114;
      uint64_t v12 = v7;
      __int16 v13 = 2048;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      CFStringRef v16 = @"BKDisplayRenderOverlay.m";
      __int16 v17 = 1024;
      int v18 = 66;
      __int16 v19 = 2114;
      int v20 = v4;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v4 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000430CCLL);
  }
  v8.receiver = self;
  v8.super_class = (Class)BKDisplayRenderOverlay;
  [(BKDisplayRenderOverlay *)&v8 dealloc];
}

- (id)_initWithPersistenceData:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [v4 descriptor];
    [v4 level];
    int v7 = v6;

    LODWORD(v8) = v7;
    id v9 = [(BKDisplayRenderOverlay *)self initWithOverlayDescriptor:v5 level:v8];

    self = v9;
    id v10 = self;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BKDisplayRenderOverlay)initWithOverlayDescriptor:(id)a3 level:(float)a4
{
  id v8 = a3;
  if (!v8)
  {
    __int16 v17 = (objc_class *)objc_opt_class();
    int v18 = NSStringFromClass(v17);
    __int16 v19 = +[NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"descriptor", v18];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      int v20 = NSStringFromSelector(a2);
      __int16 v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      *(_WORD *)&buf[22] = 2048;
      v33 = self;
      LOWORD(v34) = 2114;
      *(void *)((char *)&v34 + 2) = @"BKDisplayRenderOverlay.m";
      WORD5(v34) = 1024;
      HIDWORD(v34) = 35;
      LOWORD(p_scale) = 2114;
      *(void *)((char *)&p_scale + 2) = v19;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v19 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100043414);
  }
  id v9 = v8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v23 = (objc_class *)[v9 classForCoder];
    if (!v23) {
      v23 = (objc_class *)objc_opt_class();
    }
    v24 = NSStringFromClass(v23);
    v25 = (objc_class *)objc_opt_class();
    v26 = NSStringFromClass(v25);
    v27 = +[NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"descriptor", v24, v26];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v28 = NSStringFromSelector(a2);
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138544642;
      *(void *)&uint8_t buf[4] = v28;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v30;
      *(_WORD *)&buf[22] = 2048;
      v33 = self;
      LOWORD(v34) = 2114;
      *(void *)((char *)&v34 + 2) = @"BKDisplayRenderOverlay.m";
      WORD5(v34) = 1024;
      HIDWORD(v34) = 35;
      LOWORD(p_scale) = 2114;
      *(void *)((char *)&p_scale + 2) = v27;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v27 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100043550);
  }

  v31.receiver = self;
  v31.super_class = (Class)BKDisplayRenderOverlay;
  id v10 = [(BKDisplayRenderOverlay *)&v31 init];
  __int16 v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_descriptor, a3);
    v11->_level = a4;
    uint64_t v12 = +[BKDisplayRenderOverlayPersistenceCoordinator sharedInstance];
    persistenceCoordinator = v11->_persistenceCoordinator;
    v11->_persistenceCoordinator = (BKDisplayRenderOverlayPersistenceCoordinator *)v12;

    v11->_type = 0;
    *(_WORD *)&v11->_visible = 0;
    uint64_t v14 = [v9 display];
    if ([v14 isExternal])
    {
      __int16 v15 = [v14 currentMode];
      v11->_scale = (double)(unint64_t)[v15 preferredScale];
    }
    else
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_10001143C;
      v33 = (BKDisplayRenderOverlay *)&unk_1000F6620;
      long long v34 = 0uLL;
      long long p_scale = (unint64_t)&v11->_scale;
      uint64_t v36 = 0;
      uint64_t v37 = 0;
      sub_1000112C0(buf);
    }
  }
  return v11;
}

@end