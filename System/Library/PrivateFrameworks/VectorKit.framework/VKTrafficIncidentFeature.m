@interface VKTrafficIncidentFeature
+ (id)stringForIncidentSignificance:(int64_t)a3;
+ (id)stringForIncidentType:(int64_t)a3;
+ (id)stringForRouteRelevance:(int64_t)a3;
+ (int64_t)incidentTypeForGeoRouteIncident:(id)a3;
- (BOOL)hasSameIdentifier:(id)a3;
- (BOOL)isNotForDisplay;
- (BOOL)isOnSelectedRoute;
- (GEOFormattedString)effectiveTimeRange;
- (GEOFormattedString)formattedSubtitle;
- (GEOFormattedString)formattedTitle;
- (GEOPBTransitArtwork)artwork;
- (NSArray)restrictionDetails;
- (NSDate)endDate;
- (NSDate)lastUpdatedDate;
- (NSDate)startDate;
- (NSString)crossStreet;
- (NSString)info;
- (NSString)street;
- (NSString)subtitle;
- (NSString)title;
- (NSString)uniqueString;
- (VKTrafficIncidentFeature)initWithIncidentData:(const void *)a3;
- (VKTrafficIncidentFeature)initWithRouteIncident:(id)a3 routeOffsetInMeters:(unsigned int)a4 routeRelevance:(int64_t)a5 onRoute:(id)a6;
- (float)elevationMinZoom;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)routeRelevance;
- (int64_t)significance;
- (int64_t)type;
- (optional<gss::IncidentDataSource>)dataSource;
- (void)populateDebugNode:(void *)a3;
- (void)setIsOnSelectedRoute:(BOOL)a3;
- (void)setRouteRelevance:(int64_t)a3;
@end

@implementation VKTrafficIncidentFeature

- (id).cxx_construct
{
  *((unsigned char *)self + 288) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (LOBYTE(self->_artwork)) {
    LOBYTE(self->_artwork) = 0;
  }
  objc_storeStrong((id *)&self->_elevationMinZoom, 0);
  objc_storeStrong((id *)&self->_uniqueString, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_crossStreet, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_isNotForDisplay, 0);
  objc_storeStrong((id *)&self->_significance, 0);
  objc_storeStrong((id *)&self->super._routeLegWhen._value, 0);
  objc_storeStrong((id *)&self->super._routeLegWhen, 0);
}

- (optional<gss::IncidentDataSource>)dataSource
{
  unsigned char *v2 = 0;
  if (LOBYTE(self->_artwork))
  {
    v2[1] = BYTE1(self->_artwork);
    unsigned char *v2 = 1;
  }
  result._value = (ValueUnion)a2;
  result._hasValue = (char)self;
  return result;
}

- (GEOPBTransitArtwork)artwork
{
  return (GEOPBTransitArtwork *)self->_uniqueString;
}

- (int64_t)significance
{
  return self->_type;
}

- (NSDate)lastUpdatedDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return (NSDate *)self->_info;
}

- (NSDate)startDate
{
  return (NSDate *)self->_crossStreet;
}

- (NSString)info
{
  return self->_street;
}

- (NSString)crossStreet
{
  return *(NSString **)&self->_isNotForDisplay;
}

- (NSString)street
{
  return (NSString *)self->_significance;
}

- (float)elevationMinZoom
{
  return *(float *)&self->_lastUpdatedDate;
}

- (void)setIsOnSelectedRoute:(BOOL)a3
{
  BYTE1(self->_routeRelevance) = a3;
}

- (BOOL)isOnSelectedRoute
{
  return BYTE1(self->_routeRelevance);
}

- (void)setRouteRelevance:(int64_t)a3
{
  self->_subtitle = (NSString *)a3;
}

- (int64_t)routeRelevance
{
  return (int64_t)self->_subtitle;
}

- (BOOL)isNotForDisplay
{
  return self->_routeRelevance;
}

- (int64_t)type
{
  return (int64_t)self->_title;
}

- (NSString)subtitle
{
  return *(NSString **)&self->super._routeLegWhen._value.type;
}

- (NSString)title
{
  return *(NSString **)&self->super._routeLegWhen._hasValue;
}

- (NSString)uniqueString
{
  return (NSString *)self->_endDate;
}

