@interface BKLibraryBookshelfMetrics
+ (id)_manager;
+ (id)_metricsTemplateURL;
+ (id)_templateFactory;
+ (id)_templatePackageURL;
+ (id)supportedMetrics;
- (BCLayoutMetrics)metrics;
- (BKLibraryBookshelfMetrics)initWithObserver:(id)a3;
- (BOOL)compactWidth;
- (BOOL)editMode;
- (BOOL)isPopover;
- (BOOL)updateIfNeededWithEnvironment:(id)a3 bookshelfLayoutMode:(unint64_t)a4 editMode:(BOOL)a5 isPopover:(BOOL)a6;
- (NSDictionary)computedMetrics;
- (id)metricsTemplateURL;
- (unint64_t)bookshelfLayoutMode;
- (void)addSymbolsToMetricsEnvironment:(id)a3 package:(id)a4;
- (void)invalidate;
- (void)setBookshelfLayoutMode:(unint64_t)a3;
- (void)setEditMode:(BOOL)a3;
- (void)setIsPopover:(BOOL)a3;
- (void)setMetrics:(id)a3;
@end

@implementation BKLibraryBookshelfMetrics

+ (id)_manager
{
  if (qword_100B4A1E8 != -1) {
    dispatch_once(&qword_100B4A1E8, &stru_100A43ED8);
  }
  v2 = (void *)qword_100B4A1E0;

  return v2;
}

+ (id)_templatePackageURL
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"BKLibraryBookshelfConfiguration" withExtension:@"tpkg"];

  return v3;
}

+ (id)_templateFactory
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100093F2C;
  block[3] = &unk_100A43EF8;
  block[4] = a1;
  if (qword_100B4A1F8 != -1) {
    dispatch_once(&qword_100B4A1F8, block);
  }
  v2 = (void *)qword_100B4A1F0;

  return v2;
}

+ (id)_metricsTemplateURL
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000940A4;
  block[3] = &unk_100A43EF8;
  block[4] = a1;
  if (qword_100B4A208 != -1) {
    dispatch_once(&qword_100B4A208, block);
  }
  v2 = (void *)qword_100B4A200;

  return v2;
}

- (BKLibraryBookshelfMetrics)initWithObserver:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)BKLibraryBookshelfMetrics;
  v5 = [(BKLibraryBookshelfMetrics *)&v12 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)BCLayoutMetrics);
    v7 = [(id)objc_opt_class() _templateFactory];
    v8 = [(id)objc_opt_class() _manager];
    v9 = (BCLayoutMetrics *)[v6 initWithObserver:v4 factory:v7 manager:v8 delegate:v5];
    metrics = v5->_metrics;
    v5->_metrics = v9;
  }
  return v5;
}

- (NSDictionary)computedMetrics
{
  return (NSDictionary *)[(BCLayoutMetrics *)self->_metrics metrics];
}

- (BOOL)updateIfNeededWithEnvironment:(id)a3 bookshelfLayoutMode:(unint64_t)a4 editMode:(BOOL)a5 isPopover:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  if (self->_bookshelfLayoutMode != a4 || self->_editMode != v7 || self->_isPopover != v6)
  {
    self->_bookshelfLayoutMode = a4;
    self->_editMode = v7;
    self->_isPopover = v6;
    v11 = [(BKLibraryBookshelfMetrics *)self metrics];
    [v11 invalidate];
  }
  objc_super v12 = [(BKLibraryBookshelfMetrics *)self metrics];
  unsigned __int8 v13 = [v12 updateIfNeededWithEnvironment:v10];

  return v13;
}

- (void)invalidate
{
  id v2 = [(BKLibraryBookshelfMetrics *)self metrics];
  [v2 invalidate];
}

- (BOOL)compactWidth
{
  id v2 = [(BKLibraryBookshelfMetrics *)self metrics];
  unsigned __int8 v3 = [v2 compactWidth];

  return v3;
}

- (id)metricsTemplateURL
{
  id v2 = objc_opt_class();

  return _[v2 _metricsTemplateURL];
}

- (void)addSymbolsToMetricsEnvironment:(id)a3 package:(id)a4
{
  id v6 = a4;
  id v14 = a3;
  unsigned int v7 = [v6 nameForString:@"libraryEnv::layoutMode"];
  if ((id)[(BKLibraryBookshelfMetrics *)self bookshelfLayoutMode] == (id)1) {
    CFStringRef v8 = @"grid";
  }
  else {
    CFStringRef v8 = @"list";
  }
  objc_msgSend(v14, "setSymbol:forName:", (unsigned __int16)objc_msgSend(v6, "symbolForString:", v8), v7);
  unsigned int v9 = [v6 nameForString:@"libraryEnv::interactionMode"];
  if ([(BKLibraryBookshelfMetrics *)self editMode]) {
    CFStringRef v10 = @"edit";
  }
  else {
    CFStringRef v10 = @"none";
  }
  [v14 setSymbol:(unsigned __int16)[v6 symbolForString:v10] forName:v9];
  unsigned int v11 = [v6 nameForString:@"libraryEnv::popoverMode"];
  if ([(BKLibraryBookshelfMetrics *)self isPopover]) {
    CFStringRef v12 = @"popover";
  }
  else {
    CFStringRef v12 = @"none";
  }
  unsigned __int16 v13 = (unsigned __int16)[v6 symbolForString:v12];

  [v14 setSymbol:v13 forName:v11];
}

+ (id)supportedMetrics
{
  id v2 = objc_opt_new();
  v21[0] = v2;
  unsigned __int8 v3 = objc_opt_new();
  v21[1] = v3;
  id v4 = objc_opt_new();
  v21[2] = v4;
  v5 = objc_opt_new();
  v21[3] = v5;
  id v6 = objc_opt_new();
  v21[4] = v6;
  unsigned int v7 = +[NSArray arrayWithObjects:v21 count:5];
  id v8 = [v7 mutableCopy];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned int v9 = +[BKLibraryBookshelfCellMetrics sectionNames];
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        id v14 = +[BKLibraryBookshelfCellMetrics cellMetricsForSectionName:*(void *)(*((void *)&v16 + 1) + 8 * i)];
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

- (BCLayoutMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (unint64_t)bookshelfLayoutMode
{
  return self->_bookshelfLayoutMode;
}

- (void)setBookshelfLayoutMode:(unint64_t)a3
{
  self->_bookshelfLayoutMode = a3;
}

- (BOOL)editMode
{
  return self->_editMode;
}

- (void)setEditMode:(BOOL)a3
{
  self->_editMode = a3;
}

- (BOOL)isPopover
{
  return self->_isPopover;
}

- (void)setIsPopover:(BOOL)a3
{
  self->_isPopover = a3;
}

- (void).cxx_destruct
{
}

@end