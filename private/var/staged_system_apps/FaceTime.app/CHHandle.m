@interface CHHandle
- (NSString)formattedPhoneNumber;
- (TUHandle)tuHandle;
@end

@implementation CHHandle

- (TUHandle)tuHandle
{
  v3 = [(CHHandle *)self value];
  if (v3)
  {
    unint64_t v4 = (unint64_t)[(CHHandle *)self type];
    if (v4 > 3) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = qword_10007DB50[v4];
    }
    id v6 = [objc_alloc((Class)TUHandle) initWithType:v5 value:v3];
  }
  else
  {
    id v6 = 0;
  }

  return (TUHandle *)v6;
}

- (NSString)formattedPhoneNumber
{
  return (NSString *)sub_10004C268(self, (uint64_t)a2, (void (*)(void))sub_10004C2E8);
}

@end