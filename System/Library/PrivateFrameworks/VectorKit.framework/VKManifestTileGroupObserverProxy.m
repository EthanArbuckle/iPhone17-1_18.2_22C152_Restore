@interface VKManifestTileGroupObserverProxy
- (VKManifestTileGroupObserverProxy)initWithQueue:(id)a3;
- (function<void)didChangeActiveTileGroup;
- (function<void)experimentConfigurationDidChange;
- (function<void)willChangeActiveTileGroup;
- (id).cxx_construct;
- (void)dealloc;
- (void)experimentConfigurationDidChange:(id)a3;
- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5;
- (void)resourceManifestManagerWillChangeActiveTileGroup:(id)a3;
- (void)setDidChangeActiveTileGroup:(function<void (GEOResourceManifestManager *);
- (void)setExperimentConfigurationDidChange:(function<void (GEOExperimentConfiguration *);
- (void)setWillChangeActiveTileGroup:(function<void (GEOResourceManifestManager *);
@end

@implementation VKManifestTileGroupObserverProxy

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 12) = 0;
  return self;
}

- (void)setWillChangeActiveTileGroup:(function<void (GEOResourceManifestManager *)
{
}

- (void)setExperimentConfigurationDidChange:(function<void (GEOExperimentConfiguration *)
{
}

- (void)setDidChangeActiveTileGroup:(function<void (GEOResourceManifestManager *)
{
}

- (VKManifestTileGroupObserverProxy)initWithQueue:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VKManifestTileGroupObserverProxy;
  v5 = [(VKManifestTileGroupObserverProxy *)&v9 init];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F64918] modernManager];
    [v6 addTileGroupObserver:v5 queue:v4];

    v7 = [MEMORY[0x1E4F64598] sharedConfiguration];
    [v7 addExperimentObserver:v5 queue:v4];
  }
  return v5;
}

- (void).cxx_destruct
{
  p_experimentConfigurationDidChange = &self->_experimentConfigurationDidChange;
  f = (function<void (GEOExperimentConfiguration *)> *)self->_experimentConfigurationDidChange.__f_.__f_;
  if (f == p_experimentConfigurationDidChange)
  {
    (*(void (**)(function<void (GEOExperimentConfiguration *)> *, SEL))(*(void *)p_experimentConfigurationDidChange->__f_.__buf_.__lx
                                                                                 + 32))(p_experimentConfigurationDidChange, a2);
  }
  else if (f)
  {
    (*(void (**)(function<void (GEOExperimentConfiguration *)> *, SEL))(*(void *)f->__f_.__buf_.__lx + 40))(f, a2);
  }
  v5 = (VKManifestTileGroupObserverProxy *)self->_didChangeActiveTileGroup.__f_.__f_;
  if (v5 == (VKManifestTileGroupObserverProxy *)&self->_didChangeActiveTileGroup)
  {
    (*(void (**)(function<void (GEOResourceManifestManager *, GEOActiveTileGroup *, GEOActiveTileGroup *)> *, SEL))(*(void *)self->_didChangeActiveTileGroup.__f_.__buf_.__lx + 32))(&self->_didChangeActiveTileGroup, a2);
  }
  else if (v5)
  {
    (*((void (**)(VKManifestTileGroupObserverProxy *, SEL))v5->super.isa + 5))(v5, a2);
  }
  v6 = (VKManifestTileGroupObserverProxy *)self->_willChangeActiveTileGroup.__f_.__f_;
  if (v6 == (VKManifestTileGroupObserverProxy *)&self->_willChangeActiveTileGroup)
  {
    v8 = *(void (**)(function<void (GEOResourceManifestManager *)> *))(*(void *)self->_willChangeActiveTileGroup.__f_.__buf_.__lx
                                                                                + 32);
    v8(&self->_willChangeActiveTileGroup);
  }
  else if (v6)
  {
    v7 = (void (*)(void))*((void *)v6->super.isa + 5);
    v7();
  }
}

- (function<void)experimentConfigurationDidChange
{
  objc_copyCppObjectAtomic(retstr, &self->_experimentConfigurationDidChange, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__6);
  return result;
}

- (function<void)didChangeActiveTileGroup
{
  objc_copyCppObjectAtomic(retstr, &self->_didChangeActiveTileGroup, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property__4);
  return result;
}

- (function<void)willChangeActiveTileGroup
{
  objc_copyCppObjectAtomic(retstr, &self->_willChangeActiveTileGroup, (void (__cdecl *)(void *, const void *))__copy_helper_atomic_property_);
  return result;
}

