@interface TransparencyGPBSourceContext
+ (id)descriptor;
@end

@implementation TransparencyGPBSourceContext

+ (id)descriptor
{
  id result = (id)qword_1000A7478;
  if (!qword_1000A7478)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBSourceContext messageName:@"SourceContext" fileDescription:off_1000A5A38 fields:&off_1000A5A18 fieldCount:1 storageSize:16 flags:v3];
    qword_1000A7478 = (uint64_t)result;
  }
  return result;
}

@end