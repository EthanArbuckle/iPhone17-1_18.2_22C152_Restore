@interface BRKRoutineManager
+ (void)fetchLocationsOfInterestWithSingleRetryOfType:(int64_t)a3 routineManager:(id)a4 withHandler:(id)a5;
@end

@implementation BRKRoutineManager

+ (void)fetchLocationsOfInterestWithSingleRetryOfType:(int64_t)a3 routineManager:(id)a4 withHandler:(id)a5
{
  id v7 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000050DC;
  v11[3] = &unk_100008338;
  id v13 = a5;
  int64_t v14 = a3;
  id v12 = v7;
  id v8 = v13;
  id v9 = v7;
  v10 = objc_retainBlock(v11);
  [v9 fetchLocationsOfInterestOfType:a3 withHandler:v10];
}

@end