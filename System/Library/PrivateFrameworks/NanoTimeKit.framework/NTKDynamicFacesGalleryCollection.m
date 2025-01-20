@interface NTKDynamicFacesGalleryCollection
- (BOOL)bundleWantsDynamicCollection;
- (NTKDynamicFacesGalleryCollection)initWithDevice:(id)a3 title:(id)a4 bundleIdentifier:(id)a5;
- (id)facesForDevice:(id)a3;
- (id)title;
@end

@implementation NTKDynamicFacesGalleryCollection

- (NTKDynamicFacesGalleryCollection)initWithDevice:(id)a3 title:(id)a4 bundleIdentifier:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NTKDynamicFacesGalleryCollection;
  v11 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)&v14 initWithDevice:a3];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a4);
    objc_storeStrong((id *)&v12->_bundleIdentifier, a5);
    [(NTKGalleryCollection *)v12 setCalloutName:&__block_literal_global_66];
  }

  return v12;
}

uint64_t __74__NTKDynamicFacesGalleryCollection_initWithDevice_title_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _dynamicCollectionFaceGalleryCalloutName];
}

- (id)title
{
  return self->_title;
}

- (BOOL)bundleWantsDynamicCollection
{
  v3 = +[NTKFaceBundleManager sharedManager];
  bundleIdentifier = self->_bundleIdentifier;
  v5 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)self device];
  v6 = [v3 faceBundleForBundleIdentifier:bundleIdentifier onDevice:v5];

  if (v6)
  {
    v7 = [(NTKDeviceSpecificFacesArrayGalleryCollection *)self device];
    char v8 = [v6 useDynamicCollectionForDevice:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)facesForDevice:(id)a3
{
  id v4 = a3;
  if ([(NTKDynamicFacesGalleryCollection *)self bundleWantsDynamicCollection])
  {
    v5 = +[NTKFaceBundleManager sharedManager];
    v6 = [v5 faceBundleForBundleIdentifier:self->_bundleIdentifier onDevice:v4];

    if (v6)
    {
      v7 = [v6 galleryFacesInDynamicCollectionForDevice:v4];
      char v8 = (void *)[v7 copy];
    }
    else
    {
      char v8 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    char v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end