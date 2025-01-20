@interface UniContext
- (NSPointerArray)weakArray;
- (UniContext)init;
- (id)renderOrder;
- (void)dealloc;
- (void)empty;
- (void)setWeakArray:(id)a3;
@end

@implementation UniContext

- (UniContext)init
{
  v8.receiver = self;
  v8.super_class = (Class)UniContext;
  v4 = [(UniContext *)&v8 init];
  if (v4)
  {
    uint64_t v5 = objc_msgSend_strongObjectsPointerArray(MEMORY[0x263F08A88], v2, v3);
    weakArray = v4->weakArray;
    v4->weakArray = (NSPointerArray *)v5;
  }
  return v4;
}

- (id)renderOrder
{
  return self->weakArray;
}

- (void)empty
{
  if (self->weakArray)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    weakArray = self->weakArray;
    if (isKindOfClass)
    {
      uint64_t v9 = objc_msgSend_count(weakArray, v3, v4);
      weakArray = self->weakArray;
      if (v9)
      {
        uint64_t v11 = objc_msgSend_count(weakArray, v7, v8) - 1;
        do
          objc_msgSend_removePointerAtIndex_(self->weakArray, v10, v11--);
        while (v11 != -1);
        weakArray = self->weakArray;
      }
    }
  }
  else
  {
    weakArray = 0;
  }
  self->weakArray = 0;
}

- (void)dealloc
{
  objc_msgSend_empty(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)UniContext;
  [(UniContext *)&v4 dealloc];
}

- (NSPointerArray)weakArray
{
  return (NSPointerArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWeakArray:(id)a3
{
}

- (void).cxx_destruct
{
}

@end