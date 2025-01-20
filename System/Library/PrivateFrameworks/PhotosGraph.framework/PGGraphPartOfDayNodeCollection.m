@interface PGGraphPartOfDayNodeCollection
+ (Class)nodeClass;
+ (id)partOfDayNodeForPartOfDay:(unint64_t)a3 inGraph:(id)a4;
- (NSArray)partsOfDay;
- (void)enumerateNamesUsingBlock:(id)a3;
@end

@implementation PGGraphPartOfDayNodeCollection

- (void)enumerateNamesUsingBlock:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PGGraphPartOfDayNodeCollection_enumerateNamesUsingBlock___block_invoke;
  v6[3] = &unk_1E68EDC50;
  id v7 = v4;
  id v5 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];
}

uint64_t __59__PGGraphPartOfDayNodeCollection_enumerateNamesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSArray)partsOfDay
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__PGGraphPartOfDayNodeCollection_partsOfDay__block_invoke;
  v6[3] = &unk_1E68F1988;
  id v4 = v3;
  id v7 = v4;
  [(MANodeCollection *)self enumerateStringPropertyValuesForKey:@"name" withBlock:v6];

  return (NSArray *)v4;
}

void __44__PGGraphPartOfDayNodeCollection_partsOfDay__block_invoke(uint64_t a1)
{
  unint64_t v2 = +[PGGraphPartOfDayNode partOfDayForPartOfDayName:](PGGraphPartOfDayNode, "partOfDayForPartOfDayName:");
  id v3 = *(void **)(a1 + 32);
  id v4 = [NSNumber numberWithUnsignedInteger:v2];
  [v3 addObject:v4];
}

+ (id)partOfDayNodeForPartOfDay:(unint64_t)a3 inGraph:(id)a4
{
  id v5 = a4;
  v6 = +[PGGraphPartOfDayNode filterWithPartOfDay:a3];
  id v7 = +[MANodeCollection nodesMatchingFilter:v6 inGraph:v5];

  return v7;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

@end