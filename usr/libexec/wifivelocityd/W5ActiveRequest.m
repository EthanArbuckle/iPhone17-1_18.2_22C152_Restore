@interface W5ActiveRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)wantsUpdates;
- (NSString)destinationPeerID;
- (NSString)peerID;
- (NSString)sourcePeerID;
- (NSUUID)uuid;
- (W5ActiveRequest)initWithCoder:(id)a3;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)type;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setDestinationPeerID:(id)a3;
- (void)setPeerID:(id)a3;
- (void)setSourcePeerID:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setType:(int64_t)a3;
- (void)setUuid:(id)a3;
- (void)setWantsUpdates:(BOOL)a3;
@end

@implementation W5ActiveRequest

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)W5ActiveRequest;
  [(W5ActiveRequest *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = +[NSMutableString stringWithCapacity:0];
  [(NSMutableString *)v3 appendFormat:@"UUID: %@\n", [(NSString *)[(NSUUID *)self->_uuid UUIDString] substringToIndex:5]];
  [(NSMutableString *)v3 appendFormat:@"PeerID: %@\n", self->_peerID];
  [(NSMutableString *)v3 appendFormat:@"Type: %@\n", sub_10001CB8C(self->_type)];
  if (self->_wantsUpdates) {
    v4 = "Yes";
  }
  else {
    v4 = "No";
  }
  [(NSMutableString *)v3 appendFormat:@"Wants Updates: %s\n", v4];
  id v5 = objc_alloc_init((Class)NSDateFormatter);
  [v5 setDateStyle:0];
  [v5 setTimeStyle:2];
  [v5 setLocale:+[NSLocale currentLocale](NSLocale, "currentLocale")];
  -[v3 appendFormat:@"Timestamp: %@\n", [v5 stringFromDate:[NSDate dateWithTimeIntervalSinceReferenceDate:self->_timestamp]]];
  id v6 = [(NSMutableString *)v3 copy];

  return v6;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5ActiveRequest;
  if (-[W5ActiveRequest conformsToProtocol:](&v5, "conformsToProtocol:")
    || ([a3 isEqual:&OBJC_PROTOCOL___NSSecureCoding] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&OBJC_PROTOCOL___NSCopying];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[W5ActiveRequest allocWithZone:a3] init];
  [(W5ActiveRequest *)v4 setUuid:self->_uuid];
  [(W5ActiveRequest *)v4 setPeerID:self->_peerID];
  [(W5ActiveRequest *)v4 setType:self->_type];
  [(W5ActiveRequest *)v4 setTimestamp:self->_timestamp];
  [(W5ActiveRequest *)v4 setWantsUpdates:self->_wantsUpdates];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_uuid forKey:@"_uuid"];
  [a3 encodeObject:self->_peerID forKey:@"_peerID"];
  [a3 encodeInteger:self->_type forKey:@"_type"];
  [a3 encodeDouble:@"_timestamp" forKey:self->_timestamp];
  BOOL wantsUpdates = self->_wantsUpdates;

  [a3 encodeBool:wantsUpdates forKey:@"_wantsUpdates"];
}

- (W5ActiveRequest)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)W5ActiveRequest;
  v4 = [(W5ActiveRequest *)&v7 init];
  if (v4)
  {
    v4->_uuid = (NSUUID *)[[objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_uuid"), "copy") copy];
    v4->_peerID = [(NSString *)[objc_msgSend(objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"_peerID"), "copy") copy];
    v4->_type = (int64_t)[a3 decodeIntegerForKey:@"_type"];
    [a3 decodeDoubleForKey:@"_timestamp"];
    v4->_timestamp = v5;
    v4->_BOOL wantsUpdates = [a3 decodeBoolForKey:@"_wantsUpdates"];
  }
  return v4;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
}

- (NSString)sourcePeerID
{
  return self->_sourcePeerID;
}

- (void)setSourcePeerID:(id)a3
{
}

- (NSString)destinationPeerID
{
  return self->_destinationPeerID;
}

- (void)setDestinationPeerID:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (BOOL)wantsUpdates
{
  return self->_wantsUpdates;
}

- (void)setWantsUpdates:(BOOL)a3
{
  self->_BOOL wantsUpdates = a3;
}

@end