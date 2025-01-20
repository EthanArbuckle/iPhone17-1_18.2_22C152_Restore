@interface MPCluster
- (BOOL)clusterContainsSlideAtPath:(id)a3;
- (MPCluster)init;
- (NSMutableArray)items;
- (NSMutableDictionary)usageCounterPerLayer;
- (NSString)name;
- (double)rating;
- (double)usageCountForLayer:(id)a3;
- (id)allSlides;
- (id)allSlidesSortedByUser;
- (id)allSlidesSortedChronologically;
- (id)description;
- (id)usageCountDescription;
- (int64_t)slideCount;
- (void)addSlide:(id)a3;
- (void)dealloc;
- (void)detailedDescription;
- (void)removeAllSlides;
- (void)resetAllUsageCounters;
- (void)setItems:(id)a3;
- (void)setName:(id)a3;
- (void)setRating:(double)a3;
- (void)setUsageCountForLayer:(id)a3 to:(double)a4;
- (void)setUsageCounterPerLayer:(id)a3;
@end

@implementation MPCluster

- (MPCluster)init
{
  v4.receiver = self;
  v4.super_class = (Class)MPCluster;
  v2 = [(MPCluster *)&v4 init];
  if (v2)
  {
    v2->mSlides = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->mRating = 0.0;
    v2->mUsageCounterPerLayer = 0;
  }
  return v2;
}

- (void)dealloc
{
  self->mSlides = 0;
  self->mUsageCounterPerLayer = 0;

  self->mName = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPCluster;
  [(MPCluster *)&v3 dealloc];
}

- (void)addSlide:(id)a3
{
}

- (void)removeAllSlides
{
}

- (int64_t)slideCount
{
  return (int64_t)[(NSMutableArray *)self->mSlides count];
}

- (id)allSlides
{
  return self->mSlides;
}

- (id)allSlidesSortedByUser
{
  return [(NSMutableArray *)self->mSlides sortedArrayUsingFunction:sortSlidesByUserDefinedOrder1 context:0];
}

- (BOOL)clusterContainsSlideAtPath:(id)a3
{
  return 0;
}

- (id)allSlidesSortedChronologically
{
  char v3 = 1;
  return objc_msgSend(-[MPCluster allSlides](self, "allSlides"), "sortedArrayUsingFunction:context:", sortSlidesByCaptureDate1, &v3);
}

- (void)setUsageCountForLayer:(id)a3 to:(double)a4
{
  double v4 = a4;
  mUsageCounterPerLayer = self->mUsageCounterPerLayer;
  if (mUsageCounterPerLayer)
  {
    if (a3)
    {
LABEL_3:
      *(float *)&a4 = v4;
      v8 = +[NSNumber numberWithFloat:a4];
      [(NSMutableDictionary *)mUsageCounterPerLayer setObject:v8 forKey:a3];
      return;
    }
  }
  else
  {
    mUsageCounterPerLayer = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->mUsageCounterPerLayer = mUsageCounterPerLayer;
    if (a3) {
      goto LABEL_3;
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v9 = [(NSMutableDictionary *)mUsageCounterPerLayer countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(mUsageCounterPerLayer);
        }
        [(MPCluster *)self setUsageCountForLayer:*(void *)(*((void *)&v13 + 1) + 8 * i) to:v4];
      }
      id v10 = [(NSMutableDictionary *)mUsageCounterPerLayer countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (double)usageCountForLayer:(id)a3
{
  mUsageCounterPerLayer = self->mUsageCounterPerLayer;
  if (mUsageCounterPerLayer)
  {
    if (a3)
    {
LABEL_3:
      objc_msgSend(-[NSMutableDictionary valueForKey:](mUsageCounterPerLayer, "valueForKey:", a3), "floatValue");
      return v6;
    }
  }
  else
  {
    mUsageCounterPerLayer = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->mUsageCounterPerLayer = mUsageCounterPerLayer;
    if (a3) {
      goto LABEL_3;
    }
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = [(NSMutableDictionary *)mUsageCounterPerLayer countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v8) {
    return 0.0;
  }
  id v9 = v8;
  uint64_t v10 = *(void *)v15;
  double v7 = 0.0;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(mUsageCounterPerLayer);
      }
      objc_msgSend(-[NSMutableDictionary valueForKey:](self->mUsageCounterPerLayer, "valueForKey:", *(void *)(*((void *)&v14 + 1) + 8 * i)), "floatValue");
      double v7 = v7 + v12;
    }
    id v9 = [(NSMutableDictionary *)mUsageCounterPerLayer countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v9);
  return v7;
}

- (void)resetAllUsageCounters
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  mUsageCounterPerLayer = self->mUsageCounterPerLayer;
  id v4 = [(NSMutableDictionary *)mUsageCounterPerLayer countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(mUsageCounterPerLayer);
        }
        [(MPCluster *)self setUsageCountForLayer:*(void *)(*((void *)&v8 + 1) + 8 * i) to:0.0];
      }
      id v5 = [(NSMutableDictionary *)mUsageCounterPerLayer countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)usageCountDescription
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(NSMutableDictionary *)self->mUsageCounterPerLayer allValues];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    uint64_t v6 = (NSMutableString *)&stru_1AC850;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) floatValue];
        uint64_t v6 = +[NSMutableString stringWithString:[(NSMutableString *)v6 stringByAppendingFormat:@"%.2f:", v8]];
      }
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
  else
  {
    uint64_t v6 = (NSMutableString *)&stru_1AC850;
  }
  if ([(NSMutableString *)v6 length]) {
    -[NSMutableString deleteCharactersInRange:](v6, "deleteCharactersInRange:", (char *)[(NSMutableString *)v6 length] - 1, 1);
  }
  return v6;
}

- (void)detailedDescription
{
  NSLog(@"-------------------", a2);
  NSLog(@"Cluster description:");
  NSLog(@"name: %@ usageCount = (%@), slide count = %d", [(MPCluster *)self name], [(MPCluster *)self usageCountDescription], [(MPCluster *)self slideCount]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = [(MPCluster *)self allSlides];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v10;
    do
    {
      float v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v3);
        }
        NSLog(@"             slide[%d]:  usageCount = (%@), fileName: %@", (char *)v8 + v6, [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) usageCountDescription], objc_msgSend(objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v8), "path"), "lastPathComponent"));
        float v8 = (char *)v8 + 1;
      }
      while (v5 != v8);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      uint64_t v6 = (v6 + v8);
    }
    while (v5);
  }
  NSLog(@"-------------------");
}

- (id)description
{
  return +[NSString stringWithFormat:@"SCCluster: %p name=%@, rating=%.1f, usageCount = (%@), #slides=%d", self, self->mName, *(void *)&self->mRating, [(MPCluster *)self usageCountDescription], [(MPCluster *)self slideCount]];
}

- (NSMutableArray)items
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setItems:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (double)rating
{
  return self->mRating;
}

- (void)setRating:(double)a3
{
  self->mRating = a3;
}

- (NSMutableDictionary)usageCounterPerLayer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUsageCounterPerLayer:(id)a3
{
}

@end