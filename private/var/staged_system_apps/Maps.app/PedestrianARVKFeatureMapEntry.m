@interface PedestrianARVKFeatureMapEntry
- (MNGuidanceARInfo)guidanceInfo;
- (PedestrianARVKFeatureMapEntry)initWithFeature:(id)a3 guidanceInfo:(id)a4;
- (VKARWalkingFeature)feature;
- (id)description;
@end

@implementation PedestrianARVKFeatureMapEntry

- (PedestrianARVKFeatureMapEntry)initWithFeature:(id)a3 guidanceInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[PedestrianARVKFeatureMapEntry initWithFeature:guidanceInfo:]";
      __int16 v21 = 2080;
      v22 = "PedestrianARVKMapViewMapDelegate.m";
      __int16 v23 = 1024;
      int v24 = 29;
      __int16 v25 = 2080;
      v26 = "feature != nil";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v13 = sub_1005762E4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v14 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v20 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  if (!v8)
  {
    v15 = sub_1005762E4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[PedestrianARVKFeatureMapEntry initWithFeature:guidanceInfo:]";
      __int16 v21 = 2080;
      v22 = "PedestrianARVKMapViewMapDelegate.m";
      __int16 v23 = 1024;
      int v24 = 30;
      __int16 v25 = 2080;
      v26 = "guidanceInfo != nil";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v16 = sub_1005762E4();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v20 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PedestrianARVKFeatureMapEntry;
  v9 = [(PedestrianARVKFeatureMapEntry *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_feature, a3);
    objc_storeStrong((id *)&v10->_guidanceInfo, a4);
  }

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  feature = self->_feature;
  v6 = [(MNGuidanceARInfo *)self->_guidanceInfo mapsShortDescription];
  id v7 = +[NSString stringWithFormat:@"<%@: %p, feature: %@, guidanceInfo: %@>", v4, self, feature, v6];

  return v7;
}

- (VKARWalkingFeature)feature
{
  return self->_feature;
}

- (MNGuidanceARInfo)guidanceInfo
{
  return self->_guidanceInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_guidanceInfo, 0);

  objc_storeStrong((id *)&self->_feature, 0);
}

@end