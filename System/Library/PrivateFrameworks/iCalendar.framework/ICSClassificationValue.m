@interface ICSClassificationValue
+ (id)classificationFromCode:(int)a3;
+ (id)classificationValueFromICSString:(id)a3;
- (Class)classForCoder;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
@end

@implementation ICSClassificationValue

+ (id)classificationValueFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PUBLIC"])
  {
    uint64_t v4 = 1;
LABEL_7:
    v5 = +[ICSClassificationValue classificationFromCode:v4];
    goto LABEL_8;
  }
  if ([v3 isEqualToString:@"PRIVATE"])
  {
    uint64_t v4 = 2;
    goto LABEL_7;
  }
  if ([v3 isEqualToString:@"CONFIDENTIAL"])
  {
    uint64_t v4 = 3;
    goto LABEL_7;
  }
  v5 = 0;
LABEL_8:

  return v5;
}

+ (id)classificationFromCode:(int)a3
{
  id v3 = [(ICSPredefinedValue *)[ICSClassificationValue alloc] initWithLong:a3];
  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4 = a3;
  id v9 = a4;
  int v6 = [(ICSPredefinedValue *)self longValue];
  v7 = @"PUBLIC";
  if (v6 == 2) {
    v7 = @"PRIVATE";
  }
  if (v6 == 3) {
    v8 = @"CONFIDENTIAL";
  }
  else {
    v8 = v7;
  }
  iCalendarAppendStringToStringWithOptions(v8, v9, v4);
}

@end