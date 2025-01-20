@interface UGCPhotoAlbumCategory
- (BOOL)isEqual:(id)a3;
- (NSString)albumTitle;
- (UGCPhotoAlbumCategory)initWithTitle:(id)a3 categoryType:(unint64_t)a4;
- (unint64_t)categoryType;
@end

@implementation UGCPhotoAlbumCategory

- (UGCPhotoAlbumCategory)initWithTitle:(id)a3 categoryType:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UGCPhotoAlbumCategory;
  v8 = [(UGCPhotoAlbumCategory *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_albumTitle, a3);
    v9->_categoryType = a4;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 albumTitle];
    id v7 = [(UGCPhotoAlbumCategory *)self albumTitle];
    unint64_t v8 = v6;
    unint64_t v9 = v7;
    if (v8 | v9
      && (unsigned int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
    {
      BOOL v12 = 0;
    }
    else
    {
      id v11 = [v5 categoryType];
      BOOL v12 = v11 == (id)[(UGCPhotoAlbumCategory *)self categoryType];
    }
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (NSString)albumTitle
{
  return self->_albumTitle;
}

- (unint64_t)categoryType
{
  return self->_categoryType;
}

- (void).cxx_destruct
{
}

@end