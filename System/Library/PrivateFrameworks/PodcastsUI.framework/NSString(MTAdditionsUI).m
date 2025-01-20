@interface NSString(MTAdditionsUI)
+ (id)prettyStringWithDuration:()MTAdditionsUI;
+ (uint64_t)localizedStringWithNumber:()MTAdditionsUI;
@end

@implementation NSString(MTAdditionsUI)

+ (uint64_t)localizedStringWithNumber:()MTAdditionsUI
{
  return IMAccessibilityLocalizedNumber();
}

+ (id)prettyStringWithDuration:()MTAdditionsUI
{
  uint64_t v1 = (uint64_t)a1;
  uint64_t v2 = (uint64_t)a1 / 3600;
  uint64_t v3 = (uint64_t)a1 / 60;
  uint64_t v4 = v3 % 60;
  if ((uint64_t)a1 >= 7200 && v4 == 1)
  {
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = [v5 localizedStringForKey:@"%@ hours 1 min" value:&stru_1F3F553C0 table:0];

LABEL_4:
    v7 = NSString;
    v8 = [NSNumber numberWithInteger:v2];
    v9 = IMAccessibilityLocalizedNumber();
    v10 = objc_msgSend(v7, "stringWithFormat:", v6, v9);

LABEL_7:
    goto LABEL_8;
  }
  if (v1 >= 7200)
  {
    v11 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = [v11 localizedStringForKey:@"%@ hours %@ min" value:&stru_1F3F553C0 table:0];

    v12 = NSString;
    v8 = [NSNumber numberWithInteger:v2];
    v13 = IMAccessibilityLocalizedNumber();
    v14 = [NSNumber numberWithInteger:v4];
    v15 = IMAccessibilityLocalizedNumber();
    v10 = objc_msgSend(v12, "stringWithFormat:", v6, v13, v15);

    goto LABEL_7;
  }
  if ((unint64_t)(v1 - 3600) <= 0xE0F && v4 == 1)
  {
    v17 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = v17;
    v18 = @"1 hour 1 min";
LABEL_14:
    v10 = [v17 localizedStringForKey:v18 value:&stru_1F3F553C0 table:0];
    goto LABEL_8;
  }
  if ((unint64_t)(v1 - 3600) <= 0xE0F)
  {
    v19 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = [v19 localizedStringForKey:@"%@ hour %@ min" value:&stru_1F3F553C0 table:0];

    v20 = NSString;
    v21 = [NSNumber numberWithInteger:1];
    v22 = IMAccessibilityLocalizedNumber();
    v23 = [NSNumber numberWithInteger:v4];
    v24 = IMAccessibilityLocalizedNumber();
    v10 = objc_msgSend(v20, "stringWithFormat:", v6, v22, v24);

LABEL_17:
    goto LABEL_8;
  }
  uint64_t v2 = v1 - 60 * v3;
  if (v4 < 1)
  {
    v17 = [MEMORY[0x1E4F28B50] mainBundle];
    v6 = v17;
    if (v2 == 1)
    {
      v18 = @"1 second";
      goto LABEL_14;
    }
    uint64_t v30 = [v17 localizedStringForKey:@"%@ seconds" value:&stru_1F3F553C0 table:0];

    v31 = NSString;
    v32 = [NSNumber numberWithInteger:v2];
    v33 = IMAccessibilityLocalizedNumber();
    v10 = objc_msgSend(v31, "stringWithFormat:", v30, v33);

    v6 = (void *)v30;
  }
  else
  {
    if (v2 <= 0 && v4 == 1)
    {
      v17 = [MEMORY[0x1E4F28B50] mainBundle];
      v6 = v17;
      v18 = @"1 min";
      goto LABEL_14;
    }
    if (v2 == 1 && v4 == 1)
    {
      v17 = [MEMORY[0x1E4F28B50] mainBundle];
      v6 = v17;
      v18 = @"1 min 1 sec";
      goto LABEL_14;
    }
    if (v2 < 1 || (unint64_t)v4 >= 0xA)
    {
      if (v2 > 29) {
        ++v4;
      }
      v28 = [MEMORY[0x1E4F28B50] mainBundle];
      v6 = [v28 localizedStringForKey:@"%@ minutes" value:&stru_1F3F553C0 table:0];

      v29 = NSString;
      v21 = [NSNumber numberWithInteger:v4];
      v22 = IMAccessibilityLocalizedNumber();
      v10 = objc_msgSend(v29, "stringWithFormat:", v6, v22);
      goto LABEL_17;
    }
    v34 = [MEMORY[0x1E4F28B50] mainBundle];
    v35 = v34;
    if (v4 == 1)
    {
      v6 = [v34 localizedStringForKey:@"1 min %@ sec" value:&stru_1F3F553C0 table:0];

      goto LABEL_4;
    }
    v6 = [v34 localizedStringForKey:@"%@ min %@ sec" value:&stru_1F3F553C0 table:0];

    v36 = NSString;
    v37 = [NSNumber numberWithInteger:v4];
    v38 = IMAccessibilityLocalizedNumber();
    v39 = [NSNumber numberWithInteger:v2];
    v40 = IMAccessibilityLocalizedNumber();
    v10 = objc_msgSend(v36, "stringWithFormat:", v6, v38, v40);
  }
LABEL_8:

  return v10;
}

@end