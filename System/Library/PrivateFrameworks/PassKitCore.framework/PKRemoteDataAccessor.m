@interface PKRemoteDataAccessor
- (NSString)objectUniqueID;
- (PKPassLibrary)library;
- (PKRemoteDataAccessor)init;
- (PKRemoteDataAccessor)initWithLibrary:(id)a3 objectUniqueID:(id)a4;
- (id)archiveData;
- (id)cachedImageSetForType:(int64_t)a3 withDisplayProfile:(id)a4 displayTraits:(id)a5;
- (id)content;
- (id)dataForBundleResource:(id)a3;
- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4;
- (id)dataForBundleResources:(id)a3;
- (id)displayProfileOfType:(int64_t)a3;
- (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7;
- (id)passLocalizedStringForKey:(id)a3;
- (void)contentWithCompletion:(id)a3;
- (void)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7 withCompletion:(id)a8;
- (void)noteShared;
- (void)requestUpdateWithCompletion:(id)a3;
- (void)revocationStatusWithCompletion:(id)a3;
- (void)updateSettings:(unint64_t)a3;
@end

@implementation PKRemoteDataAccessor

- (id)content
{
  if (self->_library)
  {
    v2 = [(PKPassLibrary *)self->_library contentForUniqueID:self->_objectUniqueID];
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7
{
  if (self->_library)
  {
    v7 = -[PKPassLibrary imageSetForUniqueID:ofType:displayProfile:suffix:](self->_library, "imageSetForUniqueID:ofType:displayProfile:suffix:", self->_objectUniqueID, a3, a6, a5, a4);
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectUniqueID, 0);
  objc_storeStrong((id *)&self->_library, 0);
}

- (PKRemoteDataAccessor)initWithLibrary:(id)a3 objectUniqueID:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKRemoteDataAccessor;
  v9 = [(PKRemoteDataAccessor *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_library, a3);
    objc_storeStrong((id *)&v10->_objectUniqueID, a4);
  }

  return v10;
}

- (PKRemoteDataAccessor)init
{
  return 0;
}

- (void)revocationStatusWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)noteShared
{
}

- (void)updateSettings:(unint64_t)a3
{
}

- (void)requestUpdateWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  library = self->_library;
  if (library)
  {
    -[PKPassLibrary requestUpdateOfObjectWithUniqueIdentifier:completion:](library, "requestUpdateOfObjectWithUniqueIdentifier:completion:", self->_objectUniqueID);
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
  MEMORY[0x1F4181870]();
}

- (void)contentWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  library = self->_library;
  if (library)
  {
    -[PKPassLibrary fetchContentForUniqueID:withCompletion:](library, "fetchContentForUniqueID:withCompletion:", self->_objectUniqueID);
  }
  else if (v4)
  {
    v4[2](v4, 0);
  }
  MEMORY[0x1F4181870]();
}

- (id)cachedImageSetForType:(int64_t)a3 withDisplayProfile:(id)a4 displayTraits:(id)a5
{
  if (self->_library)
  {
    v5 = [(PKPassLibrary *)self->_library cachedImageSetForUniqueID:self->_objectUniqueID type:a3 withDisplayProfile:a4 displayTraits:a5];
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (void)imageSetForType:(int64_t)a3 screenScale:(double)a4 suffix:(id)a5 displayProfile:(id)a6 preheat:(BOOL)a7 withCompletion:(id)a8
{
  id v15 = a5;
  id v12 = a6;
  v13 = (void (**)(id, void))a8;
  library = self->_library;
  if (library)
  {
    [(PKPassLibrary *)library fetchImageSetForUniqueID:self->_objectUniqueID ofType:a3 displayProfile:v12 suffix:v15 withCompletion:v13];
  }
  else if (v13)
  {
    v13[2](v13, 0);
  }
}

- (id)dataForBundleResourceNamed:(id)a3 withExtension:(id)a4
{
  return [(PKPassLibrary *)self->_library dataForBundleResourceNamed:a3 withExtension:a4 objectUniqueIdentifier:self->_objectUniqueID];
}

- (id)dataForBundleResource:(id)a3
{
  id v4 = a3;
  v5 = [v4 name];
  v6 = [v4 extension];

  id v7 = [(PKRemoteDataAccessor *)self dataForBundleResourceNamed:v5 withExtension:v6];

  return v7;
}

- (id)dataForBundleResources:(id)a3
{
  return [(PKPassLibrary *)self->_library dataForBundleResources:a3 objectUniqueIdentifier:self->_objectUniqueID];
}

- (id)archiveData
{
  return [(PKPassLibrary *)self->_library archiveForObjectWithUniqueID:self->_objectUniqueID];
}

- (id)displayProfileOfType:(int64_t)a3
{
  return 0;
}

- (id)passLocalizedStringForKey:(id)a3
{
  return [(PKPassLibrary *)self->_library passLocalizedStringForKey:a3 uniqueID:self->_objectUniqueID];
}

- (PKPassLibrary)library
{
  return self->_library;
}

- (NSString)objectUniqueID
{
  return self->_objectUniqueID;
}

@end