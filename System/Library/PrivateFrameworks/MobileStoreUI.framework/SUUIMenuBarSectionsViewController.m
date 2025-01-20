@interface SUUIMenuBarSectionsViewController
- (SUUIMenuBarSectionsViewController)initWithLayoutStyle:(int64_t)a3;
- (id)defaultSectionForComponent:(id)a3;
- (unint64_t)numberOfIterationsForShelfPageSections;
- (void)setNumberOfIterationsForShelfPageSections:(unint64_t)a3;
@end

@implementation SUUIMenuBarSectionsViewController

- (SUUIMenuBarSectionsViewController)initWithLayoutStyle:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SUUIMenuBarSectionsViewController;
  result = [(SUUIStorePageSectionsViewController *)&v4 initWithLayoutStyle:a3];
  if (result) {
    result->_numberOfIterationsForShelfPageSections = 1;
  }
  return result;
}

- (id)defaultSectionForComponent:(id)a3
{
  id v4 = a3;
  if ([v4 componentType] == 22)
  {
    v5 = [[SUUIMenuBarTemplateShelfPageSectionConfiguration alloc] initWithNumberOfIterations:[(SUUIMenuBarSectionsViewController *)self numberOfIterationsForShelfPageSections]];
    v6 = (objc_class *)objc_opt_class();
    v7 = [v4 viewElement];
    int v8 = [v7 isDynamicContainer];

    if (v8) {
      v6 = (objc_class *)objc_opt_class();
    }
    v9 = (void *)[[v6 alloc] initWithPageComponent:v4 configuration:v5];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)numberOfIterationsForShelfPageSections
{
  return self->_numberOfIterationsForShelfPageSections;
}

- (void)setNumberOfIterationsForShelfPageSections:(unint64_t)a3
{
  self->_numberOfIterationsForShelfPageSections = a3;
}

@end