@interface ICRadioLikeResponse
- (BOOL)shouldFlushTrackCache;
@end

@implementation ICRadioLikeResponse

- (BOOL)shouldFlushTrackCache
{
  v2 = [(ICRadioResponse *)self contentDictionary];
  v3 = [v2 objectForKey:@"flush-track-cache"];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

@end