- (void)populateDebugNode:(void *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)VKTrafficIncidentFeature;
  -[VKTrafficFeature populateDebugNode:](&v21, sel_populateDebugNode_);
  v20[23] = 19;
  strcpy(v20, "TrafficIncidentType");
  id v5 = +[VKTrafficIncidentFeature stringForIncidentType:self->_title];
  v6 = (const std::string::value_type *)[v5 UTF8String];
  memset(&__p, 0, sizeof(__p));
  int v19 = 4;
  if (v6)
  {
    std::string::__assign_external(&__p, v6);
  }
  else
  {
    *((unsigned char *)&__p.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&__p, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v20, (uint64_t)v17);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  v20[23] = 14;
  strcpy(v20, "RouteRelevance");
  id v7 = +[VKTrafficIncidentFeature stringForRouteRelevance:self->_subtitle];
  v8 = (const std::string::value_type *)[v7 UTF8String];
  memset(&v15, 0, sizeof(v15));
  int v16 = 4;
  if (v8)
  {
    std::string::__assign_external(&v15, v8);
  }
  else
  {
    *((unsigned char *)&v15.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v15, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v20, (uint64_t)v14);
  if (SHIBYTE(v15.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v15.__r_.__value_.__l.__data_);
  }

  v20[23] = 12;
  strcpy(v20, "Significance");
  id v9 = +[VKTrafficIncidentFeature stringForIncidentSignificance:self->_type];
  v10 = (const std::string::value_type *)[v9 UTF8String];
  memset(&v12, 0, sizeof(v12));
  int v13 = 4;
  if (v10)
  {
    std::string::__assign_external(&v12, v10);
  }
  else
  {
    *((unsigned char *)&v12.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v12, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v20, (uint64_t)&v11);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v12.__r_.__value_.__l.__data_);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VKTrafficIncidentFeature;
  v4 = [(VKTrafficFeature *)&v7 copyWithZone:a3];
  id v5 = v4;
  if (v4)
  {
    objc_storeStrong(v4 + 20, *(id *)&self->super._routeLegWhen._hasValue);
    objc_storeStrong(v5 + 21, *(id *)&self->super._routeLegWhen._value.type);
    v5[22] = self->_title;
    *((unsigned char *)v5 + 200) = self->_routeRelevance;
    v5[23] = self->_subtitle;
    *((unsigned char *)v5 + 201) = BYTE1(self->_routeRelevance);
    objc_storeStrong(v5 + 26, self->_significance);
    objc_storeStrong(v5 + 27, *(id *)&self->_isNotForDisplay);
    objc_storeStrong(v5 + 28, self->_street);
    objc_storeStrong(v5 + 29, self->_crossStreet);
    objc_storeStrong(v5 + 30, self->_info);
    objc_storeStrong(v5 + 31, self->_startDate);
    v5[24] = self->_type;
    *((_DWORD *)v5 + 66) = self->_lastUpdatedDate;
    objc_storeStrong(v5 + 32, self->_endDate);
    objc_storeStrong(v5 + 35, *(id *)&self->_elevationMinZoom);
    objc_storeStrong(v5 + 34, self->_uniqueString);
  }
  return v5;
}

- (GEOFormattedString)formattedSubtitle
{
  return (GEOFormattedString *)[*(id *)&self->_elevationMinZoom subTitleString];
}

- (GEOFormattedString)formattedTitle
{
  return (GEOFormattedString *)[*(id *)&self->_elevationMinZoom titleString];
}

- (NSArray)restrictionDetails
{
  return (NSArray *)[*(id *)&self->_elevationMinZoom restrictionDetails];
}

- (GEOFormattedString)effectiveTimeRange
{
  return (GEOFormattedString *)[*(id *)&self->_elevationMinZoom effectiveTimeRange];
}

- (VKTrafficIncidentFeature)initWithRouteIncident:(id)a3 routeOffsetInMeters:(unsigned int)a4 routeRelevance:(int64_t)a5 onRoute:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  std::string v12 = v11;
  if (!v10) {
    goto LABEL_42;
  }
  uint64_t v13 = *MEMORY[0x1E4F64198];
  uint64_t v60 = *MEMORY[0x1E4F64198];
  if (v11)
  {
    uint64_t v13 = [v11 coordinateAtOffset:(double)a4];
    uint64_t v60 = v13;
    [v12 pointAtRouteCoordinate:v13];
    double v15 = v14;
  }
  else
  {
    double v15 = 1.79769313e308;
  }
  int v16 = [v10 position];
  [v16 lat];
  double v18 = v17;
  int v19 = [v10 position];
  [v19 lng];
  double v21 = v20;

  double v22 = v12 ? VKTrafficFeatureDirection(&v60, v12) : -1.0;
  v23 = objc_msgSend(v10, "incidentId", VKTrafficFeatureDirection(&v60, v12));
  v59.receiver = self;
  v59.super_class = (Class)VKTrafficIncidentFeature;
  self = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:](&v59, sel_initWithFeatureType_uniqueIdentifier_position_direction_routeOffset_routeOffsetInMeters_, 0, v23, v13, v18, v21, v15, v22, (double)a4);

  if (!self) {
    goto LABEL_42;
  }
  v24 = [v10 incidentId];
  endDate = self->_endDate;
  self->_endDate = v24;

  unsigned int v26 = [v10 type];
  if (v26 > 0xE) {
    v27 = 0;
  }
  else {
    v27 = (NSString *)qword_1A29621D8[v26];
  }
  self->_title = v27;
  if ([v10 type] == 100)
  {
    char v28 = 1;
  }
  else if ([v10 hasShouldDisplayOnMap])
  {
    char v28 = [v10 shouldDisplayOnMap] ^ 1;
  }
  else
  {
    char v28 = 0;
  }
  LOBYTE(self->_routeRelevance) = v28;
  self->_subtitle = (NSString *)a5;
  self->super._maxZoom = 99.0;
  uint64_t v29 = [v10 significance] - 1;
  if (v29 >= 5) {
    int64_t v30 = 1;
  }
  else {
    int64_t v30 = v29 + 2;
  }
  self->_double type = v30;
  uint64_t v31 = [v10 laneClosureType] - 1;
  if (v31 < 6) {
    uint64_t v32 = v31 + 1;
  }
  else {
    uint64_t v32 = 0;
  }
  {
    operator new();
  }
  v33 = (std::__shared_mutex_base *)blockMutex(void)::lock;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)blockMutex(void)::lock);
  if (_titleBlock)
  {
    uint64_t v34 = (*(void (**)(uint64_t, NSString *, uint64_t, void))(_titleBlock + 16))(_titleBlock, self->_title, v32, [v10 laneClosureCount]);
    v35 = *(void **)&self->super._routeLegWhen._hasValue;
    *(void *)&self->super._routeLegWhen._hasValue = v34;
  }
  if (_subtitleBlock)
  {
    v36 = (*(void (**)(void))(_subtitleBlock + 16))();
    double v37 = COERCE_DOUBLE([v36 copy]);
    double type = self->super._routeLegWhen._value.type;
    self->super._routeLegWhen._value.double type = v37;
  }
  std::__shared_mutex_base::unlock_shared(v33);
  if (*(void *)&self->super._routeLegWhen._hasValue)
  {
    int64_t v39 = [v10 street];
    significance = (void *)self->_significance;
    self->_significance = v39;

    uint64_t v41 = [v10 crossStreet];
    v42 = *(void **)&self->_isNotForDisplay;
    *(void *)&self->_isNotForDisplay = v41;

    v43 = [v10 info];
    street = self->_street;
    self->_street = v43;

    if ([v10 startTime] >= 1)
    {
      v45 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v10, "startTime") * 0.001);
      crossStreet = self->_crossStreet;
      self->_crossStreet = v45;
    }
    if ([v10 endTime] >= 1)
    {
      v47 = (NSString *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v10, "endTime") * 0.001);
      info = self->_info;
      self->_info = v47;
    }
    if ([v10 updateTime] >= 1)
    {
      v49 = (NSDate *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9C8]), "initWithTimeIntervalSince1970:", (double)objc_msgSend(v10, "updateTime") * 0.001);
      startDate = self->_startDate;
      self->_startDate = v49;
    }
    v51 = [v10 restrictionInfo];

    if (v51)
    {
      uint64_t v52 = [v10 restrictionInfo];
      v53 = *(void **)&self->_elevationMinZoom;
      *(void *)&self->_elevationMinZoom = v52;
    }
    v54 = [v10 artwork];

    if (v54)
    {
      v55 = [v10 artwork];
      uniqueString = self->_uniqueString;
      self->_uniqueString = v55;
    }
    if (!LOBYTE(self->_artwork)) {
      LOBYTE(self->_artwork) = 1;
    }
    BYTE1(self->_artwork) = 1;
    v57 = self;
  }
  else
  {
LABEL_42:
    v57 = 0;
  }

  return v57;
}

