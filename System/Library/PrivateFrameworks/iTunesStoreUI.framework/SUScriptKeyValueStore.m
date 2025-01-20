@interface SUScriptKeyValueStore
+ (id)_checkOutStoreWithDomain:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)_popStoreWithDomain:(id)a3;
+ (void)initialize;
- (SUScriptKeyValueStore)initWithDomain:(id)a3;
- (id)_className;
- (id)valueForKey:(id)a3;
- (void)dealloc;
- (void)getValueForKey:(id)a3 usingFunction:(id)a4;
- (void)removeAllValues;
- (void)removeValueForKey:(id)a3;
- (void)setValueForKey:(id)a3 value:(id)a4;
@end

@implementation SUScriptKeyValueStore

- (SUScriptKeyValueStore)initWithDomain:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUScriptKeyValueStore;
  v4 = [(SUScriptObject *)&v6 init];
  if (v4)
  {
    v4->_domain = (NSString *)[a3 copy];
    v4->_keyValueStore = (SSKeyValueStore *)(id)[(id)objc_opt_class() _checkOutStoreWithDomain:a3];
  }
  return v4;
}

- (void)dealloc
{
  [(id)objc_opt_class() _popStoreWithDomain:self->_domain];

  v3.receiver = self;
  v3.super_class = (Class)SUScriptKeyValueStore;
  [(SUScriptObject *)&v3 dealloc];
}

- (void)getValueForKey:(id)a3 usingFunction:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v7 = [[SUScriptFunction alloc] initWithScriptObject:a4];
    [(SUScriptFunction *)v7 setThisObject:self];
    keyValueStore = self->_keyValueStore;
    domain = self->_domain;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __54__SUScriptKeyValueStore_getValueForKey_usingFunction___block_invoke;
    v11[3] = &unk_264814F48;
    v11[4] = self;
    v11[5] = v7;
    [(SSKeyValueStore *)keyValueStore getValueForDomain:domain key:a3 usingBlock:v11];
  }
  else
  {
    v10 = (void *)MEMORY[0x263F1FA90];
    [v10 throwException:@"Invalid argument"];
  }
}

void __54__SUScriptKeyValueStore_getValueForKey_usingFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    a2 = [MEMORY[0x263F1FA98] undefined];
  }
  id v4 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "callWithArguments:", objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", a2, 0));
  [*(id *)(a1 + 40) setThisObject:0];
  v5 = *(void **)(a1 + 40);
}

- (void)removeAllValues
{
}

- (void)removeValueForKey:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    keyValueStore = self->_keyValueStore;
    domain = self->_domain;
    [(SSKeyValueStore *)keyValueStore setValue:0 forDomain:domain key:a3 completionBlock:0];
  }
  else
  {
    v7 = (void *)MEMORY[0x263F1FA90];
    [v7 throwException:@"Invalid argument"];
  }
}

- (void)setValueForKey:(id)a3 value:(id)a4
{
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
    a4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (!a4 || (objc_opt_class(), (objc_opt_isKindOfClass())))
  {
    keyValueStore = self->_keyValueStore;
    domain = self->_domain;
    [(SSKeyValueStore *)keyValueStore setValue:a4 forDomain:domain key:a3 completionBlock:0];
  }
  else
  {
    v9 = (void *)MEMORY[0x263F1FA90];
    [v9 throwException:@"Invalid argument"];
  }
}

- (id)valueForKey:(id)a3
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__51;
  v15 = __Block_byref_object_dispose__51;
  uint64_t v16 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = dispatch_semaphore_create(0);
    keyValueStore = self->_keyValueStore;
    domain = self->_domain;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __37__SUScriptKeyValueStore_valueForKey___block_invoke;
    v10[3] = &unk_264814EF8;
    v10[4] = v5;
    v10[5] = &v11;
    [(SSKeyValueStore *)keyValueStore getValueForDomain:domain key:a3 usingBlock:v10];
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v5);
  }
  else
  {
    [MEMORY[0x263F1FA90] throwException:@"Invalid argument"];
  }
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);
  return v8;
}

intptr_t __37__SUScriptKeyValueStore_valueForKey___block_invoke(uint64_t a1, void *a2)
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    a2 = (void *)[MEMORY[0x263F1FA98] undefined];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = a2;
  id v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

- (id)_className
{
  return @"iTunesKeyValueStore";
}

+ (id)_checkOutStoreWithDomain:(id)a3
{
  _os_nospin_lock_lock();
  id v4 = (id)sAccountStoreCounts;
  if (!sAccountStoreCounts)
  {
    id v4 = objc_alloc_init(MEMORY[0x263F08760]);
    sAccountStoreCounts = (uint64_t)v4;
  }
  [v4 addObject:a3];
  id v5 = (id)sActiveStores;
  if (!sActiveStores)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    sActiveStores = (uint64_t)v5;
  }
  id v6 = (id)[v5 objectForKey:a3];
  if (!v6)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F7B1D8]);
    [(id)sActiveStores setObject:v6 forKey:a3];
  }
  _os_nospin_lock_unlock();

  return v6;
}

+ (void)_popStoreWithDomain:(id)a3
{
  _os_nospin_lock_lock();
  uint64_t v4 = [(id)sAccountStoreCounts countForObject:a3];
  [(id)sAccountStoreCounts removeObject:a3];
  if (v4 == 1) {
    [(id)sActiveStores removeObjectForKey:a3];
  }

  _os_nospin_lock_unlock();
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  id result = (id)SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_55, 5);
  if (!result)
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___SUScriptKeyValueStore;
    return objc_msgSendSuper2(&v6, sel_webScriptNameForSelector_, a3);
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_55 = (uint64_t)sel_getValueForKey_usingFunction_;
    unk_2681B5810 = @"getValue";
    qword_2681B5818 = (uint64_t)sel_removeAllValues;
    unk_2681B5820 = @"removeAllValues";
    qword_2681B5828 = (uint64_t)sel_removeValueForKey_;
    unk_2681B5830 = @"removeValue";
    qword_2681B5838 = (uint64_t)sel_setValueForKey_value_;
    unk_2681B5840 = @"setValue";
    qword_2681B5848 = (uint64_t)sel_valueForKey_;
    unk_2681B5850 = @"valueForKey";
  }
}

@end