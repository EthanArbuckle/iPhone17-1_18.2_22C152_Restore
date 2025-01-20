@interface TransparencyGPBSourceContext
+ (id)descriptor;
@end

@implementation TransparencyGPBSourceContext

+ (id)descriptor
{
  id result = (id)qword_10032EB78;
  if (!qword_10032EB78)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBSourceContext messageName:@"SourceContext" fileDescription:off_100323890 fields:&off_100323870 fieldCount:1 storageSize:16 flags:v3];
    qword_10032EB78 = (uint64_t)result;
  }
  return result;
}

@end