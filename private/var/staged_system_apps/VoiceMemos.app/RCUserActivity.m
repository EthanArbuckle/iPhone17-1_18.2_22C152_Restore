@interface RCUserActivity
+ (BOOL)requiresDismissalAtEndOfCaptureForActivityType:(int64_t)a3 subActivityType:(int64_t)a4;
- (BOOL)isTrim;
- (BOOL)requiresDismissalAtEndOfCapture;
- (BOOL)transitionToActivityType:(int64_t)a3 subType:(int64_t)a4 withDisplayModel:(id)a5;
- (RCRecordingDisplayModel)displayModel;
- (int64_t)activityType;
- (int64_t)subActivityType;
- (void)setActivityType:(int64_t)a3;
- (void)setDisplayModel:(id)a3;
- (void)setSubActivityType:(int64_t)a3;
@end

@implementation RCUserActivity

- (int64_t)subActivityType
{
  return self->_subActivityType;
}

- (int64_t)activityType
{
  return self->_activityType;
}

- (BOOL)transitionToActivityType:(int64_t)a3 subType:(int64_t)a4 withDisplayModel:(id)a5
{
  id v8 = a5;
  [(RCUserActivity *)self setActivityType:a3];
  [(RCUserActivity *)self setSubActivityType:a4];
  [(RCUserActivity *)self setDisplayModel:v8];

  return 1;
}

- (BOOL)isTrim
{
  return (id)[(RCUserActivity *)self subActivityType] == (id)2;
}

- (BOOL)requiresDismissalAtEndOfCapture
{
  int64_t v3 = [(RCUserActivity *)self activityType];
  int64_t v4 = [(RCUserActivity *)self subActivityType];

  return +[RCUserActivity requiresDismissalAtEndOfCaptureForActivityType:v3 subActivityType:v4];
}

+ (BOOL)requiresDismissalAtEndOfCaptureForActivityType:(int64_t)a3 subActivityType:(int64_t)a4
{
  return (a4 == 3 || a4 == 5) && a3 == 1;
}

- (void)setActivityType:(int64_t)a3
{
  self->_activityType = a3;
}

- (void)setSubActivityType:(int64_t)a3
{
  self->_subActivityType = a3;
}

- (RCRecordingDisplayModel)displayModel
{
  return self->_displayModel;
}

- (void)setDisplayModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end