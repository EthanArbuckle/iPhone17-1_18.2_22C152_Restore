@interface _PXStoryRecipePhotoKitLibraryReference
- (PHPhotoLibrary)photoLibrary;
- (_PXStoryRecipePhotoKitLibraryReference)initWithKind:(int64_t)a3 url:(id)a4;
- (_PXStoryRecipePhotoKitLibraryReference)initWithPhotoLibrary:(id)a3;
@end

@implementation _PXStoryRecipePhotoKitLibraryReference

- (void).cxx_destruct
{
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (_PXStoryRecipePhotoKitLibraryReference)initWithPhotoLibrary:(id)a3
{
  id v5 = a3;
  v6 = [v5 photoLibraryURL];
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryRecipePhotoKitLibraryReference;
  v7 = [(PFStoryConcreteRecipeLibrary *)&v9 initWithKind:1 url:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_photoLibrary, a3);
  }

  return v7;
}

- (_PXStoryRecipePhotoKitLibraryReference)initWithKind:(int64_t)a3 url:(id)a4
{
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PFStoryRecipe+PXStory+PhotoKit.m", 313, @"%s is not available as initializer", "-[_PXStoryRecipePhotoKitLibraryReference initWithKind:url:]");

  abort();
}

@end