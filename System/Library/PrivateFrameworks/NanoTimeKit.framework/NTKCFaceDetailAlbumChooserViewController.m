@interface NTKCFaceDetailAlbumChooserViewController
- (BOOL)inGallery;
- (NTKCAlbumHandlingEditor)editor;
- (NTKCFaceDetailAlbumChooserViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5;
- (NTKCFaceDetailAlbumChooserViewControllerDelegate)delegate;
- (NTKFace)face;
- (void)_albumChooserDidFinish:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation NTKCFaceDetailAlbumChooserViewController

- (NTKCFaceDetailAlbumChooserViewController)initWithPhotosEditor:(id)a3 forFace:(id)a4 inGallery:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[_NTKCFaceDetailAlbumChooserViewController alloc] initWithPhotosEditor:v9 forFace:v8 inGallery:v5];

  v14.receiver = self;
  v14.super_class = (Class)NTKCFaceDetailAlbumChooserViewController;
  v11 = [(NTKCNavigationController *)&v14 initWithRootViewController:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_implementationVC, v10);
    [(_NTKCFaceDetailAlbumChooserViewController *)v12->_implementationVC setDelegate:v12];
  }

  return v12;
}

- (NTKCAlbumHandlingEditor)editor
{
  return [(_NTKCFaceDetailAlbumChooserViewController *)self->_implementationVC editor];
}

- (BOOL)inGallery
{
  return [(_NTKCFaceDetailAlbumChooserViewController *)self->_implementationVC inGallery];
}

- (NTKFace)face
{
  return [(_NTKCFaceDetailAlbumChooserViewController *)self->_implementationVC face];
}

- (void)_albumChooserDidFinish:(id)a3
{
  id v4 = [(NTKCFaceDetailAlbumChooserViewController *)self delegate];
  [v4 albumChooserDidFinish:self];
}

- (NTKCFaceDetailAlbumChooserViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (NTKCFaceDetailAlbumChooserViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_implementationVC, 0);
}

@end