@interface PTDrillDownRow
@end

@implementation PTDrillDownRow

id __37__PTDrillDownRow_UI__defaultUIAction__block_invoke(uint64_t a1, void *a2, void *a3)
{
  v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  v7 = [v4 childKeyPath];
  v8 = [v6 childSettingsForKeyPath:v7];

  v9 = (objc_class *)objc_opt_class();
  v10 = (void *)[[v9 alloc] initWithSettings:v8 presentingRow:v6];

  return v10;
}

@end