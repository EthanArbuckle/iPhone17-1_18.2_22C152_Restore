@interface FMUtil
+ (BOOL)randomlyFalseWithLikelihood:(double)a3;
+ (BOOL)randomlyTrueWithLikelihood:(double)a3;
+ (double)getPrediction:(unint64_t)a3 errorPercentWithActual:(unint64_t)a4;
+ (double)meanOfSample:(id)a3;
+ (double)pNormOf:(double)a3 mean:(double)a4 stdDev:(double)a5;
+ (double)probabilityOfNextPickInRange:(double)a3 aroundMean:(double)a4 ofSample:(id)a5;
+ (id)extractValueFromDict:(id)a3 atKey:(id)a4 ofExpectedClass:(Class)a5 error:(id *)a6;
+ (id)extractValueFromDict:(id)a3 atKey:(id)a4 ofExpectedClass:(Class)a5 orDefault:(id)a6;
+ (void)removeFirstElementsForCapacity:(unint64_t)a3 fromArray:(id)a4;
+ (void)setError:(id *)a3 code:(int64_t)a4 message:(id)a5;
+ (void)waitForDeviceUnlockAndRunBlock:(id)a3;
@end

@implementation FMUtil

+ (void)removeFirstElementsForCapacity:(unint64_t)a3 fromArray:(id)a4
{
  id v5 = a4;
  if ((unint64_t)[v5 count] > a3) {
    objc_msgSend(v5, "removeObjectsInRange:", 0, (char *)objc_msgSend(v5, "count") - a3);
  }
}

+ (id)extractValueFromDict:(id)a3 atKey:(id)a4 ofExpectedClass:(Class)a5 orDefault:(id)a6
{
  id v9 = a6;
  uint64_t v16 = 0;
  uint64_t v10 = +[FMUtil extractValueFromDict:a3 atKey:a4 ofExpectedClass:a5 error:&v16];
  v11 = (void *)v10;
  if (v10) {
    BOOL v12 = v16 == 0;
  }
  else {
    BOOL v12 = 0;
  }
  if (v12) {
    v13 = (void *)v10;
  }
  else {
    v13 = v9;
  }
  id v14 = v13;

  return v14;
}

+ (id)extractValueFromDict:(id)a3 atKey:(id)a4 ofExpectedClass:(Class)a5 error:(id *)a6
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = [v8 objectForKey:v9];
    if (v10)
    {
      if (objc_opt_isKindOfClass())
      {
        id v10 = v10;
        v11 = v10;
        goto LABEL_9;
      }
      BOOL v12 = +[NSString stringWithFormat:@"Value for key %@ is not of expected class", v9];
      +[FMUtil setError:a6 code:0 message:v12];
    }
    else
    {
      BOOL v12 = +[NSString stringWithFormat:@"Value for key %@ is null", v9];
      +[FMUtil setError:a6 code:0 message:v12];
    }

    v11 = 0;
  }
  else
  {
    id v10 = +[NSString stringWithFormat:@"Cannot extract key %@, dict is null", v9];
    v11 = 0;
    +[FMUtil setError:a6 code:0 message:v10];
  }
LABEL_9:

  return v11;
}

+ (BOOL)randomlyTrueWithLikelihood:(double)a3
{
  return (double)arc4random() / 4294967300.0 < a3;
}

+ (BOOL)randomlyFalseWithLikelihood:(double)a3
{
  return !+[FMUtil randomlyTrueWithLikelihood:a3];
}

+ (void)waitForDeviceUnlockAndRunBlock:(id)a3
{
  v3 = (uint64_t (**)(void))a3;
  v4 = dispatch_queue_create("com.apple.wirelessinsightsd.FederatedMobility.FMUtil.DeviceUnlock", 0);
  id v5 = dispatch_semaphore_create(0);
  int v8 = -1;
  int out_token = -1;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10002272C;
  handler[3] = &unk_1001B5DA0;
  handler[4] = v5;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, v4, handler);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100022780;
  v6[3] = &unk_1001B5DA0;
  v6[4] = v5;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &v8, v4, v6);
  while ((v3[2](v3) & 1) == 0)
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  if (out_token != -1) {
    notify_cancel(out_token);
  }
  if (v8 != -1) {
    notify_cancel(v8);
  }
  if (v4) {
    dispatch_release(v4);
  }
  if (v5) {
    dispatch_release(v5);
  }
}

+ (double)getPrediction:(unint64_t)a3 errorPercentWithActual:(unint64_t)a4
{
  return fabs((double)(uint64_t)(a3 - a4)) / (double)((a4 + a3) >> 1) * 100.0;
}

+ (double)meanOfSample:(id)a3
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    double v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "doubleValue", (void)v11);
        double v6 = v6 + v8;
      }
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
  else
  {
    double v6 = 0.0;
  }

  id v9 = [v3 count];
  return v6 / (double)(unint64_t)v9;
}

+ (double)probabilityOfNextPickInRange:(double)a3 aroundMean:(double)a4 ofSample:(id)a5
{
  id v7 = a5;
  double v8 = 0.0;
  if ((unint64_t)[v7 count] >= 2)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v20;
      do
      {
        long long v12 = 0;
        do
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * (void)v12), "doubleValue", (void)v19);
          double v8 = v8 + (a4 - v13) * (a4 - v13);
          long long v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    double v14 = sqrt(v8 * (1.0 / (double)((unint64_t)[v9 count] - 1)));
    +[FMUtil pNormOf:a3 + a4 mean:a4 stdDev:v14];
    double v16 = v15;
    +[FMUtil pNormOf:a4 - a3 mean:a4 stdDev:v14];
    double v8 = v16 - v17;
  }

  return v8;
}

+ (double)pNormOf:(double)a3 mean:(double)a4 stdDev:(double)a5
{
  return (erf((a3 - a4) / a5 / 1.41421356) + 1.0) * 0.5;
}

+ (void)setError:(id *)a3 code:(int64_t)a4 message:(id)a5
{
  id v7 = a5;
  NSErrorUserInfoKey v9 = NSLocalizedDescriptionKey;
  id v10 = v7;
  double v8 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  *a3 = +[NSError errorWithDomain:@"FMUtil" code:a4 userInfo:v8];
}

@end