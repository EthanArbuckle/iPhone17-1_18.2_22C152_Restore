@interface NSUUID
+ (id)csd_UUIDv5ForString:(id)a3;
@end

@implementation NSUUID

+ (id)csd_UUIDv5ForString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"A910C931-A590-41EF-A783-910BFBE500B3"];
    if (v5)
    {
      v6 = objc_msgSend(a1, "tu_UUIDv5ForString:namespaceUUID:", v4, v5);
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end