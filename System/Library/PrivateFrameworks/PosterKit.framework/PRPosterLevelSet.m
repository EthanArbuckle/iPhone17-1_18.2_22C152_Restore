@interface PRPosterLevelSet
+ (BOOL)supportsSecureCoding;
+ (id)allLevelsExceptFloating;
+ (id)backgroundLevelSet;
+ (id)compositeLevelSet;
+ (id)defaultLevelSet;
+ (id)floatingLevelSet;
+ (id)foregroundLevelSet;
+ (id)levelSetForLevel:(int64_t)a3;
- (BOOL)containsLevel:(int64_t)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToLevelSet:(id)a3;
- (NSSet)levels;
- (PRPosterLevelSet)init;
- (PRPosterLevelSet)initWithCoder:(id)a3;
- (PRPosterLevelSet)initWithLevel:(int64_t)a3;
- (PRPosterLevelSet)initWithLevels:(id)a3;
- (PRPosterLevelSet)initWithNumberOfLevels:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)sortedLevels;
- (unint64_t)hash;
- (unint64_t)numberOfLevels;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateLevels:(id)a3;
@end

@implementation PRPosterLevelSet

+ (id)defaultLevelSet
{
  if (defaultLevelSet_onceToken != -1) {
    dispatch_once(&defaultLevelSet_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)defaultLevelSet_defaultLevelSet;
  return v2;
}

uint64_t __35__PRPosterLevelSet_defaultLevelSet__block_invoke()
{
  v0 = objc_alloc_init(PRPosterLevelSet);
  v1 = (void *)defaultLevelSet_defaultLevelSet;
  defaultLevelSet_defaultLevelSet = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x1E4F927F8] defaultLevelSet];
  uint64_t v3 = *(void *)(defaultLevelSet_defaultLevelSet + 8);
  *(void *)(defaultLevelSet_defaultLevelSet + 8) = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

+ (id)compositeLevelSet
{
  if (compositeLevelSet_onceToken != -1) {
    dispatch_once(&compositeLevelSet_onceToken, &__block_literal_global_56);
  }
  uint64_t v2 = (void *)compositeLevelSet_compositeLevelSet;
  return v2;
}

uint64_t __37__PRPosterLevelSet_compositeLevelSet__block_invoke()
{
  v0 = objc_alloc_init(PRPosterLevelSet);
  v1 = (void *)compositeLevelSet_compositeLevelSet;
  compositeLevelSet_compositeLevelSet = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x1E4F927F8] compositeLevelSet];
  uint64_t v3 = *(void *)(compositeLevelSet_compositeLevelSet + 8);
  *(void *)(compositeLevelSet_compositeLevelSet + 8) = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

+ (id)allLevelsExceptFloating
{
  if (allLevelsExceptFloating_onceToken != -1) {
    dispatch_once(&allLevelsExceptFloating_onceToken, &__block_literal_global_58);
  }
  uint64_t v2 = (void *)allLevelsExceptFloating_allLevelsExceptFloating;
  return v2;
}

uint64_t __43__PRPosterLevelSet_allLevelsExceptFloating__block_invoke()
{
  v0 = objc_alloc_init(PRPosterLevelSet);
  v1 = (void *)allLevelsExceptFloating_allLevelsExceptFloating;
  allLevelsExceptFloating_allLevelsExceptFloating = (uint64_t)v0;

  uint64_t v2 = [MEMORY[0x1E4F927F8] allLevelsExceptFloating];
  uint64_t v3 = *(void *)(allLevelsExceptFloating_allLevelsExceptFloating + 8);
  *(void *)(allLevelsExceptFloating_allLevelsExceptFloating + 8) = v2;
  return MEMORY[0x1F41817F8](v2, v3);
}

+ (id)backgroundLevelSet
{
  if (backgroundLevelSet_onceToken != -1) {
    dispatch_once(&backgroundLevelSet_onceToken, &__block_literal_global_60);
  }
  uint64_t v2 = (void *)backgroundLevelSet_backgroundLevelSet;
  return v2;
}

uint64_t __38__PRPosterLevelSet_backgroundLevelSet__block_invoke()
{
  uint64_t v0 = +[PRPosterLevelSet levelSetForLevel:-2000];
  uint64_t v1 = backgroundLevelSet_backgroundLevelSet;
  backgroundLevelSet_backgroundLevelSet = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)foregroundLevelSet
{
  if (foregroundLevelSet_onceToken != -1) {
    dispatch_once(&foregroundLevelSet_onceToken, &__block_literal_global_62);
  }
  uint64_t v2 = (void *)foregroundLevelSet_foregroundLevelSet;
  return v2;
}

