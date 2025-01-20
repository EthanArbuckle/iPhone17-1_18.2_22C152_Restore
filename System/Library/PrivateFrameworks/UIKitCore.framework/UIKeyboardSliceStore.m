@interface UIKeyboardSliceStore
+ (id)sharedStore;
+ (id)sliceSetForID:(id)a3;
+ (id)sliceSetIDForKeyplaneName:(id)a3 type:(int64_t)a4 orientation:(int64_t)a5;
+ (void)archiveSet:(id)a3;
- (UIKeyboardSliceStore)init;
- (id)sliceSetForID:(id)a3;
- (void)addSet:(id)a3;
@end

@implementation UIKeyboardSliceStore

- (UIKeyboardSliceStore)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIKeyboardSliceStore;
  v2 = [(UIKeyboardSliceStore *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    store = v2->_store;
    v2->_store = (NSMutableDictionary *)v3;
  }
  return v2;
}

+ (id)sharedStore
{
  if (qword_1EB261EB0 != -1) {
    dispatch_once(&qword_1EB261EB0, &__block_literal_global_391);
  }
  v2 = (void *)_MergedGlobals_1162;
  return v2;
}

void __35__UIKeyboardSliceStore_sharedStore__block_invoke()
{
  v0 = objc_alloc_init(UIKeyboardSliceStore);
  v1 = (void *)_MergedGlobals_1162;
  _MergedGlobals_1162 = (uint64_t)v0;
}

- (void)addSet:(id)a3
{
  store = self->_store;
  id v4 = a3;
  id v5 = [v4 sliceSetID];
  [(NSMutableDictionary *)store setValue:v4 forKey:v5];
}

- (id)sliceSetForID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_store valueForKey:a3];
}

+ (id)sliceSetForID:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedStore];
  objc_super v6 = [v5 sliceSetForID:v4];

  return v6;
}

+ (id)sliceSetIDForKeyplaneName:(id)a3 type:(int64_t)a4 orientation:(int64_t)a5
{
  return (id)[NSString stringWithFormat:@"%@:%ld", a4, a5, a3, a4];
}

+ (void)archiveSet:(id)a3
{
  id v4 = a3;
  id v5 = [a1 sharedStore];
  [v5 addSet:v4];
}

- (void).cxx_destruct
{
}

@end