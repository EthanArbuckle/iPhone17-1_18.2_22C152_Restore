@interface VUIJSBookmarkInterface
- (id)cachedElapsedTimeForReferenceId:(id)a3;
@end

@implementation VUIJSBookmarkInterface

- (id)cachedElapsedTimeForReferenceId:(id)a3
{
  id v3 = a3;
  v4 = +[VUIStreamingBookmarkCache sharedInstance];
  id v7 = 0;
  [v4 resumeTimeInfoForReferenceID:v3 outAbsoluteResumeTime:&v7 outAbsoluteTimestamp:0 outMainContentRelativeResumeTime:0 outMainContentRelativeTimestamp:0];

  id v5 = v7;
  return v5;
}

@end