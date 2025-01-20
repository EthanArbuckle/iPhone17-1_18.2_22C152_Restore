@interface COSSOSSafetyFeature
- (COSSOSSafetyFeature)initWithTitle:(id)a3 subtitle:(id)a4 assetName:(id)a5;
- (NSString)assetName;
- (NSString)subtitle;
- (NSString)title;
- (void)setAssetName:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation COSSOSSafetyFeature

- (COSSOSSafetyFeature)initWithTitle:(id)a3 subtitle:(id)a4 assetName:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)COSSOSSafetyFeature;
  v12 = [(COSSOSSafetyFeature *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_title, a3);
    objc_storeStrong((id *)&v13->_subtitle, a4);
    objc_storeStrong((id *)&v13->_assetName, a5);
  }

  return v13;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)assetName
{
  return self->_assetName;
}

- (void)setAssetName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetName, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end