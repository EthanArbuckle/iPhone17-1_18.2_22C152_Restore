@interface SidecarDisplaySendingDeviceSessionState
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (SidecarDevice)device;
- (SidecarDisplaySendingDeviceSessionState)init;
- (SidecarDisplaySendingDeviceSessionState)initWithCoder:(id)a3;
- (SidecarDisplaySendingDeviceSessionState)initWithDevice:(id)a3 sessionState:(int64_t)a4;
- (SidecarDisplaySendingDeviceSessionState)initWithDevice:(id)a3 sessionState:(int64_t)a4 visualDetectability:(int64_t)a5;
- (id)description;
- (int64_t)sessionState;
- (int64_t)visualDetectability;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SidecarDisplaySendingDeviceSessionState

- (void).cxx_destruct
{
}

- (int64_t)visualDetectability
{
  return self->_visualDetectability;
}

- (int64_t)sessionState
{
  return self->_sessionState;
}

- (SidecarDevice)device
{
  return self->_device;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(SidecarDisplaySendingDeviceSessionState *)self device];
  v7 = [v6 identifier];
  unint64_t v8 = [(SidecarDisplaySendingDeviceSessionState *)self visualDetectability];
  if (v8 > 2) {
    v9 = @"UnrecognizedValue";
  }
  else {
    v9 = off_2649C6460[v8];
  }
  v10 = v9;
  unint64_t v11 = [(SidecarDisplaySendingDeviceSessionState *)self sessionState];
  if (v11 > 3) {
    v12 = @"Unknown";
  }
  else {
    v12 = off_2649C6048[v11];
  }
  v13 = v12;
  v14 = [v3 stringWithFormat:@"%@ device identifier: [%@], visualDetectability: [%@], sessionState: [%@]", v5, v7, v10, v13];

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  device = self->_device;
  id v5 = a3;
  encodeObject(v5, @"device", device);
  encodeInteger(v5, @"sessionState", self->_sessionState);
  encodeInteger(v5, @"visualDetectability", self->_visualDetectability);
}

- (SidecarDisplaySendingDeviceSessionState)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = decodeObject(v4, @"device", v5);
  uint64_t v7 = decodeInteger(v4, @"sessionState");
  uint64_t v8 = decodeInteger(v4, @"visualDetectability");

  v9 = [(SidecarDisplaySendingDeviceSessionState *)self initWithDevice:v6 sessionState:v7 visualDetectability:v8];
  return v9;
}

- (SidecarDisplaySendingDeviceSessionState)initWithDevice:(id)a3 sessionState:(int64_t)a4
{
  return [(SidecarDisplaySendingDeviceSessionState *)self initWithDevice:a3 sessionState:a4 visualDetectability:0];
}

- (SidecarDisplaySendingDeviceSessionState)initWithDevice:(id)a3 sessionState:(int64_t)a4 visualDetectability:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SidecarDisplaySendingDeviceSessionState;
  v10 = [(SidecarDisplaySendingDeviceSessionState *)&v13 init];
  unint64_t v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_device, a3);
    v11->_sessionState = a4;
    v11->_visualDetectability = a5;
  }

  return v11;
}

- (SidecarDisplaySendingDeviceSessionState)init
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)new
{
}

@end