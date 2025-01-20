@interface CNContact
+ (BOOL)_maps_addressBookAllowed;
- (CGImage)imageForCustomImageKey:(unint64_t)a3 suggestedSize:(CGSize)a4 contentScale:(float)a5;
- (id)avatarImageWithSize:(CGSize)a3 scale:(double)a4 rightToLeft:(BOOL)a5;
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

@end