@interface WBSFormAutoFillClassificationToCorrectionsTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation WBSFormAutoFillClassificationToCorrectionsTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

- (id)transformedValue:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v3 isEqualToString:&stru_1EFBE3CF8])
    {
      v9 = @"AddressBookLabel";
      v4 = [MEMORY[0x1E4F1CA98] null];
      v10[0] = v4;
      v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      v7 = @"AddressBookLabel";
      id v8 = v3;
      v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = [v3 objectForKeyedSubscript:@"AddressBookLabel"];
    v5 = [MEMORY[0x1E4F1CA98] null];
    int v6 = [(__CFString *)v4 isEqual:v5];

    if (v6)
    {

      v4 = &stru_1EFBE3CF8;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end