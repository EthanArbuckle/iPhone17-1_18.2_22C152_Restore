@interface IndoorRequestInfo
+ (BOOL)isMetadata:(int)a3;
+ (BOOL)supportsSecureCoding;
+ (id)indoorRequestInfoFromRequest:(id)a3;
+ (id)indoorRequestInfoFromTask:(id)a3;
- (BOOL)allowCellularDownloadTile;
- (IndoorRequestInfo)init;
- (IndoorRequestInfo)initWithCoder:(id)a3;
- (NSDate)lastRelevant;
- (NSString)floorUuid;
- (NSString)venueUuid;
- (NSUUID)requestUUID;
- (id)description;
- (id)initFloor:(id)a3 inVenue:(id)a4 withContext:(int64_t)a5 requestFor:(int)a6 withinSession:(int)a7 lastRelevant:(id)a8 allowCellularDownloadTile:(BOOL)a9 requestUUID:(id)a10;
- (id)initFromRequest:(id)a3 updatedRelevancy:(id)a4;
- (int)kind;
- (int)session;
- (int64_t)context;
- (void)encodeWithCoder:(id)a3;
- (void)setOnRequest:(id)a3;
@end

@implementation IndoorRequestInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestUUID, 0);
  objc_storeStrong((id *)&self->_lastRelevant, 0);
  objc_storeStrong((id *)&self->_floorUuid, 0);

  objc_storeStrong((id *)&self->_venueUuid, 0);
}

- (NSString)venueUuid
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)floorUuid
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (id)initFloor:(id)a3 inVenue:(id)a4 withContext:(int64_t)a5 requestFor:(int)a6 withinSession:(int)a7 lastRelevant:(id)a8 allowCellularDownloadTile:(BOOL)a9 requestUUID:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a8;
  id v24 = a10;
  v25.receiver = self;
  v25.super_class = (Class)IndoorRequestInfo;
  v19 = [(IndoorRequestInfo *)&v25 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_floorUuid, a3);
    objc_storeStrong((id *)&v20->_venueUuid, a4);
    v20->_context = a5;
    v20->_session = a7;
    v20->_kind = a6;
    objc_storeStrong((id *)&v20->_lastRelevant, a8);
    objc_storeStrong((id *)&v20->_requestUUID, a10);
    v20->_allowCellularDownloadTile = a9;
    v21 = v20;
  }

  return v20;
}

- (NSUUID)requestUUID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)indoorRequestInfoFromRequest:(id)a3
{
  id v3 = a3;
  v4 = +[NSURLProtocol propertyForKey:@"com.apple.pipelined.RequestInfo" inRequest:v3];
  id v5 = [v3 description];
  id v16 = (const std::string::value_type *)[v5 UTF8String];
  if (!v4)
  {
    sub_1000AE4B0(v18, "");
    sub_100231068("No indoor request information in NSURLRequest: ", &v20);
    sub_100315E10(&v16, &v21);
    sub_10016A2C4((uint64_t)v18, (uint64_t)&v20, 2);
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v21.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_10:
        if ((v19 & 0x80000000) == 0) {
          goto LABEL_11;
        }
LABEL_26:
        operator delete(v18[0]);
LABEL_11:
        sub_1000D11E0((uint64_t)__p);
      }
    }
    else if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_10;
    }
    operator delete(v20.__r_.__value_.__l.__data_);
    if ((v19 & 0x80000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v7 = [(id)objc_opt_class() description];
  id v16 = (const std::string::value_type *)[v7 UTF8String];
  if ((isKindOfClass & 1) == 0)
  {
    sub_1000AE4B0(v18, "");
    sub_10026C010("Invalid indoor request information in NSURLRequest. Type = ", &v20);
    sub_100315E10(&v16, &v21);
    sub_10016A2C4((uint64_t)v18, (uint64_t)&v20, 2);
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v21.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_14:
        if ((v19 & 0x80000000) == 0) {
          goto LABEL_15;
        }
LABEL_29:
        operator delete(v18[0]);
LABEL_15:
        sub_1000D11E0((uint64_t)__p);
      }
    }
    else if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_14;
    }
    operator delete(v20.__r_.__value_.__l.__data_);
    if ((v19 & 0x80000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }

  id v15 = 0;
  v8 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v15];
  id v9 = v15;
  id v10 = [v9 description];
  id v16 = (const std::string::value_type *)[v10 UTF8String];
  if (!v8)
  {
    sub_1000AE4B0(v18, "");
    sub_10015E644("Hit an error while unarchiving: %s", &v20);
    sub_100315E10(&v16, &v21);
    sub_10016A2C4((uint64_t)v18, (uint64_t)&v20, 2);
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v21.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_18:
        if ((v19 & 0x80000000) == 0) {
          goto LABEL_19;
        }
LABEL_32:
        operator delete(v18[0]);
LABEL_19:
        sub_1000D11E0((uint64_t)__p);
      }
    }
    else if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_18;
    }
    operator delete(v20.__r_.__value_.__l.__data_);
    if ((v19 & 0x80000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_32;
  }

  id v11 = [v3 description];
  id v16 = (const std::string::value_type *)[v11 UTF8String];

  objc_opt_class();
  char v12 = objc_opt_isKindOfClass();
  id v13 = [(id)objc_opt_class() description];
  id v16 = (const std::string::value_type *)[v13 UTF8String];
  if ((v12 & 1) == 0)
  {
    sub_1000AE4B0(v18, "");
    sub_10026C010("Invalid indoor request information in NSURLRequest. Type = ", &v20);
    sub_100315E10(&v16, &v21);
    sub_10016A2C4((uint64_t)v18, (uint64_t)&v20, 2);
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v21.__r_.__value_.__l.__data_);
      if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
LABEL_22:
        if ((v19 & 0x80000000) == 0) {
          goto LABEL_23;
        }
LABEL_35:
        operator delete(v18[0]);
LABEL_23:
        sub_1000D11E0((uint64_t)__p);
      }
    }
    else if ((SHIBYTE(v20.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
    {
      goto LABEL_22;
    }
    operator delete(v20.__r_.__value_.__l.__data_);
    if ((v19 & 0x80000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_35;
  }

  return v8;
}

+ (id)indoorRequestInfoFromTask:(id)a3
{
  id v3 = [a3 originalRequest];
  v4 = +[IndoorRequestInfo indoorRequestInfoFromRequest:v3];

  return v4;
}

+ (BOOL)isMetadata:(int)a3
{
  return a3 == 0;
}

- (IndoorRequestInfo)init
{
}

- (IndoorRequestInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"venueUuid"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"floorUuid"];
  signed int v7 = [v4 decodeIntForKey:@"locationContext"];
  unsigned int v8 = [v4 decodeBoolForKey:@"isFloorMetadata"];
  id v9 = [v4 decodeIntForKey:@"session"];
  id v10 = objc_alloc((Class)NSDate);
  [v4 decodeDoubleForKey:@"lastRelevant"];
  id v11 = [v10 initWithTimeIntervalSinceReferenceDate:];
  char v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"requestUUID"];
  LOBYTE(v15) = [v4 decodeBoolForKey:@"allowCellularDownloadTile"];
  id v13 = [(IndoorRequestInfo *)self initFloor:v6 inVenue:v5 withContext:v7 requestFor:v8 ^ 1 withinSession:v9 lastRelevant:v11 allowCellularDownloadTile:v15 requestUUID:v12];

  return v13;
}

- (id)initFromRequest:(id)a3 updatedRelevancy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 floorUuid];
  id v9 = [v6 venueUuid];
  id v10 = [v6 context];
  id v11 = [v6 kind];
  id v12 = [v6 session];
  unsigned __int8 v13 = [v6 allowCellularDownloadTile];
  v14 = [v6 requestUUID];
  LOBYTE(v17) = v13;
  id v15 = [(IndoorRequestInfo *)self initFloor:v8 inVenue:v9 withContext:v10 requestFor:v11 withinSession:v12 lastRelevant:v7 allowCellularDownloadTile:v17 requestUUID:v14];

  return v15;
}

