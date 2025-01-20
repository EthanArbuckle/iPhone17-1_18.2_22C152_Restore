@interface NSNumber(PKDecimalNumberAdditions)
- (BOOL)pk_isIntegralNumber;
- (BOOL)pk_isNegativeNumber;
- (BOOL)pk_isNotANumber;
- (BOOL)pk_isPositiveNumber;
- (BOOL)pk_isZeroNumber;
@end

@implementation NSNumber(PKDecimalNumberAdditions)

- (BOOL)pk_isIntegralNumber
{
  v4[0] = 0;
  v4[1] = 0;
  int v5 = 0;
  [a1 decimalValue];
  BOOL result = 0;
  if ((v4[0] & 0x1F00) != 0x1000)
  {
    v2[0] = 0;
    v2[1] = 0;
    int v3 = 0;
    MEMORY[0x192FDB4E0](v2, v4, 0, 0);
    return MEMORY[0x192FDB4D0](v2, v4) == 0;
  }
  return result;
}

- (BOOL)pk_isNegativeNumber
{
  if (objc_msgSend(a1, "pk_isNotANumber")) {
    return 0;
  }
  int v3 = [MEMORY[0x1E4F28C28] zero];
  BOOL v2 = [a1 compare:v3] == -1;

  return v2;
}

- (BOOL)pk_isPositiveNumber
{
  if (objc_msgSend(a1, "pk_isNotANumber")) {
    return 0;
  }
  int v3 = [MEMORY[0x1E4F28C28] zero];
  BOOL v2 = [a1 compare:v3] == 1;

  return v2;
}

- (BOOL)pk_isZeroNumber
{
  if (objc_msgSend(a1, "pk_isNotANumber")) {
    return 0;
  }
  int v3 = [MEMORY[0x1E4F28C28] zero];
  BOOL v2 = [a1 compare:v3] == 0;

  return v2;
}

- (BOOL)pk_isNotANumber
{
  BOOL v2 = [MEMORY[0x1E4F28C28] notANumber];
  BOOL v3 = [a1 compare:v2] == 0;

  return v3;
}

@end