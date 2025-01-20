@interface PUIPosterLevelSet
+ (BOOL)supportsSecureCoding;
+ (id)allLevelsExceptFloating;
+ (id)compositeLevelSet;
+ (id)defaultLevelSet;
+ (id)floatingLevelSet;
+ (id)levelSetForLevel:(int64_t)a3;
- (BOOL)containsLevel:(int64_t)a3;
- (BOOL)isCompositeLevelSet;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLevelSet:(id)a3;
- (NSOrderedSet)sortedLevels;
- (NSSet)levels;
- (PUIPosterLevelSet)init;
- (PUIPosterLevelSet)initWithCoder:(id)a3;
- (PUIPosterLevelSet)initWithLevel:(int64_t)a3;
- (PUIPosterLevelSet)initWithNumberOfLevels:(unint64_t)a3;
- (PUIPosterLevelSet)initWithSet:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)numberOfLevels;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateLevels:(id)a3;
@end

@implementation PUIPosterLevelSet

+ (id)defaultLevelSet
{
  if (defaultLevelSet_onceToken != -1) {
    dispatch_once(&defaultLevelSet_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)defaultLevelSet_defaultLevelSet;
  return v2;
}

uint64_t __36__PUIPosterLevelSet_defaultLevelSet__block_invoke()
{
  defaultLevelSet_defaultLevelSet = -[PUIPosterLevelSet initWithNumberOfLevels:]([PUIPosterLevelSet alloc], "initWithNumberOfLevels:", 3, -1000, 1000, -2000);
  return MEMORY[0x270F9A758]();
}

+ (id)compositeLevelSet
{
  if (compositeLevelSet_onceToken != -1) {
    dispatch_once(&compositeLevelSet_onceToken, &__block_literal_global_28);
  }
  v2 = (void *)compositeLevelSet_compositeLevelSet;
  return v2;
}

uint64_t __38__PUIPosterLevelSet_compositeLevelSet__block_invoke()
{
  compositeLevelSet_compositeLevelSet = -[PUIPosterLevelSet initWithNumberOfLevels:]([PUIPosterLevelSet alloc], "initWithNumberOfLevels:", 8, -3000, -2000, -1000, -500, 0, 1000, 2000, 3000);
  return MEMORY[0x270F9A758]();
}

+ (id)allLevelsExceptFloating
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__PUIPosterLevelSet_allLevelsExceptFloating__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allLevelsExceptFloating_onceToken != -1) {
    dispatch_once(&allLevelsExceptFloating_onceToken, block);
  }
  v2 = (void *)allLevelsExceptFloating_allLevelsExceptFloating;
  return v2;
}

uint64_t __44__PUIPosterLevelSet_allLevelsExceptFloating__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) compositeLevelSet];
  uint64_t v2 = [v1 copy];
  v3 = (void *)allLevelsExceptFloating_allLevelsExceptFloating;
  allLevelsExceptFloating_allLevelsExceptFloating = v2;

  *(void *)(allLevelsExceptFloating_allLevelsExceptFloating + 8) = objc_msgSend(*(id *)(allLevelsExceptFloating_allLevelsExceptFloating + 8), "bs_filter:", &__block_literal_global_31);
  return MEMORY[0x270F9A758]();
}

uint64_t __44__PUIPosterLevelSet_allLevelsExceptFloating__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqualToNumber:&unk_27081B398] ^ 1;
}

+ (id)floatingLevelSet
{
  if (floatingLevelSet_onceToken != -1) {
    dispatch_once(&floatingLevelSet_onceToken, &__block_literal_global_34);
  }
  uint64_t v2 = (void *)floatingLevelSet_floatingLevelSet;
  return v2;
}

uint64_t __37__PUIPosterLevelSet_floatingLevelSet__block_invoke()
{
  floatingLevelSet_floatingLevelSet = [[PUIPosterLevelSet alloc] initWithLevel:1000];
  return MEMORY[0x270F9A758]();
}

+ (id)levelSetForLevel:(int64_t)a3
{
  v3 = [[PUIPosterLevelSet alloc] initWithLevel:a3];
  return v3;
}

- (PUIPosterLevelSet)initWithSet:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUIPosterLevelSet;
  v5 = [(PUIPosterLevelSet *)&v11 init];
  if (v5)
  {
    v6 = (void *)[v4 copy];
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      v8 = [MEMORY[0x263EFFA08] set];
    }
    levels = v5->_levels;
    v5->_levels = v8;
  }
  return v5;
}

- (PUIPosterLevelSet)initWithNumberOfLevels:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PUIPosterLevelSet;
  id v4 = [(PUIPosterLevelSet *)&v12 init];
  if (v4)
  {
    v5 = objc_opt_new();
    for (i = &v13; a3; --a3)
    {
      v6 = i++;
      v7 = [NSNumber numberWithInteger:*v6];
      [v5 addObject:v7];
    }
    uint64_t v8 = [v5 copy];
    levels = v4->_levels;
    v4->_levels = (NSSet *)v8;
  }
  return v4;
}

