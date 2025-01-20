@interface RemoteUIControllerPreferences
- (BOOL)showSpinner;
- (NSString)navBarImageLabel;
- (NSString)spinnerLabel;
- (RemoteUIControllerPreferences)initWithSpinner:(BOOL)a3;
- (RemoteUIControllerPreferences)initWithSpinner:(BOOL)a3 spinnerLabel:(id)a4;
- (RemoteUIControllerPreferences)initWithSpinner:(BOOL)a3 spinnerLabel:(id)a4 navBarImage:(id)a5 navBarImageLabel:(id)a6;
- (UIImage)navBarImage;
- (void)setNavBarImage:(id)a3;
- (void)setNavBarImageLabel:(id)a3;
- (void)setShowSpinner:(BOOL)a3;
- (void)setSpinnerLabel:(id)a3;
@end

@implementation RemoteUIControllerPreferences

- (RemoteUIControllerPreferences)initWithSpinner:(BOOL)a3 spinnerLabel:(id)a4 navBarImage:(id)a5 navBarImageLabel:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)RemoteUIControllerPreferences;
  v14 = [(RemoteUIControllerPreferences *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_showSpinner = a3;
    objc_storeStrong((id *)&v14->_spinnerLabel, a4);
    objc_storeStrong((id *)&v15->_navBarImage, a5);
    objc_storeStrong((id *)&v15->_navBarImageLabel, a6);
  }

  return v15;
}

- (RemoteUIControllerPreferences)initWithSpinner:(BOOL)a3 spinnerLabel:(id)a4
{
  return [(RemoteUIControllerPreferences *)self initWithSpinner:a3 spinnerLabel:a4 navBarImage:0 navBarImageLabel:0];
}

- (RemoteUIControllerPreferences)initWithSpinner:(BOOL)a3
{
  return [(RemoteUIControllerPreferences *)self initWithSpinner:a3 spinnerLabel:0 navBarImage:0 navBarImageLabel:0];
}

- (BOOL)showSpinner
{
  return self->_showSpinner;
}

- (void)setShowSpinner:(BOOL)a3
{
  self->_showSpinner = a3;
}

- (NSString)spinnerLabel
{
  return self->_spinnerLabel;
}

- (void)setSpinnerLabel:(id)a3
{
}

- (UIImage)navBarImage
{
  return self->_navBarImage;
}

- (void)setNavBarImage:(id)a3
{
}

- (NSString)navBarImageLabel
{
  return self->_navBarImageLabel;
}

- (void)setNavBarImageLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navBarImageLabel, 0);
  objc_storeStrong((id *)&self->_navBarImage, 0);
  objc_storeStrong((id *)&self->_spinnerLabel, 0);
}

@end