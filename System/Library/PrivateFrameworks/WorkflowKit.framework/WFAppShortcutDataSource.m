@interface WFAppShortcutDataSource
- (WFAppShortcutDataSource)initWithAppShortcutsDenyListEnvironment:(unint64_t)a3 environment:(int64_t)a4;
- (WFSwiftAppShortcutDataSource)dataSource;
- (id)fetchAppShortcutsForBundleIdentifiers:(id)a3 localeIdentifier:(id)a4 error:(id *)a5;
@end

@implementation WFAppShortcutDataSource

- (void).cxx_destruct
{
}

- (WFSwiftAppShortcutDataSource)dataSource
{
  return self->_dataSource;
}

- (id)fetchAppShortcutsForBundleIdentifiers:(id)a3 localeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(WFAppShortcutDataSource *)self dataSource];
  v11 = [v10 fetchAppShortcutForBundleIdentifiers:v9 localeIdentifier:v8 error:a5];

  return v11;
}

- (WFAppShortcutDataSource)initWithAppShortcutsDenyListEnvironment:(unint64_t)a3 environment:(int64_t)a4
{
  v12.receiver = self;
  v12.super_class = (Class)WFAppShortcutDataSource;
  v6 = [(WFAppShortcutDataSource *)&v12 init];
  if (v6)
  {
    if (a4 != 2) {
      a4 = a4 == 1;
    }
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F72B50]) initWithOptions:2];
    id v8 = [[WFSwiftAppShortcutDataSource alloc] initWithAppShortcutsProvider:v7 denyListEnvironment:a3 organizationStyle:a4];
    dataSource = v6->_dataSource;
    v6->_dataSource = v8;

    v10 = v6;
  }

  return v6;
}

@end