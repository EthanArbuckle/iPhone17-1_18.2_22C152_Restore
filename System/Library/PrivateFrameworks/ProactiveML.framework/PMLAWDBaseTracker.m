@interface PMLAWDBaseTracker
+ (id)trackerForModelName:(id)a3 modelVersion:(id)a4 modelLocale:(id)a5;
+ (id)trackerForPlanId:(id)a3;
- (AWDProactiveModelFittingModelInfo)modelInfo;
- (PMLAWDBaseTracker)initWithModel:(id)a3;
- (void)postMetricId:(unsigned int)a3 message:(id)a4;
@end

@implementation PMLAWDBaseTracker

- (void).cxx_destruct
{
}

- (AWDProactiveModelFittingModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (void)postMetricId:(unsigned int)a3 message:(id)a4
{
}

- (PMLAWDBaseTracker)initWithModel:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PMLAWDBaseTracker;
  v6 = [(PMLAWDBaseTracker *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_modelInfo, a3);
  }

  return v7;
}

+ (id)trackerForPlanId:(id)a3
{
  v4 = +[PMLPlanDescriptor descriptorFromPlanId:a3];
  id v5 = [v4 name];
  v6 = [v4 version];
  v7 = [v4 locale];
  v8 = [a1 trackerForModelName:v5 modelVersion:v6 modelLocale:v7];

  return v8;
}

+ (id)trackerForModelName:(id)a3 modelVersion:(id)a4 modelLocale:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = objc_opt_new();
  [v11 setName:v10];

  [v11 setVersion:v9];
  [v11 setLocale:v8];

  v12 = (void *)[objc_alloc((Class)a1) initWithModel:v11];
  return v12;
}

@end