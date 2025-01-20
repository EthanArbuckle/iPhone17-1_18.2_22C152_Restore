@interface UGCPhotoFeedHeaderTitleModel
- (BOOL)isEqual:(id)a3;
- (BOOL)showPunchoutSymbol;
- (NSString)titleText;
- (void)setShowPunchoutSymbol:(BOOL)a3;
- (void)setTitleText:(id)a3;
@end

@implementation UGCPhotoFeedHeaderTitleModel

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 titleText];
    v7 = [(UGCPhotoFeedHeaderTitleModel *)self titleText];
    unint64_t v8 = v6;
    unint64_t v9 = v7;
    if (v8 | v9
      && (unsigned int v10 = [(id)v8 isEqual:v9], (id)v9, (id)v8, !v10))
    {
      LOBYTE(v12) = 0;
    }
    else
    {
      unsigned int v11 = [v5 showPunchoutSymbol];
      unsigned int v12 = v11 ^ [(UGCPhotoFeedHeaderTitleModel *)self showPunchoutSymbol] ^ 1;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
}

- (BOOL)showPunchoutSymbol
{
  return self->_showPunchoutSymbol;
}

- (void)setShowPunchoutSymbol:(BOOL)a3
{
  self->_showPunchoutSymbol = a3;
}

- (void).cxx_destruct
{
}

@end