- (PUIPosterLevelSet)initWithLevel:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PUIPosterLevelSet;
  id v4 = [(PUIPosterLevelSet *)&v10 init];
  if (v4)
  {
    v5 = (void *)MEMORY[0x263EFFA08];
    v6 = [NSNumber numberWithInteger:a3];
    uint64_t v7 = [v5 setWithObject:v6];
    levels = v4->_levels;
    v4->_levels = (NSSet *)v7;
  }
  return v4;
}

- (PUIPosterLevelSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)PUIPosterLevelSet;
  uint64_t v2 = [(PUIPosterLevelSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    levels = v2->_levels;
    v2->_levels = (NSSet *)v3;
  }
  return v2;
}

- (PUIPosterLevelSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUIPosterLevelSet;
  v5 = [(PUIPosterLevelSet *)&v13 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    uint64_t v7 = self;
    uint64_t v8 = self;
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"levels"];
    levels = v5->_levels;
    v5->_levels = (NSSet *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)numberOfLevels
{
  return [(NSSet *)self->_levels count];
}

- (unint64_t)hash
{
  return [(NSSet *)self->_levels hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PUIPosterLevelSet *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v7 = (isKindOfClass & 1) != 0 && [(PUIPosterLevelSet *)self isEqualToLevelSet:v4];
  }

  return v7;
}

- (BOOL)isEqualToLevelSet:(id)a3
{
  id v4 = (PUIPosterLevelSet *)a3;
  v5 = v4;
  if (v4)
  {
    if (self == v4) {
      char v6 = 1;
    }
    else {
      char v6 = [(NSSet *)self->_levels isEqual:v4->_levels];
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PUIPosterLevelSet allocWithZone:a3] init];
  uint64_t v5 = [(NSSet *)self->_levels copy];
  levels = v4->_levels;
  v4->_levels = (NSSet *)v5;

  return v4;
}

- (BOOL)containsLevel:(int64_t)a3
{
  levels = self->_levels;
  id v4 = [NSNumber numberWithInteger:a3];
  LOBYTE(levels) = [(NSSet *)levels containsObject:v4];

  return (char)levels;
}

- (void)enumerateLevels:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF980];
    char v6 = [(NSSet *)self->_levels allObjects];
    BOOL v7 = [v5 arrayWithArray:v6];

    [v7 sortUsingSelector:sel_compare_];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __37__PUIPosterLevelSet_enumerateLevels___block_invoke;
    v8[3] = &unk_265471A80;
    id v9 = v4;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

uint64_t __37__PUIPosterLevelSet_enumerateLevels___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = [a2 integerValue];
  BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  return v7(v5, v6, a4);
}

- (NSOrderedSet)sortedLevels
{
  sortedLevels = self->_sortedLevels;
  if (sortedLevels)
  {
    uint64_t v3 = sortedLevels;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x263EFF980];
    uint64_t v6 = [(NSSet *)self->_levels allObjects];
    BOOL v7 = [v5 arrayWithArray:v6];

    [v7 sortUsingSelector:sel_compare_];
    uint64_t v8 = [MEMORY[0x263EFF9D8] orderedSetWithArray:v7];
    id v9 = self->_sortedLevels;
    self->_sortedLevels = v8;

    uint64_t v3 = self->_sortedLevels;
  }
  return v3;
}

- (id)description
{
  if (description_onceToken != -1) {
    dispatch_once(&description_onceToken, &__block_literal_global_47);
  }
  uint64_t v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(PUIPosterLevelSet *)self sortedLevels];
  uint64_t v5 = [v4 array];
  uint64_t v6 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_56);
  [v3 appendArraySection:v6 withName:@"levels" skipIfEmpty:1];

  BOOL v7 = [v3 build];

  return v7;
}

void __32__PUIPosterLevelSet_description__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)description_posixNumberFormatter;
  description_posixNumberFormatter = v0;

  uint64_t v2 = (void *)description_posixNumberFormatter;
  id v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];
}

uint64_t __32__PUIPosterLevelSet_description__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [(id)description_posixNumberFormatter stringFromNumber:a2];
}

- (BOOL)isCompositeLevelSet
{
  id v3 = [(id)objc_opt_class() compositeLevelSet];
  LOBYTE(self) = [(PUIPosterLevelSet *)self isEqualToLevelSet:v3];

  return (char)self;
}

- (NSSet)levels
{
  return self->_levels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortedLevels, 0);
  objc_storeStrong((id *)&self->_levels, 0);
}

@end