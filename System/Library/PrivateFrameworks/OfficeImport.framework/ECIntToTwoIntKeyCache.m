@interface ECIntToTwoIntKeyCache
+ (id)keyForKey1:(unint64_t)a3 key2:(unint64_t)a4;
- (BOOL)integerIsPresentForKey1:(unint64_t)a3 key2:(unint64_t)a4 outValue:(unint64_t *)a5;
- (ECIntToTwoIntKeyCache)init;
- (void)setObject:(unint64_t)a3 forKey1:(unint64_t)a4 key2:(unint64_t)a5;
@end

@implementation ECIntToTwoIntKeyCache

- (ECIntToTwoIntKeyCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)ECIntToTwoIntKeyCache;
  v2 = [(ECIntToTwoIntKeyCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mCache = v2->mCache;
    v2->mCache = v3;
  }
  return v2;
}

+ (id)keyForKey1:(unint64_t)a3 key2:(unint64_t)a4
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%llu,%llu", a3, a4);
}

- (BOOL)integerIsPresentForKey1:(unint64_t)a3 key2:(unint64_t)a4 outValue:(unint64_t *)a5
{
  v7 = +[ECIntToTwoIntKeyCache keyForKey1:a3 key2:a4];
  v8 = [(NSMutableDictionary *)self->mCache objectForKeyedSubscript:v7];
  v9 = v8;
  if (v8) {
    *a5 = [v8 unsignedIntegerValue];
  }

  return v9 != 0;
}

- (void)setObject:(unint64_t)a3 forKey1:(unint64_t)a4 key2:(unint64_t)a5
{
  id v8 = +[ECIntToTwoIntKeyCache keyForKey1:a4 key2:a5];
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)self->mCache setObject:v7 forKeyedSubscript:v8];
}

- (void).cxx_destruct
{
}

@end