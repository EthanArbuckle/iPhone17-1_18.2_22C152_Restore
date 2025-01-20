@interface NSNumber(NAAdditions)
- (BOOL)na_isFloatValue;
- (id)na_absoluteValue;
- (id)na_largerNumber:()NAAdditions;
- (id)na_smallerNumber:()NAAdditions;
- (id)na_valueRoundedToNearestStepValue:()NAAdditions relativeToBaseValue:;
- (uint64_t)na_compareAbsoluteValue:()NAAdditions;
- (uint64_t)na_isSignedValue;
@end

@implementation NSNumber(NAAdditions)

- (uint64_t)na_isSignedValue
{
  unsigned int v1 = *(char *)[a1 objCType] - 67;
  return (v1 > 0x10) | (0xBDBEu >> v1) & 1;
}

- (id)na_smallerNumber:()NAAdditions
{
  id v4 = a3;
  if ([a1 compare:v4] == -1) {
    v5 = a1;
  }
  else {
    v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (id)na_valueRoundedToNearestStepValue:()NAAdditions relativeToBaseValue:
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && ![v6 isEqualToNumber:&unk_1F0E4E728])
  {
    objc_msgSend(a1, "na_largerNumber:", v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(a1, "na_isFloatValue") & 1) != 0 || objc_msgSend(v6, "na_isFloatValue"))
    {
      v10 = NSNumber;
      [a1 floatValue];
      float v12 = v11;
      [v7 floatValue];
      double v14 = (float)(v12 - v13);
      [v6 floatValue];
      double v16 = round(v14 / v15);
      [v6 floatValue];
      double v18 = v17;
      [v7 floatValue];
      double v20 = v19;
    }
    else if ((objc_msgSend(a1, "na_isSignedValue") & 1) != 0 {
           || (objc_msgSend(v6, "na_isSignedValue") & 1) != 0
    }
           || v9 == v7)
    {
      v10 = NSNumber;
      double v16 = round((double)([a1 longLongValue] - objc_msgSend(v7, "longLongValue"))/ (double)objc_msgSend(v6, "longLongValue"));
      double v18 = (double)[v6 longLongValue];
      double v20 = (double)[v7 longLongValue];
    }
    else
    {
      v10 = NSNumber;
      double v16 = round((double)(unint64_t)([a1 unsignedLongLongValue]- objc_msgSend(v7, "unsignedLongLongValue"))/ (double)(unint64_t)objc_msgSend(v6, "unsignedLongLongValue"));
      double v18 = (double)(unint64_t)[v6 unsignedLongLongValue];
      double v20 = (double)(unint64_t)[v7 unsignedLongLongValue];
    }
    id v8 = [v10 numberWithDouble:v20 + v16 * v18];
  }
  else
  {
    id v8 = a1;
  }
  v21 = v8;

  return v21;
}

- (id)na_largerNumber:()NAAdditions
{
  id v4 = a3;
  if ([a1 compare:v4] == -1) {
    v5 = v4;
  }
  else {
    v5 = a1;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)na_isFloatValue
{
  return (*(unsigned char *)[a1 objCType] & 0xFD) == 100;
}

- (id)na_absoluteValue
{
  id v1 = a1;
  switch(*(unsigned char *)[v1 objCType])
  {
    case 'c':
      id v6 = NSNumber;
      int v7 = [v1 charValue];
      goto LABEL_12;
    case 'd':
      id v8 = NSNumber;
      [v1 doubleValue];
      id v5 = [v8 numberWithDouble:fabs(v9)];
      break;
    case 'f':
      v10 = NSNumber;
      [v1 floatValue];
      *(float *)&double v12 = fabsf(v11);
      id v5 = [v10 numberWithFloat:v12];
      break;
    case 'i':
      id v6 = NSNumber;
      int v7 = [v1 intValue];
      goto LABEL_12;
    case 'l':
    case 'q':
      v2 = NSNumber;
      uint64_t v3 = [v1 longLongValue];
      if (v3 >= 0) {
        uint64_t v4 = v3;
      }
      else {
        uint64_t v4 = -v3;
      }
      id v5 = [v2 numberWithLongLong:v4];
      break;
    case 's':
      id v6 = NSNumber;
      int v7 = [v1 shortValue];
LABEL_12:
      if (v7 >= 0) {
        uint64_t v13 = v7;
      }
      else {
        uint64_t v13 = -v7;
      }
      id v5 = [v6 numberWithInt:v13];
      break;
    default:
      id v5 = v1;
      break;
  }
  return v5;
}

- (uint64_t)na_compareAbsoluteValue:()NAAdditions
{
  id v4 = a3;
  id v5 = objc_msgSend(a1, "na_absoluteValue");
  id v6 = objc_msgSend(v4, "na_absoluteValue");

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

@end