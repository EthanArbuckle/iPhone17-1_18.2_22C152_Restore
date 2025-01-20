@interface TRIFactor
+ (id)descriptor;
- (BOOL)hasNamespace;
- (BOOL)isInNamespaceName:(id)a3;
- (id)namespaceString;
- (id)typeString;
@end

@implementation TRIFactor

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_1;
  if (!descriptor_descriptor_1)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITrifactorRoot_FileDescriptor() fields:&descriptor_fields_14 fieldCount:7 storageSize:56 flags:v8];
    if (descriptor_descriptor_1) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"Trifactor.pbobjc.m", 152, @"Startup recursed!");
    }
    descriptor_descriptor_1 = (uint64_t)v2;
  }
  return v2;
}

- (BOOL)isInNamespaceName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TRIFactor *)self namespaceString];
  uint64_t v6 = v5;
  if (v5) {
    char v7 = [v5 isEqualToString:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (id)namespaceString
{
  if ([(TRIFactor *)self hasNamespaceName])
  {
    v3 = [(TRIFactor *)self namespaceName];
  }
  else if ([(TRIFactor *)self hasNamespaceId])
  {
    v3 = +[TRINamespace namespaceNameFromId:[(TRIFactor *)self namespaceId]];
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)typeString
{
  if ([(TRIFactor *)self hasType])
  {
    int v3 = [(TRIFactor *)self type];
    int v4 = v3;
    if (v3 > 99)
    {
      switch(v3)
      {
        case 'd':
          uint64_t v5 = @"file";
          break;
        case 'e':
          uint64_t v5 = @"directory";
          break;
        case 'h':
          uint64_t v5 = @"mobileasset";
          break;
        default:
LABEL_21:
          uint64_t v5 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"(unrecognized: %d)", -[TRIFactor type](self, "type"));
          break;
      }
    }
    else
    {
      uint64_t v5 = @"unknown";
      switch(v4)
      {
        case 0:
          break;
        case 10:
          uint64_t v5 = @"BOOLean";
          break;
        case 11:
          uint64_t v5 = @"string";
          break;
        case 12:
          uint64_t v5 = @"integer";
          break;
        case 13:
          uint64_t v5 = @"long";
          break;
        case 14:
          uint64_t v5 = @"float";
          break;
        case 15:
          uint64_t v5 = @"double";
          break;
        case 16:
          uint64_t v5 = @"binary";
          break;
        default:
          goto LABEL_21;
      }
    }
  }
  else
  {
    uint64_t v5 = @"(unset)";
  }
  return v5;
}

- (BOOL)hasNamespace
{
  if ([(TRIFactor *)self hasNamespaceName]) {
    return 1;
  }
  return [(TRIFactor *)self hasNamespaceId];
}

@end