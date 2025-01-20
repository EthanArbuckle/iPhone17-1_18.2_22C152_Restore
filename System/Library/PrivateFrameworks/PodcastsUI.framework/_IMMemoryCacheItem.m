@interface _IMMemoryCacheItem
+ (id)cacheItemWithItem:(id)a3 key:(id)a4 cost:(unint64_t)a5;
- (BOOL)conformsToProtocol;
- (NSString)key;
- (id)description;
- (id)item;
- (unint64_t)cost;
- (unint64_t)timeStamp;
- (void)setConformsToProtocol:(BOOL)a3;
- (void)setCost:(unint64_t)a3;
- (void)setItem:(id)a3;
- (void)setKey:(id)a3;
- (void)setTimeStamp:(unint64_t)a3;
@end

@implementation _IMMemoryCacheItem

+ (id)cacheItemWithItem:(id)a3 key:(id)a4 cost:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  v9 = objc_opt_new();
  if (!a5) {
    NSLog(&cfstr_AddingCostZero.isa, v7);
  }
  [v9 setItem:v8];
  [v9 setCost:a5];
  [v9 setTimeStamp:mach_absolute_time()];
  [v9 setKey:v7];
  uint64_t v10 = [v8 conformsToProtocol:&unk_1F3FC4F50];

  [v9 setConformsToProtocol:v10];

  return v9;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"<%@: %p>; Item: %@; Cost: %d; Key: %@; Conforms: %d",
               objc_opt_class(),
               self,
               self->_item,
               self->_cost,
               self->_keyString,
               self->_conformsToProtocol);
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void)setCost:(unint64_t)a3
{
  self->_cost = a3;
}

- (unint64_t)timeStamp
{
  return self->_timeStamp;
}

- (void)setTimeStamp:(unint64_t)a3
{
  self->_timeStamp = a3;
}

- (NSString)key
{
  return self->_keyString;
}

- (void)setKey:(id)a3
{
}

- (BOOL)conformsToProtocol
{
  return self->_conformsToProtocol;
}

- (void)setConformsToProtocol:(BOOL)a3
{
  self->_conformsToProtocol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyString, 0);

  objc_storeStrong(&self->_item, 0);
}

@end