@interface VUIFamilySharingLibraryShelvesDataSource
- (NSMutableSet)fetchedDataSources;
- (VUIFamilyMember)familyMember;
- (VUIFamilySharingLibraryShelvesDataSource)initWithValidShelfTypes:(id)a3 withFamilyMember:(id)a4;
- (id)_dataSourceForShelves;
- (void)dataSourceDidFinishFetching:(id)a3;
- (void)dealloc;
- (void)setFamilyMember:(id)a3;
- (void)setFetchedDataSources:(id)a3;
- (void)startFetch;
@end

@implementation VUIFamilySharingLibraryShelvesDataSource

- (VUIFamilySharingLibraryShelvesDataSource)initWithValidShelfTypes:(id)a3 withFamilyMember:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VUIFamilySharingLibraryShelvesDataSource;
  v8 = [(VUILibraryShelvesDataSource *)&v11 initWithValidShelfTypes:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_familyMember, a4);
  }

  return v9;
}

- (void)dealloc
{
  [(NSMutableSet *)self->_fetchedDataSources removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)VUIFamilySharingLibraryShelvesDataSource;
  [(VUIFamilySharingLibraryShelvesDataSource *)&v3 dealloc];
}

- (void)startFetch
{
  objc_super v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  fetchedDataSources = self->_fetchedDataSources;
  self->_fetchedDataSources = v3;

  id v5 = [(VUIFamilySharingLibraryShelvesDataSource *)self _dataSourceForShelves];
  [(VUILibraryShelvesDataSource *)self setDataSourcesByShelfType:v5];
}

- (void)dataSourceDidFinishFetching:(id)a3
{
  id v4 = a3;
  [(NSMutableSet *)self->_fetchedDataSources addObject:v4];
  unint64_t v5 = [(NSMutableSet *)self->_fetchedDataSources count];
  v6 = [(VUILibraryShelvesDataSource *)self shelfTypes];
  unint64_t v7 = [v6 count];

  if (v5 >= v7)
  {
    objc_initWeak(&location, self);
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    objc_super v11 = __72__VUIFamilySharingLibraryShelvesDataSource_dataSourceDidFinishFetching___block_invoke;
    v12 = &unk_1E6DF4A30;
    objc_copyWeak(&v13, &location);
    v8 = &v9;
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v9, v10)) {
      v11((uint64_t)v8);
    }
    else {
      dispatch_async(MEMORY[0x1E4F14428], v8);
    }

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
}

void __72__VUIFamilySharingLibraryShelvesDataSource_dataSourceDidFinishFetching___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained shelvesDelegate];
  if (objc_opt_respondsToSelector()) {
    [v1 shelvesDidFinishWithDataSource:WeakRetained];
  }
}

- (id)_dataSourceForShelves
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(VUILibraryShelvesDataSource *)self shelfTypes];
  uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v9 = [v8 unsignedIntegerValue];
        uint64_t v10 = [(VUIFamilySharingLibraryShelvesDataSource *)self familyMember];
        objc_super v11 = +[VUIMediaEntitiesDataSourceFactory dataSourceForShelf:v9 withFamilyMember:v10];

        [v11 setDelegate:self];
        [v11 startFetch];
        [v3 setObject:v11 forKey:v8];
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }

  v12 = (void *)[v3 copy];
  return v12;
}

- (VUIFamilyMember)familyMember
{
  return self->_familyMember;
}

- (void)setFamilyMember:(id)a3
{
}

- (NSMutableSet)fetchedDataSources
{
  return self->_fetchedDataSources;
}

- (void)setFetchedDataSources:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchedDataSources, 0);
  objc_storeStrong((id *)&self->_familyMember, 0);
}

@end