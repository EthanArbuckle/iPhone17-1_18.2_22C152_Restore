@interface PGGraphYearNodeCollection
+ (id)yearNodesLargerThanYear:(int64_t)a3 inGraph:(id)a4;
+ (unint64_t)calendarUnit;
- (NSArray)years;
- (void)enumerateYearsUsingBlock:(id)a3;
@end

@implementation PGGraphYearNodeCollection

- (void)enumerateYearsUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__PGGraphYearNodeCollection_enumerateYearsUsingBlock___block_invoke;
  v6[3] = &unk_1E68ED5A0;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateIntegerPropertyValuesForKey:@"name" withBlock:v6];
}

uint64_t __54__PGGraphYearNodeCollection_enumerateYearsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)years
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__PGGraphYearNodeCollection_years__block_invoke;
  v6[3] = &unk_1E68ED578;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateIntegerPropertyValuesForKey:@"name" withBlock:v6];

  return (NSArray *)v4;
}

void __34__PGGraphYearNodeCollection_years__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  objc_msgSend(NSNumber, "numberWithInteger:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

+ (id)yearNodesLargerThanYear:(int64_t)a3 inGraph:(id)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 filter];
  v15 = @"name";
  id v8 = objc_alloc(MEMORY[0x1E4F71E28]);
  v9 = [NSNumber numberWithInteger:a3];
  v10 = (void *)[v8 initWithComparator:5 value:v9];
  v16[0] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  v12 = [v7 filterBySettingProperties:v11];

  v13 = [a1 nodesMatchingFilter:v12 inGraph:v6];

  return v13;
}

+ (unint64_t)calendarUnit
{
  return 4;
}

@end