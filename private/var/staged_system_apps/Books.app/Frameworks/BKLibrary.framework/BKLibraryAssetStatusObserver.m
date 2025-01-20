@interface BKLibraryAssetStatusObserver
- (BKLibraryAssetStatusObserver)initWithFilter:(id)a3 notify:(id)a4;
- (IMArrayController)controller;
- (id)notify;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setController:(id)a3;
- (void)setNotify:(id)a3;
@end

@implementation BKLibraryAssetStatusObserver

- (BKLibraryAssetStatusObserver)initWithFilter:(id)a3 notify:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)BKLibraryAssetStatusObserver;
  v8 = [(BKLibraryAssetStatusObserver *)&v15 init];
  if (v8)
  {
    v9 = +[BKLibraryAssetStatusController sharedController];
    uint64_t v10 = [v9 _addArrayControllerWithFilter:v6];
    controller = v8->_controller;
    v8->_controller = (IMArrayController *)v10;

    [(IMArrayController *)v8->_controller addObserver:v8 forKeyPath:@"arrangedObjects" options:3 context:off_ED460];
    id v12 = [v7 copy];
    id notify = v8->_notify;
    v8->_id notify = v12;
  }
  return v8;
}

- (void)dealloc
{
  [(IMArrayController *)self->_controller removeObserver:self forKeyPath:@"arrangedObjects" context:off_ED460];
  v3 = +[BKLibraryAssetStatusController sharedController];
  [v3 _removeArrayController:self->_controller];

  v4.receiver = self;
  v4.super_class = (Class)BKLibraryAssetStatusObserver;
  [(BKLibraryAssetStatusObserver *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_ED460 == a6)
  {
    id v11 = a5;
    objc_opt_class();
    id v12 = [v11 objectForKey:NSKeyValueChangeOldKey];
    BUDynamicCast();
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v13 = [v11 objectForKey:NSKeyValueChangeNewKey];

    v14 = BUDynamicCast();

    objc_super v15 = +[NSMutableSet setWithArray:v14];
    v16 = +[NSSet setWithArray:v19];
    [v15 minusSet:v16];

    v17 = +[NSMutableSet setWithArray:v19];
    v18 = +[NSSet setWithArray:v14];
    [v17 minusSet:v18];

    if ([v15 count] || objc_msgSend(v17, "count")) {
      (*((void (**)(void))self->_notify + 2))();
    }
  }
  else
  {
    v20.receiver = self;
    v20.super_class = (Class)BKLibraryAssetStatusObserver;
    id v10 = a5;
    [(BKLibraryAssetStatusObserver *)&v20 observeValueForKeyPath:a3 ofObject:a4 change:v10 context:a6];
  }
}

- (IMArrayController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (id)notify
{
  return self->_notify;
}

- (void)setNotify:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_notify, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end