@interface NTKFaceCollectionGalleryCollection
- (NTKFaceCollectionGalleryCollection)initWithTitle:(id)a3 faceCollection:(id)a4;
- (id)collectionIdentifier;
- (id)faceAtIndex:(unint64_t)a3;
- (unint64_t)indexOfFace:(id)a3;
- (unint64_t)numberOfFaces;
- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5;
- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5;
- (void)faceCollectionDidLoad:(id)a3;
- (void)faceCollectionDidReorderFaces:(id)a3;
@end

@implementation NTKFaceCollectionGalleryCollection

- (NTKFaceCollectionGalleryCollection)initWithTitle:(id)a3 faceCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)NTKFaceCollectionGalleryCollection;
  v8 = [(NTKFaceCollectionGalleryCollection *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(NTKGalleryCollection *)v8 setTitle:v6];
    objc_storeStrong((id *)&v9->_faceCollection, a4);
  }

  return v9;
}

- (id)collectionIdentifier
{
  return [(NTKFaceCollection *)self->_faceCollection collectionIdentifier];
}

- (unint64_t)numberOfFaces
{
  return [(NTKFaceCollection *)self->_faceCollection numberOfFaces];
}

- (id)faceAtIndex:(unint64_t)a3
{
  return [(NTKFaceCollection *)self->_faceCollection faceAtIndex:a3];
}

- (unint64_t)indexOfFace:(id)a3
{
  return [(NTKFaceCollection *)self->_faceCollection indexOfFace:a3];
}

- (void)faceCollectionDidLoad:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F19A30];
  v5 = [(NTKFaceCollection *)self->_faceCollection deviceUUID];
  id v6 = [v4 deviceForNRDeviceUUID:v5];

  id v7 = [v6 nrDevice];
  faceCollection = self->_faceCollection;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __60__NTKFaceCollectionGalleryCollection_faceCollectionDidLoad___block_invoke;
  v15 = &unk_1E62C6290;
  id v16 = v6;
  id v17 = v7;
  id v9 = v7;
  id v10 = v6;
  [(NTKFaceCollection *)faceCollection enumerateFacesUsingBlock:&v12];
  objc_super v11 = [(NTKGalleryCollection *)self delegate];
  [v11 galleryCollectionDidChange:self shouldUpdateSnaphots:1];
}

void __60__NTKFaceCollectionGalleryCollection_faceCollectionDidLoad___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (([v3 hasValidConfigurationForDevice:*(void *)(a1 + 32)] & 1) == 0)
  {
    uint64_t v4 = [*(id *)(a1 + 40) valueForProperty:*MEMORY[0x1E4F79E60]];
    v5 = (void *)v4;
    if (v4) {
      id v6 = (__CFString *)v4;
    }
    else {
      id v6 = @"unknown";
    }
    id v7 = v6;

    uint64_t v8 = [*(id *)(a1 + 40) valueForProperty:*MEMORY[0x1E4F79E40]];
    id v9 = (void *)v8;
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    else {
      id v10 = @"unknown";
    }
    objc_super v11 = v10;

    uint64_t v12 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      uint64_t v13 = [v3 description];
      uint64_t v14 = *(void *)(a1 + 32);
      int v15 = 138413058;
      id v16 = v13;
      __int16 v17 = 2112;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2112;
      v22 = v11;
      _os_log_fault_impl(&dword_1BC5A9000, v12, OS_LOG_TYPE_FAULT, "Edit Option Version Mismatch Exception: Attempted to add a face (%@) with an edit option that does not exist in device (%@)  %@ (%@).", (uint8_t *)&v15, 0x2Au);
    }
  }
}

- (void)faceCollection:(id)a3 didAddFace:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = [(NTKGalleryCollection *)self delegate];
  [v6 galleryCollectionDidChange:self shouldUpdateSnaphots:1];
}

- (void)faceCollection:(id)a3 didRemoveFace:(id)a4 atIndex:(unint64_t)a5
{
  id v6 = [(NTKGalleryCollection *)self delegate];
  [v6 galleryCollectionDidChange:self shouldUpdateSnaphots:1];
}

- (void)faceCollectionDidReorderFaces:(id)a3
{
  id v4 = [(NTKGalleryCollection *)self delegate];
  [v4 galleryCollectionDidChange:self shouldUpdateSnaphots:1];
}

- (void).cxx_destruct
{
}

@end