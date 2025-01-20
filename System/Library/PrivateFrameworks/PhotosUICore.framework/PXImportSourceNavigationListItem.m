@interface PXImportSourceNavigationListItem
- (BOOL)isRemovable;
- (PHImportSource)importSource;
- (PHPhotoLibrary)photoLibrary;
- (PXImportSourceNavigationListItem)initWithIdentifier:(id)a3 title:(id)a4 itemCount:(int64_t)a5 containerIdentifier:(id)a6;
- (PXImportSourceNavigationListItem)initWithImportSource:(id)a3 photoLibrary:(id)a4;
- (UIImage)image;
- (id)accessoryGlyphImageName;
- (id)fileURL;
- (id)glyphImageName;
- (unint64_t)hash;
@end

@implementation PXImportSourceNavigationListItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_importSource, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PHImportSource)importSource
{
  return self->_importSource;
}

- (unint64_t)hash
{
  v2 = [(PXImportSourceNavigationListItem *)self importSource];
  v3 = [v2 uuid];
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isRemovable
{
  v2 = [(PXImportSourceNavigationListItem *)self importSource];
  char v3 = [v2 canEject];

  return v3;
}

- (id)accessoryGlyphImageName
{
  v7.receiver = self;
  v7.super_class = (Class)PXImportSourceNavigationListItem;
  char v3 = [(PXNavigationListItem *)&v7 accessoryGlyphImageName];
  unint64_t v4 = [(PXImportSourceNavigationListItem *)self importSource];
  int v5 = objc_msgSend(v4, "px_shouldShowCPLOptimizedMessage");

  if (v5)
  {

    char v3 = @"exclamationmark.icloud.fill";
  }
  return v3;
}

- (id)glyphImageName
{
  return @"camera.on.rectangle";
}

- (id)fileURL
{
  v2 = [(PXImportSourceNavigationListItem *)self importSource];
  char v3 = [v2 path];

  if (v3)
  {
    unint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v3];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (UIImage)image
{
  v2 = [(PXImportSourceNavigationListItem *)self importSource];
  char v3 = [v2 iconSymbolName];

  unint64_t v4 = [MEMORY[0x1E4FB1818] systemImageNamed:v3];

  return (UIImage *)v4;
}

- (PXImportSourceNavigationListItem)initWithIdentifier:(id)a3 title:(id)a4 itemCount:(int64_t)a5 containerIdentifier:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXImportSourceNavigationListItem.m", 29, @"%s is not available as initializer", "-[PXImportSourceNavigationListItem initWithIdentifier:title:itemCount:containerIdentifier:]");

  abort();
}

- (PXImportSourceNavigationListItem)initWithImportSource:(id)a3 photoLibrary:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [v7 uuid];
  id v10 = [v7 name];
  v13.receiver = self;
  v13.super_class = (Class)PXImportSourceNavigationListItem;
  id v11 = [(PXNavigationListItem *)&v13 initWithIdentifier:v9 title:v10 itemCount:0x7FFFFFFFFFFFFFFFLL containerIdentifier:0];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_importSource, a3);
    objc_storeStrong((id *)&v11->_photoLibrary, a4);
  }

  return v11;
}

@end