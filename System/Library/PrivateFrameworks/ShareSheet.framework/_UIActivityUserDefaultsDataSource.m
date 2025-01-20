@interface _UIActivityUserDefaultsDataSource
- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4;
- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4;
- (_UIActivityUserDefaultsDataSourceProxy)dataSourceProxy;
- (void)setDataSourceProxy:(id)a3;
- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5;
- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5;
@end

@implementation _UIActivityUserDefaultsDataSource

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(_UIActivityUserDefaultsDataSource *)self dataSourceProxy];
  char v9 = [v8 tableView:v7 canMoveRowAtIndexPath:v6];

  return v9;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(_UIActivityUserDefaultsDataSource *)self dataSourceProxy];
  [v11 tableView:v10 moveRowAtIndexPath:v9 toIndexPath:v8];
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_UIActivityUserDefaultsDataSource *)self dataSourceProxy];
  char v9 = [v8 tableView:v7 canEditRowAtIndexPath:v6];

  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(_UIActivityUserDefaultsDataSource *)self dataSourceProxy];
  [v10 tableView:v9 commitEditingStyle:a4 forRowAtIndexPath:v8];
}

- (_UIActivityUserDefaultsDataSourceProxy)dataSourceProxy
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSourceProxy);
  return (_UIActivityUserDefaultsDataSourceProxy *)WeakRetained;
}

- (void)setDataSourceProxy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end