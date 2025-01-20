@interface CLPrefetchFloorRequest
+ (BOOL)supportsSecureCoding;
+ (id)prefetchRequestForFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6;
- (BOOL)allowCellularDownload;
- (BOOL)hasCompleteFloor;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (CLPrefetchFloorRequest)init;
- (CLPrefetchFloorRequest)initWithCoder:(id)a3;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8 priority:(int64_t)a9;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8 ranking:(int64_t)a9;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6 priority:(int64_t)a7;
- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6 ranking:(int64_t)a7;
- (NSDate)relevancy;
- (NSString)floorUuid;
- (NSString)venueUuid;
- (id)description;
- (id)floorUid;
- (int64_t)locationContext;
- (int64_t)priority;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAllowCellularDownload:(BOOL)a3;
- (void)setFloorUid:(id)a3;
- (void)setFloorUuid:(id)a3;
- (void)setHasCompleteFloor:(BOOL)a3;
- (void)setLocationContext:(int64_t)a3;
- (void)setPriority:(int64_t)a3;
- (void)setRelevancy:(id)a3;
- (void)setVenueUuid:(id)a3;
@end

@implementation CLPrefetchFloorRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relevancy, 0);
  objc_storeStrong((id *)&self->_venueUuid, 0);

  objc_storeStrong((id *)&self->_floorUuid, 0);
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CLPrefetchFloorRequest;
  v17 = [(CLPrefetchFloorRequest *)&v20 init];
  if (v17) {
    v18 = [(CLPrefetchFloorRequest *)v17 initWithFloor:v14 inVenue:v15 lastRelevant:v16 hasCompleteFloor:v10 allowCellularDownload:v9 locationContext:a8 priority:1];
  }
  else {
    v18 = 0;
  }

  return v18;
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8 ranking:(int64_t)a9
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  v23.receiver = self;
  v23.super_class = (Class)CLPrefetchFloorRequest;
  v19 = [(CLPrefetchFloorRequest *)&v23 init];
  objc_super v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_floorUuid, a3);
    objc_storeStrong((id *)&v20->_venueUuid, a4);
    objc_storeStrong((id *)&v20->_relevancy, a5);
    v20->_hasCompleteFloor = a6;
    v20->_allowCellularDownload = a7;
    v20->_locationContext = a8;
    v20->_priority = a9;
    v21 = v20;
  }

  return v20;
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 hasCompleteFloor:(BOOL)a6 allowCellularDownload:(BOOL)a7 locationContext:(int64_t)a8 priority:(int64_t)a9
{
  return -[CLPrefetchFloorRequest initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:ranking:](self, "initWithFloor:inVenue:lastRelevant:hasCompleteFloor:allowCellularDownload:locationContext:ranking:", a3, a4, a5, 0, a7, a8);
}

- (NSString)floorUuid
{
  return self->_floorUuid;
}

- (int64_t)locationContext
{
  return self->_locationContext;
}

- (NSString)venueUuid
{
  return self->_venueUuid;
}

- (NSDate)relevancy
{
  return self->_relevancy;
}

- (BOOL)allowCellularDownload
{
  return self->_allowCellularDownload;
}

- (int64_t)priority
{
  return self->_priority;
}

- (BOOL)hasCompleteFloor
{
  return self->_hasCompleteFloor;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)prefetchRequestForFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [[CLPrefetchFloorRequest alloc] initWithFloor:v9 inVenue:v10 lastRelevant:v11 locationContext:a6];

  return v12;
}

- (CLPrefetchFloorRequest)init
{
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6
{
  return [(CLPrefetchFloorRequest *)self initWithFloor:a3 inVenue:a4 lastRelevant:a5 hasCompleteFloor:0 allowCellularDownload:1 locationContext:a6];
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6 priority:(int64_t)a7
{
  return [(CLPrefetchFloorRequest *)self initWithFloor:a3 inVenue:a4 lastRelevant:a5 hasCompleteFloor:0 allowCellularDownload:1 locationContext:a6 ranking:a7];
}

- (CLPrefetchFloorRequest)initWithFloor:(id)a3 inVenue:(id)a4 lastRelevant:(id)a5 locationContext:(int64_t)a6 ranking:(int64_t)a7
{
  return [(CLPrefetchFloorRequest *)self initWithFloor:a3 inVenue:a4 lastRelevant:a5 hasCompleteFloor:0 allowCellularDownload:1 locationContext:a6 ranking:a7];
}

- (CLPrefetchFloorRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectForKey:@"floorUuid"];
  if (!v5)
  {
    v5 = [v4 decodeObjectForKey:@"floorUuid"];
  }
  uint64_t v6 = [v4 decodeObjectForKey:@"venueUuid"];
  if (v6) {
    v7 = (__CFString *)v6;
  }
  else {
    v7 = @"mismatch between pipelined/CoreIndoor.framework";
  }
  [v4 decodeDoubleForKey:@"relevancy"];
  v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v9 = [[self initWithFloor:v5 inVenue:v7 lastRelevant:v8 hasCompleteFloor:[v4 decodeBoolForKey:@"hasCompleteFloor"] allowCellularDownload:[v4 decodeBoolForKey:@"allowCellularDownload"] locationContext:[v4 decodeIntegerForKey:@"locationContext"] priority:[v4 decodeIntegerForKey:@"priority"]];

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_floorUuid forKey:@"floorUuid"];
  [v4 encodeObject:self->_floorUuid forKey:@"floorUuid"];
  [v4 encodeObject:self->_venueUuid forKey:@"venueUuid"];
  [(NSDate *)self->_relevancy timeIntervalSinceReferenceDate];
  [v4 encodeDouble:@"relevancy" forKey:@"relevancy"];
  [v4 encodeBool:self->_hasCompleteFloor forKey:@"hasCompleteFloor"];
  [v4 encodeBool:self->_allowCellularDownload forKey:@"allowCellularDownload"];
  [v4 encodeInteger:self->_locationContext forKey:@"locationContext"];
  [v4 encodeInteger:self->_priority forKey:@"priority"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unsigned __int8 v5 = [(NSString *)self->_floorUuid isEqualToString:v4];
  }
  else {
    unsigned __int8 v5 = [(CLPrefetchFloorRequest *)self isEqualToRequest:v4];
  }
  BOOL v6 = v5;

  return v6;
}

- (BOOL)isEqualToRequest:(id)a3
{
  floorUuid = self->_floorUuid;
  id v4 = [a3 floorUuid];
  LOBYTE(floorUuid) = [(NSString *)floorUuid isEqualToString:v4];

  return (char)floorUuid;
}

- (unint64_t)hash
{
  return [(NSString *)self->_floorUuid hash];
}

- (id)description
{
  return self->_floorUuid;
}

- (id)floorUid
{
  return self->_floorUuid;
}

- (void)setFloorUid:(id)a3
{
}

- (void)setFloorUuid:(id)a3
{
}

- (void)setVenueUuid:(id)a3
{
}

- (void)setRelevancy:(id)a3
{
}

- (void)setHasCompleteFloor:(BOOL)a3
{
  self->_hasCompleteFloor = a3;
}

- (void)setAllowCellularDownload:(BOOL)a3
{
  self->_allowCellularDownload = a3;
}

- (void)setLocationContext:(int64_t)a3
{
  self->_locationContext = a3;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

@end