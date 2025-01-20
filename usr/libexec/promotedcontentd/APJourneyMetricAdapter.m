@interface APJourneyMetricAdapter
+ (id)translateWithPromotedContent:(int64_t)a3 placement:(unint64_t)a4;
@end

@implementation APJourneyMetricAdapter

+ (id)translateWithPromotedContent:(int64_t)a3 placement:(unint64_t)a4
{
  v6 = +[NSMutableDictionary dictionary];
  int64_t v7 = a3;
  uint64_t v8 = 7030;
  switch(v7)
  {
    case 1:
      uint64_t v8 = 7031;
      break;
    case 2:
      uint64_t v8 = 7032;
      break;
    case 3:
      uint64_t v8 = 7033;
      break;
    case 4:
      uint64_t v8 = 7034;
      break;
    case 5:
      if (a4 - 7005 >= 4) {
        uint64_t v8 = 0;
      }
      else {
        uint64_t v8 = qword_1001D7368[a4 - 7005];
      }
      break;
    default:
      break;
  }
  v9 = +[NSNumber numberWithInteger:v8];
  [v6 setObject:v9 forKeyedSubscript:@"type"];

  id v10 = [v6 copy];

  return v10;
}

@end