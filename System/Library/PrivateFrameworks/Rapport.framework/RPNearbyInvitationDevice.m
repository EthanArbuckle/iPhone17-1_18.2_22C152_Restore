@interface RPNearbyInvitationDevice
+ (BOOL)supportsSecureCoding;
- (BOOL)inBubble;
- (BOOL)isEqualToDevice:(id)a3;
- (BOOL)wasTriggered;
- (RPNearbyInvitationDevice)initWithCoder:(id)a3;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (unsigned)deviceColor;
- (unsigned)updateWithEndpoint:(id)a3;
- (unsigned)updateWithSFDevice:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInBubble:(BOOL)a3;
- (void)setWasTriggered:(BOOL)a3;
@end

@implementation RPNearbyInvitationDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RPNearbyInvitationDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RPNearbyInvitationDevice;
  v5 = [(RPEndpoint *)&v8 initWithCoder:v4];
  if (v5)
  {
    uint64_t v9 = 0;
    if (NSDecodeSInt64RangedIfPresent()) {
      v5->_deviceColor = v9;
    }
    v6 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)RPNearbyInvitationDevice;
  [(RPEndpoint *)&v5 encodeWithCoder:v4];
  if (self->_deviceColor) {
    objc_msgSend(v4, "encodeInteger:forKey:");
  }
}

- (id)description
{
  return [(RPNearbyInvitationDevice *)self descriptionWithLevel:50];
}

- (id)descriptionWithLevel:(int)a3
{
  NSAppendPrintF();
  id v11 = 0;
  uint64_t v9 = [(RPEndpoint *)self identifier];
  NSAppendPrintF();
  id v4 = v11;

  uint64_t v10 = [(RPNearbyInvitationDevice *)self deviceColor];
  NSAppendPrintF();
  id v5 = v4;

  v6 = [(RPEndpoint *)self model];
  if (v6)
  {
    NSAppendPrintF();
    id v7 = v5;

    id v5 = v7;
  }

  return v5;
}

- (BOOL)isEqualToDevice:(id)a3
{
  identifier = self->super._identifier;
  id v4 = [a3 identifier];
  LOBYTE(identifier) = [(NSString *)identifier isEqualToString:v4];

  return (char)identifier;
}

- (unsigned)updateWithSFDevice:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)RPNearbyInvitationDevice;
  id v4 = a3;
  unsigned int v5 = [(RPEndpoint *)&v10 updateWithSFDevice:v4];
  v6 = objc_msgSend(v4, "bleDevice", v10.receiver, v10.super_class);

  id v7 = [v6 advertisementFields];
  unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();

  if (self->_deviceColor != Int64Ranged)
  {
    self->_deviceColor = Int64Ranged;
    v5 |= 2u;
  }
  return v5;
}

- (unsigned)updateWithEndpoint:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RPNearbyInvitationDevice;
  return [(RPEndpoint *)&v4 updateWithEndpoint:a3];
}

- (unsigned)deviceColor
{
  return self->_deviceColor;
}

- (BOOL)inBubble
{
  return self->_inBubble;
}

- (void)setInBubble:(BOOL)a3
{
  self->_inBubble = a3;
}

- (BOOL)wasTriggered
{
  return self->_wasTriggered;
}

- (void)setWasTriggered:(BOOL)a3
{
  self->_wasTriggered = a3;
}

@end