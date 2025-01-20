@interface SUScriptNavigationTransition
+ (id)webScriptNameForKeyName:(id)a3;
+ (id)webScriptNameForSelector:(SEL)a3;
+ (void)initialize;
- (NSMutableArray)finishBlocks;
- (NSString)rightBarButton;
- (SUScriptNavigationItem)topNavigationItem;
- (SUScriptNavigationTransition)initWithContainer:(id)a3 finishBlock:(id)a4;
- (id)_className;
- (id)scriptAttributeKeys;
- (int64_t)fromIndex;
- (int64_t)status;
- (int64_t)toIndex;
- (void)addFinishBlock:(id)a3;
- (void)finishedLoading;
- (void)setFinishBlocks:(id)a3;
- (void)setFromIndex:(int64_t)a3;
- (void)setRightBarButton:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setToIndex:(int64_t)a3;
- (void)setTopNavigationItem:(id)a3;
@end

@implementation SUScriptNavigationTransition

- (SUScriptNavigationTransition)initWithContainer:(id)a3 finishBlock:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SUScriptNavigationTransition;
  v9 = [(SUScriptObject *)&v17 init];
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    finishBlocks = v9->_finishBlocks;
    v9->_finishBlocks = v10;

    v12 = v9->_finishBlocks;
    v13 = (void *)[v8 copy];
    [(NSMutableArray *)v12 addObject:v13];

    v9->_status = 0;
    v14 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v9->super._lock;
    v9->super._lock = v14;

    objc_storeStrong((id *)&v9->_container, a3);
  }

  return v9;
}

- (void)addFinishBlock:(id)a3
{
  id v4 = a3;
  [(SUScriptObject *)self lock];
  finishBlocks = self->_finishBlocks;
  v6 = (void *)[v4 copy];

  [(NSMutableArray *)finishBlocks addObject:v6];

  [(SUScriptObject *)self unlock];
}

- (int64_t)status
{
  [(SUScriptObject *)self lock];
  int64_t status = self->_status;
  [(SUScriptObject *)self unlock];
  return status;
}

- (void)setStatus:(int64_t)a3
{
  [(SUScriptObject *)self lock];
  self->_int64_t status = a3;

  [(SUScriptObject *)self unlock];
}

- (int64_t)fromIndex
{
  return self->_fromIndex;
}

- (void)setFromIndex:(int64_t)a3
{
  self->_fromIndex = a3;
}

- (void)setToIndex:(int64_t)a3
{
  self->_toIndex = a3;
}

- (void)setTopNavigationItem:(id)a3
{
  v3 = (void *)MEMORY[0x263F1FA90];
  id v4 = [NSString stringWithFormat:@"%@ is readonly", @"topNavigationItem"];
  [v3 throwException:v4];
}

- (int64_t)toIndex
{
  return self->_toIndex;
}

- (SUScriptNavigationItem)topNavigationItem
{
  if (self->_container)
  {
    v3 = [SUScriptNavigationItem alloc];
    id v4 = [(SUViewController *)self->_container navigationItem];
    v5 = [(SUScriptNavigationItem *)v3 initWithNativeNavigationItem:v4];

    [(SUScriptObject *)self checkInScriptObject:v5];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)finishedLoading
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  [(SUScriptObject *)self lock];
  if (self->_status == 2)
  {
    v3 = 0;
    id v4 = 0;
  }
  else
  {
    v3 = (void *)[(NSMutableArray *)self->_finishBlocks copy];
    id v4 = self->_container;
    container = self->_container;
    self->_container = 0;

    finishBlocks = self->_finishBlocks;
    self->_finishBlocks = 0;

    self->_int64_t status = 2;
  }
  [(SUScriptObject *)self unlock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * i));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (id)_className
{
  return @"iTunesNavigationTransition";
}

+ (id)webScriptNameForKeyName:(id)a3
{
  id v4 = a3;
  v5 = [(id)__KeyMapping_19 objectForKey:v4];
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationTransition;
    v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForKeyName_, v4);
  }

  return v5;
}

+ (id)webScriptNameForSelector:(SEL)a3
{
  v5 = SUWebScriptNameForSelector2(a3, (uint64_t)&__SelectorMapping_14, 1);
  if (!v5)
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SUScriptNavigationTransition;
    v5 = objc_msgSendSuper2(&v7, sel_webScriptNameForSelector_, a3);
  }

  return v5;
}

- (id)scriptAttributeKeys
{
  v5.receiver = self;
  v5.super_class = (Class)SUScriptNavigationTransition;
  v2 = [(SUScriptObject *)&v5 scriptAttributeKeys];
  v3 = [(id)__KeyMapping_19 allKeys];
  [v2 addObjectsFromArray:v3];

  return v2;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    __SelectorMapping_14 = (uint64_t)sel_finishedLoading;
    *(void *)algn_2681B4A88 = @"finishedLoading";
    __KeyMapping_19 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", @"fromIndex", @"toIndex", @"toIndex", @"topNavigationItem", @"topNavigationItem", 0);
    MEMORY[0x270F9A758]();
  }
}

- (NSString)rightBarButton
{
  return self->_rightBarButton;
}

- (void)setRightBarButton:(id)a3
{
}

- (NSMutableArray)finishBlocks
{
  return self->_finishBlocks;
}

- (void)setFinishBlocks:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishBlocks, 0);
  objc_storeStrong((id *)&self->_rightBarButton, 0);
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end