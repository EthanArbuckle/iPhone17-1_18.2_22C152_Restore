@interface SBHLocalizedIndexedCollationStrategy
+ (id)defaultCollationStrategy;
+ (id)defaultSectionIndexTitles;
+ (id)defaultSectionTitles;
+ (id)dimSumCollationStrategy;
+ (id)myCurrentCollation;
+ (void)prewarm;
- (BOOL)containsSection:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSArray)sectionIndexTitles;
- (NSArray)sectionTitles;
- (SBHLocalizedIndexedCollationStrategy)initWithAdditionalSections:(id)a3;
- (id)appendedSectionTitles;
- (id)sortedArrayFromArray:(id)a3 collationStringSelector:(SEL)a4;
- (int64_t)sectionForObject:(id)a3 collationStringSelector:(SEL)a4;
- (int64_t)sectionForSectionIndexTitleAtIndex:(int64_t)a3;
@end

@implementation SBHLocalizedIndexedCollationStrategy

+ (id)defaultSectionTitles
{
  return (id)__defaultSectionTitles;
}

+ (id)defaultSectionIndexTitles
{
  return (id)__defaultSectionIndexTitles;
}

+ (id)myCurrentCollation
{
  BSDispatchQueueAssertMain();
  if (myCurrentCollation_onceToken != -1) {
    dispatch_once(&myCurrentCollation_onceToken, &__block_literal_global_62);
  }
  v2 = (void *)myCurrentCollation_currentCollation;
  return v2;
}

void __58__SBHLocalizedIndexedCollationStrategy_myCurrentCollation__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4FB1960] currentCollation];
  v1 = (void *)myCurrentCollation_currentCollation;
  myCurrentCollation_currentCollation = v0;
}

+ (void)prewarm
{
  BSDispatchQueueAssertMain();
  v3 = [a1 myCurrentCollation];
  [v3 tokenizer];

  v4 = +[SBHLocalizedIndexedCollationStrategy myCurrentCollation];
  uint64_t v5 = [v4 sectionTitles];
  v6 = (void *)__defaultSectionTitles;
  __defaultSectionTitles = v5;

  v7 = +[SBHLocalizedIndexedCollationStrategy myCurrentCollation];
  uint64_t v8 = [v7 sectionIndexTitles];
  v9 = (void *)__defaultSectionIndexTitles;
  __defaultSectionIndexTitles = v8;

  id v10 = (id)[a1 dimSumCollationStrategy];
  id v11 = (id)[a1 defaultCollationStrategy];
}

+ (id)dimSumCollationStrategy
{
  if (dimSumCollationStrategy_onceToken != -1) {
    dispatch_once(&dimSumCollationStrategy_onceToken, &__block_literal_global_3_1);
  }
  v2 = (void *)dimSumCollationStrategy_dimSumCollation;
  return v2;
}

void __63__SBHLocalizedIndexedCollationStrategy_dimSumCollationStrategy__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [SBHLocalizedIndexedCollationStrategy alloc];
  v4[0] = *MEMORY[0x1E4FB2F38];
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v2 = [(SBHLocalizedIndexedCollationStrategy *)v0 initWithAdditionalSections:v1];
  v3 = (void *)dimSumCollationStrategy_dimSumCollation;
  dimSumCollationStrategy_dimSumCollation = v2;
}

+ (id)defaultCollationStrategy
{
  if (defaultCollationStrategy_onceToken != -1) {
    dispatch_once(&defaultCollationStrategy_onceToken, &__block_literal_global_6_1);
  }
  uint64_t v2 = (void *)defaultCollationStrategy_defaultCollationStrategy;
  return v2;
}

void __64__SBHLocalizedIndexedCollationStrategy_defaultCollationStrategy__block_invoke()
{
  uint64_t v0 = [[SBHLocalizedIndexedCollationStrategy alloc] initWithAdditionalSections:0];
  v1 = (void *)defaultCollationStrategy_defaultCollationStrategy;
  defaultCollationStrategy_defaultCollationStrategy = (uint64_t)v0;
}

