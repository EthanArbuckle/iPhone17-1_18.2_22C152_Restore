@interface PLRectValueFromDataTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (id)reverseTransformedValue:(id)a3;
- (id)transformedValue:(id)a3;
@end

@implementation PLRectValueFromDataTransformer

- (id)reverseTransformedValue:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    if ([v4 length] == 32)
    {
      v5 = (void *)MEMORY[0x1E4F29238];
      id v6 = v4;
      v7 = objc_msgSend(v5, "valueWithBytes:objCType:", objc_msgSend(v6, "bytes"), "{CGRect={CGPoint=dd}{CGSize=dd}}");

      goto LABEL_6;
    }
  }
  v7 = 0;
LABEL_6:

  return v7;
}

- (id)transformedValue:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    memset(v6, 0, sizeof(v6));
    [v3 getValue:v6];
    id v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v6 length:32];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (BOOL)allowsReverseTransformation
{
  return 1;
}

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

@end