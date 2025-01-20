@interface EDOptimizedStringsCollection
- (EDOptimizedStringsCollection)init;
- (unint64_t)addObject:(id)a3;
@end

@implementation EDOptimizedStringsCollection

- (EDOptimizedStringsCollection)init
{
  v6.receiver = self;
  v6.super_class = (Class)EDOptimizedStringsCollection;
  v2 = [(EDCollection *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    mStringDictionary = v2->mStringDictionary;
    v2->mStringDictionary = (NSMutableDictionary *)v3;
  }
  return v2;
}

- (unint64_t)addObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(NSMutableDictionary *)self->mStringDictionary objectForKey:v4];
    objc_super v6 = v5;
    if (v5)
    {
      unint64_t v7 = [v5 unsignedIntValue];
    }
    else
    {
      [(NSMutableArray *)self->super.mObjects addObject:v4];
      mStringDictionary = self->mStringDictionary;
      v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->super.mObjects, "count") - 1);
      [(NSMutableDictionary *)mStringDictionary setObject:v9 forKey:v4];

      unint64_t v7 = [(NSMutableArray *)self->super.mObjects count] - 1;
    }
  }
  else
  {
    unint64_t v7 = -1;
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end