@interface CDDCommunicatorHelper
+ (id)sharedInstance;
- (id)getNewThermalValueForOldValue:(id)a3;
- (id)getOldThermalValueForNewValue:(id)a3;
- (unint64_t)highestCommonVersionFor:(id)a3 and:(id)a4;
@end

@implementation CDDCommunicatorHelper

+ (id)sharedInstance
{
  v2 = (void *)qword_100040EC0;
  if (!qword_100040EC0)
  {
    if (qword_100040EC8 != -1) {
      dispatch_once(&qword_100040EC8, &stru_100038AC0);
    }
    v2 = (void *)qword_100040EC0;
  }

  return v2;
}

- (id)getNewThermalValueForOldValue:(id)a3
{
  return [(id)qword_100040EB8 objectForKeyedSubscript:a3];
}

- (id)getOldThermalValueForNewValue:(id)a3
{
  return [(id)qword_100040EB0 objectForKeyedSubscript:a3];
}

- (unint64_t)highestCommonVersionFor:(id)a3 and:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6) {
      goto LABEL_3;
    }
  }
  else
  {
    v16[0] = @"MaxVersion";
    v16[1] = @"MinVersion";
    v17[0] = &off_10003B138;
    v17[1] = &off_10003B138;
    id v5 = +[NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];
    if (v7) {
      goto LABEL_3;
    }
  }
  v14[0] = @"MaxVersion";
  v14[1] = @"MinVersion";
  v15[0] = &off_10003B138;
  v15[1] = &off_10003B138;
  v7 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
LABEL_3:
  v8 = [v5 objectForKeyedSubscript:@"MaxVersion"];
  unsigned int v9 = [v8 unsignedIntValue];

  v10 = [v7 objectForKeyedSubscript:@"MaxVersion"];
  unsigned int v11 = [v10 unsignedIntValue];

  if (v9 >= v11) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v9;
  }

  return v12;
}

@end