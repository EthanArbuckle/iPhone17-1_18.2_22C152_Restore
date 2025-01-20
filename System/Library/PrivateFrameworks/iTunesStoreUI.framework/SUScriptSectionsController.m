@interface SUScriptSectionsController
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (SUScriptSection)selectedSection;
- (SUScriptSectionsController)init;
- (id)_className;
- (id)_copySectionWithIdentifier:(id)a3;
- (id)_fixedSelectedIdentifier;
- (id)scriptAttributeKeys;
- (id)sectionWithIdentifier:(id)a3;
- (id)sections;
- (void)_setSelectedIdentifier:(id)a3;
- (void)_tabBarConfigurationChangedNotification:(id)a3;
- (void)dealloc;
- (void)setRootViewController:(id)a3 forSection:(id)a4;
- (void)setSelectedSection:(id)a3;
@end

@implementation SUScriptSectionsController

- (SUScriptSectionsController)init
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptSectionsController;
  v2 = [(SUScriptObject *)&v4 init];
  if (v2) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "addObserver:selector:name:object:", v2, sel__tabBarConfigurationChangedNotification_, @"SUTabBarConfigurationChangedNotification", 0);
  }
  return v2;
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:name:object:", self, @"SUTabBarConfigurationChangedNotification", 0);
  v3.receiver = self;
  v3.super_class = (Class)SUScriptSectionsController;
  [(SUScriptObject *)&v3 dealloc];
}

- (id)sectionWithIdentifier:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__15;
  v11 = __Block_byref_object_dispose__15;
  uint64_t v12 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    WebThreadRunOnMainThread();
  }
  else {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  objc_super v3 = (void *)v8[5];
  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = (id)[MEMORY[0x263EFF9D0] null];
  }
  v5 = v4;
  _Block_object_dispose(&v7, 8);
  return v5;
}

uint64_t __52__SUScriptSectionsController_sectionWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _copySectionWithIdentifier:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = result;
  return result;
}

- (id)_className
{
  return @"iTunesSectionsController";
}

- (id)sections
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v5 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  -[SUScriptObject checkInScriptObjects:](self, "checkInScriptObjects:", v3, v5, 3221225472, __38__SUScriptSectionsController_sections__block_invoke, &unk_264812158, self, v3);
  return v3;
}

uint64_t __38__SUScriptSectionsController_sections__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "clientInterface"), "tabBarController"), "sections");
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (result)
  {
    uint64_t v4 = result;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [[SUScriptSection alloc] initWithNativeSection:*(void *)(*((void *)&v9 + 1) + 8 * v6)];
        if (v7)
        {
          v8 = v7;
          [*(id *)(a1 + 40) addObject:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t result = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v4 = result;
    }
    while (result);
  }
  return result;
}

- (SUScriptSection)selectedSection
{
  uint64_t v8 = 0;
  long long v9 = &v8;
  uint64_t v10 = 0x3052000000;
  long long v11 = __Block_byref_object_copy__15;
  long long v12 = __Block_byref_object_dispose__15;
  uint64_t v13 = 0;
  uint64_t v6 = MEMORY[0x263EF8330];
  WebThreadRunOnMainThread();
  v2 = (void *)v9[5];
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = (SUScriptSection *)objc_msgSend(MEMORY[0x263EFF9D0], "null", v6, 3221225472, __45__SUScriptSectionsController_selectedSection__block_invoke, &unk_264812E48, self, &v8);
  }
  uint64_t v4 = v3;
  _Block_object_dispose(&v8, 8);
  return v4;
}

uint64_t __45__SUScriptSectionsController_selectedSection__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _fixedSelectedIdentifier];
  if (result) {
    uint64_t result = [*(id *)(a1 + 32) _copySectionWithIdentifier:result];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setSelectedSection:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend((id)objc_msgSend(a3, "identifier"), "length"))
  {
    id v5 = [(SUScriptObject *)self webThreadMainThreadBatchProxy];
    uint64_t v6 = [a3 identifier];
    [v5 _setSelectedIdentifier:v6];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x263F1FA90];
    [v7 throwException:@"Invalid argument"];
  }
}

- (void)setRootViewController:(id)a3 forSection:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    WebThreadRunOnMainThread();
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263F1FA90];
    [v4 throwException:@"Invalid argument"];
  }
}

uint64_t __63__SUScriptSectionsController_setRootViewController_forSection___block_invoke(id *a1)
{
  uint64_t result = objc_msgSend((id)objc_msgSend(a1[4], "clientInterface"), "tabBarController");
  if (result)
  {
    id v3 = (void *)result;
    uint64_t v4 = [a1[5] nativeViewController];
    uint64_t v5 = [a1[6] identifier];
    return [v3 setTransientViewController:v4 onSectionWithIdentifier:v5];
  }
  return result;
}

- (void)_tabBarConfigurationChangedNotification:(id)a3
{
}

- (id)_copySectionWithIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(SUTabBarController *)[(SUClientInterface *)[(SUScriptObject *)self clientInterface] tabBarController] sections];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(a3, "isEqualToString:", objc_msgSend(v10, "identifier")))
        {
          long long v11 = [[SUScriptSection alloc] initWithNativeSection:v10];
          [(SUScriptObject *)self checkInScriptObject:v11];
          return v11;
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  return 0;
}

- (id)_fixedSelectedIdentifier
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = [(SUTabBarController *)[(SUClientInterface *)[(SUScriptObject *)self clientInterface] tabBarController] selectedIdentifier];
  uint64_t v4 = objc_msgSend(-[SUScriptObject invocationBatch:](self, "invocationBatch:", 0), "copyQueuedInvocationsForObject:", self);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (sel_isEqual((SEL)[v9 selector], sel__setSelectedIdentifier_))
        {
          id v11 = 0;
          [v9 getArgument:&v11 atIndex:2];
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v3 = (NSString *)v11;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_setSelectedIdentifier:(id)a3
{
  uint64_t v4 = [(SUClientInterface *)[(SUScriptObject *)self clientInterface] tabBarController];

  [(SUTabBarController *)v4 setSelectedIdentifier:a3];
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id result = (id)objc_msgSend((id)__KeyMapping_24, "objectForKey:");
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSectionsController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForKeyName_, a3);
  }
  return result;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_19, 2);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptSectionsController;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

- (id)scriptAttributeKeys
{
  v4.receiver = self;
  v4.super_class = (Class)SUScriptSectionsController;
  v2 = [(SUScriptObject *)&v4 scriptAttributeKeys];
  -[NSMutableArray addObjectsFromArray:](v2, "addObjectsFromArray:", [(id)__KeyMapping_24 allKeys]);
  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_19 = (uint64_t)sel_sectionWithIdentifier_;
    unk_2681B4BE0 = @"sectionWithIdentifier";
    qword_2681B4BE8 = (uint64_t)sel_setRootViewController_forSection_;
    unk_2681B4BF0 = @"setRootViewControllerForSection";
    __KeyMapping_24 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"sections", @"selectedSection", @"selectedSection", 0);
  }
}

@end