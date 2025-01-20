@interface MPMediaPropertyPredicate(VideosUI)
+ (id)vui_mediaPropertyPredicateWithProperty:()VideosUI predicateOperatorType:value:;
+ (uint64_t)vui_mediaPropertyPredicateComparisonWithPredicateOperatorType:()VideosUI;
@end

@implementation MPMediaPropertyPredicate(VideosUI)

+ (id)vui_mediaPropertyPredicateWithProperty:()VideosUI predicateOperatorType:value:
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = objc_msgSend(a1, "vui_mediaPropertyPredicateComparisonWithPredicateOperatorType:", a4);
  v11 = [MEMORY[0x1E4F31968] predicateWithValue:v8 forProperty:v9 comparisonType:v10];

  return v11;
}

+ (uint64_t)vui_mediaPropertyPredicateComparisonWithPredicateOperatorType:()VideosUI
{
  uint64_t result = 0;
  switch(a3)
  {
    case 0:
      uint64_t result = 103;
      break;
    case 1:
      uint64_t result = 104;
      break;
    case 2:
      uint64_t result = 101;
      break;
    case 3:
      uint64_t result = 102;
      break;
    case 4:
    case 5:
      return result;
    case 6:
    case 7:
      goto LABEL_4;
    case 8:
      uint64_t result = 105;
      break;
    case 9:
      uint64_t result = 106;
      break;
    case 10:
      uint64_t result = 108;
      break;
    default:
      if (a3 == 99)
      {
        uint64_t result = 1;
      }
      else
      {
LABEL_4:
        objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Unsupported operator type (%lu)", a3);
        uint64_t result = 0;
      }
      break;
  }
  return result;
}

@end