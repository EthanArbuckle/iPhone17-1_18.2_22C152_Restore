@interface RTStateDepictionOneState
+ (BOOL)supportsSecureCoding;
- (GEOMapItem)geoMapItem;
- (NSDate)geocodeDate;
- (NSMutableArray)histEntryExit_s;
- (NSString)customLabel;
- (RTMapItem)mapItem;
- (RTStateDepictionOneState)init;
- (RTStateDepictionOneState)initWithCoder:(id)a3;
- (RTStateDepictionOneState)initWithLocation:(id)a3 type:(int64_t)a4 typeSource:(unint64_t)a5 customLabel:(id)a6 mapItem:(id)a7;
- (RTStateModelLocation)location;
- (id)description;
- (int64_t)type;
- (unint64_t)mapItemSource;
- (unint64_t)typeSource;
- (void)encodeWithCoder:(id)a3;
- (void)setCustomLabel:(id)a3;
- (void)setGeoMapItem:(id)a3;
- (void)setGeocodeDate:(id)a3;
- (void)setHistEntryExit_s:(id)a3;
- (void)setLocation:(id)a3;
- (void)setMapItem:(id)a3;
- (void)setMapItemSource:(unint64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setTypeSource:(unint64_t)a3;
@end

@implementation RTStateDepictionOneState

- (RTStateDepictionOneState)init
{
  return [(RTStateDepictionOneState *)self initWithLocation:0 type:-1 typeSource:0 customLabel:0 mapItem:0];
}

- (RTStateDepictionOneState)initWithLocation:(id)a3 type:(int64_t)a4 typeSource:(unint64_t)a5 customLabel:(id)a6 mapItem:(id)a7
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)RTStateDepictionOneState;
  v16 = [(RTStateDepictionOneState *)&v24 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_location, a3);
    v17->_type = a4;
    v17->_typeSource = a5;
    objc_storeStrong((id *)&v17->_mapItem, a7);
    geocodeDate = v17->_geocodeDate;
    v17->_geocodeDate = 0;

    uint64_t v19 = objc_opt_new();
    histEntryExit_s = v17->_histEntryExit_s;
    v17->_histEntryExit_s = (NSMutableArray *)v19;

    uint64_t v21 = [v14 copy];
    customLabel = v17->_customLabel;
    v17->_customLabel = (NSString *)v21;
  }
  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(RTStateDepictionOneState *)self location];
  [v4 encodeObject:v5 forKey:@"location"];

  [v4 encodeInteger:-[RTStateDepictionOneState type](self, "type") forKey:@"type"];
  [v4 encodeInteger:-[RTStateDepictionOneState typeSource](self, "typeSource") forKey:@"typeSource2.0"];
  v6 = (void *)MEMORY[0x1E4F646E0];
  v7 = [(RTStateDepictionOneState *)self geoMapItem];
  v8 = [v6 mapItemStorageForGEOMapItem:v7];
  [v4 encodeObject:v8 forKey:@"mapItem"];

  [v4 encodeInteger:-[RTStateDepictionOneState mapItemSource](self, "mapItemSource") forKey:@"mapItemSource"];
  v9 = [(RTStateDepictionOneState *)self geocodeDate];
  [v4 encodeObject:v9 forKey:@"geocodeDate"];

  v10 = [(RTStateDepictionOneState *)self histEntryExit_s];
  [v4 encodeObject:v10 forKey:@"histEntryExit_s"];

  id v11 = [(RTStateDepictionOneState *)self customLabel];
  [v4 encodeObject:v11 forKey:@"customLabel"];
}

