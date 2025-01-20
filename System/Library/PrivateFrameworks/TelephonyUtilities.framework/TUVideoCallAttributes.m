@interface TUVideoCallAttributes
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToVideoCallAttributes:(id)a3;
- (TUVideoCallAttributes)initWithCoder:(id)a3;
- (id)description;
- (int64_t)localVideoContextSlotIdentifier;
- (int64_t)remoteCameraOrientation;
- (int64_t)remoteVideoContextSlotIdentifier;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setLocalVideoContextSlotIdentifier:(int64_t)a3;
- (void)setRemoteCameraOrientation:(int64_t)a3;
- (void)setRemoteVideoContextSlotIdentifier:(int64_t)a3;
@end

@implementation TUVideoCallAttributes

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" remoteCameraOrientation=%ld", -[TUVideoCallAttributes remoteCameraOrientation](self, "remoteCameraOrientation"));
  objc_msgSend(v3, "appendFormat:", @" localVideoContextSlotIdentifier=%ld", -[TUVideoCallAttributes localVideoContextSlotIdentifier](self, "localVideoContextSlotIdentifier"));
  objc_msgSend(v3, "appendFormat:", @" remoteVideoContextSlotIdentifier=%ld", -[TUVideoCallAttributes remoteVideoContextSlotIdentifier](self, "remoteVideoContextSlotIdentifier"));
  [v3 appendString:@">"];
  v4 = (void *)[v3 copy];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(TUVideoCallAttributes *)self isEqualToVideoCallAttributes:v4];

  return v5;
}

- (BOOL)isEqualToVideoCallAttributes:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUVideoCallAttributes *)self remoteCameraOrientation];
  if (v5 == [v4 remoteCameraOrientation]
    && (int64_t v6 = [(TUVideoCallAttributes *)self localVideoContextSlotIdentifier],
        v6 == [v4 localVideoContextSlotIdentifier]))
  {
    int64_t v7 = [(TUVideoCallAttributes *)self remoteVideoContextSlotIdentifier];
    BOOL v8 = v7 == [v4 remoteVideoContextSlotIdentifier];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3 = [(TUVideoCallAttributes *)self remoteCameraOrientation];
  int64_t v4 = [(TUVideoCallAttributes *)self localVideoContextSlotIdentifier] ^ v3;
  return v4 ^ [(TUVideoCallAttributes *)self remoteVideoContextSlotIdentifier];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUVideoCallAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(TUVideoCallAttributes *)self init];
  if (v5)
  {
    int64_t v6 = NSStringFromSelector(sel_remoteCameraOrientation);
    v5->_remoteCameraOrientation = [v4 decodeIntegerForKey:v6];

    int64_t v7 = NSStringFromSelector(sel_localVideoContextSlotIdentifier);
    v5->_localVideoContextSlotIdentifier = [v4 decodeIntegerForKey:v7];

    BOOL v8 = NSStringFromSelector(sel_remoteVideoContextSlotIdentifier);
    v5->_remoteVideoContextSlotIdentifier = [v4 decodeIntegerForKey:v8];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t remoteCameraOrientation = self->_remoteCameraOrientation;
  id v5 = a3;
  int64_t v6 = NSStringFromSelector(sel_remoteCameraOrientation);
  [v5 encodeInteger:remoteCameraOrientation forKey:v6];

  int64_t localVideoContextSlotIdentifier = self->_localVideoContextSlotIdentifier;
  BOOL v8 = NSStringFromSelector(sel_localVideoContextSlotIdentifier);
  [v5 encodeInteger:localVideoContextSlotIdentifier forKey:v8];

  int64_t remoteVideoContextSlotIdentifier = self->_remoteVideoContextSlotIdentifier;
  NSStringFromSelector(sel_remoteVideoContextSlotIdentifier);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeInteger:remoteVideoContextSlotIdentifier forKey:v10];
}

- (int64_t)remoteCameraOrientation
{
  return self->_remoteCameraOrientation;
}

- (void)setRemoteCameraOrientation:(int64_t)a3
{
  self->_int64_t remoteCameraOrientation = a3;
}

- (int64_t)localVideoContextSlotIdentifier
{
  return self->_localVideoContextSlotIdentifier;
}

- (void)setLocalVideoContextSlotIdentifier:(int64_t)a3
{
  self->_int64_t localVideoContextSlotIdentifier = a3;
}

- (int64_t)remoteVideoContextSlotIdentifier
{
  return self->_remoteVideoContextSlotIdentifier;
}

- (void)setRemoteVideoContextSlotIdentifier:(int64_t)a3
{
  self->_int64_t remoteVideoContextSlotIdentifier = a3;
}

@end