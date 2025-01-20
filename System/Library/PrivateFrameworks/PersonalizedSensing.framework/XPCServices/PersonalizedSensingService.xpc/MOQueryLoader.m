@interface MOQueryLoader
- (MOQueryLoader)init;
- (OS_dispatch_queue)queue;
- (id)createPromptQueryWithBundleSummary:(id)a3;
- (id)createSummaryQueryForBundleContent:(id)a3;
@end

@implementation MOQueryLoader

- (MOQueryLoader)init
{
  v7.receiver = self;
  v7.super_class = (Class)MOQueryLoader;
  v2 = [(MOQueryLoader *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("MOQueryLoader", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (id)createSummaryQueryForBundleContent:(id)a3
{
  v3 = +[NSString stringWithFormat:@"<<<%@", a3];
  dispatch_queue_t v4 = +[NSString stringWithFormat:@"%@%@", @"I'm a computational scientist working on ways of measuring, tracking, and understanding human behavior using digital device data. The following records incorporates data from various sources including specific things like the activity type, or the Places, or the Time, followed by the <<< tag. Please summarize this bundle in a way that would be useful to a user whose data this is for future reference, particularly the place, and inferred activity type", v3];
  v5 = [MOQuery alloc];
  v6 = +[NSUUID UUID];
  objc_super v7 = [(MOQuery *)v5 initWithQueryIdentifier:v6 queryString:v4 queryCategory:1 queryEventType:1 queryVersion:1 queryTemperature:0.8];

  return v7;
}

- (id)createPromptQueryWithBundleSummary:(id)a3
{
  +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@====%@", @"Role: You are a world-class copywriter trying to create elegant and descriptive titles for entries in a personalized photo journal.Context: Each entry should be very brief, inspired by on the the following context summary after the ==== tag which has been provided bya research team and compiled from activity logs around the time of the photographs, but written as a slightly abstract theme that could apply to similar situations perhaps at other times.Result: Please propose 4 very brief titles with minimal details to make the title distinctive; avoid specifics of place name.Avoid any jargon not understandable to a 14 year old student, avoid obvious phrases like photo,photo shoot or photograph.",
  v3 = a3);
  dispatch_queue_t v4 = [MOQuery alloc];
  v5 = +[NSUUID UUID];
  v6 = [(MOQuery *)v4 initWithQueryIdentifier:v5 queryString:v3 queryCategory:2 queryEventType:1 queryVersion:1 queryTemperature:0.8];

  return v6;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
}

@end