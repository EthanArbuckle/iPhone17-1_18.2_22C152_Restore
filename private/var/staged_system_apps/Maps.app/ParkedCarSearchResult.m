@interface ParkedCarSearchResult
- (ParkedCar)parkedCar;
- (ParkedCarSearchResult)initWithParkedCar:(id)a3;
- (id)personalizedItemKey;
- (id)title;
@end

@implementation ParkedCarSearchResult

- (ParkedCarSearchResult)initWithParkedCar:(id)a3
{
  id v5 = a3;
  v6 = [v5 mapItem];
  v9.receiver = self;
  v9.super_class = (Class)ParkedCarSearchResult;
  v7 = [(SearchResult *)&v9 initWithMapItem:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_parkedCar, a3);
  }

  return v7;
}

- (id)personalizedItemKey
{
  return +[ParkedCar personalizedItemKey];
}

- (id)title
{
  return [(ParkedCar *)self->_parkedCar title];
}

- (ParkedCar)parkedCar
{
  return self->_parkedCar;
}

- (void).cxx_destruct
{
}

@end