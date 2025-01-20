@interface NPTFileSizeConverter
+ (id)getFileSizeAsString:(int)a3;
+ (int)fileSizeFromInt:(int64_t)a3;
+ (unint64_t)getFileSizeInBytes:(int)a3;
@end

@implementation NPTFileSizeConverter

+ (unint64_t)getFileSizeInBytes:(int)a3
{
  return (a3 << 20);
}

+ (id)getFileSizeAsString:(int)a3
{
  if (a3 == 1000)
  {
    v4 = @"1g";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%um", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (int)fileSizeFromInt:(int64_t)a3
{
  if (a3 > 59)
  {
    if (a3 > 99)
    {
      if (a3 > 499)
      {
        if (a3 == 500) {
          return 500;
        }
        if (a3 == 1000) {
          return 1000;
        }
      }
      else
      {
        if (a3 == 100) {
          return 100;
        }
        if (a3 == 250) {
          return 250;
        }
      }
    }
    else if (a3 > 79)
    {
      if (a3 == 80) {
        return 80;
      }
      if (a3 == 90) {
        return 90;
      }
    }
    else
    {
      if (a3 == 60) {
        return 60;
      }
      if (a3 == 70) {
        return 70;
      }
    }
    return 1001;
  }
  if (a3 > 24)
  {
    if (a3 > 39)
    {
      if (a3 == 40) {
        return 40;
      }
      if (a3 == 50) {
        return 50;
      }
    }
    else
    {
      if (a3 == 25) {
        return 25;
      }
      if (a3 == 30) {
        return 30;
      }
    }
    return 1001;
  }
  int result = 1;
  switch(a3)
  {
    case 1:
      return result;
    case 2:
      int result = 2;
      break;
    case 3:
    case 4:
    case 6:
    case 7:
    case 8:
    case 9:
      return 1001;
    case 5:
      int result = 5;
      break;
    case 10:
      int result = 10;
      break;
    default:
      if (a3 != 20) {
        return 1001;
      }
      int result = 20;
      break;
  }
  return result;
}

@end