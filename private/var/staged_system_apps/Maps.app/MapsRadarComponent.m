@interface MapsRadarComponent
+ (MapsRadarComponent)mapsAppCoreUIComponent;
+ (MapsRadarComponent)mapsAppNavUIWalkingComponent;
+ (MapsRadarComponent)mapsClientComponent;
+ (MapsRadarComponent)mapsComponent;
+ (MapsRadarComponent)mapsGeoServicesComponent;
+ (MapsRadarComponent)mapsMapDisplayComponent;
+ (MapsRadarComponent)mapsNavFrameworkComponent;
+ (MapsRadarComponent)mapsShareETACarPlayComponent;
+ (MapsRadarComponent)mapsShareETAiOSComponent;
+ (MapsRadarComponent)mapsVisualLocalizationComponent;
- (MapsRadarComponent)initWithName:(id)a3 version:(id)a4 ID:(id)a5;
- (NSNumber)ID;
- (NSString)debugDescription;
- (NSString)description;
- (NSString)name;
- (NSString)version;
- (void)_maps_buildDescriptionWithBlock:(id)a3;
@end

@implementation MapsRadarComponent

- (MapsRadarComponent)initWithName:(id)a3 version:(id)a4 ID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    v19 = sub_1005762E4();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "-[MapsRadarComponent initWithName:version:ID:]";
      __int16 v31 = 2080;
      v32 = "MapsRadarComponent.m";
      __int16 v33 = 1024;
      int v34 = 23;
      __int16 v35 = 2080;
      v36 = "name != nil";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v20 = sub_1005762E4();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v30 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v9)
  {
    v22 = sub_1005762E4();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "-[MapsRadarComponent initWithName:version:ID:]";
      __int16 v31 = 2080;
      v32 = "MapsRadarComponent.m";
      __int16 v33 = 1024;
      int v34 = 24;
      __int16 v35 = 2080;
      v36 = "version != nil";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v23 = sub_1005762E4();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v30 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v10)
  {
    v25 = sub_1005762E4();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v30 = "-[MapsRadarComponent initWithName:version:ID:]";
      __int16 v31 = 2080;
      v32 = "MapsRadarComponent.m";
      __int16 v33 = 1024;
      int v34 = 25;
      __int16 v35 = 2080;
      v36 = "ID != nil";
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v26 = sub_1005762E4();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v30 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v28.receiver = self;
  v28.super_class = (Class)MapsRadarComponent;
  v11 = [(MapsRadarComponent *)&v28 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    name = v11->_name;
    v11->_name = v12;

    v14 = (NSString *)[v9 copy];
    version = v11->_version;
    v11->_version = v14;

    v16 = (NSNumber *)[v10 copy];
    ID = v11->_ID;
    v11->_ID = v16;
  }
  return v11;
}

- (NSString)description
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1000918D8;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(MapsRadarComponent *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(MapsRadarComponent *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  id v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@", "];
  v12 = +[NSString stringWithFormat:@"%@ (%@)", v10, v11];

  return (NSString *)v12;
}

- (NSString)debugDescription
{
  v2 = self;
  v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_100661F94;
  v17 = &unk_1012E9588;
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v3;
  v4 = objc_retainBlock(&v14);
  [(MapsRadarComponent *)v2 _maps_buildDescriptionWithBlock:v4];
  v5 = v2;
  if (v5)
  {
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    if (objc_opt_respondsToSelector())
    {
      id v8 = [(MapsRadarComponent *)v5 performSelector:"accessibilityIdentifier"];
      id v9 = v8;
      if (v8 && ![v8 isEqualToString:v7])
      {
        id v10 = +[NSString stringWithFormat:@"%@<%p, %@>", v7, v5, v9, v14, v15, v16, v17];

        goto LABEL_7;
      }
    }
    id v10 = +[NSString stringWithFormat:@"%@<%p>", v7, v5];
LABEL_7:

    goto LABEL_9;
  }
  id v10 = @"<nil>";
LABEL_9:

  v11 = [v3 componentsJoinedByString:@"\n"];
  v12 = +[NSString stringWithFormat:@"%@ {\n%@\n}", v10, v11];

  return (NSString *)v12;
}

- (void)_maps_buildDescriptionWithBlock:(id)a3
{
  v4 = (void (**)(id, const __CFString *, NSString *))((char *)a3 + 16);
  v5 = (void (*)(void))*((void *)a3 + 2);
  id v6 = a3;
  v5();
  (*v4)(v6, @"version", self->_version);
  (*v4)(v6, @"id", (NSString *)&self->_ID->super.super.isa);
}

+ (MapsRadarComponent)mapsClientComponent
{
  v2 = [[MapsRadarComponent alloc] initWithName:@"Maps Client (New Bugs)" version:@"iOS" ID:&off_1013A7EA0];

  return v2;
}

+ (MapsRadarComponent)mapsComponent
{
  v2 = [[MapsRadarComponent alloc] initWithName:@"Maps" version:@"New Bugs" ID:&off_1013A7EB8];

  return v2;
}

+ (MapsRadarComponent)mapsGeoServicesComponent
{
  v2 = [[MapsRadarComponent alloc] initWithName:@"GeoServices" version:@"All" ID:&off_1013A7ED0];

  return v2;
}

+ (MapsRadarComponent)mapsMapDisplayComponent
{
  v2 = [[MapsRadarComponent alloc] initWithName:@"MapDisplay" version:@"All" ID:&off_1013A7EE8];

  return v2;
}

+ (MapsRadarComponent)mapsNavFrameworkComponent
{
  v2 = [[MapsRadarComponent alloc] initWithName:@"Maps FW Nav" version:@"iOS" ID:&off_1013A7F00];

  return v2;
}

+ (MapsRadarComponent)mapsAppNavUIWalkingComponent
{
  v2 = [[MapsRadarComponent alloc] initWithName:@"Maps App Nav UI Walking" version:@"iOS" ID:&off_1013A7F18];

  return v2;
}

+ (MapsRadarComponent)mapsVisualLocalizationComponent
{
  v2 = [[MapsRadarComponent alloc] initWithName:@"Maps Visual Localization" version:@"3DV" ID:&off_1013A7F30];

  return v2;
}

+ (MapsRadarComponent)mapsAppCoreUIComponent
{
  v2 = [[MapsRadarComponent alloc] initWithName:@"Maps App Core UI" version:@"All" ID:&off_1013A7F48];

  return v2;
}

+ (MapsRadarComponent)mapsShareETAiOSComponent
{
  v2 = [[MapsRadarComponent alloc] initWithName:@"Maps App Share ETA" version:@"iOS" ID:&off_1013A7F60];

  return v2;
}

+ (MapsRadarComponent)mapsShareETACarPlayComponent
{
  v2 = [[MapsRadarComponent alloc] initWithName:@"Maps App Share ETA" version:@"CarPlay" ID:&off_1013A7F78];

  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)version
{
  return self->_version;
}

- (NSNumber)ID
{
  return self->_ID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ID, 0);
  objc_storeStrong((id *)&self->_version, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end