@interface WelcomeScreenBullet
+ (id)landmarksIn3D;
+ (id)multiStopRouting;
+ (id)transitCards;
- (NSString)body;
- (NSString)title;
- (UIColor)tintColor;
- (UIImage)image;
- (WelcomeScreenBullet)initWithTitle:(id)a3 body:(id)a4 imageName:(id)a5 tintColor:(id)a6;
- (WelcomeScreenBullet)initWithTitle:(id)a3 body:(id)a4 systemImageName:(id)a5 tintColor:(id)a6;
@end

@implementation WelcomeScreenBullet

- (WelcomeScreenBullet)initWithTitle:(id)a3 body:(id)a4 imageName:(id)a5 tintColor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)WelcomeScreenBullet;
  v14 = [(WelcomeScreenBullet *)&v22 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    title = v14->_title;
    v14->_title = v15;

    v17 = (NSString *)[v11 copy];
    body = v14->_body;
    v14->_body = v17;

    uint64_t v19 = +[UIImage imageNamed:v12];
    image = v14->_image;
    v14->_image = (UIImage *)v19;

    objc_storeStrong((id *)&v14->_tintColor, a6);
  }

  return v14;
}

- (WelcomeScreenBullet)initWithTitle:(id)a3 body:(id)a4 systemImageName:(id)a5 tintColor:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)WelcomeScreenBullet;
  v14 = [(WelcomeScreenBullet *)&v22 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    title = v14->_title;
    v14->_title = v15;

    v17 = (NSString *)[v11 copy];
    body = v14->_body;
    v14->_body = v17;

    uint64_t v19 = +[UIImage systemImageNamed:v12];
    image = v14->_image;
    v14->_image = (UIImage *)v19;

    objc_storeStrong((id *)&v14->_tintColor, a6);
  }

  return v14;
}

+ (id)multiStopRouting
{
  v2 = [WelcomeScreenBullet alloc];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Multi-Stop Routing" value:@"localized string not found" table:0];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Add multiple stops along your driving route." value:@"localized string not found" table:0];
  v7 = +[UIColor systemBlueColor];
  v8 = [(WelcomeScreenBullet *)v2 initWithTitle:v4 body:v6 imageName:@"multipointrouting" tintColor:v7];

  return v8;
}

+ (id)transitCards
{
  v2 = [WelcomeScreenBullet alloc];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Transit Cards" value:@"localized string not found" table:0];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Add transit cards to Wallet, see low balances, and replenish your card without leaving Maps.", @"localized string not found", 0 value table];
  v7 = +[UIColor systemBlueColor];
  v8 = [(WelcomeScreenBullet *)v2 initWithTitle:v4 body:v6 systemImageName:@"creditcard.fill" tintColor:v7];

  return v8;
}

+ (id)landmarksIn3D
{
  v2 = [WelcomeScreenBullet alloc];
  v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"Landmarks" value:@"localized string not found" table:0];
  v5 = +[NSBundle mainBundle];
  v6 = [v5 localizedStringForKey:@"Explore beautifully designed 3D landmarks in Las Vegas, Seattle, Chicago, and more.", @"localized string not found", 0 value table];
  v7 = +[UIColor systemBlueColor];
  v8 = [(WelcomeScreenBullet *)v2 initWithTitle:v4 body:v6 systemImageName:@"building.columns.fill" tintColor:v7];

  return v8;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)body
{
  return self->_body;
}

- (UIImage)image
{
  return self->_image;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_body, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end