@interface WeatherMapURLCache
- (_TtC11WeatherMaps18WeatherMapURLCache)init;
- (_TtC11WeatherMaps18WeatherMapURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 directoryURL:(id)a5;
- (_TtC11WeatherMaps18WeatherMapURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 diskPath:(id)a5;
- (id)cachedResponseForRequest:(id)a3;
- (void)getCachedResponseForDataTask:(NSURLSessionDataTask *)a3 completionHandler:(id)a4;
- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4;
- (void)storeCachedResponse:(id)a3 forRequest:(id)a4;
@end

@implementation WeatherMapURLCache

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  uint64_t v6 = sub_20A388E20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A388DE0();
  id v10 = a3;
  v11 = self;
  sub_20A2FF91C((uint64_t)v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (id)cachedResponseForRequest:(id)a3
{
  uint64_t v4 = sub_20A388E20();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A388DE0();
  uint64_t v8 = self;
  id v9 = sub_20A2FFC6C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (void)storeCachedResponse:(id)a3 forDataTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_20A2FFE54((uint64_t)v6, v7);
}

- (void)getCachedResponseForDataTask:(NSURLSessionDataTask *)a3 completionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  id v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  uint64_t v8 = a3;
  id v9 = self;
  sub_20A300894((uint64_t)&unk_267627E28, (uint64_t)v7);
}

- (_TtC11WeatherMaps18WeatherMapURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 diskPath:(id)a5
{
  if (a5)
  {
    uint64_t v7 = sub_20A38B610();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  return (_TtC11WeatherMaps18WeatherMapURLCache *)sub_20A300998(a3, a4, v7, v9);
}

- (_TtC11WeatherMaps18WeatherMapURLCache)initWithMemoryCapacity:(int64_t)a3 diskCapacity:(int64_t)a4 directoryURL:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AC390E8);
  MEMORY[0x270FA5388](v8 - 8);
  id v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_20A3892F0();
    uint64_t v11 = sub_20A389310();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v11 = sub_20A389310();
    uint64_t v12 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v10, v12, 1, v11);
  return (_TtC11WeatherMaps18WeatherMapURLCache *)sub_20A300A98(a3, a4, (uint64_t)v10);
}

- (_TtC11WeatherMaps18WeatherMapURLCache)init
{
  return (_TtC11WeatherMaps18WeatherMapURLCache *)sub_20A300CB8();
}

@end