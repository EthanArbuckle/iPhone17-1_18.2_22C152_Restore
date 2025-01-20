@interface SXColumnConditionValidator
- (BOOL)validateCondition:(id)a3 context:(id)a4;
@end

@implementation SXColumnConditionValidator

- (BOOL)validateCondition:(id)a3 context:(id)a4
{
  id v5 = a3;
  unint64_t v6 = [a4 numberOfColumns];
  unint64_t v7 = [v5 minColumns];
  unint64_t v8 = [v5 maxColumns];

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && v7 > v6) {
    return 0;
  }
  return v8 + 1 < 2 || v8 >= v6;
}

@end