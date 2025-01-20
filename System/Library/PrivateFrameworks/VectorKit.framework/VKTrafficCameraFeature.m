@interface VKTrafficCameraFeature
+ (id)stringForTrafficCameraType:(int64_t)a3;
- (BOOL)hasCountryCode;
- (BOOL)isAboveSpeedThreshold;
- (BOOL)isSpeedLimitCamera;
- (NSString)speedLimitText;
- (VKTrafficCameraFeature)initWithTrafficCamera:(id)a3 onRoute:(id)a4;
- (VKTrafficCameraFeature)initWithTrafficCameraType:(int64_t)a3 uniqueIdentifier:(id)a4 routeOffset:(PolylineCoordinate)a5 onRoute:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)type;
- (unsigned)countryCode;
- (unsigned)speedThreshold;
- (void)populateDebugNode:(void *)a3;
- (void)setIsAboveSpeedThreshold:(BOOL)a3;
@end

@implementation VKTrafficCameraFeature

- (void).cxx_destruct
{
}

- (BOOL)hasCountryCode
{
  return self->_speedLimit;
}

- (unsigned)countryCode
{
  return *(_DWORD *)&self->_isAboveSpeedThreshold;
}

- (NSString)speedLimitText
{
  return (NSString *)self->_type;
}

- (BOOL)isAboveSpeedThreshold
{
  return self->super._routeLegWhen._value.data[0];
}

- (unsigned)speedThreshold
{
  return self->_speedLimitText;
}

- (int64_t)type
{
  return *(void *)&self->super._routeLegWhen._hasValue;
}

- (void)populateDebugNode:(void *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)VKTrafficCameraFeature;
  -[VKTrafficFeature populateDebugNode:](&v28, sel_populateDebugNode_);
  v27[23] = 17;
  strcpy(v27, "TrafficCameraType");
  id v5 = +[VKTrafficCameraFeature stringForTrafficCameraType:*(void *)&self->super._routeLegWhen._hasValue];
  v6 = (const std::string::value_type *)[v5 UTF8String];
  memset(&v25, 0, sizeof(v25));
  int v26 = 4;
  if (v6)
  {
    std::string::__assign_external(&v25, v6);
  }
  else
  {
    *((unsigned char *)&v25.__r_.__value_.__s + 23) = 6;
    strcpy((char *)&v25, "<null>");
  }
  gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v27, (uint64_t)v24);
  if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v25.__r_.__value_.__l.__data_);
  }

  if ([(VKTrafficCameraFeature *)self isSpeedLimitCamera])
  {
    v27[23] = 10;
    strcpy(v27, "SpeedLimit");
    uint64_t type_high = HIDWORD(self->super._routeLegWhen._value.type);
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    int v23 = 1;
    uint64_t v20 = 0;
    uint64_t v19 = type_high;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v27, (uint64_t)v18);
    v27[23] = 21;
    strcpy(v27, "IsAboveSpeedThreshold");
    uint64_t v8 = self->super._routeLegWhen._value.data[0];
    int v17 = 0;
    memset(&v16[4], 0, 24);
    v16[0] = v8;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v27, (uint64_t)v16);
    v27[23] = 14;
    strcpy(v27, "SpeedLimitText");
    v9 = (const std::string::value_type *)[self->_type UTF8String];
    memset(&__p, 0, sizeof(__p));
    int v15 = 4;
    if (v9)
    {
      std::string::__assign_external(&__p, v9);
    }
    else
    {
      *((unsigned char *)&__p.__r_.__value_.__s + 23) = 6;
      strcpy((char *)&__p, "<null>");
    }
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v27, (uint64_t)v13);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
  }
  if (LOBYTE(self->_speedLimit))
  {
    v27[23] = 11;
    strcpy(v27, "CountryCode");
    uint64_t v10 = *(unsigned int *)&self->_isAboveSpeedThreshold;
    int v12 = 1;
    memset(&v11[4], 0, 24);
    v11[1] = v10;
    gdc::DebugTreeNode::addProperty((uint64_t)a3, (uint64_t)v27, (uint64_t)v11);
  }
}

