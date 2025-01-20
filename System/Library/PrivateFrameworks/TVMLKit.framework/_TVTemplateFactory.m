@interface _TVTemplateFactory
- (_TVTemplateFactory)init;
- (void)_registerStyleSheet:(id)a3 forTemplate:(id)a4 parentStyleSheets:(id)a5;
- (void)_registerTemplateControllers;
- (void)registerProductTemplateURL:(id)a3 forTemplateName:(id)a4 includeParentStyleSheets:(BOOL)a5;
@end

@implementation _TVTemplateFactory

- (_TVTemplateFactory)init
{
  v5.receiver = self;
  v5.super_class = (Class)_TVTemplateFactory;
  v2 = [(_TVTemplateFactory *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(_TVTemplateFactory *)v2 _registerTemplateControllers];
    [(_TVTemplateFactory *)v3 _registerCustomAnimators];
  }
  return v3;
}

- (void)_registerTemplateControllers
{
  v2 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v2 _registerViewControllerCreator:&__block_literal_global_10 withType:66];

  v3 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v3 _registerViewControllerCreator:&__block_literal_global_14 withType:74];

  v4 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v4 _registerViewControllerCreator:&__block_literal_global_17_0 withType:71];

  objc_super v5 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v5 _registerViewControllerCreator:&__block_literal_global_20 withType:63];

  v6 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v6 _registerViewControllerCreator:&__block_literal_global_23_0 withType:69];

  v7 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v7 _registerViewControllerCreator:&__block_literal_global_26_0 withType:65];

  v8 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v8 _registerViewControllerCreator:&__block_literal_global_29_0 withType:67];

  v9 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v9 _registerViewControllerCreator:&__block_literal_global_32 withType:61];

  v10 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v10 _registerViewControllerCreator:&__block_literal_global_35_0 withType:62];

  id v11 = +[TVInterfaceFactory sharedInterfaceFactory];
  [v11 _registerViewControllerCreator:&__block_literal_global_37_0 withType:73];
}

- (void)registerProductTemplateURL:(id)a3 forTemplateName:(id)a4 includeParentStyleSheets:(BOOL)a5
{
  BOOL v5 = a5;
  v25[1] = *MEMORY[0x263EF8340];
  id v19 = a3;
  id v7 = a4;
  v25[0] = @"BaseStyleSheet";
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:1];
  v9 = [MEMORY[0x263EFF980] arrayWithArray:v8];
  v10 = v9;
  if (v5) {
    [v9 addObject:@"ProductStyleSheet"];
  }
  id v11 = +[TVMLUtilities TVMLKitBundle];
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v10;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v21;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = [v11 URLForResource:*(void *)(*((void *)&v20 + 1) + 8 * v17) withExtension:@"xml"];
        if (v18) {
          [v12 addObject:v18];
        }

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v15);
  }

  [MEMORY[0x263F4B498] registerStyleSheetURL:v19 parentStyleSheets:v12 forTemplateName:v7];
}

- (void)_registerStyleSheet:(id)a3 forTemplate:(id)a4 parentStyleSheets:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[TVMLUtilities TVMLKitBundle];
  id v11 = +[TVInterfaceFactory sharedInterfaceFactory];
  long long v22 = v8;
  id v12 = [v11 _styleSheetURLForTemplate:v8];

  long long v23 = v7;
  id v13 = [v10 URLForResource:v7 withExtension:@"xml"];
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v15 = v9;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        long long v20 = [v10 URLForResource:*(void *)(*((void *)&v24 + 1) + 8 * v19) withExtension:@"xml"];
        if (v20) {
          [v14 addObject:v20];
        }

        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v17);
  }

  if (v12)
  {
    [v14 addObject:v13];
    id v21 = v12;

    id v13 = v21;
  }
  [MEMORY[0x263F4B498] registerStyleSheetURL:v13 parentStyleSheets:v14 forTemplateName:v22];
}

- (void).cxx_destruct
{
}

@end