- (void)setOnRequest:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IndoorRequestInfo isMetadata:[(IndoorRequestInfo *)self kind]]|| [(IndoorRequestInfo *)self allowCellularDownloadTile];
  [v4 setAllowsCellularAccess:v5];
  id v6 = +[NSKeyedArchiver archivedDataWithRootObject:self];
  if (!v6)
  {
    sub_1000AE4B0(v8, "");
    sub_1003535C4("Couldn't serialize self", &__p);
    sub_10016A2C4((uint64_t)v8, (uint64_t)&__p, 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(__p.__r_.__value_.__l.__data_);
    }
    if (v9 < 0) {
      operator delete(v8[0]);
    }
    sub_100149690((uint64_t)&v7);
  }

  +[NSURLProtocol setProperty:v6 forKey:@"com.apple.pipelined.RequestInfo" inRequest:v4];
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_venueUuid forKey:@"venueUuid"];
  [v5 encodeObject:self->_floorUuid forKey:@"floorUuid"];
  [v5 encodeInt:LODWORD(self->_context) forKey:@"locationContext"];
  [v5 encodeBool:+[IndoorRequestInfo isMetadata:](IndoorRequestInfo, "isMetadata:", self->_kind) forKey:@"isFloorMetadata"];
  [v5 encodeInt:self->_session forKey:@"session"];
  [(NSDate *)self->_lastRelevant timeIntervalSinceReferenceDate];
  [v5 encodeDouble:@"lastRelevant" forKey:];
  id v4 = [(IndoorRequestInfo *)self requestUUID];
  [v5 encodeObject:v4 forKey:@"requestUUID"];

  [v5 encodeBool:-[IndoorRequestInfo allowCellularDownloadTile](self, "allowCellularDownloadTile") forKey:@"allowCellularDownloadTile"];
}

- (id)description
{
  uint64_t v3 = 0;
  CFStringRef v4 = @"T";
  int kind = self->_kind;
  uint64_t session = self->_session;
  if (kind != 1) {
    CFStringRef v4 = 0;
  }
  if (kind) {
    CFStringRef v7 = v4;
  }
  else {
    CFStringRef v7 = @"C";
  }
  if (session <= 2) {
    uint64_t v3 = (uint64_t)*(&off_10046B690 + session);
  }
  int64_t context = self->_context;
  id v9 = objc_alloc((Class)NSString);
  venueUuid = self->_venueUuid;
  floorUuid = self->_floorUuid;
  id v12 = [(IndoorRequestInfo *)self requestUUID];
  uint64_t v13 = [v12 UUIDString];
  v14 = (void *)v13;
  CFStringRef v15 = @"I";
  if (context) {
    CFStringRef v15 = 0;
  }
  if (context == 1) {
    CFStringRef v15 = @"R";
  }
  id v16 = [v9 initWithFormat:@"%@|%@|%@|%@|%@|%@", v3, v7, v15, venueUuid, floorUuid, v13];

  return v16;
}

- (int64_t)context
{
  return self->_context;
}

- (NSDate)lastRelevant
{
  return (NSDate *)objc_getProperty(self, a2, 48, 1);
}

- (int)session
{
  return self->_session;
}

- (int)kind
{
  return self->_kind;
}

- (BOOL)allowCellularDownloadTile
{
  return self->_allowCellularDownloadTile;
}

@end