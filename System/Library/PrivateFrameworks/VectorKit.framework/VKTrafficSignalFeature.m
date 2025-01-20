@interface VKTrafficSignalFeature
+ (id)stringForTrafficSignalType:(int64_t)a3;
- (BOOL)hasCountryCode;
- (VKTrafficSignalFeature)initWithTrafficSignal:(id)a3 onRoute:(id)a4;
- (VKTrafficSignalFeature)initWithTrafficSignalType:(int64_t)a3 uniqueIdentifier:(id)a4 routeOffset:(PolylineCoordinate)a5 onRoute:(id)a6;
- (int64_t)type;
- (unsigned)countryCode;
- (void)populateDebugNode:(void *)a3;
@end

@implementation VKTrafficSignalFeature

- (BOOL)hasCountryCode
{
  return self->super._routeLegWhen._value.data[4];
}

- (unsigned)countryCode
{
  return LODWORD(self->super._routeLegWhen._value.type);
}

- (int64_t)type
{
  return *(void *)&self->super._routeLegWhen._hasValue;
}

- (void)populateDebugNode:(void *)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VKTrafficSignalFeature;
  -[VKTrafficFeature populateDebugNode:](&v14, sel_populateDebugNode_);
  v13[23] = 17;
  strcpy(v13, "TrafficSignalType");
  id v5 = +[VKTrafficSignalFeature stringForTrafficSignalType:*(void *)&self->super._routeLegWhen._hasValue];
  v6 = (const std::string::value_type *)[v5 UTF8String];
  memset(&__p, 0, sizeof(__p));
  int v12 = 4;
  if (v6)
  {
    std::string::__assign_external(&__p, v6);
  }
  else
  {
    *((unsigned char *)&__p.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&__p, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v13, (uint64_t)v10);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(__p.__r_.__value_.__l.__data_);
  }

  if (self->super._routeLegWhen._value.data[4])
  {
    v13[23] = 11;
    strcpy(v13, "CountryCode");
    uint64_t type_low = LODWORD(self->super._routeLegWhen._value.type);
    int v9 = 1;
    memset(&v8[4], 0, 24);
    v8[1] = type_low;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v13, (uint64_t)v8);
  }
}

- (VKTrafficSignalFeature)initWithTrafficSignal:(id)a3 onRoute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VKTrafficSignalFeature;
  v8 = [(VKTrafficFeature *)&v14 initWithEnrouteNotice:v6 onRoute:v7];
  int v9 = v8;
  v10 = 0;
  if (v6 && v8)
  {
    int v11 = [v6 type];
    uint64_t v12 = v11 == 2;
    if (v11 == 1) {
      uint64_t v12 = 2;
    }
    *(void *)&v9->super._routeLegWhen._hasValue = v12;
    if ([v6 hasCountryCode])
    {
      v9->super._routeLegWhen._value.data[4] = 1;
      LODWORD(v9->super._routeLegWhen._value.type) = [v6 countryCode];
    }
    v10 = v9;
  }

  return v10;
}

- (VKTrafficSignalFeature)initWithTrafficSignalType:(int64_t)a3 uniqueIdentifier:(id)a4 routeOffset:(PolylineCoordinate)a5 onRoute:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)VKTrafficSignalFeature;
  id v7 = [(VKTrafficFeature *)&v11 initWithFeatureType:2 uniqueIdentifier:a4 routeOffset:a5 onRoute:a6];
  v8 = v7;
  if (v7)
  {
    *(void *)&v7->super._routeLegWhen._hasValue = a3;
    int v9 = v7;
  }

  return v8;
}

+ (id)stringForTrafficSignalType:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return (id)*((void *)&off_1E5A98E50 + a3);
  }
}

@end