@interface CarSmallWidgetSearchCategoriesCellModel
- (BOOL)vibrantBackground;
- (BrowseCategory)category;
- (CarSmallWidgetSearchCategoriesCellModel)initWithBrowseCategory:(id)a3;
- (id)_maps_diffableDataSourceIdentifier;
- (id)image;
- (id)subtitle;
- (id)title;
@end

@implementation CarSmallWidgetSearchCategoriesCellModel

- (CarSmallWidgetSearchCategoriesCellModel)initWithBrowseCategory:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CarSmallWidgetSearchCategoriesCellModel;
  v6 = [(CarSmallWidgetSearchCategoriesCellModel *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_category, a3);
  }

  return v7;
}

- (id)_maps_diffableDataSourceIdentifier
{
  return [(BrowseCategory *)self->_category name];
}

- (id)title
{
  v3 = [(BrowseCategory *)self->_category alternativeName];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(BrowseCategory *)self->_category name];
  }
  v6 = v5;

  return v6;
}

- (id)subtitle
{
  return 0;
}

- (id)image
{
  image = self->_image;
  if (!image)
  {
    v4 = +[BrowseManager sharedManager];
    id v5 = [v4 synchronousImageForCategory:self->_category scale:1 isCarplay:0.0];
    v6 = self->_image;
    self->_image = v5;

    [(UIImage *)self->_image setAccessibilityIdentifier:@"CarSmallWidgetSearchCategoryImage"];
    image = self->_image;
  }

  return image;
}

- (BOOL)vibrantBackground
{
  return 0;
}

- (BrowseCategory)category
{
  return self->_category;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_category, 0);

  objc_storeStrong((id *)&self->_image, 0);
}

@end