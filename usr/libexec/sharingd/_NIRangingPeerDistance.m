@interface _NIRangingPeerDistance
+ (BOOL)supportsSecureCoding;
- (BOOL)initiator;
- (BOOL)isInitiator;
- (BOOL)shouldUnlock;
- (NSNumber)distanceMeters;
- (_NIRangingPeer)peer;
- (_NIRangingPeerDistance)init;
- (_NIRangingPeerDistance)initWithCoder:(id)a3;
- (_NIRangingPeerDistance)initWithPeer:(id)a3 distanceMeters:(id)a4 initiator:(BOOL)a5 shouldUnlock:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _NIRangingPeerDistance

- (_NIRangingPeerDistance)init
{
  return 0;
}

- (_NIRangingPeerDistance)initWithPeer:(id)a3 distanceMeters:(id)a4 initiator:(BOOL)a5 shouldUnlock:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_NIRangingPeerDistance;
  v12 = [(_NIRangingPeerDistance *)&v17 init];
  if (v12)
  {
    v13 = [[_NIRangingPeerDistanceInternal alloc] initWithPeer:v10 distanceMeters:v11 initiator:v7 shouldUnlock:v6];
    id internal = v12->_internal;
    v12->_id internal = v13;

    v15 = v12;
  }

  return v12;
}

- (_NIRangingPeer)peer
{
  return (_NIRangingPeer *)*((id *)self->_internal + 1);
}

- (NSNumber)distanceMeters
{
  return (NSNumber *)*((id *)self->_internal + 2);
}

- (BOOL)shouldUnlock
{
  return *((unsigned char *)self->_internal + 25);
}

- (BOOL)initiator
{
  return *((unsigned char *)self->_internal + 24);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  id internal = self->_internal;
  uint64_t v6 = internal[1];
  uint64_t v7 = internal[2];
  uint64_t v8 = *((unsigned __int8 *)internal + 24);
  uint64_t v9 = *((unsigned __int8 *)internal + 25);

  return [v4 initWithPeer:v6 distanceMeters:v7 initiator:v8 shouldUnlock:v9];
}

- (_NIRangingPeerDistance)initWithCoder:(id)a3
{
  id v5 = a3;
  if (([v5 allowsKeyedCoding] & 1) == 0)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SDAutoUnlockNIRangingPeer.m", 286, @"Invalid parameter not satisfying: %@", @"[aDecoder allowsKeyedCoding]" object file lineNumber description];
  }
  uint64_t v6 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"kNICodingKeyRangingPeerDistancePeer"];
  uint64_t v7 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"kNICodingKeyRangingPeerDistanceDistance"];
  id v8 = [v5 decodeBoolForKey:@"kNICodingKeyRangingPeerDistanceInitiator"];
  id v9 = [v5 decodeBoolForKey:@"kNICodingKeyRangingPeerDistanceUnlock"];

  id v10 = [(_NIRangingPeerDistance *)self initWithPeer:v6 distanceMeters:v7 initiator:v8 shouldUnlock:v9];
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  if (([v10 allowsKeyedCoding] & 1) == 0)
  {
    id v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2, self, @"SDAutoUnlockNIRangingPeer.m", 298, @"Invalid parameter not satisfying: %@", @"[aCoder allowsKeyedCoding]" object file lineNumber description];
  }
  id internal = self->_internal;
  uint64_t v6 = internal[1];
  uint64_t v7 = internal;
  [v10 encodeObject:v6 forKey:@"kNICodingKeyRangingPeerDistancePeer"];
  [v10 encodeObject:v7[2] forKey:@"kNICodingKeyRangingPeerDistanceDistance"];
  [v10 encodeBool:*((unsigned __int8 *)v7 + 24) forKey:@"kNICodingKeyRangingPeerDistanceInitiator"];
  uint64_t v8 = *((unsigned __int8 *)v7 + 25);

  [v10 encodeBool:v8 forKey:@"kNICodingKeyRangingPeerDistanceUnlock"];
}

- (id)description
{
  id internal = (id *)self->_internal;
  id v3 = internal[1];
  id v4 = internal;
  id v5 = [v3 getMacAddressAsString];
  [v4[2] floatValue];
  double v7 = v6;
  if (*((unsigned char *)v4 + 25)) {
    uint64_t v8 = "Yes";
  }
  else {
    uint64_t v8 = "No";
  }
  id v9 = [internal[1] secureRangingKeyID];
  if (v9) {
    id v10 = "Yes";
  }
  else {
    id v10 = "No";
  }
  int v11 = *((unsigned __int8 *)v4 + 24);

  if (v11) {
    v12 = "Yes";
  }
  else {
    v12 = "No";
  }
  v13 = +[NSString stringWithFormat:@"Peer: %@ distance[m]:%.02f unlock:%s secure:%s initiator:%s", v5, *(void *)&v7, v8, v10, v12];

  return v13;
}

- (BOOL)isInitiator
{
  return self->_initiator;
}

- (void).cxx_destruct
{
}

@end