@interface CNContact
+ (BOOL)_maps_addressBookAllowed;
+ (void)_maps_imageForNoContactWithDiameter:(double)a3 scale:(double)a4 completion:(id)a5;
+ (void)_maps_imageForUnkonwnWithDiameter:(double)a3 scale:(double)a4 completion:(id)a5;
- (BOOL)isMeCard;
- (CGImage)imageForCustomImageKey:(unint64_t)a3 suggestedSize:(CGSize)a4 contentScale:(float)a5;
- (id)_maps_spokenNameForNavigation;
- (id)avatarImageWithSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5;
- (void)_maps_imageForContactWithDiameter:(double)a3 scale:(double)a4 completion:(id)a5;
@end

@implementation CNContact

- (id)avatarImageWithSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5
{
  BOOL v5 = a5;
  double height = a3.height;
  double width = a3.width;
  if (+[CNContact _maps_addressBookAllowed])
  {
    +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", v5, 0, width, height, a4);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v11 = objc_alloc_init((Class)CNAvatarImageRenderer);
    v15 = self;
    v12 = +[NSArray arrayWithObjects:&v15 count:1];
    v13 = [v11 avatarImageForContacts:v12 scope:v10];
  }
  else
  {
    id v10 = objc_alloc_init((Class)CNAvatarImageRenderer);
    id v11 = [v10 placeholderImageProvider];
    v13 = [v11 imageForSize:width scale:height a4];
  }

  return v13;
}

- (CGImage)imageForCustomImageKey:(unint64_t)a3 suggestedSize:(CGSize)a4 contentScale:(float)a5
{
  -[CNContact avatarImageWithSize:scale:rightToLeft:](self, "avatarImageWithSize:scale:rightToLeft:", 0, a4.width, a4.height, a5);
  id v5 = objc_claimAutoreleasedReturnValue();
  v6 = (CGImage *)[v5 CGImage];

  return v6;
}

+ (BOOL)_maps_addressBookAllowed
{
  return +[CNContactStore _maps_isAuthorized];
}

- (BOOL)isMeCard
{
  v3 = +[AddressBookManager sharedManager];
  v4 = [v3 meCard];
  id v5 = [v4 identifier];
  v6 = [(CNContact *)self identifier];
  LOBYTE(self) = v5 == v6;

  return (char)self;
}

- (void)_maps_imageForContactWithDiameter:(double)a3 scale:(double)a4 completion:(id)a5
{
  id v7 = a5;
  v8 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100C7DB74;
  block[3] = &unk_1012EB5B8;
  double v12 = a3;
  block[4] = self;
  id v11 = v7;
  id v9 = v7;
  dispatch_async(v8, block);
}

+ (void)_maps_imageForNoContactWithDiameter:(double)a3 scale:(double)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = dispatch_get_global_queue(17, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C7DD20;
  v9[3] = &unk_1012F01B8;
  double v11 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

+ (void)_maps_imageForUnkonwnWithDiameter:(double)a3 scale:(double)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = dispatch_get_global_queue(17, 0);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100C7DEC8;
  v9[3] = &unk_1012F01B8;
  double v11 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, v9);
}

- (id)_maps_spokenNameForNavigation
{
  v3 = +[CNContactFormatter stringFromContact:self style:1];
  if ([v3 length])
  {
    id v4 = v3;
  }
  else
  {
    id v4 = +[CNContactFormatter stringFromContact:self style:0];
  }
  id v5 = v4;

  return v5;
}

@end