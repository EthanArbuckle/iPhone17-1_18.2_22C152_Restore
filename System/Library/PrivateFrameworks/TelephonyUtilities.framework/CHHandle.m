@interface CHHandle
+ (CHHandle)handleWithTUHandle:(id)a3;
+ (int64_t)handleTypeForTUHandle:(id)a3;
- (TUHandle)tuHandle;
@end

@implementation CHHandle

+ (int64_t)handleTypeForTUHandle:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (char *)[v3 type];
    if ((unint64_t)(v5 - 1) >= 3) {
      int64_t v6 = 0;
    }
    else {
      int64_t v6 = (int64_t)v5;
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (CHHandle)handleWithTUHandle:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [a1 handleTypeForTUHandle:v4];
    id v6 = objc_alloc((Class)CHHandle);
    v7 = [v4 value];

    id v8 = [v6 initWithType:v5 value:v7];
  }
  else
  {
    id v8 = 0;
  }

  return (CHHandle *)v8;
}

- (TUHandle)tuHandle
{
  id v3 = [(CHHandle *)self value];
  if (!v3) {
    goto LABEL_6;
  }
  id v4 = [(CHHandle *)self type];
  if ((unint64_t)v4 < 2)
  {
    uint64_t v5 = +[TUHandle normalizedGenericHandleForValue:v3];
    goto LABEL_8;
  }
  if (v4 != (id)2)
  {
    if (v4 == (id)3)
    {
      uint64_t v5 = +[TUHandle normalizedEmailAddressHandleForValue:v3];
LABEL_8:
      id v6 = (void *)v5;
      goto LABEL_10;
    }
LABEL_6:
    id v6 = 0;
    goto LABEL_10;
  }
  v7 = [0 isoCountryCode];
  id v6 = +[TUHandle normalizedPhoneNumberHandleForValue:v3 isoCountryCode:v7];

LABEL_10:

  return (TUHandle *)v6;
}

@end