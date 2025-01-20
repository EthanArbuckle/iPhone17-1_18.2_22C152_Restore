@interface PUPhotoEditApertureButtonContainer
- (PUPhotoEditApertureButton)apertureButton;
- (PUPhotoEditApertureButtonContainer)initWithApertureButton:(id)a3;
- (void)setApertureButton:(id)a3;
@end

@implementation PUPhotoEditApertureButtonContainer

- (void).cxx_destruct
{
}

- (void)setApertureButton:(id)a3
{
}

- (PUPhotoEditApertureButton)apertureButton
{
  return self->_apertureButton;
}

- (PUPhotoEditApertureButtonContainer)initWithApertureButton:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PUPhotoEditApertureButtonContainer;
  v6 = [(PUPhotoEditApertureButtonContainer *)&v22 init];
  v7 = v6;
  if (v6)
  {
    p_apertureButton = (id *)&v6->_apertureButton;
    objc_storeStrong((id *)&v6->_apertureButton, a3);
    [(PUPhotoEditApertureButtonContainer *)v7 addSubview:*p_apertureButton];
    v9 = [(PUPhotoEditApertureButtonContainer *)v7 leadingAnchor];
    v10 = [*p_apertureButton leadingAnchor];
    v11 = [v9 constraintEqualToAnchor:v10];
    [v11 setActive:1];

    v12 = [(PUPhotoEditApertureButtonContainer *)v7 widthAnchor];
    v13 = [v12 constraintEqualToConstant:50.0];
    [v13 setActive:1];

    v14 = [(PUPhotoEditApertureButtonContainer *)v7 topAnchor];
    v15 = [*p_apertureButton topAnchor];
    v16 = [v14 constraintEqualToAnchor:v15];
    [v16 setActive:1];

    v17 = [(PUPhotoEditApertureButtonContainer *)v7 bottomAnchor];
    v18 = [*p_apertureButton bottomAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    [v19 setActive:1];

    [(PUPhotoEditApertureButtonContainer *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = v7;
  }

  return v7;
}

@end