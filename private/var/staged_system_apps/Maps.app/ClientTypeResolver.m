@interface ClientTypeResolver
- (BOOL)hasObjectWithType:(int)a3;
- (ClientTypeResolver)init;
- (ClientTypeResolver)initWithCurrentLocation:(BOOL)a3 parkedCar:(BOOL)a4 personalizedItems:(BOOL)a5;
- (ClientTypeResolverCurrentLocationSource)currentLocationSource;
- (ClientTypeResolverParkedCarSource)parkedCarSource;
- (ClientTypeResolverPersonalizedItemSource)personalizedItemSource;
- (NSMutableDictionary)sources;
- (id)sourceWithType:(int)a3;
- (void)addSource:(id)a3;
- (void)setCurrentLocationSource:(id)a3;
- (void)setParkedCarSource:(id)a3;
- (void)setPersonalizedItemSource:(id)a3;
- (void)setSources:(id)a3;
@end

@implementation ClientTypeResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sources, 0);
  objc_storeStrong((id *)&self->_personalizedItemSource, 0);
  objc_storeStrong((id *)&self->_parkedCarSource, 0);

  objc_storeStrong((id *)&self->_currentLocationSource, 0);
}

- (ClientTypeResolver)init
{
  return [(ClientTypeResolver *)self initWithCurrentLocation:1 parkedCar:1 personalizedItems:1];
}

- (ClientTypeResolver)initWithCurrentLocation:(BOOL)a3 parkedCar:(BOOL)a4 personalizedItems:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ClientTypeResolver;
  v8 = [(ClientTypeResolver *)&v25 init];
  if (!v8) {
    return v8;
  }
  v9 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  sources = v8->_sources;
  v8->_sources = v9;

  if (!v7)
  {
    if (!v6) {
      goto LABEL_4;
    }
LABEL_8:
    v21 = [ClientTypeResolverParkedCarSource alloc];
    v22 = +[ParkedCarManager sharedManager];
    v23 = [(ClientTypeResolverParkedCarSource *)v21 initWithParkedCarManager:v22];
    parkedCarSource = v8->_parkedCarSource;
    v8->_parkedCarSource = v23;

    [(ClientTypeResolver *)v8 addSource:v8->_parkedCarSource];
    if (!v5) {
      return v8;
    }
    goto LABEL_5;
  }
  v17 = [ClientTypeResolverCurrentLocationSource alloc];
  v18 = +[MKLocationManager sharedLocationManager];
  v19 = [(ClientTypeResolverCurrentLocationSource *)v17 initWithLocationManager:v18];
  currentLocationSource = v8->_currentLocationSource;
  v8->_currentLocationSource = v19;

  [(ClientTypeResolver *)v8 addSource:v8->_currentLocationSource];
  if (v6) {
    goto LABEL_8;
  }
LABEL_4:
  if (v5)
  {
LABEL_5:
    v11 = [ClientTypeResolverPersonalizedItemSource alloc];
    v12 = +[AddressBookManager sharedManager];
    v13 = +[CoreRoutineLocationOfInterestManager sharedManager];
    v14 = [(ClientTypeResolverPersonalizedItemSource *)v11 initWithAddressBookManager:v12 locationOfInterestManager:v13];
    personalizedItemSource = v8->_personalizedItemSource;
    v8->_personalizedItemSource = v14;

    [(ClientTypeResolver *)v8 addSource:v8->_personalizedItemSource];
  }
  return v8;
}

- (BOOL)hasObjectWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = -[ClientTypeResolver sourceWithType:](self, "sourceWithType:");
  LOBYTE(v3) = [v4 hasObjectWithType:v3];

  return v3;
}

- (id)sourceWithType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  v4 = [(ClientTypeResolver *)self sources];
  BOOL v5 = +[NSNumber numberWithInt:v3];
  BOOL v6 = [v4 objectForKey:v5];

  return v6;
}

- (void)addSource:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v5 = [v4 knownTypes];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v9);
        v11 = [(ClientTypeResolver *)self sources];
        [v11 setObject:v4 forKey:v10];

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (NSMutableDictionary)sources
{
  return self->_sources;
}

- (ClientTypeResolverCurrentLocationSource)currentLocationSource
{
  return self->_currentLocationSource;
}

- (void)setCurrentLocationSource:(id)a3
{
}

- (ClientTypeResolverParkedCarSource)parkedCarSource
{
  return self->_parkedCarSource;
}

- (void)setParkedCarSource:(id)a3
{
}

- (ClientTypeResolverPersonalizedItemSource)personalizedItemSource
{
  return self->_personalizedItemSource;
}

- (void)setPersonalizedItemSource:(id)a3
{
}

- (void)setSources:(id)a3
{
}

@end