@interface _UIActivityPlaceholderItemProxy
+ (id)unproxiedItemForItem:(id)a3;
+ (id)unproxiedItemsForItems:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProxy;
- (BOOL)respondsToSelector:(SEL)a3;
- (Class)class;
- (Class)superclass;
- (_UIActivityPlaceholderItemProxy)initWithPlaceholderItem:(id)a3;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (id)placeholderItem;
- (unint64_t)hash;
- (void)forwardInvocation:(id)a3;
@end

@implementation _UIActivityPlaceholderItemProxy

+ (id)unproxiedItemForItem:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if ([v3 isProxy])
  {
    uint64_t v5 = [v3 placeholderItem];
    v6 = (void *)v5;
    if (v5) {
      v7 = (void *)v5;
    }
    else {
      v7 = v3;
    }
    id v4 = v7;
  }
  return v4;
}

+ (id)unproxiedItemsForItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = objc_msgSend(a1, "unproxiedItemForItem:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (_UIActivityPlaceholderItemProxy)initWithPlaceholderItem:(id)a3
{
  objc_storeStrong(&self->_uikit_placeholderItem, a3);
  id v5 = a3;
  objc_setAssociatedObject(self, &__UIActivityPlaceholderItemAssocitatedObjectKey, v5, (void *)1);

  return self;
}

- (id)placeholderItem
{
  return objc_getAssociatedObject(self, &__UIActivityPlaceholderItemAssocitatedObjectKey);
}

- (BOOL)isProxy
{
  return 1;
}

- (id)description
{
  return (id)[self->_uikit_placeholderItem description];
}

- (BOOL)isEqual:(id)a3
{
  return [self->_uikit_placeholderItem isEqual:a3];
}

- (unint64_t)hash
{
  return [self->_uikit_placeholderItem hash];
}

- (Class)superclass
{
  return (Class)[self->_uikit_placeholderItem superclass];
}

- (Class)class
{
  return (Class)objc_opt_class();
}

- (void)forwardInvocation:(id)a3
{
}

- (id)methodSignatureForSelector:(SEL)a3
{
  return (id)[self->_uikit_placeholderItem methodSignatureForSelector:a3];
}

- (BOOL)respondsToSelector:(SEL)a3
{
  return objc_opt_respondsToSelector() & 1;
}

- (void).cxx_destruct
{
}

@end