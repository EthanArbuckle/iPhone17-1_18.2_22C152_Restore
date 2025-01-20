@interface MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest
+ (int64_t)_underlyingFavoriteEntityChangeRequestActionFrom:(int64_t)a3;
- (MPModelLibraryFavoriteEntityChangeRequest)_underlyingFavoriteEntityChangeRequest;
- (MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest)initWithModelObject:(id)a3 requestActionType:(int64_t)a4;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest)initWithModelObject:(id)a3 requestActionType:(int64_t)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest;
  v7 = [(MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest *)&v19 init];
  if (v7)
  {
    int64_t v8 = +[MusicKit_SoftLinking_MPModelLibraryFavoriteEntityChangeRequest _underlyingFavoriteEntityChangeRequestActionFrom:a4];
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    v9 = (void *)getMPModelLibraryFavoriteEntityRequestActionClass_softClass;
    uint64_t v28 = getMPModelLibraryFavoriteEntityRequestActionClass_softClass;
    if (!getMPModelLibraryFavoriteEntityRequestActionClass_softClass)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __getMPModelLibraryFavoriteEntityRequestActionClass_block_invoke;
      v23 = &unk_1E6D453B0;
      v24 = &v25;
      __getMPModelLibraryFavoriteEntityRequestActionClass_block_invoke((uint64_t)&v20);
      v9 = (void *)v26[3];
    }
    v10 = v9;
    _Block_object_dispose(&v25, 8);
    v11 = (void *)[[v10 alloc] initWithChangeAction:v8];
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x2050000000;
    v12 = (void *)getMPModelLibraryFavoriteEntityChangeRequestClass_softClass;
    uint64_t v28 = getMPModelLibraryFavoriteEntityChangeRequestClass_softClass;
    if (!getMPModelLibraryFavoriteEntityChangeRequestClass_softClass)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      v22 = __getMPModelLibraryFavoriteEntityChangeRequestClass_block_invoke;
      v23 = &unk_1E6D453B0;
      v24 = &v25;
      __getMPModelLibraryFavoriteEntityChangeRequestClass_block_invoke((uint64_t)&v20);
      v12 = (void *)v26[3];
    }
    v13 = v12;
    _Block_object_dispose(&v25, 8);
    v14 = (MPModelLibraryFavoriteEntityChangeRequest *)objc_alloc_init(v13);
    underlyingFavoriteEntityChangeRequest = v7->_underlyingFavoriteEntityChangeRequest;
    v7->_underlyingFavoriteEntityChangeRequest = v14;

    v16 = v7->_underlyingFavoriteEntityChangeRequest;
    v17 = [v6 _underlyingModelObject];
    [(MPModelLibraryFavoriteEntityChangeRequest *)v16 setModelObject:v17];

    [(MPModelLibraryFavoriteEntityChangeRequest *)v7->_underlyingFavoriteEntityChangeRequest setRequestAction:v11];
  }

  return v7;
}

- (MPModelLibraryFavoriteEntityChangeRequest)_underlyingFavoriteEntityChangeRequest
{
  return self->_underlyingFavoriteEntityChangeRequest;
}

+ (int64_t)_underlyingFavoriteEntityChangeRequestActionFrom:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3) {
    return 0;
  }
  else {
    return a3;
  }
}

- (void).cxx_destruct
{
}

@end