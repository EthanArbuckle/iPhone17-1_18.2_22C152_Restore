@interface BDWorkoutPreviewMetadata
+ (void)getPreviewMetadata:(id)a3 withCompletion:(id)a4;
- (BDWorkoutPreviewMetadata)initWithActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 configurationType:(int64_t)a5 configurationName:(id)a6 goalTypeIdentifier:(unint64_t)a7;
- (BOOL)isIndoor;
- (NSString)configurationName;
- (int64_t)configurationType;
- (unint64_t)activityType;
- (unint64_t)goalTypeIdentifier;
@end

@implementation BDWorkoutPreviewMetadata

- (BDWorkoutPreviewMetadata)initWithActivityType:(unint64_t)a3 isIndoor:(BOOL)a4 configurationType:(int64_t)a5 configurationName:(id)a6 goalTypeIdentifier:(unint64_t)a7
{
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BDWorkoutPreviewMetadata;
  v14 = [(BDWorkoutPreviewMetadata *)&v17 init];
  v15 = v14;
  if (v14)
  {
    v14->_isIndoor = a4;
    v14->_activityType = a3;
    v14->_configurationType = a5;
    objc_storeStrong((id *)&v14->_configurationName, a6);
    v15->_goalTypeIdentifier = a7;
  }

  return v15;
}

+ (void)getPreviewMetadata:(id)a3 withCompletion:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, id))a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2050000000;
  v7 = (void *)qword_1000EE050;
  uint64_t v20 = qword_1000EE050;
  if (!qword_1000EE050)
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000842C;
    v16[3] = &unk_1000E0428;
    v16[4] = &v17;
    sub_10000842C((uint64_t)v16);
    v7 = (void *)v18[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v17, 8);
  v9 = [v8 dataFromSourceFromData:v5];
  if (v9)
  {
    v10 = [BDWorkoutPreviewMetadata alloc];
    id v11 = [v9 activityType];
    id v12 = [v9 isIndoor];
    id v13 = [v9 configurationType];
    v14 = [v9 configurationName];
    v15 = -[BDWorkoutPreviewMetadata initWithActivityType:isIndoor:configurationType:configurationName:goalTypeIdentifier:](v10, "initWithActivityType:isIndoor:configurationType:configurationName:goalTypeIdentifier:", v11, v12, v13, v14, [v9 goalTypeIdentifier]);

    v6[2](v6, v15);
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (unint64_t)activityType
{
  return self->_activityType;
}

- (BOOL)isIndoor
{
  return self->_isIndoor;
}

- (int64_t)configurationType
{
  return self->_configurationType;
}

- (NSString)configurationName
{
  return self->_configurationName;
}

- (unint64_t)goalTypeIdentifier
{
  return self->_goalTypeIdentifier;
}

- (void).cxx_destruct
{
}

@end