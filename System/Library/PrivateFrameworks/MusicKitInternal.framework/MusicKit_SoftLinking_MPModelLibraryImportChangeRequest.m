@interface MusicKit_SoftLinking_MPModelLibraryImportChangeRequest
- (BOOL)shouldLibraryAdd;
- (MPModelLibraryImportChangeRequest)_underlyingLibraryImportChangeRequest;
- (MusicKit_SoftLinking_MPModelLibraryImportChangeRequest)init;
- (MusicKit_SoftLinking_MPModelObject)referralObject;
- (NSArray)modelObjects;
- (NSArray)relatedModelObjects;
- (void)setModelObjects:(id)a3;
- (void)setReferralObject:(id)a3;
- (void)setRelatedModelObjects:(id)a3;
- (void)setShouldLibraryAdd:(BOOL)a3;
@end

@implementation MusicKit_SoftLinking_MPModelLibraryImportChangeRequest

- (MusicKit_SoftLinking_MPModelLibraryImportChangeRequest)init
{
  v8.receiver = self;
  v8.super_class = (Class)MusicKit_SoftLinking_MPModelLibraryImportChangeRequest;
  v2 = [(MusicKit_SoftLinking_MPModelLibraryImportChangeRequest *)&v8 init];
  if (v2)
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2050000000;
    v3 = (void *)getMPModelLibraryImportChangeRequestClass_softClass_0;
    uint64_t v13 = getMPModelLibraryImportChangeRequestClass_softClass_0;
    if (!getMPModelLibraryImportChangeRequestClass_softClass_0)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __getMPModelLibraryImportChangeRequestClass_block_invoke_0;
      v9[3] = &unk_1E6D453B0;
      v9[4] = &v10;
      __getMPModelLibraryImportChangeRequestClass_block_invoke_0((uint64_t)v9);
      v3 = (void *)v11[3];
    }
    v4 = v3;
    _Block_object_dispose(&v10, 8);
    v5 = (MPModelLibraryImportChangeRequest *)objc_alloc_init(v4);
    underlyingLibraryImportChangeRequest = v2->_underlyingLibraryImportChangeRequest;
    v2->_underlyingLibraryImportChangeRequest = v5;
  }
  return v2;
}

- (MPModelLibraryImportChangeRequest)_underlyingLibraryImportChangeRequest
{
  return self->_underlyingLibraryImportChangeRequest;
}

- (void)setModelObjects:(id)a3
{
  id v4 = a3;
  v5 = (NSArray *)[v4 copy];
  modelObjects = self->_modelObjects;
  self->_modelObjects = v5;

  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2050000000;
  v7 = (void *)getMPMutableSectionedCollectionClass_softClass_3;
  uint64_t v15 = getMPMutableSectionedCollectionClass_softClass_3;
  if (!getMPMutableSectionedCollectionClass_softClass_3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __getMPMutableSectionedCollectionClass_block_invoke_3;
    v11[3] = &unk_1E6D453B0;
    v11[4] = &v12;
    __getMPMutableSectionedCollectionClass_block_invoke_3((uint64_t)v11);
    v7 = (void *)v13[3];
  }
  objc_super v8 = v7;
  _Block_object_dispose(&v12, 8);
  id v9 = objc_alloc_init(v8);
  [v9 appendSection:&stru_1F3B7D290];
  uint64_t v10 = objc_msgSend(v4, "msv_map:", &__block_literal_global_11);
  [v9 appendItems:v10];

  [(MPModelLibraryImportChangeRequest *)self->_underlyingLibraryImportChangeRequest setModelObjects:v9];
}

- (void)setReferralObject:(id)a3
{
  objc_storeStrong((id *)&self->_referralObject, a3);
  id v5 = a3;
  underlyingLibraryImportChangeRequest = self->_underlyingLibraryImportChangeRequest;
  id v7 = [(MusicKit_SoftLinking_MPModelObject *)self->_referralObject _underlyingModelObject];
  [(MPModelLibraryImportChangeRequest *)underlyingLibraryImportChangeRequest setReferralObject:v7];
}

- (void)setShouldLibraryAdd:(BOOL)a3
{
  self->_shouldLibraryAdd = a3;
  -[MPModelLibraryImportChangeRequest setShouldLibraryAdd:](self->_underlyingLibraryImportChangeRequest, "setShouldLibraryAdd:");
}

- (void)setRelatedModelObjects:(id)a3
{
}

- (NSArray)modelObjects
{
  return self->_modelObjects;
}

- (MusicKit_SoftLinking_MPModelObject)referralObject
{
  return self->_referralObject;
}

- (NSArray)relatedModelObjects
{
  return self->_relatedModelObjects;
}

- (BOOL)shouldLibraryAdd
{
  return self->_shouldLibraryAdd;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relatedModelObjects, 0);
  objc_storeStrong((id *)&self->_referralObject, 0);
  objc_storeStrong((id *)&self->_modelObjects, 0);
  objc_storeStrong((id *)&self->_underlyingLibraryImportChangeRequest, 0);
}

@end