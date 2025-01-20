@interface CSHWProtoValue
+ (id)descriptor;
@end

@implementation CSHWProtoValue

+ (id)descriptor
{
  id result = (id)qword_1003DD768;
  if (!qword_1003DD768)
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    LODWORD(v5) = 13;
    id result = +[GPBDescriptor allocDescriptorForClass:v3 rootClass:v4 file:sub_1002E9B88() fields:&unk_1003DD148 fieldCount:4 storageSize:32 flags:v5];
    qword_1003DD768 = (uint64_t)result;
  }
  return result;
}

@end