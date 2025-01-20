@interface OADGraphicFeatureCache
- (OADGraphicFeatureCache)init;
- (id)countedFeatureAtIndex:(unint64_t)a3;
- (id)featuresSortedByUsageCount;
- (unint64_t)cacheFeature:(id)a3;
- (void)dealloc;
@end

@implementation OADGraphicFeatureCache

- (OADGraphicFeatureCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)OADGraphicFeatureCache;
  v2 = [(OADGraphicFeatureCache *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mFeatureUsageArray = v2->mFeatureUsageArray;
    v2->mFeatureUsageArray = v3;

    v5 = objc_alloc_init(OITSUNoCopyDictionary);
    mFeatureMap = v2->mFeatureMap;
    v2->mFeatureMap = v5;
  }
  return v2;
}

- (unint64_t)cacheFeature:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(OITSUNoCopyDictionary *)self->mFeatureMap objectForKey:v4];
    v6 = v5;
    if (v5)
    {
      v7 = -[OADGraphicFeatureCache countedFeatureAtIndex:](self, "countedFeatureAtIndex:", [v5 unsignedIntegerValue]);
      [v7 incrementUsageCount];
    }
    else
    {
      uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](self->mFeatureUsageArray, "count") + 1);
      v10 = [[OADCountedGraphicFeature alloc] initWithFeature:v4];
      [(NSMutableArray *)self->mFeatureUsageArray addObject:v10];

      [(OITSUNoCopyDictionary *)self->mFeatureMap setObject:v9 forKey:v4];
      v6 = (void *)v9;
    }
    unint64_t v8 = [v6 unsignedIntegerValue];
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)dealloc
{
  mFeatureUsageArray = self->mFeatureUsageArray;
  self->mFeatureUsageArray = 0;

  mFeatureMap = self->mFeatureMap;
  self->mFeatureMap = 0;

  v5.receiver = self;
  v5.super_class = (Class)OADGraphicFeatureCache;
  [(OADGraphicFeatureCache *)&v5 dealloc];
}

- (id)countedFeatureAtIndex:(unint64_t)a3
{
  if (a3)
  {
    id v4 = [(NSMutableArray *)self->mFeatureUsageArray objectAtIndex:a3 - 1];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)featuresSortedByUsageCount
{
  return (id)[(NSMutableArray *)self->mFeatureUsageArray sortedArrayUsingSelector:sel_compareUsageCount_];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFeatureMap, 0);
  objc_storeStrong((id *)&self->mFeatureUsageArray, 0);
}

@end