- (SBHLocalizedIndexedCollationStrategy)initWithAdditionalSections:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SBHLocalizedIndexedCollationStrategy;
  uint64_t v5 = [(SBHLocalizedIndexedCollationStrategy *)&v19 init];
  if (v5)
  {
    uint64_t v6 = +[SBHLocalizedIndexedCollationStrategy myCurrentCollation];
    currentCollation = v5->_currentCollation;
    v5->_currentCollation = (UILocalizedIndexedCollation *)v6;

    uint64_t v8 = [(id)objc_opt_class() defaultSectionTitles];
    cachedSectionTitles = v5->_cachedSectionTitles;
    v5->_cachedSectionTitles = (NSArray *)v8;

    uint64_t v10 = [(id)objc_opt_class() defaultSectionIndexTitles];
    cachedSectionIndexTitles = v5->_cachedSectionIndexTitles;
    v5->_cachedSectionIndexTitles = (NSArray *)v10;

    if ([v4 count])
    {
      uint64_t v12 = [(NSArray *)v5->_cachedSectionTitles arrayByAddingObjectsFromArray:v4];
      v13 = v5->_cachedSectionTitles;
      v5->_cachedSectionTitles = (NSArray *)v12;

      uint64_t v14 = [(NSArray *)v5->_cachedSectionIndexTitles arrayByAddingObjectsFromArray:v4];
      v15 = v5->_cachedSectionIndexTitles;
      v5->_cachedSectionIndexTitles = (NSArray *)v14;

      uint64_t v16 = [v4 copy];
      appendedSections = v5->_appendedSections;
      v5->_appendedSections = (NSArray *)v16;
    }
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SBHLocalizedIndexedCollationStrategy *)a3;
  BSDispatchQueueAssertMain();
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    char v6 = 0;
    if (v4 && (isKindOfClass & 1) != 0) {
      char v6 = BSEqualObjects();
    }
  }

  return v6;
}

- (id)appendedSectionTitles
{
  return self->_appendedSections;
}

- (BOOL)containsSection:(id)a3
{
  return [(NSArray *)self->_cachedSectionTitles containsObject:a3];
}

- (NSArray)sectionTitles
{
  return self->_cachedSectionTitles;
}

- (NSArray)sectionIndexTitles
{
  return self->_cachedSectionIndexTitles;
}

- (int64_t)sectionForObject:(id)a3 collationStringSelector:(SEL)a4
{
  id v6 = a3;
  BSDispatchQueueAssertMain();
  int64_t v7 = [(UILocalizedIndexedCollation *)self->_currentCollation sectionForObject:v6 collationStringSelector:a4];
  if (self->_appendedSections)
  {
    uint64_t v8 = [v6 performSelector:sel__sbhIconLibraryOverrideCollationSectionTitle];
    if (v8) {
      int64_t v7 = [(NSArray *)self->_cachedSectionIndexTitles indexOfObject:v8];
    }
  }
  return v7;
}

- (id)sortedArrayFromArray:(id)a3 collationStringSelector:(SEL)a4
{
  id v6 = a3;
  BSDispatchQueueAssertMain();
  int64_t v7 = [(UILocalizedIndexedCollation *)self->_currentCollation sortedArrayFromArray:v6 collationStringSelector:a4];

  return v7;
}

- (int64_t)sectionForSectionIndexTitleAtIndex:(int64_t)a3
{
  BSDispatchQueueAssertMain();
  currentCollation = self->_currentCollation;
  return [(UILocalizedIndexedCollation *)currentCollation sectionForSectionIndexTitleAtIndex:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCollation, 0);
  objc_storeStrong((id *)&self->_appendedSections, 0);
  objc_storeStrong((id *)&self->_cachedSectionIndexTitles, 0);
  objc_storeStrong((id *)&self->_cachedSectionTitles, 0);
}

@end