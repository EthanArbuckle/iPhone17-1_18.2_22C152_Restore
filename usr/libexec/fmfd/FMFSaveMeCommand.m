@interface FMFSaveMeCommand
- (FMFSaveMeCommand)initWithDeviceId:(id)a3;
- (NSString)deviceId;
- (id)jsonBodyDictionary;
- (id)pathSuffix;
- (void)setDeviceId:(id)a3;
@end

@implementation FMFSaveMeCommand

- (FMFSaveMeCommand)initWithDeviceId:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)FMFSaveMeCommand;
  v5 = [(FMFBaseCmd *)&v8 initWithClientSession:0];
  v6 = v5;
  if (v5) {
    [(FMFSaveMeCommand *)v5 setDeviceId:v4];
  }

  return v6;
}

- (id)pathSuffix
{
  return @"saveme/savePrefs";
}

- (id)jsonBodyDictionary
{
  v7.receiver = self;
  v7.super_class = (Class)FMFSaveMeCommand;
  v3 = [(FMFBaseCmd *)&v7 jsonBodyDictionary];
  id v4 = [(FMFSaveMeCommand *)self deviceId];
  if (v4) {
    [(FMFSaveMeCommand *)self deviceId];
  }
  else {
  v5 = +[NSNull null];
  }
  [v3 setObject:v5 forKey:@"meDeviceId"];

  return v3;
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
}

- (void).cxx_destruct
{
}

@end