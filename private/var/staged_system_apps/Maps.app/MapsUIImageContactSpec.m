@interface MapsUIImageContactSpec
- (BOOL)isEqual:(id)a3;
- (BOOL)useAvatarImageRendered;
- (BOOL)useSearchImageFallback;
- (CNContact)contact;
- (MapsUIImageContactSpec)init;
- (UIColor)tintColor;
- (double)size;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4;
- (int64_t)style;
- (unint64_t)hash;
- (void)setContact:(id)a3;
- (void)setSize:(double)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTintColor:(id)a3;
- (void)setUseAvatarImageRendered:(BOOL)a3;
@end

@implementation MapsUIImageContactSpec

- (MapsUIImageContactSpec)init
{
  v3.receiver = self;
  v3.super_class = (Class)MapsUIImageContactSpec;
  result = [(MapsUIImageContactSpec *)&v3 init];
  if (result) {
    result->_contact = 0;
  }
  return result;
}

- (double)size
{
  double result = *(double *)&self->_style;
  if (result <= 0.0) {
    return 32.0;
  }
  return result;
}

- (BOOL)useSearchImageFallback
{
  return 0;
}

- (id)imageForScale:(double)a3 isCarPlay:(BOOL)a4
{
  if ([(MapsUIImageContactSpec *)self useAvatarImageRendered])
  {
    [(MapsUIImageContactSpec *)self size];
    double v6 = v5;
    [(MapsUIImageContactSpec *)self size];
    double v8 = v7;
    v9 = +[MKSystemController sharedInstance];
    [v9 screenScale];
    +[CNAvatarImageRenderingScope scopeWithPointSize:scale:rightToLeft:style:](CNAvatarImageRenderingScope, "scopeWithPointSize:scale:rightToLeft:style:", 0, 0, v6, v8, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    id v12 = objc_alloc_init((Class)CNAvatarImageRenderer);
    v13 = [(MapsUIImageContactSpec *)self contact];
    v20 = v13;
    v14 = +[NSArray arrayWithObjects:&v20 count:1];
    v15 = [v12 avatarImageForContacts:v14 scope:v11];
  }
  else
  {
    id v16 = objc_alloc((Class)CNMonogrammer);
    int64_t v17 = [(MapsUIImageContactSpec *)self style];
    [(MapsUIImageContactSpec *)self size];
    id v11 = [v16 initWithStyle:v17];
    v18 = [(MapsUIImageContactSpec *)self tintColor];
    [v11 monogramsWithTint:v18];

    id v12 = [(MapsUIImageContactSpec *)self contact];
    v15 = [v11 monogramForContact:v12];
  }

  return v15;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  double v5 = [(MapsUIImageContactSpec *)self contact];
  [v4 setContact:v5];

  [v4 setStyle:[self style]];
  [(MapsUIImageContactSpec *)self size];
  [v4 setSize:];
  double v6 = [(MapsUIImageContactSpec *)self tintColor];
  [v4 setTintColor:v6];

  [v4 setUseAvatarImageRendered:[self useAvatarImageRendered]];
  return v4;
}

- (unint64_t)hash
{
  objc_super v3 = [(MapsUIImageContactSpec *)self contact];
  unint64_t v4 = (unint64_t)[v3 hash];
  double v5 = +[NSNumber numberWithInteger:[(MapsUIImageContactSpec *)self style]];
  unint64_t v6 = v4 ^ ((void)[v5 hash] << 8);
  [(MapsUIImageContactSpec *)self size];
  double v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  unint64_t v8 = v6 ^ ((void)[v7 hash] << 16);
  v9 = [(MapsUIImageContactSpec *)self tintColor];
  unint64_t v10 = v8 ^ (unint64_t)[v9 hash];
  id v11 = +[NSNumber numberWithBool:[(MapsUIImageContactSpec *)self useAvatarImageRendered]];
  unint64_t v12 = v10 ^ ((void)[v11 hash] << 24);

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [(MapsUIImageContactSpec *)self contact];
    double v7 = [v5 contact];
    unsigned int v8 = [v6 isEqual:v7];

    if (!v8) {
      goto LABEL_6;
    }
    id v9 = [(MapsUIImageContactSpec *)self style];
    if (v9 != [v5 style]) {
      goto LABEL_6;
    }
    [(MapsUIImageContactSpec *)self size];
    double v11 = v10;
    [v5 size];
    if (v11 != v12) {
      goto LABEL_6;
    }
    v13 = [(MapsUIImageContactSpec *)self tintColor];
    v14 = [v5 tintColor];

    if (v13 == v14)
    {
      unsigned int v17 = [(MapsUIImageContactSpec *)self useAvatarImageRendered];
      unsigned int v15 = v17 ^ [v5 useAvatarImageRendered] ^ 1;
    }
    else
    {
LABEL_6:
      LOBYTE(v15) = 0;
    }
  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(MapsUIImageContactSpec *)self contact];
  int64_t v5 = [(MapsUIImageContactSpec *)self style];
  [(MapsUIImageContactSpec *)self size];
  unint64_t v7 = (unint64_t)v6;
  unsigned int v8 = [(MapsUIImageContactSpec *)self tintColor];
  id v9 = +[NSString stringWithFormat:@"<%@: %p contact=%@ style=%lu size=%lu tintColor=%@ useAvatarImageRendered=%d>", v3, self, v4, v5, v7, v8, [(MapsUIImageContactSpec *)self useAvatarImageRendered]];

  return v9;
}

- (CNContact)contact
{
  return *(CNContact **)&self->_useAvatarImageRendered;
}

- (void)setContact:(id)a3
{
}

- (int64_t)style
{
  return (int64_t)self->_contact;
}

- (void)setStyle:(int64_t)a3
{
  self->_contact = (CNContact *)a3;
}

- (void)setSize:(double)a3
{
  *(double *)&self->_style = a3;
}

- (UIColor)tintColor
{
  return *(UIColor **)&self->_size;
}

- (void)setTintColor:(id)a3
{
}

- (BOOL)useAvatarImageRendered
{
  return *(&self->super._isRTL + 1);
}

- (void)setUseAvatarImageRendered:(BOOL)a3
{
  *(&self->super._isRTL + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_size, 0);

  objc_storeStrong((id *)&self->_useAvatarImageRendered, 0);
}

@end