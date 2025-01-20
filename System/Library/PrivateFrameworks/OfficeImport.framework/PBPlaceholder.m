@interface PBPlaceholder
+ (BOOL)isBodyPlaceholder:(int)a3;
+ (BOOL)isTitlePlaceholder:(int)a3;
+ (int)placeholderTypeFromTextType:(int)a3;
+ (int)readPlaceholderOrientation:(int)a3;
+ (int)readPlaceholderSize:(int)a3;
+ (int)readPlaceholderType:(int)a3;
+ (void)writePlaceholder:(id)a3 toPlaceholderAtom:(PptOEPlaceholderAtom *)a4 isMaster:(BOOL)a5 isNotes:(BOOL)a6;
@end

@implementation PBPlaceholder

+ (int)placeholderTypeFromTextType:(int)a3
{
  if (a3 > 8) {
    return -1;
  }
  else {
    return dword_238EEFE94[a3];
  }
}

+ (int)readPlaceholderType:(int)a3
{
  if (a3 < 0x1B) {
    return dword_238EEFE28[a3];
  }
  TCVerifyInputMeetsCondition(0);
  return 0;
}

+ (int)readPlaceholderSize:(int)a3
{
  if (a3 >= 3) {
    return -1;
  }
  else {
    return a3;
  }
}

+ (int)readPlaceholderOrientation:(int)a3
{
  return a3 == 25 || (a3 - 17) < 2;
}

+ (BOOL)isBodyPlaceholder:(int)a3
{
  return (a3 < 9) & (0x1A2u >> a3);
}

+ (BOOL)isTitlePlaceholder:(int)a3
{
  return !a3 || a3 == 6;
}

+ (void)writePlaceholder:(id)a3 toPlaceholderAtom:(PptOEPlaceholderAtom *)a4 isMaster:(BOOL)a5 isNotes:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v14 = a3;
  a4->var6 = [v14 index];
  *((unsigned char *)a4 + 53) = [v14 size];
  int v9 = [v14 orientation];
  switch([v14 type])
  {
    case 0u:
      if (v9 == 1) {
        char v10 = 17;
      }
      else {
        char v10 = 13;
      }
      if (v7) {
        char v10 = 1;
      }
      break;
    case 1u:
      if (v9 == 1) {
        char v10 = 18;
      }
      else {
        char v10 = 14;
      }
      if (v7)
      {
        char v10 = 2;
        char v11 = 6;
      }
      else
      {
        char v11 = 12;
      }
      if (v6) {
        char v10 = v11;
      }
      break;
    case 2u:
      BOOL v12 = !v7;
      char v10 = 15;
      char v13 = 3;
      goto LABEL_31;
    case 3u:
      BOOL v12 = !v7;
      char v10 = 16;
      char v13 = 11;
      goto LABEL_31;
    case 4u:
      char v10 = 7;
      break;
    case 5u:
      char v10 = 8;
      break;
    case 6u:
      char v10 = 9;
      break;
    case 7u:
      char v10 = 10;
      break;
    case 8u:
      if (v9 == 1) {
        char v10 = 25;
      }
      else {
        char v10 = 19;
      }
      break;
    case 9u:
      char v10 = 20;
      break;
    case 0xAu:
      char v10 = 21;
      break;
    case 0xBu:
      char v10 = 22;
      break;
    case 0xCu:
      char v10 = 23;
      break;
    case 0xDu:
      char v10 = 24;
      break;
    case 0xEu:
      BOOL v12 = !v7;
      char v10 = 11;
      char v13 = 5;
LABEL_31:
      if (!v12) {
        char v10 = v13;
      }
      break;
    case 0xFu:
      char v10 = 26;
      break;
    default:
      char v10 = 0;
      break;
  }
  *((unsigned char *)a4 + 52) = v10;
}

@end