uint64_t __38__PRPosterLevelSet_foregroundLevelSet__block_invoke()
{
  uint64_t v0 = +[PRPosterLevelSet levelSetForLevel:-1000];
  uint64_t v1 = foregroundLevelSet_foregroundLevelSet;
  foregroundLevelSet_foregroundLevelSet = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)floatingLevelSet
{
  if (floatingLevelSet_onceToken != -1) {
    dispatch_once(&floatingLevelSet_onceToken, &__block_literal_global_64);
  }
  uint64_t v2 = (void *)floatingLevelSet_floatingLevelSet;
  return v2;
}

uint64_t __36__PRPosterLevelSet_floatingLevelSet__block_invoke()
{
  uint64_t v0 = +[PRPosterLevelSet levelSetForLevel:1000];
  uint64_t v1 = floatingLevelSet_floatingLevelSet;
  floatingLevelSet_floatingLevelSet = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)levelSetForLevel:(int64_t)a3
{
  uint64_t v3 = [[PRPosterLevelSet alloc] initWithLevel:a3];
  return v3;
}

- (PRPosterLevelSet)initWithNumberOfLevels:(unint64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PRPosterLevelSet;
  v4 = [(PRPosterLevelSet *)&v12 init];
  if (v4)
  {
    v5 = objc_opt_new();
    for (i = &v13; a3; --a3)
    {
      v6 = i++;
      v7 = [NSNumber numberWithInteger:*v6];
      [v5 addObject:v7];
    }
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F927F8]) initWithSet:v5];
    underlyingLevelSet = v4->_underlyingLevelSet;
    v4->_underlyingLevelSet = (PUIPosterLevelSet *)v8;
  }
  return v4;
}

- (PRPosterLevelSet)initWithLevel:(int64_t)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PRPosterLevelSet;
  v4 = [(PRPosterLevelSet *)&v12 init];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F927F8]);
    v6 = (void *)MEMORY[0x1E4F1CAD0];
    v7 = [NSNumber numberWithInteger:a3];
    uint64_t v8 = [v6 setWithObject:v7];
    uint64_t v9 = [v5 initWithSet:v8];
    underlyingLevelSet = v4->_underlyingLevelSet;
    v4->_underlyingLevelSet = (PUIPosterLevelSet *)v9;
  }
  return v4;
}

- (PRPosterLevelSet)initWithLevels:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRPosterLevelSet;
  id v5 = [(PRPosterLevelSet *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F927F8]) initWithSet:v4];
    underlyingLevelSet = v5->_underlyingLevelSet;
    v5->_underlyingLevelSet = (PUIPosterLevelSet *)v6;
  }
  return v5;
}

- (PRPosterLevelSet)init
{
  v6.receiver = self;
  v6.super_class = (Class)PRPosterLevelSet;
  uint64_t v2 = [(PRPosterLevelSet *)&v6 init];
  if (v2)
  {
    uint64_t v3 = (PUIPosterLevelSet *)objc_alloc_init(MEMORY[0x1E4F927F8]);
    underlyingLevelSet = v2->_underlyingLevelSet;
    v2->_underlyingLevelSet = v3;
  }
  return v2;
}

- (PRPosterLevelSet)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PRPosterLevelSet;
  id v5 = [(PRPosterLevelSet *)&v14 init];
  if (v5)
  {
    objc_super v6 = (void *)MEMORY[0x1E4F1CAD0];
    v7 = self;
    uint64_t v8 = self;
    objc_super v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, 0);
    v10 = [v4 decodeObjectOfClasses:v9 forKey:@"levels"];

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F927F8]) initWithSet:v10];
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
  id v4 = (PRPosterLevelSet *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    BOOL v7 = (isKindOfClass & 1) != 0 && [(PRPosterLevelSet *)self isEqualToLevelSet:v4];
  }

  return v7;
}

- (BOOL)isEqualToLevelSet:(id)a3
{
  id v4 = (PRPosterLevelSet *)a3;
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
  id v4 = [+[PRPosterLevelSet allocWithZone:a3] init];
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
  uint64_t v2 = [(PUIPosterLevelSet *)self->_underlyingLevelSet sortedLevels];
  uint64_t v3 = [v2 array];

  return v3;
}

- (NSSet)levels
{
  return (NSSet *)[(PUIPosterLevelSet *)self->_underlyingLevelSet levels];
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = [(PRPosterLevelSet *)self sortedLevels];
  uint64_t v5 = objc_msgSend(v4, "bs_mapNoNulls:", &__block_literal_global_74);
  [v3 appendArraySection:v5 withName:@"levels" skipIfEmpty:1];

  objc_super v6 = [v3 build];

  return v6;
}

__CFString *__31__PRPosterLevelSet_description__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 integerValue];
  return ShortNSStringFromPRPosterLevel(v2);
}

- (void).cxx_destruct
{
}

@end