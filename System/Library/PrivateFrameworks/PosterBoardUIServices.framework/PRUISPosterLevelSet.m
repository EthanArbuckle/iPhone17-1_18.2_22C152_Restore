@interface PRUISPosterLevelSet
+ (BOOL)supportsSecureCoding;
+ (id)PRUISPosterLevelSetForPUIPosterLevelSet:(id)a3;
+ (id)allLevelsExceptFloating;
+ (id)compositeLevelSet;
+ (id)defaultLevelSet;
+ (id)levelSetForLevel:(int64_t)a3;
- (BOOL)containsLevel:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLevelSet:(id)a3;
- (NSSet)levels;
- (PRUISPosterLevelSet)init;
- (PRUISPosterLevelSet)initWithCoder:(id)a3;
- (PRUISPosterLevelSet)initWithLevel:(int64_t)a3;
- (PRUISPosterLevelSet)initWithLevels:(id)a3;
- (PRUISPosterLevelSet)initWithNumberOfLevels:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)sortedLevels;
- (unint64_t)hash;
- (unint64_t)numberOfLevels;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateLevels:(id)a3;
@end

@implementation PRUISPosterLevelSet

+ (id)defaultLevelSet
{
  if (defaultLevelSet_onceToken != -1) {
    dispatch_once(&defaultLevelSet_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)defaultLevelSet_defaultLevelSet;

  return v2;
}

void __38__PRUISPosterLevelSet_defaultLevelSet__block_invoke()
{
  id v2 = [MEMORY[0x263F5F590] defaultLevelSet];
  uint64_t v0 = +[PRUISPosterLevelSet PRUISPosterLevelSetForPUIPosterLevelSet:v2];
  v1 = (void *)defaultLevelSet_defaultLevelSet;
  defaultLevelSet_defaultLevelSet = v0;
}

+ (id)compositeLevelSet
{
  if (compositeLevelSet_onceToken != -1) {
    dispatch_once(&compositeLevelSet_onceToken, &__block_literal_global_29);
  }
  id v2 = (void *)compositeLevelSet_compositeLevelSet;

  return v2;
}

void __40__PRUISPosterLevelSet_compositeLevelSet__block_invoke()
{
  id v2 = [MEMORY[0x263F5F590] compositeLevelSet];
  uint64_t v0 = +[PRUISPosterLevelSet PRUISPosterLevelSetForPUIPosterLevelSet:v2];
  v1 = (void *)compositeLevelSet_compositeLevelSet;
  compositeLevelSet_compositeLevelSet = v0;
}

+ (id)allLevelsExceptFloating
{
  if (allLevelsExceptFloating_onceToken != -1) {
    dispatch_once(&allLevelsExceptFloating_onceToken, &__block_literal_global_31);
  }
  id v2 = (void *)allLevelsExceptFloating_allLevelsExceptFloating;

  return v2;
}

void __46__PRUISPosterLevelSet_allLevelsExceptFloating__block_invoke()
{
  id v2 = [MEMORY[0x263F5F590] allLevelsExceptFloating];
  uint64_t v0 = +[PRUISPosterLevelSet PRUISPosterLevelSetForPUIPosterLevelSet:v2];
  v1 = (void *)allLevelsExceptFloating_allLevelsExceptFloating;
  allLevelsExceptFloating_allLevelsExceptFloating = v0;
}

+ (id)levelSetForLevel:(int64_t)a3
{
  v3 = [[PRUISPosterLevelSet alloc] initWithLevel:a3];

  return v3;
}

+ (id)PRUISPosterLevelSetForPUIPosterLevelSet:(id)a3
{
  v3 = (PUIPosterLevelSet *)a3;
  v4 = objc_alloc_init(PRUISPosterLevelSet);
  underlyingLevelSet = v4->_underlyingLevelSet;
  v4->_underlyingLevelSet = v3;

  return v4;
}

- (PRUISPosterLevelSet)initWithNumberOfLevels:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PRUISPosterLevelSet;
  v4 = [(PRUISPosterLevelSet *)&v12 init];
  if (v4)
  {
    v5 = objc_opt_new();
    for (i = &v13; a3; --a3)
    {
      v6 = i++;
      v7 = [NSNumber numberWithInteger:*v6];
      [v5 addObject:v7];
    }
    uint64_t v8 = [objc_alloc(MEMORY[0x263F5F590]) initWithSet:v5];
    underlyingLevelSet = v4->_underlyingLevelSet;
    v4->_underlyingLevelSet = (PUIPosterLevelSet *)v8;
  }
  return v4;
}

