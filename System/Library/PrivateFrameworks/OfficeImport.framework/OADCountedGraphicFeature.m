@interface OADCountedGraphicFeature
- (OADCountedGraphicFeature)initWithFeature:(id)a3;
- (id)feature;
- (int64_t)compareUsageCount:(id)a3;
- (unint64_t)usageCount;
- (void)dealloc;
- (void)incrementUsageCount;
- (void)setUsageCount:(unint64_t)a3;
@end

@implementation OADCountedGraphicFeature

- (OADCountedGraphicFeature)initWithFeature:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OADCountedGraphicFeature;
  v6 = [(OADCountedGraphicFeature *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->mFeature, a3);
    v7->mUsageCount = 1;
  }

  return v7;
}

- (void)dealloc
{
  id mFeature = self->mFeature;
  self->id mFeature = 0;

  v4.receiver = self;
  v4.super_class = (Class)OADCountedGraphicFeature;
  [(OADCountedGraphicFeature *)&v4 dealloc];
}

- (void)incrementUsageCount
{
}

- (id)feature
{
  return self->mFeature;
}

- (int64_t)compareUsageCount:(id)a3
{
  unint64_t mUsageCount = self->mUsageCount;
  unint64_t v4 = *((void *)a3 + 2);
  BOOL v5 = mUsageCount > v4;
  int64_t v6 = mUsageCount != v4;
  if (v5) {
    return -1;
  }
  else {
    return v6;
  }
}

- (unint64_t)usageCount
{
  return self->mUsageCount;
}

- (void)setUsageCount:(unint64_t)a3
{
  self->unint64_t mUsageCount = a3;
}

- (void).cxx_destruct
{
}

@end