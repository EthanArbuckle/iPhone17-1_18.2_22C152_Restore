@interface PSPhoneNumberSpecifier
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (NSString)countryCode;
- (void)setCountryCode:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation PSPhoneNumberSpecifier

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isEqualToString:@"cellObject"])
  {
    v8 = [v6 editableTextField];
    [v8 setDelegate:self];
  }
  v9.receiver = self;
  v9.super_class = (Class)PSPhoneNumberSpecifier;
  [(PSSpecifier *)&v9 setProperty:v6 forKey:v7];
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  unint64_t length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  id v10 = a5;
  id v11 = [v9 text];
  if (location + length <= [v11 length])
  {
    v35 = v10;
    v12 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v11, "length"));
    uint64_t v13 = [v11 length];
    if (v13 - 1 >= 0)
    {
      uint64_t v14 = v13;
      do
      {
        v15 = objc_msgSend(v11, "substringWithRange:", --v14, 1);
        if ([@"()- /" rangeOfString:v15] == 0x7FFFFFFFFFFFFFFFLL)
        {
          [v12 insertString:v15 atIndex:0];
        }
        else if (v14 >= location)
        {
          unint64_t length = (__PAIR128__(length, v14) - (length + location)) >> 64;
        }
        else
        {
          --location;
        }
      }
      while (v14 > 0);
    }
    v16 = objc_msgSend(v12, "stringByReplacingCharactersInRange:withString:", location, length, v35);

    id v17 = v16;
    uint64_t v18 = [v35 length];
    v19 = [(PSPhoneNumberSpecifier *)self countryCode];
    v20 = (void *)PSPNCreateFormattedStringWithCountry((uint64_t)v17, [v19 lowercaseString]);

    unint64_t v21 = 0;
    if ([v17 length])
    {
      unint64_t v22 = v18 + location;
      if (v18 + location)
      {
        unint64_t v23 = 0;
        unint64_t v21 = 0;
        do
        {
          int v24 = [v17 characterAtIndex:v23];
          while (v21 < [v20 length] && objc_msgSend(v20, "characterAtIndex:", v21) != v24)
            ++v21;
          ++v21;
          ++v23;
        }
        while (v23 < [v17 length] && v23 < v22);
      }
    }
    if (!textField_shouldChangeCharactersInRange_replacementString__asciiMaker)
    {
      id v25 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
      v26 = (void *)textField_shouldChangeCharactersInRange_replacementString__asciiMaker;
      textField_shouldChangeCharactersInRange_replacementString__asciiMaker = (uint64_t)v25;
    }
    v27 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithCapacity:", objc_msgSend(v20, "length"));
    if ([v20 length])
    {
      unint64_t v28 = 0;
      do
      {
        v29 = objc_msgSend(v20, "substringWithRange:", v28, 1);
        v30 = [(id)textField_shouldChangeCharactersInRange_replacementString__asciiMaker numberFromString:v29];
        v31 = v30;
        if (v30)
        {
          v32 = [v30 stringValue];
          [v27 appendString:v32];
        }
        else
        {
          [v27 appendString:v29];
        }

        ++v28;
      }
      while (v28 < [v20 length]);
    }
    id v11 = v27;

    [v9 setText:v11];
    objc_msgSend(v9, "setSelectionRange:", v21, 0);
    v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 postNotificationName:*MEMORY[0x1E4F43E28] object:v9];

    id v10 = v35;
  }

  return 0;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 text];
  id v6 = [(PSPhoneNumberSpecifier *)self countryCode];
  id v7 = (id)PSPNCreateFormattedStringWithCountry(v5, [v6 lowercaseString]);

  [v4 setText:v7];
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (void)setCountryCode:(id)a3
{
}

- (void).cxx_destruct
{
}

@end