- (RTStateDepictionOneState)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RTStateDepictionOneState;
  v5 = [(RTStateDepictionOneState *)&v24 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"location"];
    location = v5->_location;
    v5->_location = (RTStateModelLocation *)v6;

    if ([v4 containsValueForKey:@"type"]) {
      uint64_t v8 = [v4 decodeIntegerForKey:@"type"];
    }
    else {
      uint64_t v8 = -1;
    }
    v5->_type = v8;
    if ([v4 containsValueForKey:@"typeSource2.0"]) {
      uint64_t v9 = [v4 decodeIntegerForKey:@"typeSource2.0"];
    }
    else {
      uint64_t v9 = 0;
    }
    v5->_typeSource = v9;
    if ([v4 containsValueForKey:@"typeSource"])
    {
      unint64_t v10 = [v4 decodeIntegerForKey:@"typeSource"] + 1;
      if (v10 <= 5) {
        v5->_typeSource = qword_1DA0FFDC8[v10];
      }
    }
    if ([v4 containsValueForKey:@"mapItem"])
    {
      uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mapItem"];
      geoMapItem = v5->_geoMapItem;
      v5->_geoMapItem = (GEOMapItem *)v11;
    }
    if ([v4 containsValueForKey:@"mapItemSource"]) {
      uint64_t v13 = [v4 decodeIntegerForKey:@"mapItemSource"];
    }
    else {
      uint64_t v13 = 0;
    }
    v5->_mapItemSource = v13;
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"geocodeDate"];
    geocodeDate = v5->_geocodeDate;
    v5->_geocodeDate = (NSDate *)v14;

    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = [v16 setWithObjects:v17, objc_opt_class(), 0];
    uint64_t v19 = [v4 decodeObjectOfClasses:v18 forKey:@"histEntryExit_s"];
    histEntryExit_s = v5->_histEntryExit_s;
    v5->_histEntryExit_s = (NSMutableArray *)v19;

    if ([v4 containsValueForKey:@"customLabel"])
    {
      uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customLabel"];
      customLabel = v5->_customLabel;
      v5->_customLabel = (NSString *)v21;
    }
  }

  return v5;
}

- (id)description
{
  v27 = NSString;
  v26 = [(RTStateDepictionOneState *)self location];
  v23 = [MEMORY[0x1E4F5CE10] locationOfInterestTypeToString:-[RTStateDepictionOneState type](self, "type")];
  uint64_t v21 = [MEMORY[0x1E4F5CE10] locationOfInterestTypeSourceToString:-[RTStateDepictionOneState typeSource](self, "typeSource")];
  v30 = [(RTStateDepictionOneState *)self histEntryExit_s];
  uint64_t v19 = [v30 count];
  v29 = [(RTStateDepictionOneState *)self mapItem];
  v3 = [v29 address];
  v25 = [(RTStateDepictionOneState *)self mapItem];
  objc_super v24 = [v25 location];
  [v24 latitude];
  uint64_t v5 = v4;
  v22 = [(RTStateDepictionOneState *)self mapItem];
  v20 = [v22 location];
  [v20 longitude];
  uint64_t v7 = v6;
  v18 = [(RTStateDepictionOneState *)self mapItem];
  uint64_t v8 = [v18 extendedAttributes];
  uint64_t v9 = [v8 addressIdentifier];
  unint64_t v10 = [(RTStateDepictionOneState *)self mapItem];
  uint64_t v11 = [v10 extendedAttributes];
  if ([v11 isMe]) {
    v12 = @"YES";
  }
  else {
    v12 = @"NO";
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F5CE38];
  uint64_t v14 = [(RTStateDepictionOneState *)self mapItem];
  id v15 = [v13 sourceToString:[v14 source]];
  v16 = [(RTStateDepictionOneState *)self customLabel];
  v28 = [v27 stringWithFormat:@"location, %@, type, %@, typeSource, %@, visits, %lu, mapItem, address, \"%@\", location, <%f, %f>, addressIdentifier, %@, isMe, %@, mapItemSource, %@, customLabel, %@", v26, v23, v21, v19, v3, v5, v7, v9, v12, v15, v16];

  return v28;
}

- (RTStateModelLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (unint64_t)typeSource
{
  return self->_typeSource;
}

- (void)setTypeSource:(unint64_t)a3
{
  self->_typeSource = a3;
}

- (RTMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (unint64_t)mapItemSource
{
  return self->_mapItemSource;
}

- (void)setMapItemSource:(unint64_t)a3
{
  self->_mapItemSource = a3;
}

- (NSDate)geocodeDate
{
  return self->_geocodeDate;
}

- (void)setGeocodeDate:(id)a3
{
}

- (NSMutableArray)histEntryExit_s
{
  return self->_histEntryExit_s;
}

- (void)setHistEntryExit_s:(id)a3
{
}

- (NSString)customLabel
{
  return self->_customLabel;
}

- (void)setCustomLabel:(id)a3
{
}

- (GEOMapItem)geoMapItem
{
  return self->_geoMapItem;
}

- (void)setGeoMapItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoMapItem, 0);
  objc_storeStrong((id *)&self->_customLabel, 0);
  objc_storeStrong((id *)&self->_histEntryExit_s, 0);
  objc_storeStrong((id *)&self->_geocodeDate, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_location, 0);
}

@end