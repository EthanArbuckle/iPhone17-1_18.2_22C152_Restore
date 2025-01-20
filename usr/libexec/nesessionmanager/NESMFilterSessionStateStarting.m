@interface NESMFilterSessionStateStarting
- (NESMFilterSessionStateStarting)init;
- (void)enterWithSession:(id)a3;
- (void)handlePluginStatusDidChangeToRunning:(id)a3;
@end

@implementation NESMFilterSessionStateStarting

- (void)handlePluginStatusDidChangeToRunning:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)NESMFilterSessionStateStarting;
  [(NESMFilterSessionState *)&v24 handlePluginStatusDidChangeToRunning:v4];
  if (self)
  {
    id Property = objc_getProperty(self, v5, 16, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v7, 400, 1);
    }
  }
  else
  {
    id Property = 0;
  }
  id v8 = Property;

  if (v8 == v4)
  {
    if (self)
    {
      id v14 = objc_getProperty(self, v9, 16, 1);
      if (v14) {
        id v14 = objc_getProperty(v14, v15, 408, 1);
      }
    }
    else
    {
      id v14 = 0;
    }
    id v16 = v14;

    if (!v16) {
      goto LABEL_19;
    }
    if (self)
    {
      id v17 = objc_getProperty(self, v13, 16, 1);
      if (v17) {
        id v17 = objc_getProperty(v17, v18, 408, 1);
      }
      v19 = v17;
      id v21 = objc_getProperty(self, v20, 16, 1);
    }
    else
    {
      v19 = 0;
      id v21 = 0;
    }
    v22 = [v21 configuration];
    sub_10001689C(v19, v22);
  }
  else
  {
    if (self)
    {
      id v10 = objc_getProperty(self, v9, 16, 1);
      if (v10) {
        id v10 = objc_getProperty(v10, v11, 408, 1);
      }
    }
    else
    {
      id v10 = 0;
    }
    id v12 = v10;

    if (v12 == v4)
    {
LABEL_19:
      if (self) {
        v23 = (id *)objc_getProperty(self, v13, 16, 1);
      }
      else {
        v23 = 0;
      }
      sub_100075D24(v23, (const char *)3);
    }
  }
}

- (void)enterWithSession:(id)a3
{
  v20.receiver = self;
  v20.super_class = (Class)NESMFilterSessionStateStarting;
  [(NESMFilterSessionState *)&v20 enterWithSession:a3];
  if (self)
  {
    id Property = objc_getProperty(self, v4, 16, 1);
    if (Property) {
      id Property = objc_getProperty(Property, v6, 400, 1);
    }
  }
  else
  {
    id Property = 0;
  }
  id v7 = Property;

  if (v7)
  {
    if (self)
    {
      id v9 = objc_getProperty(self, v8, 16, 1);
      if (v9)
      {
        ptrdiff_t v11 = 400;
LABEL_15:
        id v9 = objc_getProperty(v9, v10, v11, 1);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
    goto LABEL_20;
  }
  if (self)
  {
    id v12 = objc_getProperty(self, v8, 16, 1);
    if (v12) {
      id v12 = objc_getProperty(v12, v13, 408, 1);
    }
  }
  else
  {
    id v12 = 0;
  }
  id v14 = v12;

  if (v14)
  {
    if (self)
    {
      id v9 = objc_getProperty(self, v15, 16, 1);
      if (v9)
      {
        ptrdiff_t v11 = 408;
        goto LABEL_15;
      }
LABEL_16:
      id v16 = v9;
      id v18 = objc_getProperty(self, v17, 16, 1);
LABEL_17:
      v19 = [v18 configuration];
      sub_10001689C(v16, v19);

      return;
    }
LABEL_20:
    id v16 = 0;
    id v18 = 0;
    goto LABEL_17;
  }
}

- (NESMFilterSessionStateStarting)init
{
  v3.receiver = self;
  v3.super_class = (Class)NESMFilterSessionStateStarting;
  return [(NESMFilterSessionState *)&v3 initWithType:2 andTimeout:120];
}

@end