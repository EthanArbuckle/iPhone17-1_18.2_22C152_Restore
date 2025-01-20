@interface TRINamespace
+ (id)descriptor;
+ (id)namespaceNameFromId:(unsigned int)a3;
+ (int)namespaceIdFromName:(id)a3;
@end

@implementation TRINamespace

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_7;
  if (!descriptor_descriptor_7)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITrinamespaceRoot_FileDescriptor() fields:0 fieldCount:0 storageSize:4 flags:v8];
    if (descriptor_descriptor_7) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"Trinamespace.pbobjc.m", 70, @"Startup recursed!");
    }
    descriptor_descriptor_7 = (uint64_t)v2;
  }
  return v2;
}

+ (id)namespaceNameFromId:(unsigned int)a3
{
  LODWORD(v3) = a3;
  if (TRINamespace_NamespaceId_IsValidValue(a3)) {
    uint64_t v3 = v3;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v6 = TRINamespace_NamespaceId_EnumDescriptor();
  v7 = [v6 textFormatNameForValue:v3];

  if (!v7)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"TRINamespace+TRI.m", 20, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  return v7;
}

+ (int)namespaceIdFromName:(id)a3
{
  int v7 = 0;
  id v3 = a3;
  v4 = TRINamespace_NamespaceId_EnumDescriptor();
  int v5 = [v4 getValue:&v7 forEnumTextFormatName:v3];

  if (v5) {
    return v7;
  }
  else {
    return 0;
  }
}

@end