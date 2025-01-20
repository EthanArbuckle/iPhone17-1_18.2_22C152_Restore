@interface SiriNLUExternalTypesUsoGraphCppConverter
+ (id)convertCppGraph:(const void *)a3;
@end

@implementation SiriNLUExternalTypesUsoGraphCppConverter

+ (id)convertCppGraph:(const void *)a3
{
  if (a3) {
    siri::ontology::UsoGraphProtoWriter::toProtobuf((siri::ontology::UsoGraphProtoWriter *)a3, (const siri::ontology::UsoGraph *)a2);
  }
  return 0;
}

@end