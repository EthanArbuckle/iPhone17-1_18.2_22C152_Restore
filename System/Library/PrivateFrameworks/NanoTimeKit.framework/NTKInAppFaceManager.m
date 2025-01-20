@interface NTKInAppFaceManager
- (BOOL)isEditing;
- (NTKInAppFaceManager)initWithFace:(id)a3 handler:(id)a4;
- (UIViewController)editingViewController;
- (UIViewController)faceViewController;
- (void)setEditing:(BOOL)a3;
- (void)switchToEditing;
- (void)switchToLive;
- (void)switchToSwitcher;
@end

@implementation NTKInAppFaceManager

- (NTKInAppFaceManager)initWithFace:(id)a3 handler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)NTKInAppFaceManager;
  v9 = [(NTKInAppFaceManager *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_face, a3);
    v11 = _Block_copy(v8);
    id handler = v10->_handler;
    v10->_id handler = v11;

    v10->_animatingEditingTransition = 0;
    v13 = [[NTKInAppTransformingViewController alloc] initWithFace:v7];
    faceViewController = v10->_faceViewController;
    v10->_faceViewController = v13;

    v15 = [[NTKInAppOnDemandEditingViewController alloc] initWithFace:v7];
    editViewController = v10->_editViewController;
    v10->_editViewController = v15;
  }
  return v10;
}

- (UIViewController)faceViewController
{
  return (UIViewController *)self->_faceViewController;
}

- (UIViewController)editingViewController
{
  return (UIViewController *)self->_editViewController;
}

- (void)switchToEditing
{
  if (!self->_animatingEditingTransition) {
    [(NTKInAppFaceManager *)self beginEditing];
  }
}

- (void)switchToSwitcher
{
  if (!self->_animatingEditingTransition)
  {
    [(NTKInAppFaceManager *)self endEditing];
    id v3 = [(NTKInAppTransformingViewController *)self->_faceViewController faceViewController];
    [v3 setDataMode:3];
  }
}

- (void)switchToLive
{
  if (!self->_animatingEditingTransition)
  {
    [(NTKInAppFaceManager *)self endEditing];
    id v3 = [(NTKInAppTransformingViewController *)self->_faceViewController faceViewController];
    [v3 setDataMode:1];
  }
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editViewController, 0);
  objc_storeStrong((id *)&self->_faceViewController, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_face, 0);
}

@end