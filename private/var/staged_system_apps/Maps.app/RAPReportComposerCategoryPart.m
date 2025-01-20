@interface RAPReportComposerCategoryPart
- (RAPReportComposerCategoryPart)initWithCategoryQuestion:(id)a3 selection:(id)a4;
- (void)_createSectionsForQuestion:(id)a3 withSelection:(id)a4;
@end

@implementation RAPReportComposerCategoryPart

- (RAPReportComposerCategoryPart)initWithCategoryQuestion:(id)a3 selection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RAPReportComposerCategoryPart;
  v8 = [(RAPTablePart *)&v11 initWithSections:&__NSArray0__struct];
  v9 = v8;
  if (v8) {
    [(RAPReportComposerCategoryPart *)v8 _createSectionsForQuestion:v6 withSelection:v7];
  }

  return v9;
}

- (void)_createSectionsForQuestion:(id)a3 withSelection:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  id v7 = +[NSMutableArray array];
  v8 = (char *)[v15 numberOfSections];
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    objc_super v11 = 0;
    do
    {
      if (v10)
      {
        v12 = 0;
      }
      else
      {
        v12 = [(id)objc_opt_class() localizedHeaderText];
      }

      v13 = [[RAPReportComposerMenuSection alloc] initWithMenu:v15 headerText:v12 menuSectionIndex:v10 selection:v6];
      [v7 addObject:v13];

      ++v10;
      objc_super v11 = v12;
    }
    while (v9 != v10);
  }
  id v14 = [v7 copy];
  [(RAPTablePart *)self setSections:v14];
}

@end