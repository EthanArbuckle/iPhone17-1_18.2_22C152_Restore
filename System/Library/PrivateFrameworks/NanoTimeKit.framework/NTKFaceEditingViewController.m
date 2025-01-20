@interface NTKFaceEditingViewController
- (NTKFace)face;
- (NTKFaceEditingViewController)initWithFace:(id)a3;
- (int64_t)currentEditMode;
- (void)activate;
- (void)deactivateWithCompletion:(id)a3;
- (void)dealloc;
- (void)faceColorEditOptionsChanged;
- (void)loadView;
- (void)willActivate;
- (void)willDeactivate;
@end

@implementation NTKFaceEditingViewController

- (NTKFaceEditingViewController)initWithFace:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKFaceEditingViewController;
  v6 = [(NTKFaceEditingViewController *)&v10 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_face, a3);
    [(NTKFaceEditingViewController *)v7 setModalPresentationCapturesStatusBarAppearance:1];
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel_faceColorEditOptionsChanged name:@"NTKColorEditOptionsChangedNotificationName" object:v7->_face];
  }
  return v7;
}

- (int64_t)currentEditMode
{
  return [(NTKFaceEditView *)self->_editView editMode];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"NTKColorEditOptionsChangedNotificationName" object:self->_face];

  v4.receiver = self;
  v4.super_class = (Class)NTKFaceEditingViewController;
  [(NTKFaceEditingViewController *)&v4 dealloc];
}

- (void)faceColorEditOptionsChanged
{
}

- (void)loadView
{
  v3 = [NTKFaceEditView alloc];
  objc_super v4 = [(NTKFaceEditingViewController *)self face];
  id v5 = [(NTKFaceEditView *)v3 initWithFace:v4];

  [(NTKFaceEditingViewController *)self setView:v5];
  editView = self->_editView;
  self->_editView = v5;
}

- (void)willActivate
{
}

- (void)activate
{
}

- (void)willDeactivate
{
}

- (void)deactivateWithCompletion:(id)a3
{
}

- (NTKFace)face
{
  return self->_face;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_face, 0);

  objc_storeStrong((id *)&self->_editView, 0);
}

@end