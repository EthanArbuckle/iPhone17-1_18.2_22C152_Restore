@interface CHSharingImageWorkoutConfiguration
- (CHSharingImageWorkoutConfiguration)initWithIconImage:(id)a3 routeImage:(id)a4 metricTitleAndValueInfo:(id)a5;
- (NSArray)metricTitleAndValueInfo;
- (UIImage)iconImage;
- (UIImage)routeImage;
- (void)setIconImage:(id)a3;
- (void)setMetricTitleAndValueInfo:(id)a3;
- (void)setRouteImage:(id)a3;
@end

@implementation CHSharingImageWorkoutConfiguration

- (CHSharingImageWorkoutConfiguration)initWithIconImage:(id)a3 routeImage:(id)a4 metricTitleAndValueInfo:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CHSharingImageWorkoutConfiguration;
  v12 = [(CHSharingImageWorkoutConfiguration *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_iconImage, a3);
    objc_storeStrong((id *)&v13->_routeImage, a4);
    objc_storeStrong((id *)&v13->_metricTitleAndValueInfo, a5);
  }

  return v13;
}

- (UIImage)iconImage
{
  return self->_iconImage;
}

- (void)setIconImage:(id)a3
{
}

- (UIImage)routeImage
{
  return self->_routeImage;
}

- (void)setRouteImage:(id)a3
{
}

- (NSArray)metricTitleAndValueInfo
{
  return self->_metricTitleAndValueInfo;
}

- (void)setMetricTitleAndValueInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricTitleAndValueInfo, 0);
  objc_storeStrong((id *)&self->_routeImage, 0);

  objc_storeStrong((id *)&self->_iconImage, 0);
}

@end