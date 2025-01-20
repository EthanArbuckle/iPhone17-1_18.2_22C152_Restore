@interface NTKFacesGalleryCollection
- (NTKFacesGalleryCollection)initWithDevice:(id)a3 title:(id)a4 faceDescriptors:(id)a5;
- (id)facesForDevice:(id)a3;
- (id)title;
@end

@implementation NTKFacesGalleryCollection

- (NTKFacesGalleryCollection)initWithDevice:(id)a3 title:(id)a4 faceDescriptors:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NTKFacesGalleryCollection;
  v11 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)&v16 initWithDevice:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a4);
    uint64_t v13 = [v10 copy];
    faceDescriptors = v12->_faceDescriptors;
    v12->_faceDescriptors = (NSArray *)v13;

    [(NTKGalleryCollection *)v12 setCalloutName:&__block_literal_global_69];
  }

  return v12;
}

uint64_t __66__NTKFacesGalleryCollection_initWithDevice_title_faceDescriptors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _faceGalleryCalloutName];
}

- (id)title
{
  return self->_title;
}

- (id)facesForDevice:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_faceDescriptors;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = +[NTKFace defaultFaceFromFaceDescriptor:forDevice:](NTKFace, "defaultFaceFromFaceDescriptor:forDevice:", *(void *)(*((void *)&v14 + 1) + 8 * i), v4, (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_faceDescriptors, 0);
}

@end