@interface ICSBusyStatusValue
+ (id)busyStatusTypeFromCode:(int)a3;
+ (id)busyStatusValueFromICSString:(id)a3;
- (Class)classForCoder;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
@end

@implementation ICSBusyStatusValue

+ (id)busyStatusValueFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"BUSY"])
  {
    uint64_t v4 = 1;
LABEL_9:
    v5 = +[ICSBusyStatusValue busyStatusTypeFromCode:v4];
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"FREE"])
  {
    uint64_t v4 = 2;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"TENTATIVE"])
  {
    uint64_t v4 = 3;
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"OOF"])
  {
    uint64_t v4 = 4;
    goto LABEL_9;
  }
  v5 = 0;
LABEL_10:

  return v5;
}

+ (id)busyStatusTypeFromCode:(int)a3
{
  id v3 = [(ICSPredefinedValue *)[ICSBusyStatusValue alloc] initWithLong:a3];
  return v3;
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4 = a3;
  id v8 = a4;
  unsigned int v6 = [(ICSPredefinedValue *)self longValue] - 2;
  if (v6 > 2) {
    v7 = @"BUSY";
  }
  else {
    v7 = off_1E6C258C0[v6];
  }
  iCalendarAppendStringToStringWithOptions(v7, v8, v4);
}

@end