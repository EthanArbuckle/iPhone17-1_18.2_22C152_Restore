@interface PedestrianARFeatureSetMapEntry
- (NSArray)featureEntries;
- (PedestrianARFeatureSetMapEntry)initWithFeatureSet:(id)a3 featureEntries:(id)a4;
- (VKARWalkingFeatureSet)featureSet;
- (id)description;
@end

@implementation PedestrianARFeatureSetMapEntry

- (PedestrianARFeatureSetMapEntry)initWithFeatureSet:(id)a3 featureEntries:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v12 = sub_1005762E4();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "-[PedestrianARFeatureSetMapEntry initWithFeatureSet:featureEntries:]";
      __int16 v21 = 2080;
      v22 = "PedestrianARVKMapViewMapDelegate.m";
      __int16 v23 = 1024;
      int v24 = 58;
      __int16 v25 = 2080;
      v26 = "featureSet != nil";
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
      v20 = "-[PedestrianARFeatureSetMapEntry initWithFeatureSet:featureEntries:]";
      __int16 v21 = 2080;
      v22 = "PedestrianARVKMapViewMapDelegate.m";
      __int16 v23 = 1024;
      int v24 = 59;
      __int16 v25 = 2080;
      v26 = "featureEntries != nil";
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
  v18.super_class = (Class)PedestrianARFeatureSetMapEntry;
  v9 = [(PedestrianARFeatureSetMapEntry *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_featureSet, a3);
    objc_storeStrong((id *)&v10->_featureEntries, a4);
  }

  return v10;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = +[NSString stringWithFormat:@"<%@: %p, featureSet: %@, featureEntries: %@>", v4, self, self->_featureSet, self->_featureEntries];

  return v5;
}

- (VKARWalkingFeatureSet)featureSet
{
  return self->_featureSet;
}

- (NSArray)featureEntries
{
  return self->_featureEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureEntries, 0);

  objc_storeStrong((id *)&self->_featureSet, 0);
}

@end