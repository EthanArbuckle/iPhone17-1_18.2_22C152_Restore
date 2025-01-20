@interface TUNearbyDeviceHandleCapabilities
+ (BOOL)supportsSecureCoding;
- (BOOL)isAVLessCapable;
- (BOOL)isAudioCallCapable;
- (BOOL)isLagunaCapable;
- (BOOL)isTelephonyRelayCapable;
- (TUNearbyDeviceHandleCapabilities)initWithAVLessCapable:(BOOL)a3 lagunaCapable:(BOOL)a4 audioCallCapable:(BOOL)a5 telephonyRelayCapable:(BOOL)a6;
- (TUNearbyDeviceHandleCapabilities)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation TUNearbyDeviceHandleCapabilities

- (TUNearbyDeviceHandleCapabilities)initWithAVLessCapable:(BOOL)a3 lagunaCapable:(BOOL)a4 audioCallCapable:(BOOL)a5 telephonyRelayCapable:(BOOL)a6
{
  v11.receiver = self;
  v11.super_class = (Class)TUNearbyDeviceHandleCapabilities;
  result = [(TUNearbyDeviceHandleCapabilities *)&v11 init];
  if (result)
  {
    result->_avLessCapable = a3;
    result->_lagunaCapable = a4;
    result->_audioCallCapable = a5;
    result->_telephonyRelayCapable = a6;
  }
  return result;
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@ %p", v5, self];

  objc_msgSend(v6, "appendFormat:", @" isAVLessCapable=%d", -[TUNearbyDeviceHandleCapabilities isAVLessCapable](self, "isAVLessCapable"));
  objc_msgSend(v6, "appendFormat:", @" isLagunaCapable=%d", -[TUNearbyDeviceHandleCapabilities isLagunaCapable](self, "isLagunaCapable"));
  objc_msgSend(v6, "appendFormat:", @" isAudioCallCapable=%d", -[TUNearbyDeviceHandleCapabilities isAudioCallCapable](self, "isAudioCallCapable"));
  objc_msgSend(v6, "appendFormat:", @" isTelephonyRelayCapable=%d", -[TUNearbyDeviceHandleCapabilities isTelephonyRelayCapable](self, "isTelephonyRelayCapable"));
  [v6 appendString:@">"];
  v7 = (void *)[v6 copy];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbyDeviceHandleCapabilities)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = NSStringFromSelector(sel_isAVLessCapable);
  uint64_t v6 = [v4 decodeBoolForKey:v5];

  v7 = NSStringFromSelector(sel_isLagunaCapable);
  uint64_t v8 = [v4 decodeBoolForKey:v7];

  v9 = NSStringFromSelector(sel_isAudioCallCapable);
  uint64_t v10 = [v4 decodeBoolForKey:v9];

  objc_super v11 = NSStringFromSelector(sel_isTelephonyRelayCapable);
  uint64_t v12 = [v4 decodeBoolForKey:v11];

  return [(TUNearbyDeviceHandleCapabilities *)self initWithAVLessCapable:v6 lagunaCapable:v8 audioCallCapable:v10 telephonyRelayCapable:v12];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUNearbyDeviceHandleCapabilities *)self isAVLessCapable];
  uint64_t v6 = NSStringFromSelector(sel_isAVLessCapable);
  [v4 encodeBool:v5 forKey:v6];

  BOOL v7 = [(TUNearbyDeviceHandleCapabilities *)self isLagunaCapable];
  uint64_t v8 = NSStringFromSelector(sel_isLagunaCapable);
  [v4 encodeBool:v7 forKey:v8];

  BOOL v9 = [(TUNearbyDeviceHandleCapabilities *)self isAudioCallCapable];
  uint64_t v10 = NSStringFromSelector(sel_isAudioCallCapable);
  [v4 encodeBool:v9 forKey:v10];

  BOOL v11 = [(TUNearbyDeviceHandleCapabilities *)self isTelephonyRelayCapable];
  NSStringFromSelector(sel_isTelephonyRelayCapable);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v11 forKey:v12];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  BOOL v5 = [(TUNearbyDeviceHandleCapabilities *)self isAVLessCapable];
  BOOL v6 = [(TUNearbyDeviceHandleCapabilities *)self isLagunaCapable];
  BOOL v7 = [(TUNearbyDeviceHandleCapabilities *)self isAudioCallCapable];
  BOOL v8 = [(TUNearbyDeviceHandleCapabilities *)self isTelephonyRelayCapable];

  return (id)[v4 initWithAVLessCapable:v5 lagunaCapable:v6 audioCallCapable:v7 telephonyRelayCapable:v8];
}

- (BOOL)isAVLessCapable
{
  return self->_avLessCapable;
}

- (BOOL)isLagunaCapable
{
  return self->_lagunaCapable;
}

- (BOOL)isAudioCallCapable
{
  return self->_audioCallCapable;
}

- (BOOL)isTelephonyRelayCapable
{
  return self->_telephonyRelayCapable;
}

@end