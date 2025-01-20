@interface TVPlaybackUtilities
+ (id)stateStringForIKState:(int64_t)a3;
+ (id)stateStringForTVPlaybackState:(int64_t)a3;
+ (int64_t)ikStateForTVPlaybackState:(int64_t)a3;
+ (int64_t)tvStateForIKState:(int64_t)a3;
@end

@implementation TVPlaybackUtilities

+ (id)stateStringForTVPlaybackState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return @"¯\\_(ツ)_/¯";
  }
  else {
    return off_264BA6E88[a3 - 1];
  }
}

+ (id)stateStringForIKState:(int64_t)a3
{
  v4 = objc_opt_class();
  uint64_t v5 = [(id)objc_opt_class() tvStateForIKState:a3];
  return (id)[v4 stateStringForTVPlaybackState:v5];
}

+ (int64_t)tvStateForIKState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 8) {
    return 0;
  }
  else {
    return a3;
  }
}

+ (int64_t)ikStateForTVPlaybackState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 8) {
    return 0;
  }
  else {
    return a3;
  }
}

@end