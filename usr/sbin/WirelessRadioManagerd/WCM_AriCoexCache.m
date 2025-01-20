@interface WCM_AriCoexCache
- (BOOL)get:(id)a3 value_BOOL:(BOOL *)a4 subId:(unsigned int)a5;
- (BOOL)get:(id)a3 value_double:(double *)a4 subId:(unsigned int)a5;
- (BOOL)get:(id)a3 value_int64:(int64_t *)a4 subId:(unsigned int)a5;
- (BOOL)get:(id)a3 value_uint64:(unint64_t *)a4 subId:(unsigned int)a5;
- (WCM_AriCoexCache)init;
- (id)get:(id)a3 subId:(unsigned int)a4;
- (void)removeKey:(id)a3 subId:(unsigned int)a4;
- (void)update:(id)a3 value_BOOL:(BOOL)a4 subId:(unsigned int)a5;
- (void)update:(id)a3 value_double:(double)a4 subId:(unsigned int)a5;
- (void)update:(id)a3 value_int64:(int64_t)a4 subId:(unsigned int)a5;
- (void)update:(id)a3 value_object:(id)a4 subId:(unsigned int)a5;
- (void)update:(id)a3 value_uint64:(unint64_t)a4 subId:(unsigned int)a5;
@end

@implementation WCM_AriCoexCache

- (WCM_AriCoexCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)WCM_AriCoexCache;
  v2 = [(WCM_AriCoexCache *)&v8 init];
  v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  mProperty0 = v2->mProperty0;
  v2->mProperty0 = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  mProperty1 = v2->mProperty1;
  v2->mProperty1 = v5;

  return v2;
}

- (void)removeKey:(id)a3 subId:(unsigned int)a4
{
  id v7 = a3;
  if (v7)
  {
    uint64_t v6 = 16;
    if (!a4) {
      uint64_t v6 = 8;
    }
    [*(id *)((char *)&self->super.isa + v6) removeObjectForKey:v7];
  }
}

- (void)update:(id)a3 value_object:(id)a4 subId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v10 = a3;
  id v8 = a4;
  if (v5 < 2)
  {
    uint64_t v9 = 16;
    if (!v5) {
      uint64_t v9 = 8;
    }
    [*(id *)((char *)&self->super.isa + v9) setValue:v8 forKey:v10];
  }
  else
  {
    +[WCM_Logging logLevel:0, @"ARI Driver: Cache update -- Invalid subId(%u)", v5 message];
  }
}

- (void)update:(id)a3 value_uint64:(unint64_t)a4 subId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  id v8 = +[NSNumber numberWithUnsignedLongLong:a4];
  [(WCM_AriCoexCache *)self update:v9 value_object:v8 subId:v5];
}

- (void)update:(id)a3 value_int64:(int64_t)a4 subId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  id v8 = +[NSNumber numberWithLongLong:a4];
  [(WCM_AriCoexCache *)self update:v9 value_object:v8 subId:v5];
}

- (void)update:(id)a3 value_BOOL:(BOOL)a4 subId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  id v9 = a3;
  id v8 = +[NSNumber numberWithBool:v6];
  [(WCM_AriCoexCache *)self update:v9 value_object:v8 subId:v5];
}

- (void)update:(id)a3 value_double:(double)a4 subId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  id v8 = +[NSNumber numberWithDouble:a4];
  [(WCM_AriCoexCache *)self update:v9 value_object:v8 subId:v5];
}

- (id)get:(id)a3 subId:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  if (v4 < 2)
  {
    uint64_t v8 = 16;
    if (!v4) {
      uint64_t v8 = 8;
    }
    id v7 = [*(id *)((char *)&self->super.isa + v8) objectForKeyedSubscript:v6];
  }
  else
  {
    +[WCM_Logging logLevel:0, @"ARI Driver: Cache get -- Invalid subId(%u)", v4 message];
    id v7 = 0;
  }

  return v7;
}

- (BOOL)get:(id)a3 value_uint64:(unint64_t *)a4 subId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = [(WCM_AriCoexCache *)self get:v8 subId:v5];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *a4 = (unint64_t)[v9 unsignedLongLongValue];
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)get:(id)a3 value_int64:(int64_t *)a4 subId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = [(WCM_AriCoexCache *)self get:v8 subId:v5];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *a4 = (int64_t)[v9 longLongValue];
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)get:(id)a3 value_BOOL:(BOOL *)a4 subId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = [(WCM_AriCoexCache *)self get:v8 subId:v5];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *a4 = [v9 BOOLValue];
    BOOL v10 = 1;
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (BOOL)get:(id)a3 value_double:(double *)a4 subId:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = [(WCM_AriCoexCache *)self get:v8 subId:v5];
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [v9 doubleValue];
    *(void *)a4 = v10;
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProperty1, 0);

  objc_storeStrong((id *)&self->mProperty0, 0);
}

@end