@interface UITableViewDataSource
+ (id)staticDataSourceWithSections:(id)a3;
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (NSArray)sections;
- (UITableViewDataSource)initWithCoder:(id)a3;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setSections:(id)a3;
@end

@implementation UITableViewDataSource

+ (id)staticDataSourceWithSections:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setSections:v3];

  return v4;
}

- (UITableViewDataSource)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITableViewDataSource;
  v5 = [(UITableViewDataSource *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"UITableSections"];
    sections = v5->_sections;
    v5->_sections = (NSArray *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sections = self->_sections;
  if (sections) {
    [a3 encodeObject:sections forKey:@"UITableSections"];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return [(NSArray *)self->_sections count];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sections objectAtIndex:a4];
  v5 = [v4 rows];
  int64_t v6 = [v5 count];

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v5 = a4;
  int64_t v6 = -[NSArray objectAtIndex:](sections, "objectAtIndex:", [v5 section]);
  v7 = [v6 rows];
  uint64_t v8 = [v5 row];

  objc_super v9 = [v7 objectAtIndex:v8];
  v10 = [v9 cell];

  if (!v10) {
    v10 = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"blank-cell"];
  }
  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sections objectAtIndex:a4];
  id v5 = [v4 headerTitle];

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sections objectAtIndex:a4];
  id v5 = [v4 footerTitle];

  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sections objectAtIndex:a4];
  id v5 = [v4 headerView];

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sections objectAtIndex:a4];
  id v5 = [v4 footerView];

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sections objectAtIndex:a4];
  id v5 = [v4 headerView];

  if (v5)
  {
    [v5 frame];
    double v7 = v6;
  }
  else
  {
    double v7 = -1.0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  id v4 = [(NSArray *)self->_sections objectAtIndex:a4];
  id v5 = [v4 headerView];

  if (v5)
  {
    [v5 frame];
    double v7 = v6;
  }
  else
  {
    double v7 = -1.0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  sections = self->_sections;
  id v8 = a4;
  objc_super v9 = -[NSArray objectAtIndex:](sections, "objectAtIndex:", [v8 section]);
  v10 = [v9 rows];
  uint64_t v11 = [v8 row];

  v12 = [v10 objectAtIndex:v11];
  [v12 height];
  double v14 = v13;

  if (v14 == -1.0)
  {
    [v6 rowHeight];
    double v14 = v15;
  }

  return v14;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  sections = self->_sections;
  id v5 = a4;
  id v6 = -[NSArray objectAtIndex:](sections, "objectAtIndex:", [v5 section]);
  double v7 = [v6 rows];
  uint64_t v8 = [v5 row];

  objc_super v9 = [v7 objectAtIndex:v8];
  v10 = [v9 cell];
  int64_t v11 = [v10 indentationLevel];

  return v11;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
}

- (void).cxx_destruct
{
}

@end