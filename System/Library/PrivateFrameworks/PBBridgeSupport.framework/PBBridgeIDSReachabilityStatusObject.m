@interface PBBridgeIDSReachabilityStatusObject
+ (id)connectivityString:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (NSUUID)idsDeviceID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unint64_t)reachability;
- (void)setIdsDeviceID:(id)a3;
- (void)setReachability:(unint64_t)a3;
@end

@implementation PBBridgeIDSReachabilityStatusObject

- (unint64_t)hash
{
  return [(NSUUID *)self->_idsDeviceID hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (v4) {
    char v5 = [(NSUUID *)self->_idsDeviceID isEqual:v4[1]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[PBBridgeIDSReachabilityStatusObject allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_idsDeviceID, self->_idsDeviceID);
  v4->_reachability = self->_reachability;
  return v4;
}

- (id)description
{
  v2 = NSString;
  idsDeviceID = self->_idsDeviceID;
  v4 = [(id)objc_opt_class() connectivityString:self->_reachability];
  char v5 = [v2 stringWithFormat:@"%s: idsID=%@ connectivity=%@", "-[PBBridgeIDSReachabilityStatusObject description]", idsDeviceID, v4];

  return v5;
}

+ (id)connectivityString:(unint64_t)a3
{
  if (a3 > 2) {
    return @"unknown enum value";
  }
  else {
    return off_264401648[a3];
  }
}

- (NSUUID)idsDeviceID
{
  return self->_idsDeviceID;
}

- (void)setIdsDeviceID:(id)a3
{
}

- (unint64_t)reachability
{
  return self->_reachability;
}

- (void)setReachability:(unint64_t)a3
{
  self->_reachability = a3;
}

- (void).cxx_destruct
{
}

@end