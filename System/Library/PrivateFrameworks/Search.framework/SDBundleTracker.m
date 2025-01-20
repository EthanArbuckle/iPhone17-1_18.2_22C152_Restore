@interface SDBundleTracker
+ (id)sharedBundleTracker;
+ (id)trackerKeyForBundleIdentifier:(id)a3 category:(id)a4;
- (BOOL)shouldContinueIndexingBundleWithKey:(id)a3 transitionedToState:(int)a4;
- (BOOL)shouldRunIndexerForBundleWithKey:(id)a3;
- (SDBundleTracker)init;
- (id)_infoForKey:(id)a3;
- (void)_saveInfoForBundleWithKey:(id)a3;
@end

@implementation SDBundleTracker

+ (id)sharedBundleTracker
{
  pthread_once(&stru_1000A8608, (void (*)(void))sub_100003948);
  v2 = (void *)qword_1000A8C80;

  return v2;
}

- (SDBundleTracker)init
{
  v6.receiver = self;
  v6.super_class = (Class)SDBundleTracker;
  v2 = [(SDBundleTracker *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    trackingInfos = v2->_trackingInfos;
    v2->_trackingInfos = v3;
  }
  return v2;
}

+ (id)trackerKeyForBundleIdentifier:(id)a3 category:(id)a4
{
  return [a3 stringByAppendingFormat:@"_%@", a4];
}

- (id)_infoForKey:(id)a3
{
  id v4 = a3;
  v5 = [(NSMutableDictionary *)self->_trackingInfos objectForKey:v4];
  if (!v5)
  {
    v5 = [[SDBundleTrackingInfo alloc] initWithCompositeIdentifier:v4];
    [(NSMutableDictionary *)self->_trackingInfos setObject:v5 forKey:v4];
  }

  return v5;
}

- (void)_saveInfoForBundleWithKey:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_trackingInfos objectForKey:a3];
  [v3 save];
}

- (BOOL)shouldRunIndexerForBundleWithKey:(id)a3
{
  return 1;
}

- (BOOL)shouldContinueIndexingBundleWithKey:(id)a3 transitionedToState:(int)a4
{
  return 1;
}

- (void).cxx_destruct
{
}

@end