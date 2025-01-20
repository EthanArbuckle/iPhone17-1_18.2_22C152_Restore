@interface PCLockscreenControlsDevice
+ (BOOL)supportsSecureCoding;
- (NSNumber)distance;
- (NSString)mediaRouteID;
- (PCLockscreenControlsDevice)initWithCoder:(id)a3;
- (PCLockscreenControlsDevice)initWithMediaRouteID:(id)a3 distance:(id)a4;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDistance:(id)a3;
- (void)setMediaRouteID:(id)a3;
@end

@implementation PCLockscreenControlsDevice

- (PCLockscreenControlsDevice)initWithMediaRouteID:(id)a3 distance:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PCLockscreenControlsDevice;
  v9 = [(PCLockscreenControlsDevice *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_mediaRouteID, a3);
    objc_storeStrong((id *)&v10->_distance, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PCLockscreenControlsDevice mrID=%@ dist=%@", self->_mediaRouteID, self->_distance];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  distance = self->_distance;
  id v7 = v4;
  if (distance)
  {
    [v4 encodeObject:distance forKey:@"dist"];
    id v4 = v7;
  }
  mediaRouteID = self->_mediaRouteID;
  if (mediaRouteID)
  {
    [v7 encodeObject:mediaRouteID forKey:@"mrID"];
    id v4 = v7;
  }
}

- (PCLockscreenControlsDevice)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PCLockscreenControlsDevice;
  v5 = [(PCLockscreenControlsDevice *)&v9 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();
  }
  return v5;
}

- (NSNumber)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
}

- (NSString)mediaRouteID
{
  return self->_mediaRouteID;
}

- (void)setMediaRouteID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRouteID, 0);
  objc_storeStrong((id *)&self->_distance, 0);
}

@end