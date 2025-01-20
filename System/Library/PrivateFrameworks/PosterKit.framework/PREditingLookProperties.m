@interface PREditingLookProperties
+ (PREditingLookProperties)allocWithZone:(_NSZone *)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PREditingLookProperties)initWithProperties:(id)a3;
- (PREditingLookProperties)initWithTimeFontConfiguration:(id)a3 titlePosterColor:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)appendDescriptionToFormatter:(id)a3;
@end

@implementation PREditingLookProperties

+ (PREditingLookProperties)allocWithZone:(_NSZone *)a3
{
  self;
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == a1)
  {
    return (PREditingLookProperties *)+[PREditingLookProperties allocWithZone:a3];
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___PREditingLookProperties;
    return (PREditingLookProperties *)objc_msgSendSuper2(&v7, sel_allocWithZone_, a3);
  }
}

- (PREditingLookProperties)initWithTimeFontConfiguration:(id)a3 titlePosterColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  int v9 = [(PREditingLookProperties *)self isMemberOfClass:v8];

  if (v9)
  {
    v10 = [[PRImmutableEditingLookProperties alloc] initWithTimeFontConfiguration:v6 titlePosterColor:v7];
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PREditingLookProperties;
    v10 = [(PREditingLookProperties *)&v13 init];
    self = &v10->super;
  }
  p_super = &v10->super;

  return p_super;
}

- (PREditingLookProperties)initWithProperties:(id)a3
{
  id v4 = a3;
  id v5 = [v4 timeFontConfiguration];
  id v6 = [v4 titlePosterColor];

  id v7 = [(PREditingLookProperties *)self initWithTimeFontConfiguration:v5 titlePosterColor:v6];
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PREditingLookProperties *)a3;
  if (self == v4)
  {
    char v13 = 1;
  }
  else
  {
    id v5 = self;
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = v4;
      v8 = [(PREditingLookProperties *)self timeFontConfiguration];
      int v9 = [(PREditingLookProperties *)v7 timeFontConfiguration];
      int v10 = BSEqualObjects();

      if (v10)
      {
        v11 = [(PREditingLookProperties *)self titlePosterColor];
        v12 = [(PREditingLookProperties *)v7 titlePosterColor];
        char v13 = BSEqualObjects();
      }
      else
      {
        char v13 = 0;
      }
    }
    else
    {
      char v13 = 0;
    }
  }

  return v13;
}

- (unint64_t)hash
{
  v3 = [(PREditingLookProperties *)self timeFontConfiguration];
  uint64_t v4 = [v3 hash];
  id v5 = [(PREditingLookProperties *)self titlePosterColor];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F720]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  int v9 = __38__PREditingLookProperties_description__block_invoke;
  int v10 = &unk_1E54DAA08;
  v11 = self;
  id v12 = v3;
  id v4 = v3;
  [v4 appendProem:self block:&v7];
  id v5 = objc_msgSend(v4, "description", v7, v8, v9, v10, v11);

  return (NSString *)v5;
}

uint64_t __38__PREditingLookProperties_description__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) appendDescriptionToFormatter:*(void *)(a1 + 40)];
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = +[PREditingLookProperties allocWithZone:a3];
  return [(PREditingLookProperties *)v4 initWithProperties:self];
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v8 = a3;
  id v4 = [(PREditingLookProperties *)self timeFontConfiguration];
  id v5 = (id)[v8 appendObject:v4 withName:@"timeFontConfiguration"];

  unint64_t v6 = [(PREditingLookProperties *)self titlePosterColor];
  id v7 = (id)[v8 appendObject:v6 withName:@"titlePosterColor"];
}

@end