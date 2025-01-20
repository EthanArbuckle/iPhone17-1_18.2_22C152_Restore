@interface APMockAdServerSettings
+ (BOOL)isAdResponseMockedForPlacementType:(int64_t)a3;
+ (id)adResponseDataForPlacementType:(int64_t)a3;
+ (id)storageWithDefaultValues:(id)a3;
@end

@implementation APMockAdServerSettings

+ (id)storageWithDefaultValues:(id)a3
{
  v3 = NSStringFromSelector("latencyInMilliseconds");
  v8[0] = v3;
  v9[0] = &off_100249BD8;
  v4 = NSStringFromSelector("mockingEnabled");
  v8[1] = v4;
  v9[1] = &off_100249BF0;
  v5 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];

  id v6 = [objc_alloc((Class)APSettingsStorageUserDefaults) initWithDefaultValues:v5];

  return v6;
}

+ (BOOL)isAdResponseMockedForPlacementType:(int64_t)a3
{
  BOOL v3 = 0;
  switch(a3)
  {
    case 0:
      v4 = +[APMockAdServerSettings settings];
      v5 = [v4 adResponseBanner];
      goto LABEL_8;
    case 1:
      v4 = +[APMockAdServerSettings settings];
      v5 = [v4 adResponseInterstitial];
      goto LABEL_8;
    case 2:
      v4 = +[APMockAdServerSettings settings];
      v5 = [v4 adResponseAudio];
      goto LABEL_8;
    case 3:
      v4 = +[APMockAdServerSettings settings];
      v5 = [v4 adResponseVideo];
      goto LABEL_8;
    case 4:
      v4 = +[APMockAdServerSettings settings];
      v5 = [v4 adResponseNative];
      goto LABEL_8;
    case 7:
      v4 = +[APMockAdServerSettings settings];
      v5 = [v4 adResponseSponsorship];
LABEL_8:
      BOOL v3 = v5 != 0;

      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)adResponseDataForPlacementType:(int64_t)a3
{
  BOOL v3 = 0;
  switch(a3)
  {
    case 0:
      v4 = +[APMockAdServerSettings settings];
      uint64_t v5 = [v4 adResponseBanner];
      goto LABEL_8;
    case 1:
      v4 = +[APMockAdServerSettings settings];
      uint64_t v5 = [v4 adResponseInterstitial];
      goto LABEL_8;
    case 2:
      v4 = +[APMockAdServerSettings settings];
      uint64_t v5 = [v4 adResponseAudio];
      goto LABEL_8;
    case 3:
      v4 = +[APMockAdServerSettings settings];
      uint64_t v5 = [v4 adResponseVideo];
      goto LABEL_8;
    case 4:
      v4 = +[APMockAdServerSettings settings];
      uint64_t v5 = [v4 adResponseNative];
      goto LABEL_8;
    case 7:
      v4 = +[APMockAdServerSettings settings];
      uint64_t v5 = [v4 adResponseSponsorship];
LABEL_8:
      BOOL v3 = (void *)v5;

      break;
    default:
      break;
  }

  return v3;
}

@end