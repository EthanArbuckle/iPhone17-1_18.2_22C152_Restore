@interface DBSMainDisplayPreferencesController
- (BOOL)proModeSupported;
- (DBSMainDisplayPreferencesController)init;
- (DBSZoomAndProSpecifiers)_zoomAndProSpecifierVendor;
- (id)connectedDisplayName;
- (id)specifiers;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentModalMagnifyController;
- (void)set_zoomAndProSpecifierVendor:(id)a3;
- (void)updateReferenceDependentUIElements;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation DBSMainDisplayPreferencesController

- (DBSMainDisplayPreferencesController)init
{
  v6.receiver = self;
  v6.super_class = (Class)DBSMainDisplayPreferencesController;
  v2 = [(DBSMainDisplayPreferencesController *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F15778] mainDisplay];
    v4 = NSStringFromSelector(sel_isReferenceLimited);
    [v3 addObserver:v2 forKeyPath:v4 options:1 context:0];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F15778] mainDisplay];
  v4 = NSStringFromSelector(sel_isReferenceLimited);
  [v3 removeObserver:self forKeyPath:v4];

  v5.receiver = self;
  v5.super_class = (Class)DBSMainDisplayPreferencesController;
  [(DBSMainDisplayPreferencesController *)&v5 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)DBSMainDisplayPreferencesController;
  [(DBSMainDisplayPreferencesController *)&v5 viewWillAppear:a3];
  v4 = +[DBSBrightnessManager defaultManager];
  [v4 setDelegate:self];

  [(DBSMainDisplayPreferencesController *)self updateReferenceDependentUIElements];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    objc_super v5 = [MEMORY[0x263EFF980] array];
    objc_super v6 = +[DBSBrightnessManager defaultManager];
    v7 = [v6 mainDisplayBrightnessSpecifiers];

    [v5 addObjectsFromArray:v7];
    v8 = objc_opt_new();
    [v8 setDelegate:self];
    v9 = [v8 specifiers];

    if (v9)
    {
      v10 = [v8 specifiers];
      [v5 addObjectsFromArray:v10];
    }
    [(DBSMainDisplayPreferencesController *)self set_zoomAndProSpecifierVendor:v8];
    v11 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)presentModalMagnifyController
{
  id v7 = objc_alloc_init(MEMORY[0x263F5FC30]);
  uint64_t v3 = (int)*MEMORY[0x263F5FE98];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  objc_super v5 = (objc_class *)objc_opt_class();
  objc_super v6 = NSStringFromClass(v5);
  [v4 setProperty:v6 forKey:*MEMORY[0x263F60228]];

  [v7 setSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + v3)];
  [v7 setParentController:self];
  [v7 setupController];
  [v7 setModalPresentationStyle:2];
  [(DBSMainDisplayPreferencesController *)self presentViewController:v7 animated:1 completion:0];
}

- (id)connectedDisplayName
{
  return 0;
}

- (BOOL)proModeSupported
{
  v2 = [MEMORY[0x263F15778] mainDisplay];
  uint64_t v3 = [v2 availablePresets];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)updateReferenceDependentUIElements
{
  uint64_t v3 = [(DBSMainDisplayPreferencesController *)self specifiers];
  id v15 = [v3 specifierForID:@"BRIGHTNESS"];

  BOOL v4 = [(DBSMainDisplayPreferencesController *)self specifiers];
  objc_super v5 = [v4 specifierForID:@"WHITE_BALANCE"];

  objc_super v6 = [(DBSMainDisplayPreferencesController *)self specifiers];
  id v7 = [v6 specifierForID:@"ADVANCED"];

  v8 = [MEMORY[0x263F15778] mainDisplay];
  int v9 = [v8 isReference];

  uint64_t v10 = *MEMORY[0x263F600A8];
  if (v9) {
    uint64_t v11 = MEMORY[0x263EFFA80];
  }
  else {
    uint64_t v11 = MEMORY[0x263EFFA88];
  }
  [v15 setObject:v11 forKeyedSubscript:*MEMORY[0x263F600A8]];
  [v5 setObject:v11 forKeyedSubscript:v10];
  v12 = NSNumber;
  v13 = [MEMORY[0x263F15778] mainDisplay];
  v14 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isReferenceLimited"));
  [v15 setObject:v14 forKeyedSubscript:@"brightnessLimited"];

  [(DBSMainDisplayPreferencesController *)self reloadSpecifier:v15];
  [(DBSMainDisplayPreferencesController *)self reloadSpecifier:v5];
  if (v7) {
    [(DBSMainDisplayPreferencesController *)self reloadSpecifier:v7];
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [MEMORY[0x263F15778] mainDisplay];
  if ([v13 isEqual:v11])
  {
    v14 = [(DBSMainDisplayPreferencesController *)self specifiers];
    id v15 = [v14 specifierForID:@"BRIGHTNESS"];

    v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v13, "isReferenceLimited"));
    [v15 setObject:v16 forKeyedSubscript:@"brightnessLimited"];

    [(DBSMainDisplayPreferencesController *)self reloadSpecifier:v15];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)DBSMainDisplayPreferencesController;
    [(DBSMainDisplayPreferencesController *)&v17 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (DBSZoomAndProSpecifiers)_zoomAndProSpecifierVendor
{
  return self->__zoomAndProSpecifierVendor;
}

- (void)set_zoomAndProSpecifierVendor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end