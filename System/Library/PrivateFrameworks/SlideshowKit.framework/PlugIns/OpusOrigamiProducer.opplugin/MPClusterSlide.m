@interface MPClusterSlide
- (MPClusterSlide)init;
- (NSDate)captureDate;
- (NSMutableArray)usableSlideClusters;
- (NSMutableDictionary)usageCounterPerLayer;
- (NSString)path;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)usageCountDescription;
- (int64_t)index;
- (int64_t)overallUsageCounter;
- (int64_t)referenceCounter;
- (int64_t)usageCounterForLayer:(id)a3;
- (void)dealloc;
- (void)increaseUsageCounterForLayer:(id)a3;
- (void)resetAllUsageCounters;
- (void)setCaptureDate:(id)a3;
- (void)setIndex:(int64_t)a3;
- (void)setPath:(id)a3;
- (void)setReferenceCounter:(int64_t)a3;
- (void)setUsableSlideClusters:(id)a3;
- (void)setUsageCounterForLayer:(id)a3 to:(int64_t)a4;
- (void)setUsageCounterPerLayer:(id)a3;
@end

@implementation MPClusterSlide

- (MPClusterSlide)init
{
  v5.receiver = self;
  v5.super_class = (Class)MPClusterSlide;
  v2 = [(MPClusterSlide *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->mIndex = 0;
    v2->mReferenceCounter = 0;
    v2->mUsageCounterPerLayer = 0;
    v2->mUsableSlideClusters = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  }
  return v3;
}

- (void)dealloc
{
  self->mUsableSlideClusters = 0;
  self->mUsageCounterPerLayer = 0;

  self->mCaptureDate = 0;
  self->mPath = 0;
  v3.receiver = self;
  v3.super_class = (Class)MPClusterSlide;
  [(MPClusterSlide *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  [v4 setUsableSlideClusters:self->mUsableSlideClusters];
  [v4 setCaptureDate:self->mCaptureDate];
  [v4 setReferenceCounter:self->mReferenceCounter];
  [v4 setUsageCounterPerLayer:self->mUsageCounterPerLayer];
  return v4;
}

- (void)increaseUsageCounterForLayer:(id)a3
{
  mUsageCounterPerLayer = self->mUsageCounterPerLayer;
  if (!mUsageCounterPerLayer)
  {
    mUsageCounterPerLayer = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->mUsageCounterPerLayer = mUsageCounterPerLayer;
  }
  id v6 = [(NSMutableDictionary *)mUsageCounterPerLayer objectForKey:a3];
  if (v6)
  {
    signed int v7 = [v6 intValue];
    v8 = self->mUsageCounterPerLayer;
    v9 = +[NSNumber numberWithInteger:v7 + 1];
  }
  else
  {
    v8 = self->mUsageCounterPerLayer;
    v9 = +[NSNumber numberWithInt:1];
  }
  [(NSMutableDictionary *)v8 setObject:v9 forKey:a3];
}

- (int64_t)usageCounterForLayer:(id)a3
{
  return (int)objc_msgSend(-[NSMutableDictionary objectForKey:](self->mUsageCounterPerLayer, "objectForKey:", a3), "intValue");
}

- (void)setUsageCounterForLayer:(id)a3 to:(int64_t)a4
{
  mUsageCounterPerLayer = self->mUsageCounterPerLayer;
  if (mUsageCounterPerLayer)
  {
    if (a3)
    {
LABEL_3:
      v8 = +[NSNumber numberWithInteger:a4];
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
        [(MPClusterSlide *)self setUsageCounterForLayer:*(void *)(*((void *)&v13 + 1) + 8 * i) to:a4];
      }
      id v10 = [(NSMutableDictionary *)mUsageCounterPerLayer countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (int64_t)overallUsageCounter
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSMutableDictionary *)self->mUsageCounterPerLayer allValues];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (!v3) {
    return 0;
  }
  id v4 = v3;
  int64_t v5 = 0;
  uint64_t v6 = *(void *)v10;
  do
  {
    for (i = 0; i != v4; i = (char *)i + 1)
    {
      if (*(void *)v10 != v6) {
        objc_enumerationMutation(v2);
      }
      v5 += (int)[*(id *)(*((void *)&v9 + 1) + 8 * i) intValue];
    }
    id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  }
  while (v4);
  return v5;
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
        [(MPClusterSlide *)self setUsageCounterForLayer:*(void *)(*((void *)&v8 + 1) + 8 * i) to:0];
      }
      id v5 = [(NSMutableDictionary *)mUsageCounterPerLayer countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)usageCountDescription
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(NSMutableDictionary *)self->mUsageCounterPerLayer allValues];
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    uint64_t v6 = (NSMutableString *)&stru_1AC850;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", -[NSMutableString stringByAppendingFormat:](v6, "stringByAppendingFormat:", @"%d:", [*(id *)(*((void *)&v9 + 1) + 8 * i) intValue]));
      }
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
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

- (id)description
{
  return +[NSString stringWithFormat:@"SCSlide: %p fileName=%@, captureDate=%@", self, [(NSString *)self->mPath lastPathComponent], self->mCaptureDate];
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPath:(id)a3
{
}

- (NSDate)captureDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCaptureDate:(id)a3
{
}

- (int64_t)referenceCounter
{
  return self->mReferenceCounter;
}

- (void)setReferenceCounter:(int64_t)a3
{
  self->mReferenceCounter = a3;
}

- (int64_t)index
{
  return self->mIndex;
}

- (void)setIndex:(int64_t)a3
{
  self->mIndex = a3;
}

- (NSMutableDictionary)usageCounterPerLayer
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUsageCounterPerLayer:(id)a3
{
}

- (NSMutableArray)usableSlideClusters
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setUsableSlideClusters:(id)a3
{
}

@end