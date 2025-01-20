@interface WISSystemStatusSimulacrum
+ (BOOL)WISSSDataConnectionTypeIs5G:(unint64_t)a3;
+ (BOOL)WISSSDataConnectionTypeIsLTE:(unint64_t)a3;
+ (id)WISSSDataConnectionTypeToString:(unint64_t)a3;
+ (unint64_t)deriveConnectionTypeForDataStatus:(id)a3;
+ (unint64_t)deriveWISSSDataConnectionTypeForIndicator:(int)a3 andRadioTechnology:(int)a4;
@end

@implementation WISSystemStatusSimulacrum

+ (id)WISSSDataConnectionTypeToString:(unint64_t)a3
{
  if (a3 > 0xF) {
    return @"Unknown";
  }
  else {
    return off_1001B9138[a3];
  }
}

+ (BOOL)WISSSDataConnectionTypeIsLTE:(unint64_t)a3
{
  return a3 - 7 < 4;
}

+ (BOOL)WISSSDataConnectionTypeIs5G:(unint64_t)a3
{
  return a3 - 11 < 4;
}

+ (unint64_t)deriveWISSSDataConnectionTypeForIndicator:(int)a3 andRadioTechnology:(int)a4
{
  unint64_t result = 3;
  switch(a3)
  {
    case 1:
      if ((a4 - 3) < 3) {
        unint64_t result = 1;
      }
      else {
        unint64_t result = 2;
      }
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 4;
      break;
    case 4:
    case 5:
      unint64_t result = 5;
      break;
    case 7:
      unint64_t result = 7;
      break;
    case 8:
      unint64_t result = 11;
      break;
    case 13:
      unint64_t result = 10;
      break;
    case 14:
      unint64_t result = 8;
      break;
    case 15:
      unint64_t result = 9;
      break;
    case 16:
      unint64_t result = 12;
      break;
    case 17:
      unint64_t result = 13;
      break;
    case 18:
      unint64_t result = 14;
      break;
    default:
      unint64_t result = 0;
      break;
  }
  return result;
}

+ (unint64_t)deriveConnectionTypeForDataStatus:(id)a3
{
  id v3 = a3;
  unint64_t v4 = +[WISSystemStatusSimulacrum deriveWISSSDataConnectionTypeForIndicator:andRadioTechnology:](WISSystemStatusSimulacrum, "deriveWISSSDataConnectionTypeForIndicator:andRadioTechnology:", [v3 indicator], objc_msgSend(v3, "radioTechnology"));
  unint64_t v5 = +[WISSystemStatusSimulacrum deriveWISSSDataConnectionTypeForIndicator:andRadioTechnology:](WISSystemStatusSimulacrum, "deriveWISSSDataConnectionTypeForIndicator:andRadioTechnology:", [v3 indicatorOverride], objc_msgSend(v3, "radioTechnology"));
  if (!+[WISSystemStatusSimulacrum WISSSDataConnectionTypeIs5G:v5])
  {
    if (v4 == 7)
    {
      if (!+[WISSystemStatusSimulacrum WISSSDataConnectionTypeIsLTE:v5])unint64_t v5 = 7; {
    }
      }
    else
    {
      unint64_t v5 = v4;
      if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 4)
      {
        if ([v3 indicatorOverride] == 7) {
          unint64_t v5 = 6;
        }
        else {
          unint64_t v5 = v4;
        }
      }
    }
  }

  return v5;
}

@end