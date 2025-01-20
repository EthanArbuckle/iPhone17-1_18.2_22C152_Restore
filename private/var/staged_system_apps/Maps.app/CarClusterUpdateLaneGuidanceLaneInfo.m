@interface CarClusterUpdateLaneGuidanceLaneInfo
+ (id)_enumProperties;
+ (id)_integersKeyed;
+ (id)laneGuidanceLaneInfoUpdateWithComposedRouteLaneInfos:(id)a3;
- (CarClusterUpdateLaneGuidanceLaneInfo)initWithComposedRouteLaneInfo:(id)a3 atIndex:(unint64_t)a4 highlightFirstAngle:(BOOL)a5;
- (NSArray)angle;
- (NSNumber)angleHighlight;
- (NSNumber)index;
- (double)_angleFromLaneDirection:(int)a3;
- (unsigned)status;
- (void)setAngle:(id)a3;
- (void)setAngleHighlight:(id)a3;
- (void)setIndex:(id)a3;
- (void)setStatus:(unsigned __int16)a3;
@end

@implementation CarClusterUpdateLaneGuidanceLaneInfo

+ (id)laneGuidanceLaneInfoUpdateWithComposedRouteLaneInfos:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) isPreferredLaneForManeuver])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  +[NSMutableArray array];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100D771A8;
  v9[3] = &unk_101323320;
  char v11 = (char)v4;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v7;
  [v3 enumerateObjectsUsingBlock:v9];

  return v7;
}

- (CarClusterUpdateLaneGuidanceLaneInfo)initWithComposedRouteLaneInfo:(id)a3 atIndex:(unint64_t)a4 highlightFirstAngle:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v37.receiver = self;
  v37.super_class = (Class)CarClusterUpdateLaneGuidanceLaneInfo;
  v9 = [(CarClusterUpdateLaneGuidanceLaneInfo *)&v37 init];
  if (!v9) {
    goto LABEL_20;
  }
  id v10 = NSCollectionLayoutEdgeSpacing_ptr;
  uint64_t v11 = +[NSNumber numberWithUnsignedInteger:a4];
  index = v9->_index;
  v9->_index = (NSNumber *)v11;

  v9->_status = 0;
  if ([v8 isPreferredLaneForManeuver])
  {
    __int16 v13 = 2;
LABEL_6:
    v9->_status = v13;
    goto LABEL_7;
  }
  if ([v8 isLaneForManeuver])
  {
    __int16 v13 = 1;
    goto LABEL_6;
  }
LABEL_7:
  v32 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [v8 directions];
  id v14 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v34;
    do
    {
      v17 = 0;
      do
      {
        if (*(void *)v34 != v16) {
          objc_enumerationMutation(obj);
        }
        v18 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v17);
        -[CarClusterUpdateLaneGuidanceLaneInfo _angleFromLaneDirection:](v9, "_angleFromLaneDirection:", [v18 direction]);
        double v20 = v19;
        if (!v5) {
          goto LABEL_14;
        }
        [v8 directions];
        BOOL v21 = v5;
        v22 = v10;
        v24 = id v23 = v8;
        v25 = [v24 firstObject];

        id v8 = v23;
        id v10 = v22;
        BOOL v5 = v21;
        if (v18 == v25)
        {
          uint64_t v27 = [v10[55] numberWithDouble:v20];
          angleHighlight = v9->_angleHighlight;
          v9->_angleHighlight = (NSNumber *)v27;
        }
        else
        {
LABEL_14:
          angleHighlight = [v10[55] numberWithDouble:v20];
          [(NSArray *)v32 addObject:angleHighlight];
        }

        v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v28 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
      id v15 = v28;
    }
    while (v28);
  }

  angle = v9->_angle;
  v9->_angle = v32;

LABEL_20:
  return v9;
}

- (double)_angleFromLaneDirection:(int)a3
{
  double result = 0.0;
  if (a3 > 31)
  {
    if (a3 > 127)
    {
      if (a3 == 256)
      {
        return 180.0;
      }
      else if (a3 == 128)
      {
        return -45.0;
      }
    }
    else if (a3 == 32)
    {
      return -135.0;
    }
    else if (a3 == 64)
    {
      return -90.0;
    }
  }
  else if (a3 > 7)
  {
    if (a3 == 8)
    {
      return 135.0;
    }
    else if (a3 == 16)
    {
      return -180.0;
    }
  }
  else if (a3 == 2)
  {
    return 45.0;
  }
  else if (a3 == 4)
  {
    return 90.0;
  }
  return result;
}

+ (id)_enumProperties
{
  if (qword_1016111A8 != -1) {
    dispatch_once(&qword_1016111A8, &stru_101323340);
  }
  v2 = (void *)qword_1016111B0;

  return v2;
}

+ (id)_integersKeyed
{
  if (qword_1016111B8 != -1) {
    dispatch_once(&qword_1016111B8, &stru_101323360);
  }
  v2 = (void *)qword_1016111C0;

  return v2;
}

- (NSNumber)index
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIndex:(id)a3
{
}

- (unsigned)status
{
  return self->_status;
}

- (void)setStatus:(unsigned __int16)a3
{
  self->_status = a3;
}

- (NSArray)angle
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAngle:(id)a3
{
}

- (NSNumber)angleHighlight
{
  return (NSNumber *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAngleHighlight:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_angleHighlight, 0);
  objc_storeStrong((id *)&self->_angle, 0);

  objc_storeStrong((id *)&self->_index, 0);
}

@end