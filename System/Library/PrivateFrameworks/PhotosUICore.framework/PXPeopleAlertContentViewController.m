@interface PXPeopleAlertContentViewController
- (NSString)message;
- (PHPerson)person;
- (PXPeopleAlertContentViewController)initWithPerson:(id)a3 message:(id)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXPeopleAlertContentViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_person, 0);
}

- (NSString)message
{
  return self->_message;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)viewWillAppear:(BOOL)a3
{
  v41[9] = *MEMORY[0x1E4F143B8];
  v40.receiver = self;
  v40.super_class = (Class)PXPeopleAlertContentViewController;
  [(PXPeopleAlertContentViewController *)&v40 viewWillAppear:a3];
  v4 = [(PXPeopleAlertContentViewController *)self view];
  id v5 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  v6 = [(PXPeopleAlertContentViewController *)self message];
  [v5 setText:v6];

  [v5 setTextAlignment:1];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setNumberOfLines:0];
  v7 = [MEMORY[0x1E4FB1618] systemGrayColor];
  [v5 setTextColor:v7];

  v8 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:13.0];
  [v5 setFont:v8];

  [v4 addSubview:v5];
  v9 = -[PXPeopleScalableAvatarView initWithFrame:]([PXPeopleScalableAvatarView alloc], "initWithFrame:", 0.0, 0.0, 130.0, 130.0);
  v10 = [(PXPeopleAlertContentViewController *)self person];
  [(PXPeopleScalableAvatarView *)v9 setPerson:v10];

  [(PXPeopleScalableAvatarView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 addSubview:v9];
  v28 = (void *)MEMORY[0x1E4F28DC8];
  v39 = [(PXPeopleScalableAvatarView *)v9 widthAnchor];
  v38 = [(PXPeopleScalableAvatarView *)v9 heightAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v41[0] = v37;
  v36 = [(PXPeopleScalableAvatarView *)v9 widthAnchor];
  v35 = [v36 constraintEqualToConstant:130.0];
  v41[1] = v35;
  v34 = [(PXPeopleScalableAvatarView *)v9 centerXAnchor];
  v33 = [v4 centerXAnchor];
  v32 = [v34 constraintEqualToAnchor:v33];
  v41[2] = v32;
  v31 = [(PXPeopleScalableAvatarView *)v9 topAnchor];
  v30 = [v4 topAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:20.0];
  v41[3] = v29;
  v27 = [v5 centerXAnchor];
  v25 = v4;
  v26 = [v4 centerXAnchor];
  v24 = [v27 constraintEqualToAnchor:v26];
  v41[4] = v24;
  v23 = [v5 topAnchor];
  v22 = [(PXPeopleScalableAvatarView *)v9 bottomAnchor];
  v21 = [v23 constraintEqualToAnchor:v22 constant:10.0];
  v41[5] = v21;
  v20 = [v5 bottomAnchor];
  v19 = [v4 bottomAnchor];
  v11 = [v20 constraintEqualToAnchor:v19 constant:-20.0];
  v41[6] = v11;
  v12 = [v5 leadingAnchor];
  v13 = [v4 leadingAnchor];
  v14 = [v12 constraintEqualToAnchor:v13 constant:30.0];
  v41[7] = v14;
  v15 = [v5 trailingAnchor];
  v16 = [v4 trailingAnchor];
  v17 = [v15 constraintEqualToAnchor:v16 constant:-30.0];
  v41[8] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:9];
  [v28 activateConstraints:v18];
}

- (PXPeopleAlertContentViewController)initWithPerson:(id)a3 message:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXPeopleAlertContentViewController.m", 28, @"Invalid parameter not satisfying: %@", @"person" object file lineNumber description];
  }
  if (![v9 length])
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXPeopleAlertContentViewController.m", 29, @"Invalid parameter not satisfying: %@", @"message.length > 0" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)PXPeopleAlertContentViewController;
  v10 = [(PXPeopleAlertContentViewController *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_person, a3);
    objc_storeStrong((id *)&v11->_message, a4);
  }

  return v11;
}

@end