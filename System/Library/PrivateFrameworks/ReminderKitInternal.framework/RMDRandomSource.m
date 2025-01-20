@interface RMDRandomSource
+ (BOOL)supportsSecureCoding;
+ (id)sharedRandom;
- (BOOL)nextBool;
- (RMDRandomSource)init;
- (RMDRandomSource)initWithCoder:(id)a3;
- (float)nextUniform;
- (id)arrayByShufflingObjectsInArray:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)nextInt;
- (unint64_t)nextIntWithUpperBound:(unint64_t)a3;
@end

@implementation RMDRandomSource

- (RMDRandomSource)init
{
  uint64_t v3 = objc_opt_class();
  if (v3 == objc_opt_class())
  {
    v4 = objc_alloc_init(RMDARC4RandomSource);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)RMDRandomSource;
    v4 = [(RMDRandomSource *)&v7 init];
    self = &v4->super;
  }
  p_super = &v4->super;

  return p_super;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();

  return (id)objc_opt_new();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RMDRandomSource)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RMDRandomSource;
  return [(RMDRandomSource *)&v4 init];
}

+ (id)sharedRandom
{
  if (sharedRandom_onceToken != -1) {
    dispatch_once(&sharedRandom_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedRandom_source;

  return v2;
}

uint64_t __31__RMDRandomSource_sharedRandom__block_invoke()
{
  sharedRandom_source = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

- (int64_t)nextInt
{
  return 0;
}

- (unint64_t)nextIntWithUpperBound:(unint64_t)a3
{
  return 0;
}

- (float)nextUniform
{
  return (float)[(RMDRandomSource *)self nextIntWithUpperBound:16777217] * 0.000000059605;
}

- (BOOL)nextBool
{
  return [(RMDRandomSource *)self nextIntWithUpperBound:2] != 0;
}

- (id)arrayByShufflingObjectsInArray:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((unint64_t)[v4 count] > 1)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v4;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      int v10 = 0;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          unint64_t v14 = [(RMDRandomSource *)self nextIntWithUpperBound:(v10 + i + 1)];
          if (v14 == v10 + i)
          {
            [v6 addObject:v13];
          }
          else
          {
            unint64_t v15 = v14;
            v16 = [v6 objectAtIndex:v14];
            [v6 addObject:v16];

            [v6 setObject:v13 atIndexedSubscript:v15];
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        v10 += i;
      }
      while (v9);
    }

    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v6];
    id v4 = v18;
  }
  else
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4];
  }

  return v5;
}

@end