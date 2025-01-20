@interface NSString
+ (id)csd_stringWithCSDVoIPApplicationMessageTransportType:(int64_t)a3;
- (NSUUID)csd_UUIDv5;
@end

@implementation NSString

- (NSUUID)csd_UUIDv5
{
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:self];
  if (!v3)
  {
    id v3 = +[NSUUID csd_UUIDv5ForString:self];
  }

  return (NSUUID *)v3;
}

+ (id)csd_stringWithCSDVoIPApplicationMessageTransportType:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return 0;
  }
  else {
    return off_10050A7D8[a3];
  }
}

@end