@interface DirectionsElevationGraphConfiguration
- (BOOL)allowsUserInteraction;
- (BOOL)isEqual:(id)a3;
- (BOOL)showsElevationAxisLabels;
- (BOOL)supportsSignal:(id)a3;
- (DirectionsElevationGraphConfiguration)initWithUseType:(int64_t)a3 userInterfaceIdiom:(int64_t)a4;
- (NSString)chartSpec;
- (double)barWidth;
- (double)gapWidth;
- (id)_JSONForType:(id)a3;
- (id)_testDirectoryURL;
- (id)_urlForType:(id)a3;
- (id)_urlForType:(id)a3 device:(id)a4;
- (int64_t)useType;
- (unint64_t)targetNumberOfBarsForRouteLength:(double)a3 availableWidth:(double)a4;
- (void)setAllowUserInteraction:(BOOL)a3;
- (void)setShowElevationAxisLabels:(BOOL)a3;
@end

@implementation DirectionsElevationGraphConfiguration

- (DirectionsElevationGraphConfiguration)initWithUseType:(int64_t)a3 userInterfaceIdiom:(int64_t)a4
{
  v18.receiver = self;
  v18.super_class = (Class)DirectionsElevationGraphConfiguration;
  v6 = [(DirectionsElevationGraphConfiguration *)&v18 init];
  v7 = v6;
  if (v6)
  {
    v6->_useType = a3;
    v6->_userInterfaceIdiom = a4;
    *(_OWORD *)&v6->_barWidth = xmmword_100F73AD0;
    switch(a3)
    {
      case 2:
        specType = v6->_specType;
        v6->_specType = (NSString *)@"navigation";

        v7->_allowUserInteraction = 1;
        uint64_t v10 = +[NSSet setWithObjects:@"width", @"height", @"elevationDomainUnionWith", @"routeLength", @"progress", @"textSizes", @"yAxis", 0];
        supportedSignals = v7->_supportedSignals;
        v7->_supportedSignals = (NSSet *)v10;

        *(_OWORD *)&v7->_barWidth = xmmword_100F73AE0;
        break;
      case 1:
        v12 = v6->_specType;
        v6->_specType = (NSString *)@"planning";

        +[NSSet setWithObjects:@"width", @"height", @"elevationDomainUnionWith", @"routeLength", @"selectedBarColor", 0, v16, v17];
        goto LABEL_8;
      case 0:
        v8 = v6->_specType;
        v6->_specType = (NSString *)@"details";

        v7->_showElevationAxisLabels = a4 != 4;
        v7->_allowUserInteraction = 1;
        +[NSSet setWithObjects:@"width", @"height", @"elevationDomainUnionWith", @"routeLength", @"fadeDistance", @"fadeEnd", @"yAxis", 0];
        uint64_t v13 = LABEL_8:;
        v14 = v7->_supportedSignals;
        v7->_supportedSignals = (NSSet *)v13;

        break;
    }
  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  BOOL v5 = v4
    && [v4 isMemberOfClass:objc_opt_class()]
    && v4[5] == self->_useType
    && v4[2]
    && self->_userInterfaceIdiom != 0;

  return v5;
}

- (BOOL)supportsSignal:(id)a3
{
  return [(NSSet *)self->_supportedSignals containsObject:a3];
}

- (unint64_t)targetNumberOfBarsForRouteLength:(double)a3 availableWidth:(double)a4
{
  int64_t useType = self->_useType;
  [(DirectionsElevationGraphConfiguration *)self barWidth];
  double v9 = v8;
  [(DirectionsElevationGraphConfiguration *)self gapWidth];
  double v11 = v9 + v10;
  if (useType == 1)
  {
    return sub_10058DBA8(a3, v11, a4);
  }
  else
  {
    unint64_t v13 = vcvtmd_u64_f64(a4 / v11);
    unint64_t result = GEOConfigGetUInteger();
    if (result <= v13) {
      return v13;
    }
  }
  return result;
}

- (NSString)chartSpec
{
  return (NSString *)[(DirectionsElevationGraphConfiguration *)self _JSONForType:self->_specType];
}

- (id)_testDirectoryURL
{
  v2 = +[NSFileManager _maps_globalCachesURL];
  v3 = [v2 path];
  v4 = +[NSURL fileURLWithPath:v3];

  return v4;
}

- (id)_JSONForType:(id)a3
{
  v3 = [(DirectionsElevationGraphConfiguration *)self _urlForType:a3];
  id v4 = [objc_alloc((Class)NSData) initWithContentsOfURL:v3];
  BOOL v5 = &stru_101324E70;
  if ([v4 length])
  {
    v6 = (__CFString *)[objc_alloc((Class)NSString) initWithData:v4 encoding:4];
    v7 = v6;
    if (v6) {
      double v8 = v6;
    }
    else {
      double v8 = &stru_101324E70;
    }
    BOOL v5 = v8;
  }

  return v5;
}

- (id)_urlForType:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[UIDevice currentDevice];
  id v6 = [v5 userInterfaceIdiom];

  CFStringRef v7 = @"phone";
  if (v6 == (id)5) {
    CFStringRef v7 = @"mac";
  }
  if (v6 == (id)4) {
    CFStringRef v8 = @"watch";
  }
  else {
    CFStringRef v8 = v7;
  }
  double v9 = [(DirectionsElevationGraphConfiguration *)self _urlForType:v4 device:v8];

  return v9;
}

