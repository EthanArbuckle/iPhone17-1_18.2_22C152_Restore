@interface NUDocumentSectionItem
- (NUDocumentSectionItem)initWithViewController:(id)a3 heightProvider:(id)a4;
- (NUDocumentSectionItemHeightProvider)heightProvider;
- (UIViewController)viewController;
- (double)sectionHeight;
- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4;
- (id)sectionItemViewController;
@end

@implementation NUDocumentSectionItem

- (NUDocumentSectionItem)initWithViewController:(id)a3 heightProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NUDocumentSectionItem;
  v9 = [(NUDocumentSectionItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewController, a3);
    objc_storeStrong((id *)&v10->_heightProvider, a4);
  }

  return v10;
}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = [(NUDocumentSectionItem *)self heightProvider];
  objc_msgSend(v8, "sectionItemHeightForSize:traitCollection:", v7, width, height);
  double v10 = v9;

  return v10;
}

- (id)sectionItemViewController
{
  return self->_viewController;
}

- (UIViewController)viewController
{
  return (UIViewController *)objc_getProperty(self, a2, 8, 1);
}

- (NUDocumentSectionItemHeightProvider)heightProvider
{
  return (NUDocumentSectionItemHeightProvider *)objc_getProperty(self, a2, 16, 1);
}

- (double)sectionHeight
{
  return self->_sectionHeight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heightProvider, 0);

  objc_storeStrong((id *)&self->_viewController, 0);
}

@end