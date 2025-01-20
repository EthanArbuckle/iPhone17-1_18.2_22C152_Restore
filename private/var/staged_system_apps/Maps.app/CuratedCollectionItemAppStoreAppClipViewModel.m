@interface CuratedCollectionItemAppStoreAppClipViewModel
- (BOOL)isEqual:(id)a3;
- (CuratedCollectionItemAppStoreAppClipViewModel)initWithAppStoreAppClip:(id)a3;
- (GEOAppStoreAppClip)appClip;
- (NSString)subtitle;
- (NSString)title;
- (unint64_t)hash;
- (void)fetchAppClipIconWithSize:(CGSize)a3 scale:(double)a4 completion:(id)a5;
@end

@implementation CuratedCollectionItemAppStoreAppClipViewModel

- (CuratedCollectionItemAppStoreAppClipViewModel)initWithAppStoreAppClip:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CuratedCollectionItemAppStoreAppClipViewModel;
  v6 = [(CuratedCollectionItemAppStoreAppClipViewModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appClip, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  return (unint64_t)[(GEOAppStoreAppClip *)self->_appClip hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CuratedCollectionItemAppStoreAppClipViewModel *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v8 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = [(CuratedCollectionItemAppStoreAppClipViewModel *)v5 appClip];
    v7 = v6;
    if (v6 == self->_appClip) {
      unsigned __int8 v8 = 1;
    }
    else {
      unsigned __int8 v8 = -[GEOAppStoreAppClip isEqual:](v6, "isEqual:");
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (NSString)title
{
  return (NSString *)[(GEOAppStoreAppClip *)self->_appClip title];
}

- (NSString)subtitle
{
  subtitle = self->_subtitle;
  if (!subtitle)
  {
    v4 = [(GEOAppStoreAppClip *)self->_appClip subtitle];
    id v5 = [v4 length];

    if (v5)
    {
      v6 = +[NSBundle mainBundle];
      v7 = [v6 localizedStringForKey:@"[Guides] App Clip button subtitle" value:@"localized string not found" table:0];
      unsigned __int8 v8 = [(GEOAppStoreAppClip *)self->_appClip subtitle];
      +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);
      objc_super v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      v10 = self->_subtitle;
      self->_subtitle = v9;
    }
    else
    {
      v6 = self->_subtitle;
      self->_subtitle = (NSString *)&stru_101324E70;
    }

    subtitle = self->_subtitle;
  }

  return subtitle;
}

- (void)fetchAppClipIconWithSize:(CGSize)a3 scale:(double)a4 completion:(id)a5
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  id v9 = a5;
  v10 = +[MKAppImageManager sharedImageManager];
  v11 = [(GEOAppStoreAppClip *)self->_appClip artworkURL];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1008F4444;
  v13[3] = &unk_101300150;
  double v15 = a4;
  CGFloat v16 = width;
  CGFloat v17 = height;
  id v14 = v9;
  id v12 = v9;
  [v10 loadAppImageAtURL:v11 completionHandler:v13];
}

- (GEOAppStoreAppClip)appClip
{
  return self->_appClip;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClip, 0);

  objc_storeStrong((id *)&self->_subtitle, 0);
}

@end