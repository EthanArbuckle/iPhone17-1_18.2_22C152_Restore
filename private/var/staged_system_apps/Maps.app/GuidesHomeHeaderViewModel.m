@interface GuidesHomeHeaderViewModel
- (CGSize)photoSize;
- (GEOGuideLocation)guideLocation;
- (GEOPlaceCollection)featuredGuide;
- (GuidesHomeHeaderViewModel)initWithGuideLocation:(id)a3 featuredGuide:(id)a4 sectionTitle:(id)a5;
- (MKPlaceCollectionViewModel)viewModel;
- (NSAttributedString)collectionLongTitle;
- (NSAttributedString)collectionTitle;
- (NSAttributedString)sectionTitle;
- (NSString)guideLocationTitle;
- (UIColor)backgroundColor;
- (UIImage)collectionImage;
- (UIImage)publisherLogoImage;
- (void)collectionImageForSize:(CGSize)a3 onCompletion:(id)a4;
- (void)publisherLogoImageWithCompletion:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCollectionImage:(id)a3;
- (void)setCollectionLongTitle:(id)a3;
- (void)setCollectionTitle:(id)a3;
- (void)setGuideLocationTitle:(id)a3;
- (void)setPhotoSize:(CGSize)a3;
- (void)setPublisherLogoImage:(id)a3;
- (void)setSectionTitle:(id)a3;
- (void)setViewModel:(id)a3;
@end

@implementation GuidesHomeHeaderViewModel

- (GuidesHomeHeaderViewModel)initWithGuideLocation:(id)a3 featuredGuide:(id)a4 sectionTitle:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v26.receiver = self;
  v26.super_class = (Class)GuidesHomeHeaderViewModel;
  v12 = [(GuidesHomeHeaderViewModel *)&v26 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_featuredGuide, a4);
    objc_storeStrong((id *)&v13->_guideLocation, a3);
    id v14 = objc_alloc((Class)NSAttributedString);
    v27[0] = NSFontAttributeName;
    v15 = +[UIFont systemFontOfSize:11.0];
    v28[0] = v15;
    v27[1] = NSForegroundColorAttributeName;
    v16 = +[UIColor whiteColor];
    v17 = [v16 colorWithAlphaComponent:0.6];
    v28[1] = v17;
    v18 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    v19 = (NSAttributedString *)[v14 initWithString:v11 attributes:v18];
    sectionTitle = v13->_sectionTitle;
    v13->_sectionTitle = v19;

    id v21 = objc_alloc((Class)MKPlaceCollectionViewModel);
    v22 = +[UIFont system28Bold];
    v23 = (MKPlaceCollectionViewModel *)[v21 initWithGEOPlaceCollection:v10 usingSyncCoordinator:0 inContext:9 usingTitleFont:v22];
    viewModel = v13->_viewModel;
    v13->_viewModel = v23;
  }
  return v13;
}

- (UIColor)backgroundColor
{
  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
  {
    v4 = [(GuidesHomeHeaderViewModel *)self viewModel];
    v5 = [v4 backgroundColor];
    v6 = self->_backgroundColor;
    self->_backgroundColor = v5;

    v7 = +[MKPlaceCollectionImageProvider sharedInstance];
    v8 = [(GuidesHomeHeaderViewModel *)self featuredGuide];
    unsigned __int8 v9 = [v7 isJoeColorManuallyCuratedForCuratedCollection:v8];

    if ((v9 & 1) == 0)
    {
      id v10 = self->_backgroundColor;
      id v11 = +[UIColor blackColor];
      v12 = [v11 colorWithAlphaComponent:0.3];
      v13 = [(UIColor *)v10 _colorBlendedWithColor:v12 compositingFilter:kCAFilterDarkenBlendMode];
      id v14 = self->_backgroundColor;
      self->_backgroundColor = v13;
    }
    backgroundColor = self->_backgroundColor;
  }
  v15 = backgroundColor;

  return v15;
}

- (NSAttributedString)collectionTitle
{
  collectionTitle = self->_collectionTitle;
  if (!collectionTitle)
  {
    v4 = [(GuidesHomeHeaderViewModel *)self viewModel];
    v5 = [v4 collectionTitle];
    v6 = self->_collectionTitle;
    self->_collectionTitle = v5;

    collectionTitle = self->_collectionTitle;
  }
  v7 = collectionTitle;

  return v7;
}

- (NSAttributedString)collectionLongTitle
{
  collectionLongTitle = self->_collectionLongTitle;
  if (!collectionLongTitle)
  {
    v4 = [(GuidesHomeHeaderViewModel *)self viewModel];
    v5 = [v4 collectionLongTitle];
    v6 = self->_collectionLongTitle;
    self->_collectionLongTitle = v5;

    collectionLongTitle = self->_collectionLongTitle;
  }
  v7 = collectionLongTitle;

  return v7;
}

- (NSString)guideLocationTitle
{
  guideLocationTitle = self->_guideLocationTitle;
  if (!guideLocationTitle)
  {
    v4 = [(GuidesHomeHeaderViewModel *)self guideLocation];
    v5 = [v4 title];
    v6 = self->_guideLocationTitle;
    self->_guideLocationTitle = v5;

    guideLocationTitle = self->_guideLocationTitle;
  }
  v7 = guideLocationTitle;

  return v7;
}

- (void)publisherLogoImageWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(GuidesHomeHeaderViewModel *)self viewModel];
  [v5 publisherLogoImageWithCompletion:v4];
}

- (void)setBackgroundColor:(id)a3
{
}

- (void)setCollectionTitle:(id)a3
{
}

- (void)setCollectionLongTitle:(id)a3
{
}

- (void)setGuideLocationTitle:(id)a3
{
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (GEOPlaceCollection)featuredGuide
{
  return self->_featuredGuide;
}

- (NSAttributedString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
}

- (MKPlaceCollectionViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (CGSize)photoSize
{
  double width = self->_photoSize.width;
  double height = self->_photoSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPhotoSize:(CGSize)a3
{
  self->_photoSize = a3;
}

- (UIImage)publisherLogoImage
{
  return (UIImage *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPublisherLogoImage:(id)a3
{
}

- (UIImage)collectionImage
{
  return self->_collectionImage;
}

- (void)setCollectionImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionImage, 0);
  objc_storeStrong((id *)&self->_publisherLogoImage, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
  objc_storeStrong((id *)&self->_featuredGuide, 0);
  objc_storeStrong((id *)&self->_guideLocation, 0);
  objc_storeStrong((id *)&self->_guideLocationTitle, 0);
  objc_storeStrong((id *)&self->_collectionLongTitle, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);

  objc_storeStrong((id *)&self->_backgroundColor, 0);
}

- (void)collectionImageForSize:(CGSize)a3 onCompletion:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(GuidesHomeHeaderViewModel *)self viewModel];
  [v8 collectionImageForSize:v7 onCompletion:width, height];
}

@end