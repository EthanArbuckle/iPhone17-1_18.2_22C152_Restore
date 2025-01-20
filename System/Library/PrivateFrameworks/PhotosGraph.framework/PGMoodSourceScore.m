@interface PGMoodSourceScore
- (double)weight;
- (id)negativeVectorWithGraph:(id)a3;
- (id)positiveVectorWithGraph:(id)a3;
@end

@implementation PGMoodSourceScore

- (id)negativeVectorWithGraph:(id)a3
{
  v3 = objc_opt_new();
  return v3;
}

- (id)positiveVectorWithGraph:(id)a3
{
  v3 = [[PGMoodVector alloc] initWithArray:&unk_1F28D44B8];
  return v3;
}

- (double)weight
{
  return 1.0;
}

@end