@interface TransparencyGPBSourceContext
+ (id)descriptor;
@end

@implementation TransparencyGPBSourceContext

+ (id)descriptor
{
  id result = (id)qword_100162140;
  if (!qword_100162140)
  {
    LODWORD(v3) = 28;
    id result = +[TransparencyGPBDescriptor allocDescriptorForClass:TransparencyGPBSourceContext messageName:@"SourceContext" fileDescription:off_10015A900 fields:&off_10015A8E0 fieldCount:1 storageSize:16 flags:v3];
    qword_100162140 = (uint64_t)result;
  }
  return result;
}

@end