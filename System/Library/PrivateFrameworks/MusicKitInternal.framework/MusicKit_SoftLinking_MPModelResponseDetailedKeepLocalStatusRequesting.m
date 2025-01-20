@interface MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting
- (MusicKit_SoftLinking_MPModelObject)modelObject;
- (MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting)initWithModelObject:(id)a3 children:(id)a4;
- (NSArray)children;
- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4;
- (void)setChildren:(id)a3;
- (void)setModelObject:(id)a3;
@end

@implementation MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting

- (MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting)initWithModelObject:(id)a3 children:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting;
  v9 = [(MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modelObject, a3);
    uint64_t v11 = [v8 copy];
    children = v10->_children;
    v10->_children = (NSArray *)v11;
  }
  return v10;
}

- (id)newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:(int64_t)a3 responseHandler:(id)a4
{
  id v6 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  id v7 = (void *)getMPMutableSectionedCollectionClass_softClass_1;
  uint64_t v31 = getMPMutableSectionedCollectionClass_softClass_1;
  if (!getMPMutableSectionedCollectionClass_softClass_1)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getMPMutableSectionedCollectionClass_block_invoke_1;
    v26 = &unk_1E6D453B0;
    v27 = &v28;
    __getMPMutableSectionedCollectionClass_block_invoke_1((uint64_t)&v23);
    id v7 = (void *)v29[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v28, 8);
  id v9 = objc_alloc_init(v8);
  v10 = [(MusicKit_SoftLinking_MPModelObject *)self->_modelObject _underlyingModelObject];
  [v9 appendSection:v10];

  uint64_t v11 = [(NSArray *)self->_children msv_map:&__block_literal_global_3];
  [v9 appendItems:v11];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v12 = (void *)getMPStoreLibraryPersonalizationRequestClass_softClass;
  uint64_t v31 = getMPStoreLibraryPersonalizationRequestClass_softClass;
  if (!getMPStoreLibraryPersonalizationRequestClass_softClass)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getMPStoreLibraryPersonalizationRequestClass_block_invoke;
    v26 = &unk_1E6D453B0;
    v27 = &v28;
    __getMPStoreLibraryPersonalizationRequestClass_block_invoke((uint64_t)&v23);
    v12 = (void *)v29[3];
  }
  v13 = v12;
  _Block_object_dispose(&v28, 8);
  objc_super v14 = (void *)[[v13 alloc] initWithUnpersonalizedContentDescriptors:v9];
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v15 = (void *)getMPStoreLibraryPersonalizationResponseClass_softClass;
  uint64_t v31 = getMPStoreLibraryPersonalizationResponseClass_softClass;
  if (!getMPStoreLibraryPersonalizationResponseClass_softClass)
  {
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    v25 = __getMPStoreLibraryPersonalizationResponseClass_block_invoke;
    v26 = &unk_1E6D453B0;
    v27 = &v28;
    __getMPStoreLibraryPersonalizationResponseClass_block_invoke((uint64_t)&v23);
    v15 = (void *)v29[3];
  }
  v16 = v15;
  _Block_object_dispose(&v28, 8);
  v17 = (void *)[[v16 alloc] initWithRequest:v14];
  [v17 setResults:v9];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __158__MusicKit_SoftLinking_MPModelResponseDetailedKeepLocalStatusRequesting_newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex_responseHandler___block_invoke_2;
  v21[3] = &unk_1E6D45718;
  id v22 = v6;
  id v18 = v6;
  v19 = (void *)[v17 newOperationForDetailedKeepLocalStatusConfigurationForSectionAtIndex:a3 responseHandler:v21];

  return v19;
}

- (MusicKit_SoftLinking_MPModelObject)modelObject
{
  return self->_modelObject;
}

- (void)setModelObject:(id)a3
{
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_modelObject, 0);
}

@end