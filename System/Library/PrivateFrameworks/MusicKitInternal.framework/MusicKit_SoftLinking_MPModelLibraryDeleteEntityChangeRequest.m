@interface MusicKit_SoftLinking_MPModelLibraryDeleteEntityChangeRequest
- (MPModelLibraryDeleteEntityChangeRequest)_underlyingLibraryDeleteEntityChangeRequest;
- (MusicKit_SoftLinking_MPModelLibraryDeleteEntityChangeRequest)init;
- (MusicKit_SoftLinking_MPModelObject)modelObject;
- (NSArray)relatedModelObjects;
- (void)setModelObject:(id)a3;
- (void)setRelatedModelObjects:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryDeleteEntityChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryDeleteEntityChangeRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryDeleteEntityChangeRequest;
  v2 = [(MusicKit_SoftLinking_MPModelLibraryDeleteEntityChangeRequest *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getMPModelLibraryDeleteEntityChangeRequestClass_softClass;
    uint64_t v13 = getMPModelLibraryDeleteEntityChangeRequestClass_softClass;
    if (!getMPModelLibraryDeleteEntityChangeRequestClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getMPModelLibraryDeleteEntityChangeRequestClass_block_invoke;
      v9[3] = &unk_1E6D453B0;
      v9[4] = &v10;
      __getMPModelLibraryDeleteEntityChangeRequestClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (MPModelLibraryDeleteEntityChangeRequest *)objc_alloc_init(v4);
    underlyingLibraryDeleteEntityChangeRequest = v2->_underlyingLibraryDeleteEntityChangeRequest;
    v2->_underlyingLibraryDeleteEntityChangeRequest = v5;
  }
  return v2;
}

- (MPModelLibraryDeleteEntityChangeRequest)_underlyingLibraryDeleteEntityChangeRequest
{
  return self->_underlyingLibraryDeleteEntityChangeRequest;
}

- (void)setModelObject:(id)a3
{
  underlyingLibraryDeleteEntityChangeRequest = self->_underlyingLibraryDeleteEntityChangeRequest;
  id v4 = [a3 _underlyingModelObject];
  [(MPModelLibraryDeleteEntityChangeRequest *)underlyingLibraryDeleteEntityChangeRequest setModelObject:v4];
}

- (MusicKit_SoftLinking_MPModelObject)modelObject
{
  return self->_modelObject;
}

- (NSArray)relatedModelObjects
{
  return self->_relatedModelObjects;
}

- (void)setRelatedModelObjects:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedModelObjects, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
  objc_storeStrong((id *)&self->_underlyingLibraryDeleteEntityChangeRequest, 0);
}

@end