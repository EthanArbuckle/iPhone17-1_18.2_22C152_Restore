@interface CHDScatterSeries
- (id)categoryData;
- (void)setCategoryData:(id)a3;
@end

@implementation CHDScatterSeries

- (void)setCategoryData:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CHDScatterSeries;
  [(CHDSeries *)&v7 setCategoryData:v4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->super.super.mChart);
  v6 = [WeakRetained processors];
  [v6 markObject:v4 processor:objc_opt_class()];
}

- (id)categoryData
{
  return self->super.super.mCategoryData;
}

@end