- (BOOL)isSpeedLimitCamera
{
  return *(void *)&self->super._routeLegWhen._hasValue == 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VKTrafficCameraFeature;
  id v4 = [(VKTrafficFeature *)&v7 copyWithZone:a3];
  id v5 = v4;
  if (v4)
  {
    *((void *)v4 + 20) = *(void *)&self->super._routeLegWhen._hasValue;
    *((_DWORD *)v4 + 43) = HIDWORD(self->super._routeLegWhen._value.type);
    *((unsigned char *)v4 + 168) = self->super._routeLegWhen._value.data[0];
    objc_storeStrong((id *)v4 + 22, self->_type);
    v5[46] = *(_DWORD *)&self->_isAboveSpeedThreshold;
  }
  return v5;
}

- (void)setIsAboveSpeedThreshold:(BOOL)a3
{
  if (self->super._routeLegWhen._value.data[0] != a3)
  {
    self->super._routeLegWhen._value.data[0] = a3;
    [(VKTrafficFeature *)self setShouldUpdateStyle:1];
  }
}

- (VKTrafficCameraFeature)initWithTrafficCamera:(id)a3 onRoute:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VKTrafficCameraFeature;
  uint64_t v8 = [(VKTrafficFeature *)&v18 initWithEnrouteNotice:v6 onRoute:v7];
  v9 = 0;
  uint64_t v10 = v8;
  if (v6 && v8)
  {
    id v11 = v6;
    switch([v11 type])
    {
      case 1u:
        if ([v11 hasSpeedThreshold])
        {
          [v11 speedThreshold];
          if (v12 == 0.0) {
            uint64_t v13 = 5;
          }
          else {
            uint64_t v13 = 1;
          }
        }
        else
        {
          uint64_t v13 = 1;
        }
        break;
      case 2u:
        uint64_t v13 = 2;
        break;
      case 3u:
        uint64_t v13 = 3;
        break;
      case 4u:
        uint64_t v13 = 4;
        break;
      case 5u:
        uint64_t v13 = 5;
        break;
      case 6u:
        uint64_t v13 = 6;
        break;
      default:
        uint64_t v13 = 0;
        break;
    }

    *(void *)&v10->super._routeLegWhen._hasValue = v13;
    if ([v11 hasSpeedThreshold])
    {
      [v11 speedThreshold];
      LODWORD(v10->_speedLimitText) = v14;
    }
    if ([v11 hasSpeedLimitText])
    {
      uint64_t v15 = [v11 speedLimitText];
      type = (void *)v10->_type;
      v10->_type = v15;
    }
    if ([v11 hasCountryCode])
    {
      LOBYTE(v10->_speedLimit) = 1;
      *(_DWORD *)&v10->_isAboveSpeedThreshold = [v11 countryCode];
    }
    v10->super._routeLegWhen._value.data[0] = 0;
    v9 = v10;
  }

  return v9;
}

- (VKTrafficCameraFeature)initWithTrafficCameraType:(int64_t)a3 uniqueIdentifier:(id)a4 routeOffset:(PolylineCoordinate)a5 onRoute:(id)a6
{
  v11.receiver = self;
  v11.super_class = (Class)VKTrafficCameraFeature;
  id v7 = [(VKTrafficFeature *)&v11 initWithFeatureType:1 uniqueIdentifier:a4 routeOffset:a5 onRoute:a6];
  uint64_t v8 = v7;
  if (v7)
  {
    *(void *)&v7->super._routeLegWhen._hasValue = a3;
    v9 = v7;
  }

  return v8;
}

+ (id)stringForTrafficCameraType:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return off_1E5A926B8[a3];
  }
}

@end