@interface FMTextFieldUtil
+ (BOOL)updateTextField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
+ (BOOL)updateTextView:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
@end

@implementation FMTextFieldUtil

+ (BOOL)updateTextView:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  int64_t location = a4.location;
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 text];
  v11 = [v8 text];
  v12 = +[FMPhoneNumberUtil unformatWithPhoneNumber:v11];

  if (!qword_1006C26B0)
  {
    v13 = +[NSMutableCharacterSet decimalDigitCharacterSet];
    [v13 addCharactersInString:@"+"];
    v14 = (void *)qword_1006C26B0;
    qword_1006C26B0 = (uint64_t)v13;
  }
  v15 = [v9 stringByTrimmingCharactersInSet:];
  id v16 = [v15 length];

  if (v16 || [v9 isEqualToString:@"+"] && objc_msgSend(v12, "length")) {
    goto LABEL_4;
  }
  if ([v9 length])
  {
    id v21 = [v10 length];
    v19 = [v10 stringByReplacingCharactersInRange:location length:length withString:v9];
    uint64_t v22 = +[FMPhoneNumberUtil unformatWithPhoneNumber:v19];

    v23 = +[FMPhoneNumberUtil formatWithPhoneNumber:v22];
    [v8 setText:v23];

    v24 = [v8 beginningOfDocument];
    if (v21 == (id)location)
    {
      v25 = [v8 text];
      v18 = [v8 positionFromPosition:v24 offset:[v25 length]];
    }
    else
    {
      v18 = [v8 positionFromPosition:v24 offset:location + 1];
    }
    goto LABEL_17;
  }
  if (length != 1 || [v9 length])
  {
LABEL_4:
    v17 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_5;
  }
  if ((unsigned char *)location == (char *)[v10 length] - 1)
  {
    if ([v12 length])
    {
      [v12 substringToIndex:([v12 length] - 1)];
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v26 = v12;
    }
    v19 = v26;
    v28 = +[FMPhoneNumberUtil formatWithPhoneNumber:v26];
    [v8 setText:v28];
    v17 = 0;
    v18 = 0;
    goto LABEL_21;
  }
  uint64_t v29 = location;
  if (location >= 1)
  {
    uint64_t v29 = location;
    while (1)
    {
      v30 = [v10 substringWithRange:v29];
      id v31 = [v30 rangeOfCharacterFromSet:qword_1006C26B0];

      if (v31 != (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v29-- <= 1)
      {
        uint64_t v29 = 0;
        break;
      }
    }
  }
  v19 = [v10 stringByReplacingCharactersInRange:v29 withString:&stru_100645290];
  uint64_t v22 = +[FMPhoneNumberUtil unformatWithPhoneNumber:v19];

  v33 = +[FMPhoneNumberUtil formatWithPhoneNumber:v22];
  [v8 setText:v33];

  v34 = [v8 beginningOfDocument];
  v18 = [v8 positionFromPosition:v34 offset:location];

  if (v18) {
    goto LABEL_18;
  }
  v24 = +[NSAssertionHandler currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"FMTextFieldUtil.m", 80, @"Invalid parameter not satisfying: %@", @"start != nil" object file lineNumber description];
LABEL_17:

LABEL_18:
  v12 = (void *)v22;
  uint64_t v27 = [v8 positionFromPosition:v18 offset:0];
  v17 = (void *)v27;
  if (v18 && v27)
  {
    v28 = [v8 textRangeFromPosition:v18 toPosition:v27];
    [v8 setSelectedTextRange:v28];
LABEL_21:
  }
LABEL_5:

  return 0;
}

+ (BOOL)updateTextField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  int64_t location = a4.location;
  id v8 = a3;
  id v9 = a5;
  v10 = [v8 text];
  v11 = [v8 text];
  v12 = +[FMPhoneNumberUtil unformatWithPhoneNumber:v11];

  if (!qword_1006C26B8)
  {
    v13 = +[NSMutableCharacterSet decimalDigitCharacterSet];
    [v13 addCharactersInString:@"+"];
    v14 = (void *)qword_1006C26B8;
    qword_1006C26B8 = (uint64_t)v13;
  }
  v15 = [v9 stringByTrimmingCharactersInSet:];
  id v16 = [v15 length];

  if (v16 || [v9 isEqualToString:@"+"] && objc_msgSend(v12, "length")) {
    goto LABEL_4;
  }
  if ([v9 length])
  {
    id v21 = [v10 length];
    v19 = [v10 stringByReplacingCharactersInRange:location length:length withString:v9];
    uint64_t v22 = +[FMPhoneNumberUtil unformatWithPhoneNumber:v19];

    v23 = +[FMPhoneNumberUtil formatWithPhoneNumber:v22];
    [v8 setText:v23];

    v24 = [v8 beginningOfDocument];
    if (v21 == (id)location)
    {
      v25 = [v8 text];
      v18 = [v8 positionFromPosition:v24 offset:[v25 length]];
    }
    else
    {
      v18 = [v8 positionFromPosition:v24 offset:location + 1];
    }
    goto LABEL_17;
  }
  if (length != 1 || [v9 length])
  {
LABEL_4:
    v17 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_5;
  }
  if ((unsigned char *)location == (char *)[v10 length] - 1)
  {
    if ([v12 length])
    {
      [v12 substringToIndex:[v12 length] - 1];
      id v26 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v26 = v12;
    }
    v19 = v26;
    v28 = +[FMPhoneNumberUtil formatWithPhoneNumber:v26];
    [v8 setText:v28];
    v17 = 0;
    v18 = 0;
    goto LABEL_21;
  }
  uint64_t v29 = location;
  if (location >= 1)
  {
    uint64_t v29 = location;
    while (1)
    {
      v30 = [v10 substringWithRange:v29];
      id v31 = [v30 rangeOfCharacterFromSet:qword_1006C26B8];

      if (v31 != (id)0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (v29-- <= 1)
      {
        uint64_t v29 = 0;
        break;
      }
    }
  }
  v19 = [v10 stringByReplacingCharactersInRange:v29 withString:&stru_100645290];
  uint64_t v22 = +[FMPhoneNumberUtil unformatWithPhoneNumber:v19];

  v33 = +[FMPhoneNumberUtil formatWithPhoneNumber:v22];
  [v8 setText:v33];

  v34 = [v8 beginningOfDocument];
  v18 = [v8 positionFromPosition:v34 offset:location];

  if (v18) {
    goto LABEL_18;
  }
  v24 = +[NSAssertionHandler currentHandler];
  [v24 handleFailureInMethod:a2, a1, @"FMTextFieldUtil.m", 155, @"Invalid parameter not satisfying: %@", @"start != nil" object file lineNumber description];
LABEL_17:

LABEL_18:
  v12 = (void *)v22;
  uint64_t v27 = [v8 positionFromPosition:v18 offset:0];
  v17 = (void *)v27;
  if (v18 && v27)
  {
    v28 = [v8 textRangeFromPosition:v18 toPosition:v27];
    [v8 setSelectedTextRange:v28];
LABEL_21:
  }
LABEL_5:

  return 0;
}

@end