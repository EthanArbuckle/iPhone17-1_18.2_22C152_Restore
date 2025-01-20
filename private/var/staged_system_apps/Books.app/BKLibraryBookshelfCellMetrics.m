@interface BKLibraryBookshelfCellMetrics
+ (id)cellMetricsForSectionName:(id)a3;
+ (id)sectionName;
+ (id)sectionNameForCollectionType:(unint64_t)a3 layoutMode:(unint64_t)a4;
+ (id)sectionNames;
- (UIBackgroundConfiguration)backgroundConfiguration;
- (id)backgroundConfigurationForState:(id)a3 isInEditMode:(BOOL)a4;
- (int)cellType;
- (void)configureWithSection:(id)a3;
- (void)setBackgroundConfiguration:(id)a3;
- (void)setCellType:(int)a3;
@end

@implementation BKLibraryBookshelfCellMetrics

+ (id)cellMetricsForSectionName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"bookCellGrid"])
  {
    v4 = off_100A3BFF8;
LABEL_9:
    id v5 = objc_alloc_init(*v4);
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"bookCellListUser"])
  {
    v4 = off_100A3C000;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"bookCellListFinished"])
  {
    v4 = off_100A3BFF0;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"bookCellListWantToRead"])
  {
    v4 = off_100A3C008;
    goto LABEL_9;
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

+ (id)sectionNameForCollectionType:(unint64_t)a3 layoutMode:(unint64_t)a4
{
  id result = @"bookCellGrid";
  if (a4 == 2 && a3 <= 3) {
    return off_100A44EC8[a3];
  }
  return result;
}

+ (id)sectionName
{
  return 0;
}

+ (id)sectionNames
{
  v4[0] = @"bookCellGrid";
  v4[1] = @"bookCellListUser";
  v4[2] = @"bookCellListFinished";
  v4[3] = @"bookCellListWantToRead";
  v2 = +[NSArray arrayWithObjects:v4 count:4];

  return v2;
}

- (void)configureWithSection:(id)a3
{
  id v4 = a3;
  id v13 = +[UIBackgroundConfiguration listPlainCellConfiguration];
  [v4 floatForKey:@"background-corner-radius"];
  [v13 setCornerRadius:];
  [v4 insetsForKey:@"background-insets"];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v13 setBackgroundInsets:v6, v8, v10, v12];
  [v13 setBackgroundColorTransformer:&stru_100A44EA8];
  [(BKLibraryBookshelfCellMetrics *)self setBackgroundConfiguration:v13];
}

- (id)backgroundConfigurationForState:(id)a3 isInEditMode:(BOOL)a4
{
  id v6 = a3;
  double v7 = [(BKLibraryBookshelfCellMetrics *)self backgroundConfiguration];
  double v8 = [v7 updatedConfigurationForState:v6];

  LODWORD(v7) = [v6 isSelected];
  if (!v7 || a4)
  {
    double v9 = v8;
    double v8 = 0;
  }
  else
  {
    double v9 = +[UIColor bc_booksKeyColor];
    [v8 setBackgroundColor:v9];
  }

  return v8;
}

- (int)cellType
{
  return self->_cellType;
}

- (void)setCellType:(int)a3
{
  self->_cellType = a3;
}

- (UIBackgroundConfiguration)backgroundConfiguration
{
  return self->_backgroundConfiguration;
}

- (void)setBackgroundConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
}

@end