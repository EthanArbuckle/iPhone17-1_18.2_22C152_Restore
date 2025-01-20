@interface NSDecimalNumber(PKDecimalNumberAdditions)
+ (id)pk_negativeOne;
- (BOOL)pk_isLessThanOrEqualToInteger:()PKDecimalNumberAdditions;
- (id)pk_absoluteValue;
- (id)pk_negativeValue;
@end

@implementation NSDecimalNumber(PKDecimalNumberAdditions)

+ (id)pk_negativeOne
{
  if (qword_1EB4025D0 != -1) {
    dispatch_once(&qword_1EB4025D0, &__block_literal_global_205);
  }
  v0 = (void *)qword_1EB4025C8;
  return v0;
}

- (id)pk_absoluteValue
{
  v2 = [MEMORY[0x1E4F28C28] zero];
  uint64_t v3 = [a1 compare:v2];

  if (v3 == -1)
  {
    objc_msgSend(a1, "pk_negativeValue");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = a1;
  }
  return v4;
}

- (id)pk_negativeValue
{
  v2 = [MEMORY[0x1E4F28C28] zero];
  if ([a1 isEqualToNumber:v2])
  {

LABEL_4:
    id v5 = a1;
    goto LABEL_6;
  }
  uint64_t v3 = [MEMORY[0x1E4F28C28] notANumber];
  int v4 = [a1 isEqualToNumber:v3];

  if (v4) {
    goto LABEL_4;
  }
  v6 = objc_msgSend(MEMORY[0x1E4F28C28], "pk_negativeOne");
  id v5 = [a1 decimalNumberByMultiplyingBy:v6];

LABEL_6:
  return v5;
}

- (BOOL)pk_isLessThanOrEqualToInteger:()PKDecimalNumberAdditions
{
  v2 = objc_msgSend(NSNumber, "numberWithInteger:");
  uint64_t v3 = [a1 compare:v2];

  return (unint64_t)(v3 + 1) < 2;
}

@end