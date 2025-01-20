@interface NTKUpNextElementDataSource
- (id)supportedSections;
- (void)getElementsDuringDateInterval:(id)a3 inSection:(int64_t)a4 withHandler:(id)a5;
@end

@implementation NTKUpNextElementDataSource

- (id)supportedSections
{
  v6[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F94A28];
  v6[0] = *MEMORY[0x1E4F94A10];
  v6[1] = v2;
  uint64_t v3 = *MEMORY[0x1E4F94A20];
  v6[2] = *MEMORY[0x1E4F949D8];
  v6[3] = v3;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:4];

  return v4;
}

- (void)getElementsDuringDateInterval:(id)a3 inSection:(int64_t)a4 withHandler:(id)a5
{
}

@end