- (PRUISPosterLevelSet)initWithLevel:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PRUISPosterLevelSet;
  v4 = [(PRUISPosterLevelSet *)&v12 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F5F590]);
    v6 = (void *)MEMORY[0x263EFFA08];
    v7 = [NSNumber numberWithInteger:a3];
    uint64_t v8 = [v6 setWithObject:v7];
    uint64_t v9 = [v5 initWithSet:v8];
    underlyingLevelSet = v4->_underlyingLevelSet;
    v4->_underlyingLevelSet = (PUIPosterLevelSet *)v9;
  }
  return v4;
}

- (PRUISPosterLevelSet)initWithLevels:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISPosterLevelSet;
  id v5 = [(PRUISPosterLevelSet *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x263F5F590]) initWithSet:v4];
    underlyingLevelSet = v5->_underlyingLevelSet;
    v5->_underlyingLevelSet = (PUIPosterLevelSet *)v6;
  }
  return v5;
}

- (PRUISPosterLevelSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)PRUISPosterLevelSet;
  id v2 = [(PRUISPosterLevelSet *)&v6 init];
  if (v2)
  {
    v3 = (PUIPosterLevelSet *)objc_alloc_init(MEMORY[0x263F5F590]);
    underlyingLevelSet = v2->_underlyingLevelSet;
    v2->_underlyingLevelSet = v3;
  }
  return v2;
}

- (PRUISPosterLevelSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PRUISPosterLevelSet;
  id v5 = [(PRUISPosterLevelSet *)&v14 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x263EFFA08];
    v7 = self;
    uint64_t v8 = self;
    objc_super v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"levels"];

    uint64_t v11 = [objc_alloc(MEMORY[0x263F5F590]) initWithSet:v10];
    underlyingLevelSet = v5->_underlyingLevelSet;
    v5->_underlyingLevelSet = (PUIPosterLevelSet *)v11;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  underlyingLevelSet = self->_underlyingLevelSet;
  id v4 = a3;
  id v5 = [(PUIPosterLevelSet *)underlyingLevelSet levels];
  [v4 encodeObject:v5 forKey:@"levels"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)numberOfLevels
{
  return [(PUIPosterLevelSet *)self->_underlyingLevelSet numberOfLevels];
}

- (unint64_t)hash
{
  return [(PUIPosterLevelSet *)self->_underlyingLevelSet hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PRUISPosterLevelSet *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v7 = (isKindOfClass & 1) != 0 && [(PRUISPosterLevelSet *)self isEqualToLevelSet:v4];
  }

  return v7;
}

- (BOOL)isEqualToLevelSet:(id)a3
{
  id v4 = (PRUISPosterLevelSet *)a3;
  p_isa = (id *)&v4->super.isa;
  if (v4)
  {
    if (self == v4)
    {
      char v8 = 1;
    }
    else
    {
      objc_super v6 = [(PUIPosterLevelSet *)self->_underlyingLevelSet levels];
      BOOL v7 = [p_isa[1] levels];
      char v8 = [v6 isEqualToSet:v7];
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[PRUISPosterLevelSet allocWithZone:a3] init];
  uint64_t v5 = [(PUIPosterLevelSet *)self->_underlyingLevelSet copy];
  underlyingLevelSet = v4->_underlyingLevelSet;
  v4->_underlyingLevelSet = (PUIPosterLevelSet *)v5;

  return v4;
}

- (BOOL)containsLevel:(int64_t)a3
{
  return [(PUIPosterLevelSet *)self->_underlyingLevelSet containsLevel:a3];
}

- (void)enumerateLevels:(id)a3
{
}

- (id)sortedLevels
{
  id v2 = [(PUIPosterLevelSet *)self->_underlyingLevelSet sortedLevels];
  v3 = [v2 array];

  return v3;
}

- (NSSet)levels
{
  return (NSSet *)[(PUIPosterLevelSet *)self->_underlyingLevelSet levels];
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = [(PRUISPosterLevelSet *)self sortedLevels];
  uint64_t v5 = objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_41);
  [v3 appendArraySection:v5 withName:@"levels" skipIfEmpty:1];

  objc_super v6 = [v3 build];

  return v6;
}

__CFString *__34__PRUISPosterLevelSet_description__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];

  return ShortNSStringFromPRUISPosterLevel(v2);
}

- (void).cxx_destruct
{
}

@end