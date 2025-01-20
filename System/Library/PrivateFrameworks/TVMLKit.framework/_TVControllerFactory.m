@interface _TVControllerFactory
- (_TVControllerFactory)init;
- (id)_carouselControllerForElement:(id)a3 layout:(id)a4 existingController:(id)a5;
- (id)_gridControllerForElement:(id)a3 existingController:(id)a4;
- (id)_listControllerForElement:(id)a3 existingController:(id)a4;
- (id)_shelfControllerForElement:(id)a3 existingController:(id)a4;
- (id)_textFieldControllerForElement:(id)a3 existingController:(id)a4;
- (void)_registerControllerCreators;
@end

@implementation _TVControllerFactory

- (_TVControllerFactory)init
{
  v5.receiver = self;
  v5.super_class = (Class)_TVControllerFactory;
  v2 = [(_TVControllerFactory *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_TVControllerFactory *)v2 _registerControllerCreators];
  }
  return v3;
}

- (void)_registerControllerCreators
{
  v3 = +[TVInterfaceFactory sharedInterfaceFactory];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __51___TVControllerFactory__registerControllerCreators__block_invoke;
  v13[3] = &unk_264BA6BE8;
  v13[4] = self;
  [v3 _registerViewControllerCreator:v13 withType:53];

  v4 = +[TVInterfaceFactory sharedInterfaceFactory];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51___TVControllerFactory__registerControllerCreators__block_invoke_2;
  v12[3] = &unk_264BA6BE8;
  v12[4] = self;
  [v4 _registerViewControllerCreator:v12 withType:14];

  objc_super v5 = +[TVInterfaceFactory sharedInterfaceFactory];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __51___TVControllerFactory__registerControllerCreators__block_invoke_3;
  v11[3] = &unk_264BA6BE8;
  v11[4] = self;
  [v5 _registerViewControllerCreator:v11 withType:22];

  v6 = +[TVInterfaceFactory sharedInterfaceFactory];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __51___TVControllerFactory__registerControllerCreators__block_invoke_4;
  v10[3] = &unk_264BA6BE8;
  v10[4] = self;
  [v6 _registerViewControllerCreator:v10 withType:45];

  v7 = +[TVInterfaceFactory sharedInterfaceFactory];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __51___TVControllerFactory__registerControllerCreators__block_invoke_5;
  v9[3] = &unk_264BA6C10;
  v9[4] = self;
  [v7 _registerViewControllerCreatorEx:v9 withType:9];

  v8 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v8 _registerViewControllerCreator:&__block_literal_global_9 withType:52];
}

- (id)_carouselControllerForElement:(id)a3 layout:(id)a4 existingController:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = (_TVCarouselViewController *)v8;
  }
  else {
    v10 = objc_alloc_init(_TVCarouselViewController);
  }
  v11 = v10;
  v12 = +[TVCarouselLayout layoutWithLayout:v7 element:v9];
  [(_TVCarouselViewController *)v11 updateWithViewElement:v9 layout:v12];

  v13 = [(_TVCarouselViewController *)v11 view];
  objc_msgSend(v13, "tv_setLayout:", v12);

  return v11;
}

- (id)_shelfControllerForElement:(id)a3 existingController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 attributes];
  id v8 = [v7 objectForKeyedSubscript:@"centered"];
  uint64_t v9 = [v8 BOOLValue];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v10 = (_TVShelfViewController *)v5;
  }
  else {
    v10 = objc_alloc_init(_TVShelfViewController);
  }
  v11 = v10;
  +[_TVLockupFactory cellMetricsForCollectionElement:v6];
  [(_TVShelfViewController *)v11 updateWithViewElement:v6 cellMetrics:&v14];

  [(_TVShelfViewController *)v11 setCentered:v9];
  v12 = v11;

  return v12;
}

- (id)_gridControllerForElement:(id)a3 existingController:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = (_TVGridViewController *)v5;
  }
  else {
    id v7 = objc_alloc_init(_TVGridViewController);
  }
  id v8 = v7;
  +[_TVLockupFactory cellMetricsForCollectionElement:v6];
  [(_TVGridViewController *)v8 updateWithViewElement:v6 cellMetrics:&v10];

  return v8;
}

- (id)_listControllerForElement:(id)a3 existingController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = (_TVListViewController *)v6;
  }
  else {
    id v7 = objc_alloc_init(_TVListViewController);
  }
  id v8 = v7;
  memset(v10, 0, sizeof(v10));
  [(_TVListViewController *)v7 updateWithViewElement:v5 cellMetrics:v10];

  return v8;
}

- (id)_textFieldControllerForElement:(id)a3 existingController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v7 = (_TVTextFieldViewController *)v6;
  }
  else {
    id v7 = objc_alloc_init(_TVTextFieldViewController);
  }
  id v8 = v7;
  [(_TVTextFieldViewController *)v7 updateWithViewElement:v5];

  return v8;
}

@end