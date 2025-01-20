@interface MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver
- (MusicKit_SoftLinking_MPLibraryActiveKeepLocalStatus)_activeKeepLocalStatusFromUnderlyingStatus:(SEL)a3 underlyingDownloadPauseReasons:(MPLibraryActiveKeepLocalStatus)a4;
- (MusicKit_SoftLinking_MPLibraryActiveKeepLocalStatus)currentStatus;
- (MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver)initWithIdentifyingModelObject:(id)a3;
- (MusicKit_SoftLinking_MPModelObject)identifyingModelObject;
- (id)statusBlock;
- (void)_handleUpdatedUnderlyingActiveKeepLocalStatus:(MPLibraryActiveKeepLocalStatus)a3;
- (void)calculateDownloadProgressWithIdentifyingModelObject:(id)a3 children:(id)a4;
- (void)setIdentifyingModelObject:(id)a3;
- (void)setStatusBlock:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver

- (MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver)initWithIdentifyingModelObject:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver;
  v5 = [(MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver *)&v24 init];
  if (v5)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__1;
    v22 = __Block_byref_object_dispose__1;
    id v23 = 0;
    id MPModelObjectClass = getMPModelObjectClass();
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __88__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_initWithIdentifyingModelObject___block_invoke;
    v15[3] = &unk_1E6D45510;
    v17 = &v18;
    id v16 = v4;
    [MPModelObjectClass performWithoutEnforcement:v15];
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2050000000;
    v7 = (void *)getMPLibraryKeepLocalStatusObserverClass_softClass;
    uint64_t v29 = getMPLibraryKeepLocalStatusObserverClass_softClass;
    if (!getMPLibraryKeepLocalStatusObserverClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getMPLibraryKeepLocalStatusObserverClass_block_invoke;
      location[3] = &unk_1E6D453B0;
      location[4] = &v26;
      __getMPLibraryKeepLocalStatusObserverClass_block_invoke((uint64_t)location);
      v7 = (void *)v27[3];
    }
    v8 = v7;
    _Block_object_dispose(&v26, 8);
    v9 = (MPLibraryKeepLocalStatusObserver *)objc_alloc_init(v8);
    underlyingLibraryKeepLocalStatusObserver = v5->_underlyingLibraryKeepLocalStatusObserver;
    v5->_underlyingLibraryKeepLocalStatusObserver = v9;

    [(MPLibraryKeepLocalStatusObserver *)v5->_underlyingLibraryKeepLocalStatusObserver setConfiguration:v19[5]];
    objc_initWeak(location, v5);
    v11 = v5->_underlyingLibraryKeepLocalStatusObserver;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __88__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_initWithIdentifyingModelObject___block_invoke_2;
    v13[3] = &unk_1E6D45948;
    objc_copyWeak(&v14, location);
    [(MPLibraryKeepLocalStatusObserver *)v11 setStatusBlock:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);

    _Block_object_dispose(&v18, 8);
  }

  return v5;
}

- (MusicKit_SoftLinking_MPModelObject)identifyingModelObject
{
  id v3 = objc_alloc(MEMORY[0x1E4F38620]);
  id v4 = [(MPLibraryKeepLocalStatusObserver *)self->_underlyingLibraryKeepLocalStatusObserver configuration];
  v5 = [v4 identifyingModelObject];
  v6 = (void *)[v3 initWithUnderlyingModelObject:v5];

  return (MusicKit_SoftLinking_MPModelObject *)v6;
}

- (void)setIdentifyingModelObject:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  id v18 = 0;
  id MPModelObjectClass = getMPModelObjectClass();
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  v9 = __83__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_setIdentifyingModelObject___block_invoke;
  v10 = &unk_1E6D45510;
  v12 = &v13;
  id v6 = v4;
  id v11 = v6;
  [MPModelObjectClass performWithoutEnforcement:&v7];
  -[MPLibraryKeepLocalStatusObserver setConfiguration:](self->_underlyingLibraryKeepLocalStatusObserver, "setConfiguration:", v14[5], v7, v8, v9, v10);

  _Block_object_dispose(&v13, 8);
}

- (MusicKit_SoftLinking_MPLibraryActiveKeepLocalStatus)currentStatus
{
  uint64_t v4 = [(MPLibraryKeepLocalStatusObserver *)self->_underlyingLibraryKeepLocalStatusObserver currentStatus];
  uint64_t v6 = v5;
  uint64_t v7 = [(MPLibraryKeepLocalStatusObserver *)self->_underlyingLibraryKeepLocalStatusObserver downloadPausedReason];
  return -[MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver _activeKeepLocalStatusFromUnderlyingStatus:underlyingDownloadPauseReasons:](self, "_activeKeepLocalStatusFromUnderlyingStatus:underlyingDownloadPauseReasons:", v4, v6, v7);
}

- (void)calculateDownloadProgressWithIdentifyingModelObject:(id)a3 children:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id MPModelObjectClass = getMPModelObjectClass();
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __118__MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver_calculateDownloadProgressWithIdentifyingModelObject_children___block_invoke;
  v11[3] = &unk_1E6D459C0;
  id v12 = v6;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v6;
  [MPModelObjectClass performWithoutEnforcement:v11];
}

- (MusicKit_SoftLinking_MPLibraryActiveKeepLocalStatus)_activeKeepLocalStatusFromUnderlyingStatus:(SEL)a3 underlyingDownloadPauseReasons:(MPLibraryActiveKeepLocalStatus)a4
{
  if ((unint64_t)(a4.var0 - 1) >= 6) {
    int64_t var0 = 0;
  }
  else {
    int64_t var0 = a4.var0;
  }
  retstr->int64_t var0 = var0;
  retstr->var1 = a5 & 7;
  retstr->var2 = a4.var1;
  return self;
}

- (void)_handleUpdatedUnderlyingActiveKeepLocalStatus:(MPLibraryActiveKeepLocalStatus)a3
{
  double var1 = a3.var1;
  int64_t var0 = a3.var0;
  uint64_t v6 = [(MPLibraryKeepLocalStatusObserver *)self->_underlyingLibraryKeepLocalStatusObserver downloadPausedReason];
  long long v11 = 0uLL;
  uint64_t v12 = 0;
  -[MusicKit_SoftLinking_MPLibraryKeepLocalStatusObserver _activeKeepLocalStatusFromUnderlyingStatus:underlyingDownloadPauseReasons:](self, "_activeKeepLocalStatusFromUnderlyingStatus:underlyingDownloadPauseReasons:", var0, *(void *)&var1, v6);
  statusBlock = self->_statusBlock;
  if (statusBlock)
  {
    uint64_t v8 = (void (*)(void *, long long *))statusBlock[2];
    long long v9 = v11;
    uint64_t v10 = v12;
    v8(statusBlock, &v9);
  }
}

- (id)statusBlock
{
  return self->_statusBlock;
}

- (void)setStatusBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_statusBlock, 0);
  objc_storeStrong((id *)&self->_underlyingLibraryKeepLocalStatusObserver, 0);
}

@end