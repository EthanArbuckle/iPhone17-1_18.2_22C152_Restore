@interface WDAnnotationData
- (WDAnnotationData)initWithText:(id)a3;
- (id)date;
- (id)owner;
- (id)text;
- (void)setDate:(id)a3;
- (void)setOwner:(id)a3;
@end

@implementation WDAnnotationData

- (WDAnnotationData)initWithText:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)WDAnnotationData;
  v6 = [(WDAnnotationData *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mText, a3);
    uint64_t v8 = [MEMORY[0x263EFF910] date];
    mDate = v7->mDate;
    v7->mDate = (NSDate *)v8;

    v10 = (NSString *)objc_alloc_init(NSString);
    mOwner = v7->mOwner;
    v7->mOwner = v10;
  }
  return v7;
}

- (id)text
{
  return self->mText;
}

- (id)date
{
  return self->mDate;
}

- (void)setDate:(id)a3
{
}

- (id)owner
{
  return self->mOwner;
}

- (void)setOwner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOwner, 0);
  objc_storeStrong((id *)&self->mDate, 0);
  objc_storeStrong((id *)&self->mText, 0);
}

@end