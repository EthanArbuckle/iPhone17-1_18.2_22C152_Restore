@interface UIKBAutoFillTestArchive
+ (id)autoFillTestArchiveWithData:(id)a3;
- (BOOL)requiresNavigationControllerNesting;
- (NSString)navigationControllerClassName;
- (NSString)presentingViewControllerClassName;
- (NSString)viewControllerClassName;
- (NSString)viewControllerTitle;
- (UIKBAutoFillTestArchive)init;
- (UIKBAutoFillTestArchive)initWithCoder:(id)a3;
- (UIKBAutoFillTestExpectedResult)expectedResult;
- (UINavigationItem)viewControllerNavigationItem;
- (UIView)snapshotView;
- (id)autoFillTestArchiveData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)tableViewDataSourceWithTag:(int64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setExpectedResult:(id)a3;
- (void)setNavigationControllerClassName:(id)a3;
- (void)setPresentingViewControllerClassName:(id)a3;
- (void)setRequiresNavigationControllerNesting:(BOOL)a3;
- (void)setSnapshotView:(id)a3;
- (void)setTableViewDataSource:(id)a3 forTableViewWithTag:(int64_t)a4;
- (void)setViewControllerClassName:(id)a3;
- (void)setViewControllerNavigationItem:(id)a3;
- (void)setViewControllerTitle:(id)a3;
@end

@implementation UIKBAutoFillTestArchive

- (UIKBAutoFillTestArchive)init
{
  v7.receiver = self;
  v7.super_class = (Class)UIKBAutoFillTestArchive;
  v2 = [(UIKBAutoFillTestArchive *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
    tableViewTagToDataSource = v2->_tableViewTagToDataSource;
    v2->_tableViewTagToDataSource = (NSMutableDictionary *)v3;

    v5 = v2;
  }

  return v2;
}

- (UIKBAutoFillTestArchive)initWithCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)UIKBAutoFillTestArchive;
  v5 = [(UIKBAutoFillTestArchive *)&v27 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"snapshotView"];
    snapshotView = v5->_snapshotView;
    v5->_snapshotView = (UIView *)v6;

    v8 = [v4 decodeObjectForKey:@"tableViewTagToDataSource"];
    uint64_t v9 = [v8 mutableCopy];
    tableViewTagToDataSource = v5->_tableViewTagToDataSource;
    v5->_tableViewTagToDataSource = (NSMutableDictionary *)v9;

    v11 = [v4 decodeObjectForKey:@"viewControllerClassName"];
    uint64_t v12 = [v11 copy];
    viewControllerClassName = v5->_viewControllerClassName;
    v5->_viewControllerClassName = (NSString *)v12;

    v14 = [v4 decodeObjectForKey:@"viewControllerTitle"];
    uint64_t v15 = [v14 copy];
    viewControllerTitle = v5->_viewControllerTitle;
    v5->_viewControllerTitle = (NSString *)v15;

    uint64_t v17 = [v4 decodeObjectForKey:@"viewControllerNavigationItem"];
    viewControllerNavigationItem = v5->_viewControllerNavigationItem;
    v5->_viewControllerNavigationItem = (UINavigationItem *)v17;

    v5->_requiresNavigationControllerNesting = [v4 decodeBoolForKey:@"requiresNavigationControllerNesting"];
    uint64_t v19 = [v4 decodeObjectForKey:@"navigationControllerClassName"];
    navigationControllerClassName = v5->_navigationControllerClassName;
    v5->_navigationControllerClassName = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectForKey:@"presentingViewControllerClassName"];
    presentingViewControllerClassName = v5->_presentingViewControllerClassName;
    v5->_presentingViewControllerClassName = (NSString *)v21;

    uint64_t v23 = [v4 decodeObjectForKey:@"expectedResult"];
    expectedResult = v5->_expectedResult;
    v5->_expectedResult = (UIKBAutoFillTestExpectedResult *)v23;

    v25 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  snapshotView = self->_snapshotView;
  id v6 = v4;
  if (snapshotView)
  {
    [v4 encodeObject:snapshotView forKey:@"snapshotView"];
    id v4 = v6;
  }
  [v4 encodeObject:self->_tableViewTagToDataSource forKey:@"tableViewTagToDataSource"];
  [v6 encodeObject:self->_viewControllerClassName forKey:@"viewControllerClassName"];
  [v6 encodeObject:self->_viewControllerTitle forKey:@"viewControllerTitle"];
  [v6 encodeObject:self->_viewControllerNavigationItem forKey:@"viewControllerNavigationItem"];
  [v6 encodeBool:self->_requiresNavigationControllerNesting forKey:@"requiresNavigationControllerNesting"];
  [v6 encodeObject:self->_navigationControllerClassName forKey:@"navigationControllerClassName"];
  [v6 encodeObject:self->_presentingViewControllerClassName forKey:@"presentingViewControllerClassName"];
  [v6 encodeObject:self->_expectedResult forKey:@"expectedResult"];
}

