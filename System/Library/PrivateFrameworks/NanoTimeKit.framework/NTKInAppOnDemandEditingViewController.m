@interface NTKInAppOnDemandEditingViewController
- (NTKFaceEditingViewController)editingViewController;
- (NTKInAppOnDemandEditingViewController)initWithFace:(id)a3;
- (void)destroyEditingViewController;
@end

@implementation NTKInAppOnDemandEditingViewController

- (NTKInAppOnDemandEditingViewController)initWithFace:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKInAppOnDemandEditingViewController;
  v6 = [(NTKInAppOnDemandEditingViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_face, a3);
  }

  return v7;
}

- (NTKFaceEditingViewController)editingViewController
{
  v26[4] = *MEMORY[0x1E4F143B8];
  p_editViewController = &self->_editViewController;
  editViewController = self->_editViewController;
  if (editViewController)
  {
    v4 = editViewController;
  }
  else
  {
    v6 = self->_face;
    v7 = [[NTKFaceEditingViewController alloc] initWithFace:v6];
    if (v7)
    {
      [(NTKInAppOnDemandEditingViewController *)self view];
      v8 = v25 = v6;
      objc_super v9 = [(NTKFaceEditingViewController *)v7 view];
      [(NTKInAppOnDemandEditingViewController *)self addChildViewController:v7];
      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v8 addSubview:v9];
      [(NTKFaceEditingViewController *)v7 didMoveToParentViewController:self];
      v19 = (void *)MEMORY[0x1E4F28DC8];
      v24 = [v9 widthAnchor];
      v23 = [v8 widthAnchor];
      v22 = [v24 constraintEqualToAnchor:v23];
      v26[0] = v22;
      v21 = [v9 heightAnchor];
      v20 = [v8 heightAnchor];
      v18 = [v21 constraintEqualToAnchor:v20];
      v26[1] = v18;
      v17 = [v9 centerXAnchor];
      v10 = [v8 centerXAnchor];
      v11 = [v17 constraintEqualToAnchor:v10];
      v26[2] = v11;
      v12 = [v9 centerYAnchor];
      v13 = [v8 centerYAnchor];
      v14 = [v12 constraintEqualToAnchor:v13];
      v26[3] = v14;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:4];
      [v19 activateConstraints:v15];

      objc_storeStrong((id *)p_editViewController, v7);
      v4 = *p_editViewController;

      v6 = v25;
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (void)destroyEditingViewController
{
  editViewController = self->_editViewController;
  if (editViewController)
  {
    [(NTKFaceEditingViewController *)editViewController removeFromParentViewController];
    v4 = [(NTKFaceEditingViewController *)self->_editViewController view];
    [v4 removeFromSuperview];

    [(NTKFaceEditingViewController *)self->_editViewController didMoveToParentViewController:0];
    id v5 = self->_editViewController;
    self->_editViewController = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editViewController, 0);
  objc_storeStrong((id *)&self->_face, 0);
}

@end