@interface MapsLocationOfInterest
+ (void)fetchLocationOfInterestWithIdentifier:(id)a3 completion:(id)a4;
- (BOOL)isFrequentLocation;
- (MKMapItem)mapItem;
- (MapsLocationOfInterest)init;
- (MapsLocationOfInterest)initWithLocationOfInterest:(id)a3 geoMapItem:(id)a4;
- (MapsLocationOfInterest)initWithLocationOfInterestType:(int64_t)a3 mapItem:(id)a4;
- (MapsLocationOfInterest)initWithMapsFavoriteItem:(id)a3;
- (MapsLocationOfInterest)initWithMapsSuggestionEntry:(id)a3;
- (NSString)customLabel;
- (NSString)name;
- (NSString)originalName;
- (NSUUID)identifier;
- (id)description;
- (int64_t)type;
- (void)_updateMapItemName;
- (void)_updateMapItemWithGeoMapItem:(id)a3;
- (void)setCustomLabel:(id)a3;
- (void)setType:(int64_t)a3;
@end

@implementation MapsLocationOfInterest

- (MapsLocationOfInterest)init
{
  return 0;
}

- (MapsLocationOfInterest)initWithLocationOfInterestType:(int64_t)a3 mapItem:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MapsLocationOfInterest;
  v7 = [(MapsLocationOfInterest *)&v11 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v9 = [v6 _geoMapItem];
    [(MapsLocationOfInterest *)v8 _updateMapItemWithGeoMapItem:v9];
  }
  return v8;
}

- (MapsLocationOfInterest)initWithLocationOfInterest:(id)a3 geoMapItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MapsLocationOfInterest;
  v8 = [(MapsLocationOfInterest *)&v14 init];
  if (v8)
  {
    v8->_type = (int64_t)[v6 type];
    uint64_t v9 = [v6 identifier];
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    uint64_t v11 = [v6 customLabel];
    customLabel = v8->_customLabel;
    v8->_customLabel = (NSString *)v11;

    [(MapsLocationOfInterest *)v8 _updateMapItemWithGeoMapItem:v7];
  }

  return v8;
}

- (MapsLocationOfInterest)initWithMapsSuggestionEntry:(id)a3
{
  id v4 = a3;
  v5 = [v4 MKMapItem];
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)MapsLocationOfInterest;
    id v6 = [(MapsLocationOfInterest *)&v17 init];
    if (v6)
    {
      id v7 = [v4 type];
      if (v7 == (id)1)
      {
        uint64_t v8 = 0;
      }
      else if (v7 == (id)19)
      {
        uint64_t v8 = 2;
      }
      else if (v7 == (id)2)
      {
        uint64_t v8 = 1;
      }
      else
      {
        uint64_t v8 = -1;
      }
      v6->_type = v8;
      id v10 = objc_alloc((Class)NSUUID);
      uint64_t v11 = [v4 uniqueIdentifier];
      v12 = (NSUUID *)[v10 initWithUUIDString:v11];
      identifier = v6->_identifier;
      v6->_identifier = v12;

      uint64_t v14 = [v4 stringForKey:@"MapsSuggestionsCoreRoutineCustomLabel"];
      customLabel = v6->_customLabel;
      v6->_customLabel = (NSString *)v14;

      objc_storeStrong((id *)&v6->_mapItem, v5);
      [(MapsLocationOfInterest *)v6 _updateMapItemName];
    }
    self = v6;
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (MapsLocationOfInterest)initWithMapsFavoriteItem:(id)a3
{
  id v4 = a3;
  v5 = [v4 mkMapItem];
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)MapsLocationOfInterest;
    id v6 = [(MapsLocationOfInterest *)&v17 init];
    if (v6)
    {
      unint64_t v7 = (unint64_t)[v4 type];
      if (v7 > 6) {
        int64_t v8 = 0;
      }
      else {
        int64_t v8 = qword_100F72B78[v7];
      }
      v6->_type = v8;
      id v10 = objc_alloc((Class)NSUUID);
      uint64_t v11 = [v4 identifier];
      v12 = (NSUUID *)[v10 initWithUUIDString:v11];
      identifier = v6->_identifier;
      v6->_identifier = v12;

      uint64_t v14 = [v4 customName];
      customLabel = v6->_customLabel;
      v6->_customLabel = (NSString *)v14;

      objc_storeStrong((id *)&v6->_mapItem, v5);
      [(MapsLocationOfInterest *)v6 _updateMapItemName];
    }
    self = v6;
    uint64_t v9 = self;
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (void)_updateMapItemName
{
  id v3 = [(MKMapItem *)self->_mapItem _geoMapItem];
  [(MapsLocationOfInterest *)self _updateMapItemWithGeoMapItem:v3];
}

- (void)_updateMapItemWithGeoMapItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v27 = v4;
    [(MapsLocationOfInterest *)self willChangeValueForKey:@"mapItem"];
    v5 = [v27 _clientAttributes];

    if (v5)
    {
      id v6 = v27;
    }
    else
    {
      id v7 = objc_alloc_init((Class)GEOMapItemClientAttributes);
      uint64_t v8 = +[GEOMapItemStorage mapItemStorageForGEOMapItem:v27 clientAttributes:v7];

      id v6 = (void *)v8;
    }
    id v28 = v6;
    uint64_t v9 = [v6 _clientAttributes];
    id v10 = [v9 routineAttributes];

    if (!v10)
    {
      id v11 = objc_alloc_init((Class)GEOMapItemRoutineAttributes);
      v12 = [v28 _clientAttributes];
      [v12 setRoutineAttributes:v11];
    }
    identifier = self->_identifier;
    uint64_t v14 = v28;
    if (identifier)
    {
      v15 = [v28 _clientAttributes];
      v16 = [v15 routineAttributes];
      [v16 setLoiIdentifier:identifier];

      uint64_t v14 = v28;
    }
    unint64_t type = self->_type;
    if (type < 4) {
      uint64_t v18 = (type + 1);
    }
    else {
      uint64_t v18 = 0;
    }
    v19 = [v14 _clientAttributes];
    v20 = [v19 routineAttributes];
    [v20 setLoiType:v18];

    v21 = (MKMapItem *)[objc_alloc((Class)MKMapItem) initWithGeoMapItem:v28 isPlaceHolderPlace:0];
    mapItem = self->_mapItem;
    self->_mapItem = v21;

    v23 = [(MapsLocationOfInterest *)self name];
    if (v23)
    {
      [(MapsLocationOfInterest *)self willChangeValueForKey:@"name"];
      v24 = [(MKMapItem *)self->_mapItem name];
      v25 = (NSString *)[v24 copy];
      originalName = self->_originalName;
      self->_originalName = v25;

      [(MKMapItem *)self->_mapItem setName:v23];
      [(MapsLocationOfInterest *)self didChangeValueForKey:@"name"];
    }
    [(MapsLocationOfInterest *)self didChangeValueForKey:@"mapItem"];
  }
}

- (NSString)name
{
  [(MapsLocationOfInterest *)self type];
  id v3 = [(MapsLocationOfInterest *)self customLabel];
  id v4 = MapsSuggestionsRoutineLocalizedLabelLOIType();

  if ([v4 length])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(MKMapItem *)self->_mapItem name];
  }
  id v6 = v5;

  return (NSString *)v6;
}

+ (void)fetchLocationOfInterestWithIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    uint64_t v8 = +[RTRoutineManager defaultManager];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100986DA4;
    v9[3] = &unk_101312348;
    id v10 = v5;
    id v11 = v7;
    [v8 fetchLocationOfInterestWithIdentifier:v10 withHandler:v9];
  }
}

- (BOOL)isFrequentLocation
{
  v2 = [(MapsLocationOfInterest *)self identifier];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(MapsLocationOfInterest *)self name];
  id v5 = [(MapsLocationOfInterest *)self mapItem];
  id v6 = [v5 name];
  id v7 = [(MapsLocationOfInterest *)self identifier];
  uint64_t v8 = +[NSString stringWithFormat:@"<%@ %p: name='%@', mapItem='%@', loi=%@>", v3, self, v4, v6, v7];

  return v8;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_unint64_t type = a3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)customLabel
{
  return self->_customLabel;
}

- (void)setCustomLabel:(id)a3
{
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (NSString)originalName
{
  return self->_originalName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_customLabel, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end