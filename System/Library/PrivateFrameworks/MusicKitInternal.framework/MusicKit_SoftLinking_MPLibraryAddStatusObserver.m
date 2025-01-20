@interface MusicKit_SoftLinking_MPLibraryAddStatusObserver
- (MusicKit_SoftLinking_MPLibraryAddStatusObserver)initWithIdentifyingModelObject:(id)a3;
- (MusicKit_SoftLinking_MPModelObject)identifyingModelObject;
- (id)statusBlock;
- (int64_t)_libraryAddStatusFromUnderlyingStatus:(int64_t)a3;
- (int64_t)currentStatus;
- (void)_handleUpdatedUnderlyingLibraryAddStatus:(int64_t)a3;
- (void)setIdentifyingModelObject:(id)a3;
- (void)setStatusBlock:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPLibraryAddStatusObserver

- (MusicKit_SoftLinking_MPLibraryAddStatusObserver)initWithIdentifyingModelObject:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MusicKit_SoftLinking_MPLibraryAddStatusObserver;
  v5 = [(MusicKit_SoftLinking_MPLibraryAddStatusObserver *)&v28 init];
  if (v5)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2810000000;
    v25 = &unk_1E0A75CFB;
    int v26 = 0;
    char v27 = 0;
    id MPModelObjectClass_0 = getMPModelObjectClass_0();
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __82__MusicKit_SoftLinking_MPLibraryAddStatusObserver_initWithIdentifyingModelObject___block_invoke;
    v19[3] = &unk_1E6D45510;
    v21 = &v22;
    id v7 = v4;
    id v20 = v7;
    [MPModelObjectClass_0 performWithoutEnforcement:v19];
    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x2050000000;
    v8 = (void *)getMPLibraryAddStatusObserverClass_softClass;
    uint64_t v33 = getMPLibraryAddStatusObserverClass_softClass;
    if (!getMPLibraryAddStatusObserverClass_softClass)
    {
      location[0] = (id)MEMORY[0x1E4F143A8];
      location[1] = (id)3221225472;
      location[2] = __getMPLibraryAddStatusObserverClass_block_invoke;
      location[3] = &unk_1E6D453B0;
      location[4] = &v30;
      __getMPLibraryAddStatusObserverClass_block_invoke((uint64_t)location);
      v8 = (void *)v31[3];
    }
    v9 = v8;
    _Block_object_dispose(&v30, 8);
    v10 = (MPLibraryAddStatusObserver *)objc_alloc_init(v9);
    underlyingLibraryAddStatusObserver = v5->_underlyingLibraryAddStatusObserver;
    v5->_underlyingLibraryAddStatusObserver = v10;

    v12 = v5->_underlyingLibraryAddStatusObserver;
    v13 = v23;
    v14 = [v7 _underlyingModelObject];
    [(MPLibraryAddStatusObserver *)v12 setConfiguration:*((unsigned int *)v13 + 8) | ((unint64_t)*((unsigned __int8 *)v13 + 36) << 32) identifyingModelObject:v14];

    objc_initWeak(location, v5);
    v15 = v5->_underlyingLibraryAddStatusObserver;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __82__MusicKit_SoftLinking_MPLibraryAddStatusObserver_initWithIdentifyingModelObject___block_invoke_2;
    v17[3] = &unk_1E6D45D48;
    objc_copyWeak(&v18, location);
    [(MPLibraryAddStatusObserver *)v15 setStatusBlock:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak(location);

    _Block_object_dispose(&v22, 8);
  }

  return v5;
}

- (MusicKit_SoftLinking_MPModelObject)identifyingModelObject
{
  id v3 = objc_alloc(MEMORY[0x1E4F38620]);
  id v4 = [(MPLibraryAddStatusObserver *)self->_underlyingLibraryAddStatusObserver identifyingModelObject];
  v5 = (void *)[v3 initWithUnderlyingModelObject:v4];

  return (MusicKit_SoftLinking_MPModelObject *)v5;
}

- (void)setIdentifyingModelObject:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2810000000;
  v16 = &unk_1E0A75CFB;
  int v17 = 0;
  char v18 = 0;
  id MPModelObjectClass_0 = getMPModelObjectClass_0();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __77__MusicKit_SoftLinking_MPLibraryAddStatusObserver_setIdentifyingModelObject___block_invoke;
  v10[3] = &unk_1E6D45510;
  v12 = &v13;
  id v6 = v4;
  id v11 = v6;
  [MPModelObjectClass_0 performWithoutEnforcement:v10];
  underlyingLibraryAddStatusObserver = self->_underlyingLibraryAddStatusObserver;
  v8 = v14;
  v9 = [v6 _underlyingModelObject];
  [(MPLibraryAddStatusObserver *)underlyingLibraryAddStatusObserver setConfiguration:*((unsigned int *)v8 + 8) | ((unint64_t)*((unsigned __int8 *)v8 + 36) << 32) identifyingModelObject:v9];

  _Block_object_dispose(&v13, 8);
}

- (int64_t)currentStatus
{
  uint64_t v3 = [(MPLibraryAddStatusObserver *)self->_underlyingLibraryAddStatusObserver currentStatus];
  return [(MusicKit_SoftLinking_MPLibraryAddStatusObserver *)self _libraryAddStatusFromUnderlyingStatus:v3];
}

- (void)_handleUpdatedUnderlyingLibraryAddStatus:(int64_t)a3
{
  [(MusicKit_SoftLinking_MPLibraryAddStatusObserver *)self _libraryAddStatusFromUnderlyingStatus:a3];
  id statusBlock = self->_statusBlock;
  if (statusBlock)
  {
    v5 = (void (*)(void))*((void *)statusBlock + 2);
    v5();
  }
}

- (int64_t)_libraryAddStatusFromUnderlyingStatus:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0xA) {
    return 0;
  }
  else {
    return a3;
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
  objc_storeStrong((id *)&self->_underlyingLibraryAddStatusObserver, 0);
}

@end