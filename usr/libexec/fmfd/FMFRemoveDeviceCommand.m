@interface FMFRemoveDeviceCommand
- (BOOL)isUserAction;
- (FMFDevice)activeDevice;
- (FMFRemoveDeviceCommand)initWithClientSession:(id)a3 device:(id)a4;
- (id)debugDescription;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)setActiveDevice:(id)a3;
@end

@implementation FMFRemoveDeviceCommand

- (FMFRemoveDeviceCommand)initWithClientSession:(id)a3 device:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)FMFRemoveDeviceCommand;
  v7 = [(FMFBaseCmd *)&v10 initWithClientSession:a3];
  v8 = v7;
  if (v6 && v7)
  {
    [(FMFRemoveDeviceCommand *)v7 setActiveDevice:v6];
  }
  else
  {
    [(FMFBaseCmd *)v7 initFailed];

    v8 = 0;
  }

  return v8;
}

- (id)pathSuffix
{
  return @"removeDevice";
}

- (id)jsonBodyDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)FMFRemoveDeviceCommand;
  v3 = [(FMFBaseCmd *)&v7 jsonBodyDictionary];
  v4 = [(FMFRemoveDeviceCommand *)self activeDevice];
  v5 = [v4 deviceId];
  [v3 setObject:v5 forKey:@"deviceId"];

  return v3;
}

- (id)debugDescription
{
  v3 = [(FMFRemoveDeviceCommand *)self activeDevice];
  v4 = +[NSString stringWithFormat:@"%@: activeDevice: %@", self, v3];

  return v4;
}

- (BOOL)isUserAction
{
  return 1;
}

- (FMFDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end