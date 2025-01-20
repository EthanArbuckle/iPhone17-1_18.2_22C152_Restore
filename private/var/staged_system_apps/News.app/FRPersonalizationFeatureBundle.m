@interface FRPersonalizationFeatureBundle
+ (id)personalizationFeatureBundleForFeaturesGenerator:(id)a3;
+ (id)personalizationFeatureBundleForFeaturesGenerator:(id)a3 groupOrder:(id)a4 feedOrder:(id)a5 userInfo:(id)a6;
- (NSArray)features;
- (NSNumber)feedOrder;
- (NSNumber)groupOrder;
- (NSNumber)sessionDuration;
- (id)featuresGenerator;
- (void)appendPersonalizationFeaturesGenerator:(id)a3;
- (void)setFeaturesGenerator:(id)a3;
- (void)setFeedOrder:(id)a3;
- (void)setGroupOrder:(id)a3;
- (void)setSessionDuration:(id)a3;
@end

@implementation FRPersonalizationFeatureBundle

+ (id)personalizationFeatureBundleForFeaturesGenerator:(id)a3
{
  return _[a1 personalizationFeatureBundleForFeaturesGenerator:a3 groupOrder:0 feedOrder:0 userInfo:0];
}

+ (id)personalizationFeatureBundleForFeaturesGenerator:(id)a3 groupOrder:(id)a4 feedOrder:(id)a5 userInfo:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init((Class)a1);
  [v12 setFeaturesGenerator:v11];

  v13 = [v9 dateLastOpened];
  if (v13)
  {
    v14 = [v9 dateLastOpened];
    [v14 fc_timeIntervalUntilNow];
    v15 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v12 setSessionDuration:v15];
  }
  else
  {
    [v12 setSessionDuration:0];
  }

  [v12 setGroupOrder:v10];
  [v12 setFeedOrder:v10];

  return v12;
}

- (NSArray)features
{
  v3 = [(FRPersonalizationFeatureBundle *)self featuresGenerator];
  if (v3)
  {
    v4 = [(FRPersonalizationFeatureBundle *)self featuresGenerator];
    v5 = v4[2]();
  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return (NSArray *)v5;
}

- (void)appendPersonalizationFeaturesGenerator:(id)a3
{
  id v4 = a3;
  [(FRPersonalizationFeatureBundle *)self featuresGenerator];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001E740;
  v7[3] = &unk_1000C5910;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [(FRPersonalizationFeatureBundle *)self setFeaturesGenerator:v7];
}

- (NSNumber)groupOrder
{
  return self->_groupOrder;
}

- (void)setGroupOrder:(id)a3
{
}

- (NSNumber)feedOrder
{
  return self->_feedOrder;
}

- (void)setFeedOrder:(id)a3
{
}

- (NSNumber)sessionDuration
{
  return self->_sessionDuration;
}

- (void)setSessionDuration:(id)a3
{
}

- (id)featuresGenerator
{
  return self->_featuresGenerator;
}

- (void)setFeaturesGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_featuresGenerator, 0);
  objc_storeStrong((id *)&self->_sessionDuration, 0);
  objc_storeStrong((id *)&self->_feedOrder, 0);

  objc_storeStrong((id *)&self->_groupOrder, 0);
}

@end