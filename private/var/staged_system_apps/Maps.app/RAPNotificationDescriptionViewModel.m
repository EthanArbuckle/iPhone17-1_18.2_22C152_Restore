@interface RAPNotificationDescriptionViewModel
- (BOOL)shouldDisplayLink;
- (NSString)descriptionText;
- (NSString)imageName;
- (NSString)linkButtonLink;
- (NSString)linkButtonText;
- (NSString)titleText;
- (RAPNotificationDescriptionViewModel)initWithRAPNotificationDetailsViewModel:(id)a3;
- (UIColor)imageBackgroundColor;
@end

@implementation RAPNotificationDescriptionViewModel

- (RAPNotificationDescriptionViewModel)initWithRAPNotificationDetailsViewModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RAPNotificationDescriptionViewModel;
  v6 = [(RAPNotificationDescriptionViewModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_detailsViewModel, a3);
  }

  return v7;
}

- (NSString)imageName
{
  v2 = [(RAPNotificationDetailsViewModel *)self->_detailsViewModel descriptionInfo];
  v3 = [v2 imageName];

  return (NSString *)v3;
}

- (UIColor)imageBackgroundColor
{
  v2 = [(RAPNotificationDetailsViewModel *)self->_detailsViewModel descriptionInfo];
  v3 = [v2 imageBackgroundColor];

  return (UIColor *)v3;
}

- (NSString)titleText
{
  v2 = [(RAPNotificationDetailsViewModel *)self->_detailsViewModel descriptionInfo];
  v3 = [v2 titleText];

  return (NSString *)v3;
}

- (NSString)descriptionText
{
  v2 = [(RAPNotificationDetailsViewModel *)self->_detailsViewModel descriptionInfo];
  v3 = [v2 descriptionText];

  return (NSString *)v3;
}

- (NSString)linkButtonText
{
  return [(RAPNotificationDetailsViewModel *)self->_detailsViewModel linkButtonText];
}

- (NSString)linkButtonLink
{
  return [(RAPNotificationDetailsViewModel *)self->_detailsViewModel linkButtonLink];
}

- (BOOL)shouldDisplayLink
{
  v3 = [(RAPNotificationDescriptionViewModel *)self linkButtonLink];
  if ([v3 length])
  {
    v4 = [(RAPNotificationDescriptionViewModel *)self linkButtonText];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
}

@end