@interface RideBookingPaymentMethod
- (INPaymentMethod)intentsPaymentMethod;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)icon;
- (void)setIntentsPaymentMethod:(id)a3;
@end

@implementation RideBookingPaymentMethod

- (INPaymentMethod)intentsPaymentMethod
{
  return (INPaymentMethod *)objc_getAssociatedObject(self, &unk_100F6F678);
}

- (void)setIntentsPaymentMethod:(id)a3
{
  id value = a3;
  v4 = [(RideBookingPaymentMethod *)self intentsPaymentMethod];
  if (([v4 isEqual:value] & 1) == 0) {
    objc_setAssociatedObject(self, &unk_100F6F678, value, (void *)3);
  }
}

- (UIImage)icon
{
  v3 = [(RideBookingPaymentMethod *)self intentsPaymentMethod];
  id v4 = [v3 type];

  if (v4 == (id)8)
  {
    v5 = +[UIImage _mapkit_imageNamed:@"apple-pay"];
  }
  else
  {
    v6 = +[RideBookingAccessProxy imageCache];
    v7 = [(RideBookingPaymentMethod *)self intentsPaymentMethod];
    v8 = [v7 icon];
    v9 = [v8 _identifier];
    v5 = [v6 imageForKey:v9];
  }

  return (UIImage *)v5;
}

- (NSString)title
{
  v3 = [(RideBookingPaymentMethod *)self intentsPaymentMethod];
  id v4 = [v3 type];

  if (v4 == (id)8)
  {
    v5 = +[NSBundle mainBundle];
    [v5 localizedStringForKey:@"Apple Pay" value:@"localized string not found" table:0];
  }
  else
  {
    v5 = [(RideBookingPaymentMethod *)self intentsPaymentMethod];
    [v5 name];
  v6 = };

  return (NSString *)v6;
}

- (NSString)subtitle
{
  v3 = [(RideBookingPaymentMethod *)self intentsPaymentMethod];
  id v4 = [v3 type];

  if (v4 == (id)8)
  {
    v5 = 0;
  }
  else
  {
    v6 = [(RideBookingPaymentMethod *)self intentsPaymentMethod];
    v5 = [v6 identificationHint];
  }

  return (NSString *)v5;
}

@end