- (id)_urlForType:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v32 = v6;
  id v51 = v6;
  v39 = +[NSArray arrayWithObjects:&v51 count:1];
  CFStringRef v8 = [(DirectionsElevationGraphConfiguration *)self _testDirectoryURL];
  v50 = v8;
  double v9 = +[NSArray arrayWithObjects:&v50 count:1];

  double v10 = +[NSBundle mainBundle];
  uint64_t v11 = [v10 resourceURL];

  v30 = (void *)v11;
  if (v11)
  {
    uint64_t v12 = [v9 arrayByAddingObject:v11];

    double v9 = (void *)v12;
  }
  v31 = v7;
  +[NSOrderedSet orderedSetWithObjects:v7, @"phone", &stru_101324E70, 0];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v36 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v45;
    v35 = v9;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v45 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v13;
        v14 = *(void **)(*((void *)&v44 + 1) + 8 * v13);
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v38 = v9;
        id v15 = [v38 countByEnumeratingWithState:&v40 objects:v48 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v41;
LABEL_10:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v41 != v17) {
              objc_enumerationMutation(v38);
            }
            v19 = *(void **)(*((void *)&v40 + 1) + 8 * v18);
            if ([v14 length])
            {
              id v20 = [v39 arrayByAddingObject:v14];
            }
            else
            {
              id v20 = v39;
            }
            v21 = v20;
            v22 = [v20 componentsJoinedByString:@"_"];
            v23 = +[NSString stringWithFormat:@"cycling_%@", v22];

            v24 = [v23 stringByAppendingPathExtension:@"json"];
            v25 = [v19 URLByAppendingPathComponent:v24];

            v26 = +[NSFileManager defaultManager];
            v27 = [v25 path];
            unsigned __int8 v28 = [v26 fileExistsAtPath:v27];

            if (v28) {
              break;
            }

            if (v16 == (id)++v18)
            {
              id v16 = [v38 countByEnumeratingWithState:&v40 objects:v48 count:16];
              if (v16) {
                goto LABEL_10;
              }
              goto LABEL_19;
            }
          }

          double v9 = v35;
          if (v25) {
            goto LABEL_24;
          }
        }
        else
        {
LABEL_19:

          double v9 = v35;
        }
        uint64_t v13 = v37 + 1;
      }
      while ((id)(v37 + 1) != v36);
      id v36 = [obj countByEnumeratingWithState:&v44 objects:v49 count:16];
    }
    while (v36);
  }
  v25 = 0;
LABEL_24:

  return v25;
}

- (int64_t)useType
{
  return self->_useType;
}

- (BOOL)allowsUserInteraction
{
  return self->_allowUserInteraction;
}

- (void)setAllowUserInteraction:(BOOL)a3
{
  self->_allowUserInteraction = a3;
}

- (BOOL)showsElevationAxisLabels
{
  return self->_showElevationAxisLabels;
}

- (void)setShowElevationAxisLabels:(BOOL)a3
{
  self->_showElevationAxisLabels = a3;
}

- (double)barWidth
{
  return self->_barWidth;
}

- (double)gapWidth
{
  return self->_gapWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedSignals, 0);

  objc_storeStrong((id *)&self->_specType, 0);
}

@end