- (void)experimentConfigurationDidChange:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_experimentConfigurationDidChange.__f_.__f_) {
    goto LABEL_8;
  }
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  v5 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v7 = 134217984;
    *(void *)&v7[4] = self;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[observer:%p] Received ExperimentalConfigurationDidChange Notification", v7, 0xCu);
  }

  *(void *)v7 = v4;
  f = self->_experimentConfigurationDidChange.__f_.__f_;
  if (f)
  {
    (*(void (**)(void *, unsigned char *))(*(void *)f + 48))(f, v7);

LABEL_8:
    return;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_didChangeActiveTileGroup.__f_.__f_) {
    goto LABEL_8;
  }
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  v11 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = self;
    _os_log_impl(&dword_1A1780000, v11, OS_LOG_TYPE_INFO, "[observer:%p] Received DidChangeActiveTileGroup Notification", buf, 0xCu);
  }

  *(void *)buf = v8;
  id v14 = v9;
  id v13 = v10;
  f = self->_didChangeActiveTileGroup.__f_.__f_;
  if (f)
  {
    (*(void (**)(void *, unsigned char *, id *, id *))(*(void *)f + 48))(f, buf, &v14, &v13);

LABEL_8:
    return;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (void)resourceManifestManagerWillChangeActiveTileGroup:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_willChangeActiveTileGroup.__f_.__f_) {
    goto LABEL_8;
  }
  if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
  }
  v5 = (id)GEOGetVectorKitVKDefaultLog_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v7 = 134217984;
    *(void *)&v7[4] = self;
    _os_log_impl(&dword_1A1780000, v5, OS_LOG_TYPE_INFO, "[observer:%p] Received WillChangeActiveTileGroup Notification", v7, 0xCu);
  }

  *(void *)v7 = v4;
  f = self->_willChangeActiveTileGroup.__f_.__f_;
  if (f)
  {
    (*(void (**)(void *, unsigned char *))(*(void *)f + 48))(f, v7);

LABEL_8:
    return;
  }
  std::__throw_bad_function_call[abi:nn180100]();
  __break(1u);
}

- (void)dealloc
{
  p_willChangeActiveTileGroup = &self->_willChangeActiveTileGroup;
  f = (function<void (GEOResourceManifestManager *)> *)self->_willChangeActiveTileGroup.__f_.__f_;
  self->_willChangeActiveTileGroup.__f_.__f_ = 0;
  if (f == p_willChangeActiveTileGroup)
  {
    (*(void (**)(function<void (GEOResourceManifestManager *)> *, SEL))(*(void *)p_willChangeActiveTileGroup->__f_.__buf_.__lx
                                                                                 + 32))(p_willChangeActiveTileGroup, a2);
  }
  else if (f)
  {
    (*(void (**)(function<void (GEOResourceManifestManager *)> *, SEL))(*(void *)f->__f_.__buf_.__lx + 40))(f, a2);
  }
  v5 = (VKManifestTileGroupObserverProxy *)self->_didChangeActiveTileGroup.__f_.__f_;
  self->_didChangeActiveTileGroup.__f_.__f_ = 0;
  if (v5 == (VKManifestTileGroupObserverProxy *)&self->_didChangeActiveTileGroup)
  {
    (*(void (**)(function<void (GEOResourceManifestManager *, GEOActiveTileGroup *, GEOActiveTileGroup *)> *, SEL))(*(void *)self->_didChangeActiveTileGroup.__f_.__buf_.__lx + 32))(&self->_didChangeActiveTileGroup, a2);
  }
  else if (v5)
  {
    (*((void (**)(VKManifestTileGroupObserverProxy *, SEL))v5->super.isa + 5))(v5, a2);
  }
  v6 = (VKManifestTileGroupObserverProxy *)self->_experimentConfigurationDidChange.__f_.__f_;
  self->_experimentConfigurationDidChange.__f_.__f_ = 0;
  if (v6 == (VKManifestTileGroupObserverProxy *)&self->_experimentConfigurationDidChange)
  {
    (*(void (**)(function<void (GEOExperimentConfiguration *)> *, SEL))(*(void *)self->_experimentConfigurationDidChange.__f_.__buf_.__lx
                                                                                 + 32))(&self->_experimentConfigurationDidChange, a2);
  }
  else if (v6)
  {
    (*((void (**)(VKManifestTileGroupObserverProxy *, SEL))v6->super.isa + 5))(v6, a2);
  }
  v7 = [MEMORY[0x1E4F64918] modernManager];
  [v7 removeTileGroupObserver:self];

  v8.receiver = self;
  v8.super_class = (Class)VKManifestTileGroupObserverProxy;
  [(VKManifestTileGroupObserverProxy *)&v8 dealloc];
}

@end