- (VKTrafficIncidentFeature)initWithIncidentData:(const void *)a3
{
  if (zilch::GeoCoordinates::has_elevation((zilch::GeoCoordinates *)a3)) {
    double v5 = (double)(int)zilch::GeoCoordinates::z((zilch::GeoCoordinates *)a3) * 0.01;
  }
  else {
    double v5 = 1.79769313e308;
  }
  int v65 = zilch::GeoCoordinates::y((zilch::GeoCoordinates *)a3);
  zilch::Latitude::toDegrees((zilch::Latitude *)&v65);
  double v7 = v6;
  int v64 = zilch::GeoCoordinates::x((zilch::GeoCoordinates *)a3);
  zilch::Longitude::toDegrees((zilch::Longitude *)&v64);
  isa = (NSDate *)((char *)a3 + 16);
  if (*((char *)a3 + 39) >= 0) {
    id v10 = (char *)a3 + 16;
  }
  else {
    id v10 = (char *)*((void *)a3 + 2);
  }
  id v11 = objc_msgSend(NSString, "stringWithUTF8String:", v10, v8);
  uint64_t v12 = *MEMORY[0x1E4F64198];
  v63.receiver = self;
  v63.super_class = (Class)VKTrafficIncidentFeature;
  uint64_t v13 = -[VKTrafficFeature initWithFeatureType:uniqueIdentifier:position:direction:routeOffset:routeOffsetInMeters:](&v63, sel_initWithFeatureType_uniqueIdentifier_position_direction_routeOffset_routeOffsetInMeters_, 0, v11, v12, v7, v62, v5, -1.0, 0.0);

  if (!v13) {
    goto LABEL_23;
  }
  long double v14 = tan(v7 * 0.00872664626 + 0.785398163);
  long double v15 = log(v14);
  v16.f64[0] = v62;
  v16.f64[1] = v15;
  unsigned int v17 = 381774871;
  __asm { FMOV            V1.2D, #0.5 }
  *(float64x2_t *)&v13->super._worldPoint.x = vmlaq_f64(_Q1, (float64x2_t)xmmword_1A28FCBE0, v16);
  v13->super._worldPoint.z = v5;
  uint64_t v23 = *((unsigned int *)a3 + 16);
  if (v23 < 8) {
    v24 = (NSString *)(v23 + 1);
  }
  else {
    v24 = 0;
  }
  v13->_title = v24;
  LOBYTE(v17) = *((unsigned char *)a3 + 164);
  float v25 = (float)v17;
  v13->super._minZoom = v25;
  LOBYTE(v25) = *((unsigned char *)a3 + 165);
  float v26 = (float)LODWORD(v25);
  v13->super._maxZoom = v26;
  LOBYTE(v26) = *((unsigned char *)a3 + 166);
  *(float *)&v13->_lastUpdatedDate = (float)LODWORD(v26);
  uint64_t v27 = (*((_DWORD *)a3 + 40) - 1);
  if (v27 >= 5) {
    uint64_t v28 = 1;
  }
  else {
    uint64_t v28 = v27 + 2;
  }
  v13->_double type = v28;
  {
    operator new();
  }
  uint64_t v29 = (std::__shared_mutex_base *)blockMutex(void)::lock;
  std::__shared_mutex_base::lock_shared((std::__shared_mutex_base *)blockMutex(void)::lock);
  if (_titleBlock)
  {
    uint64_t v30 = (*(void (**)(void))(_titleBlock + 16))();
    uint64_t v31 = *(void **)&v13->super._routeLegWhen._hasValue;
    *(void *)&v13->super._routeLegWhen._hasValue = v30;
  }
  if (_subtitleBlock)
  {
    uint64_t v32 = (*(void (**)(void))(_subtitleBlock + 16))();
    uint64_t v33 = [v32 copy];
    double type = v13->super._routeLegWhen._value.type;
    *(void *)&v13->super._routeLegWhen._value.double type = v33;
  }
  std::__shared_mutex_base::unlock_shared(v29);
  if (!*(void *)&v13->super._routeLegWhen._hasValue)
  {
LABEL_23:
    v36 = 0;
    goto LABEL_66;
  }
  if (*((char *)a3 + 39) < 0)
  {
    uint64_t v35 = *((void *)a3 + 3);
    if (!v35) {
      goto LABEL_30;
    }
    isa = (NSDate *)isa->super.isa;
    if (!isa) {
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  uint64_t v35 = *((unsigned __int8 *)a3 + 39);
  if (*((unsigned char *)a3 + 39))
  {
LABEL_26:
    isa = (NSDate *)[[NSString alloc] initWithBytes:isa length:v35 encoding:4];
    double v37 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v38 = [(NSDate *)isa stringByTrimmingCharactersInSet:v37];

    if (![v38 length])
    {

      isa = 0;
    }

LABEL_29:
    endDate = v13->_endDate;
    v13->_endDate = isa;
  }
LABEL_30:
  v40 = (char *)a3 + 72;
  if (*((char *)a3 + 95) < 0)
  {
    uint64_t v41 = *((void *)a3 + 10);
    if (!v41) {
      goto LABEL_39;
    }
    v40 = (void *)*v40;
    if (!v40) {
      goto LABEL_38;
    }
    goto LABEL_35;
  }
  uint64_t v41 = *((unsigned __int8 *)a3 + 95);
  if (*((unsigned char *)a3 + 95))
  {
LABEL_35:
    v40 = (void *)[[NSString alloc] initWithBytes:v40 length:v41 encoding:4];
    v42 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v43 = [v40 stringByTrimmingCharactersInSet:v42];

    if (![v43 length])
    {

      v40 = 0;
    }

LABEL_38:
    significance = (void *)v13->_significance;
    v13->_significance = (int64_t)v40;
  }
LABEL_39:
  v45 = (char *)a3 + 96;
  if (*((char *)a3 + 119) < 0)
  {
    uint64_t v46 = *((void *)a3 + 13);
    if (!v46) {
      goto LABEL_48;
    }
    v45 = (void *)*v45;
    if (!v45) {
      goto LABEL_47;
    }
    goto LABEL_44;
  }
  uint64_t v46 = *((unsigned __int8 *)a3 + 119);
  if (*((unsigned char *)a3 + 119))
  {
LABEL_44:
    v45 = (void *)[[NSString alloc] initWithBytes:v45 length:v46 encoding:4];
    v47 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v48 = [v45 stringByTrimmingCharactersInSet:v47];

    if (![v48 length])
    {

      v45 = 0;
    }

LABEL_47:
    v49 = *(void **)&v13->_isNotForDisplay;
    *(void *)&v13->_isNotForDisplay = v45;
  }
LABEL_48:
  v50 = (NSString *)((char *)a3 + 40);
  if ((*((char *)a3 + 63) & 0x80000000) == 0)
  {
    uint64_t v51 = *((unsigned __int8 *)a3 + 63);
    if (!*((unsigned char *)a3 + 63)) {
      goto LABEL_57;
    }
    goto LABEL_53;
  }
  uint64_t v51 = *((void *)a3 + 6);
  if (v51)
  {
    v50 = (NSString *)v50->super.isa;
    if (!v50)
    {
LABEL_56:
      street = v13->_street;
      v13->_street = v50;

      goto LABEL_57;
    }
LABEL_53:
    v50 = (NSString *)[[NSString alloc] initWithBytes:v50 length:v51 encoding:4];
    uint64_t v52 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    v53 = [(NSString *)v50 stringByTrimmingCharactersInSet:v52];

    if (![v53 length])
    {

      v50 = 0;
    }

    goto LABEL_56;
  }
LABEL_57:
  if (*((uint64_t *)a3 + 15) >= 1)
  {
    uint64_t v55 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:(double)*((uint64_t *)a3 + 15) * 0.001];
    crossStreet = v13->_crossStreet;
    v13->_crossStreet = (NSString *)v55;
  }
  if (*((uint64_t *)a3 + 16) >= 1)
  {
    uint64_t v57 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:(double)*((uint64_t *)a3 + 16) * 0.001];
    info = v13->_info;
    v13->_info = (NSString *)v57;
  }
  if (*((uint64_t *)a3 + 17) >= 1)
  {
    uint64_t v59 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:(double)*((uint64_t *)a3 + 17) * 0.001];
    startDate = v13->_startDate;
    v13->_startDate = (NSDate *)v59;
  }
  if (!LOBYTE(v13->_artwork)) {
    LOBYTE(v13->_artwork) = 1;
  }
  BYTE1(v13->_artwork) = 2;
  v36 = v13;
LABEL_66:

  return v36;
}

- (BOOL)hasSameIdentifier:(id)a3
{
  endDate = self->_endDate;
  if (endDate && *((void *)a3 + 32)) {
    return -[NSDate isEqualToString:](endDate, "isEqualToString:");
  }
  else {
    return 0;
  }
}

+ (id)stringForIncidentSignificance:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return off_1E5A91020[a3];
  }
}

+ (id)stringForRouteRelevance:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_1E5A91000[a3];
  }
}

+ (id)stringForIncidentType:(int64_t)a3
{
  if ((unint64_t)a3 > 0xE) {
    return 0;
  }
  else {
    return off_1E5A90F88[a3];
  }
}

+ (int64_t)incidentTypeForGeoRouteIncident:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3 && (unsigned int v5 = [v3 type], v5 < 0xF)) {
    int64_t v6 = qword_1A29621D8[v5];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

@end