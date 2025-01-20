@interface CSHWProtoMessageKey
+ (id)descriptor;
@end

@implementation CSHWProtoMessageKey

+ (id)descriptor
{
  id result = (id)qword_1003DD788;
  if (!qword_1003DD788)
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    LODWORD(v5) = 12;
    id result = +[GPBDescriptor allocDescriptorForClass:v3 rootClass:v4 file:sub_1002E9B88() fields:&off_1003DD328 fieldCount:2 storageSize:24 flags:v5];
    qword_1003DD788 = (uint64_t)result;
  }
  return result;
}

@end