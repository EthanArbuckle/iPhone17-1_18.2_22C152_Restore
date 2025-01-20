@interface NTKCFaceDetailCustomPhotosViewController
- (BOOL)inGallery;
- (BOOL)isModalInPresentation;
- (NTKCFaceDetailCustomPhotosViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5 faceView:(id)a6 externalImagesSet:(BOOL)a7;
- (NTKCompanionCustomPhotosEditor)editor;
- (NTKFace)face;
- (void)customPhotosControllerDidFinish:(id)a3;
- (void)setEditor:(id)a3;
- (void)setFace:(id)a3;
@end

@implementation NTKCFaceDetailCustomPhotosViewController

- (NTKCFaceDetailCustomPhotosViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5 faceView:(id)a6 externalImagesSet:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  v15 = [[_NTKCFaceDetailCustomPhotosViewController alloc] initWithPhotosEditor:v14 forFace:v13 inGallery:v8 faceView:v12 externalImagesSet:v7];

  v19.receiver = self;
  v19.super_class = (Class)NTKCFaceDetailCustomPhotosViewController;
  v16 = [(NTKCNavigationController *)&v19 initWithRootViewController:v15];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_implementationVC, v15);
    [(_NTKCFaceDetailCustomPhotosViewController *)v17->_implementationVC setDelegate:v17];
  }

  return v17;
}

- (NTKCompanionCustomPhotosEditor)editor
{
  return [(_NTKCFaceDetailCustomPhotosViewController *)self->_implementationVC editor];
}

- (BOOL)inGallery
{
  return [(_NTKCFaceDetailCustomPhotosViewController *)self->_implementationVC inGallery];
}

- (void)customPhotosControllerDidFinish:(id)a3
{
  id v4 = [(NTKCFaceDetailCustomPhotosViewController *)self delegate];
  [v4 customPhotosControllerDidFinish:self];
}

- (BOOL)isModalInPresentation
{
  return 1;
}

- (void)setEditor:(id)a3
{
}

- (NTKFace)face
{
  return self->_face;
}

- (void)setFace:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face, 0);
  objc_storeStrong((id *)&self->_editor, 0);

  objc_storeStrong((id *)&self->_implementationVC, 0);
}

uint64_t __65___NTKCFaceDetailCustomPhotosViewController_setEditing_animated___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelected:0];
}

void __83___NTKCFaceDetailCustomPhotosViewController_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, void *a2, double x, double y, double width, double height)
{
  id v11 = a2;
  id v12 = [*(id *)(a1 + 32) collectionView];
  id v13 = [v12 indexPathForCell:*(void *)(a1 + 40)];
  uint64_t v14 = [v13 item];
  uint64_t v15 = *(void *)(a1 + 48);

  if (v14 == v15)
  {
    v20.origin.x = x;
    v20.origin.y = y;
    v20.size.width = width;
    v20.size.height = height;
    if (!CGRectIsEmpty(v20))
    {
      [v11 scale];
      CGFloat v17 = 1.0 / v16;
      [v11 scale];
      CGAffineTransformMakeScale(&v19, v17, 1.0 / v18);
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      CGRect v22 = CGRectApplyAffineTransform(v21, &v19);
      x = v22.origin.x;
      y = v22.origin.y;
      width = v22.size.width;
      height = v22.size.height;
    }
    [*(id *)(a1 + 40) setPhoto:v11];
    objc_msgSend(*(id *)(a1 + 40), "setCrop:", x, y, width, height);
  }
}

void __88___NTKCFaceDetailCustomPhotosViewController_collectionView_shouldSelectItemAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updateButtons];
    v2 = [v3 collectionView];
    [v2 reloadData];

    id WeakRetained = v3;
  }
}

void __57___NTKCFaceDetailCustomPhotosViewController__savePressed__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  id v3 = objc_loadWeakRetained(v1);
  [v2 customPhotosControllerDidFinish:v3];
}

void __57___NTKCFaceDetailCustomPhotosViewController__savePressed__block_invoke_2(uint64_t a1, void *a2)
{
  id v8 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = [WeakRetained face];
    [v5 setResourceDirectory:v8];

    uint64_t v6 = v4[127];
    BOOL v7 = [v4 navigationItem];
    [v7 setLeftBarButtonItem:v6];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __62___NTKCFaceDetailCustomPhotosViewController__selectAllPressed__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSelected:*(unsigned __int8 *)(a1 + 32)];
}

uint64_t __56___NTKCFaceDetailCustomPhotosViewController__addPressed__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1112), "addPhotosFromUIImagePicker:");
  [*(id *)(a1 + 32) _updateButtons];
  v2 = [*(id *)(a1 + 32) collectionView];
  [v2 reloadData];

  return 0;
}

uint64_t __59___NTKCFaceDetailCustomPhotosViewController__deletePressed__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1104) = 1;
  return [*(id *)(a1 + 32) _deletePressed];
}

uint64_t __59___NTKCFaceDetailCustomPhotosViewController__deletePressed__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v4 = *(void **)(a1 + 32);
  v5 = [MEMORY[0x1E4F28D58] indexPathForItem:a2 inSection:0];
  [v4 addObject:v5];

  uint64_t v6 = *(void **)(*(void *)(a1 + 40) + 1112);

  return [v6 deletePhotoAtIndex:a2];
}

@end