@interface NESMFilterSessionStateRunning
- (BOOL)handleSleep;
- (NESMFilterSessionStateRunning)init;
- (void)enterWithSession:(id)a3;
- (void)handleUpdateConfiguration;
- (void)handleWakeup;
@end

@implementation NESMFilterSessionStateRunning

- (void)handleUpdateConfiguration
{
  v17.receiver = self;
  v17.super_class = (Class)NESMFilterSessionStateRunning;
  [(NESMFilterSessionState *)&v17 handleUpdateConfiguration];
  if (self)
  {
    id Property = objc_getProperty(self, v3, 16, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 400, 1);
    }
    id v6 = Property;
    v8 = [objc_getProperty(self, v7, 16, 1) configuration];
    sub_100017EFC(v6, v8);

    id v10 = objc_getProperty(self, v9, 16, 1);
    if (v10) {
      id v10 = objc_getProperty(v10, v11, 408, 1);
    }
    id v12 = v10;
    id v14 = objc_getProperty(self, v13, 16, 1);
  }
  else
  {
    v16 = [0 configuration];
    sub_100017EFC(0, v16);

    id v12 = 0;
    id v14 = 0;
  }
  v15 = [v14 configuration];
  sub_100017EFC(v12, v15);
}

- (void)handleWakeup
{
  v11.receiver = self;
  v11.super_class = (Class)NESMFilterSessionStateRunning;
  [(NESMFilterSessionState *)&v11 handleWakeup];
  if (self)
  {
    id Property = objc_getProperty(self, v3, 16, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 400, 1);
    }
    id v6 = Property;
    sub_1000182B0(v6);

    id v8 = objc_getProperty(self, v7, 16, 1);
    if (v8) {
      id v8 = objc_getProperty(v8, v9, 408, 1);
    }
  }
  else
  {
    id v8 = 0;
  }
  id v10 = v8;
  sub_1000182B0(v10);
}

- (BOOL)handleSleep
{
  v12.receiver = self;
  v12.super_class = (Class)NESMFilterSessionStateRunning;
  [(NESMFilterSessionState *)&v12 handleSleep];
  if (self)
  {
    id Property = objc_getProperty(self, v3, 16, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v5, 400, 1);
    }
    id v6 = Property;
    sub_100017F64(v6);

    id v8 = objc_getProperty(self, v7, 16, 1);
    if (v8) {
      id v8 = objc_getProperty(v8, v9, 408, 1);
    }
  }
  else
  {
    id v8 = 0;
  }
  id v10 = v8;
  sub_100017F64(v10);

  return 1;
}

- (void)enterWithSession:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NESMFilterSessionStateRunning;
  [(NESMFilterSessionState *)&v9 enterWithSession:a3];
  if (self) {
    id Property = objc_getProperty(self, v4, 16, 1);
  }
  else {
    id Property = 0;
  }
  SEL v7 = [Property server];
  if (self) {
    id v8 = objc_getProperty(self, v6, 16, 1);
  }
  else {
    id v8 = 0;
  }
  [v7 requestInstallForSession:v8 withParentSession:0 exclusive:1];
}

- (NESMFilterSessionStateRunning)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMFilterSessionStateRunning;
  return [(NESMFilterSessionState *)&v3 initWithType:3 andTimeout:0];
}

@end