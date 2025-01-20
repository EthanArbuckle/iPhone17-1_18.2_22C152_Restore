@interface RTMotionActivityManagerNotificationDominantMotionActivityChange
- (RTMotionActivity)dominantMotionActivity;
- (RTMotionActivityManagerNotificationDominantMotionActivityChange)initWithDominantMotionActivity:(id)a3;
@end

@implementation RTMotionActivityManagerNotificationDominantMotionActivityChange

- (RTMotionActivityManagerNotificationDominantMotionActivityChange)initWithDominantMotionActivity:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTMotionActivityManagerNotificationDominantMotionActivityChange;
  v5 = [(RTNotification *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    dominantMotionActivity = v5->_dominantMotionActivity;
    v5->_dominantMotionActivity = (RTMotionActivity *)v6;
  }
  return v5;
}

- (RTMotionActivity)dominantMotionActivity
{
  return self->_dominantMotionActivity;
}

- (void).cxx_destruct
{
}

@end