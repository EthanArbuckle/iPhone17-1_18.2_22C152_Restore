@interface MusicKit_SoftLinking_MPModelLibraryKeepLocalChangeRequest
- (MPModelLibraryKeepLocalChangeRequest)_underlyingLibraryKeepLocalChangeRequest;
- (MusicKit_SoftLinking_MPModelLibraryKeepLocalChangeRequest)init;
- (MusicKit_SoftLinking_MPModelObject)modelObject;
- (NSArray)relatedModelObjects;
- (int64_t)enableState;
- (unint64_t)constraints;
- (void)setConstraints:(unint64_t)a3;
- (void)setEnableState:(int64_t)a3;
- (void)setModelObject:(id)a3;
- (void)setRelatedModelObjects:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryKeepLocalChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryKeepLocalChangeRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryKeepLocalChangeRequest;
  v2 = [(MusicKit_SoftLinking_MPModelLibraryKeepLocalChangeRequest *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getMPModelLibraryKeepLocalChangeRequestClass_softClass;
    uint64_t v13 = getMPModelLibraryKeepLocalChangeRequestClass_softClass;
    if (!getMPModelLibraryKeepLocalChangeRequestClass_softClass)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getMPModelLibraryKeepLocalChangeRequestClass_block_invoke;
      v9[3] = &unk_1E6D453B0;
      v9[4] = &v10;
      __getMPModelLibraryKeepLocalChangeRequestClass_block_invoke((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (MPModelLibraryKeepLocalChangeRequest *)objc_alloc_init(v4);
    underlyingLibraryKeepLocalChangeRequest = v2->_underlyingLibraryKeepLocalChangeRequest;
    v2->_underlyingLibraryKeepLocalChangeRequest = v5;
  }
  return v2;
}

- (MPModelLibraryKeepLocalChangeRequest)_underlyingLibraryKeepLocalChangeRequest
{
  return self->_underlyingLibraryKeepLocalChangeRequest;
}

- (void)setModelObject:(id)a3
{
  objc_storeStrong((id *)&self->_modelObject, a3);
  id v5 = a3;
  underlyingLibraryKeepLocalChangeRequest = self->_underlyingLibraryKeepLocalChangeRequest;
  id v7 = [v5 _underlyingModelObject];
  [(MPModelLibraryKeepLocalChangeRequest *)underlyingLibraryKeepLocalChangeRequest setModelObject:v7];
}

- (void)setEnableState:(int64_t)a3
{
  self->_enableState = a3;
  if ((unint64_t)a3 >= 5) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = a3 - 1;
  }
  [(MPModelLibraryKeepLocalChangeRequest *)self->_underlyingLibraryKeepLocalChangeRequest setEnableState:v3];
}

- (void)setConstraints:(unint64_t)a3
{
}

- (MusicKit_SoftLinking_MPModelObject)modelObject
{
  return self->_modelObject;
}

- (int64_t)enableState
{
  return self->_enableState;
}

- (NSArray)relatedModelObjects
{
  return self->_relatedModelObjects;
}

- (void)setRelatedModelObjects:(id)a3
{
}

- (unint64_t)constraints
{
  return self->_constraints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedModelObjects, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
  objc_storeStrong((id *)&self->_underlyingLibraryKeepLocalChangeRequest, 0);
}

@end