+ (id)autoFillTestArchiveWithData:(id)a3
{
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F28DC0];
  id v4 = a3;
  uint64_t v9 = 0;
  v5 = (void *)[[v3 alloc] initForReadingFromData:v4 error:&v9];

  id v6 = 0;
  if (!v9)
  {
    [v5 setRequiresSecureCoding:0];
    objc_super v7 = [v5 decodeObjectForKey:@"testArchive"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v7;
    }
    else {
      id v6 = 0;
    }
  }
  return v6;
}

- (id)autoFillTestArchiveData
{
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:0];
  [v3 encodeObject:self forKey:@"testArchive"];
  id v4 = [v3 encodedData];

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v3 = [(UIKBAutoFillTestArchive *)self autoFillTestArchiveData];
  id v4 = +[UIKBAutoFillTestArchive autoFillTestArchiveWithData:v3];

  return v4;
}

- (id)tableViewDataSourceWithTag:(int64_t)a3
{
  tableViewTagToDataSource = self->_tableViewTagToDataSource;
  id v4 = [NSNumber numberWithInteger:a3];
  v5 = [(NSMutableDictionary *)tableViewTagToDataSource objectForKeyedSubscript:v4];

  return v5;
}

- (void)setTableViewDataSource:(id)a3 forTableViewWithTag:(int64_t)a4
{
  tableViewTagToDataSource = self->_tableViewTagToDataSource;
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithInteger:a4];
  [(NSMutableDictionary *)tableViewTagToDataSource setObject:v7 forKeyedSubscript:v8];
}

- (UIKBAutoFillTestExpectedResult)expectedResult
{
  return self->_expectedResult;
}

- (void)setExpectedResult:(id)a3
{
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void)setSnapshotView:(id)a3
{
}

- (NSString)viewControllerClassName
{
  return self->_viewControllerClassName;
}

- (void)setViewControllerClassName:(id)a3
{
}

- (NSString)viewControllerTitle
{
  return self->_viewControllerTitle;
}

- (void)setViewControllerTitle:(id)a3
{
}

- (BOOL)requiresNavigationControllerNesting
{
  return self->_requiresNavigationControllerNesting;
}

- (void)setRequiresNavigationControllerNesting:(BOOL)a3
{
  self->_requiresNavigationControllerNesting = a3;
}

- (NSString)navigationControllerClassName
{
  return self->_navigationControllerClassName;
}

- (void)setNavigationControllerClassName:(id)a3
{
}

- (NSString)presentingViewControllerClassName
{
  return self->_presentingViewControllerClassName;
}

- (void)setPresentingViewControllerClassName:(id)a3
{
}

- (UINavigationItem)viewControllerNavigationItem
{
  return self->_viewControllerNavigationItem;
}

- (void)setViewControllerNavigationItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerNavigationItem, 0);
  objc_storeStrong((id *)&self->_presentingViewControllerClassName, 0);
  objc_storeStrong((id *)&self->_navigationControllerClassName, 0);
  objc_storeStrong((id *)&self->_viewControllerTitle, 0);
  objc_storeStrong((id *)&self->_viewControllerClassName, 0);
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong((id *)&self->_expectedResult, 0);
  objc_storeStrong((id *)&self->_tableViewTagToDataSource, 0);
}

@end