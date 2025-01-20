@interface VUILibraryShelvesDataSource
- (NSDictionary)dataSourcesByShelfType;
- (NSSet)shelfTypes;
- (VUILibraryShelvesDataSource)initWithValidShelfTypes:(id)a3;
- (VUIShelvesDataSourceDelegate)shelvesDelegate;
- (void)setDataSourcesByShelfType:(id)a3;
- (void)setShelfTypes:(id)a3;
- (void)setShelvesDelegate:(id)a3;
@end

@implementation VUILibraryShelvesDataSource

- (VUILibraryShelvesDataSource)initWithValidShelfTypes:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUILibraryShelvesDataSource;
  v6 = [(VUILibraryShelvesDataSource *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_shelfTypes, a3);
  }

  return v7;
}

- (NSSet)shelfTypes
{
  return self->_shelfTypes;
}

- (void)setShelfTypes:(id)a3
{
}

- (NSDictionary)dataSourcesByShelfType
{
  return self->_dataSourcesByShelfType;
}

- (void)setDataSourcesByShelfType:(id)a3
{
}

- (VUIShelvesDataSourceDelegate)shelvesDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_shelvesDelegate);
  return (VUIShelvesDataSourceDelegate *)WeakRetained;
}

- (void)setShelvesDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shelvesDelegate);
  objc_storeStrong((id *)&self->_dataSourcesByShelfType, 0);
  objc_storeStrong((id *)&self->_shelfTypes, 0);
}

@end