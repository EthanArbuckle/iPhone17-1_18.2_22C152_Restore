@interface DADeviceStateChangeNotificationInfo
+ (id)infoWithChangedProperties:(unint64_t)a3 snapshot:(id)a4;
- (DADeviceState)snapshot;
- (DADeviceStateChangeNotificationInfo)initWithChangedProperties:(unint64_t)a3 snapshot:(id)a4;
- (unint64_t)changedProperties;
@end

@implementation DADeviceStateChangeNotificationInfo

+ (id)infoWithChangedProperties:(unint64_t)a3 snapshot:(id)a4
{
  id v6 = a4;
  id v7 = [objc_alloc((Class)a1) initWithChangedProperties:a3 snapshot:v6];

  return v7;
}

- (DADeviceStateChangeNotificationInfo)initWithChangedProperties:(unint64_t)a3 snapshot:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)DADeviceStateChangeNotificationInfo;
  v8 = [(DADeviceStateChangeNotificationInfo *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_changedProperties = a3;
    objc_storeStrong((id *)&v8->_snapshot, a4);
  }

  return v9;
}

- (unint64_t)changedProperties
{
  return self->_changedProperties;
}

- (DADeviceState)snapshot
{
  return self->_snapshot;
}

- (void).cxx_destruct
{
}

@end