@interface TRIFactorLevel
+ (id)descriptor;
+ (id)hashForFactorLevels:(id)a3;
- (id)uniqueDataRepresentation;
@end

@implementation TRIFactorLevel

+ (id)descriptor
{
  id v2 = (id)descriptor_descriptor_92;
  if (!descriptor_descriptor_92)
  {
    uint64_t v5 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    LODWORD(v8) = 0;
    id v2 = +[TRIPBDescriptor allocDescriptorForClass:v5 rootClass:v6 file:TRITrifactorRoot_FileDescriptor() fields:descriptor_fields_93 fieldCount:2 storageSize:24 flags:v8];
    if (descriptor_descriptor_92) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, @"Trifactor.pbobjc.m", 468, @"Startup recursed!");
    }
    descriptor_descriptor_92 = (uint64_t)v2;
  }
  return v2;
}

+ (id)hashForFactorLevels:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    v4 = [v3 sortedArrayWithOptions:16 usingComparator:&__block_literal_global_1];
    uint64_t v5 = objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "uniqueDataRepresentation", (void)v17);
          if ([v11 length]) {
            [v5 appendData:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v8);
    }

    if ((unint64_t)[v5 length] >> 32)
    {
      id v12 = 0;
    }
    else
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
      id v14 = v5;
      v15 = (const void *)[v14 bytes];
      LODWORD(v14) = [v14 length];
      id v12 = v13;
      CC_SHA256(v15, (CC_LONG)v14, (unsigned __int8 *)[v12 mutableBytes]);
    }
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __56__TRIFactorLevel_NamespaceHashing__hashForFactorLevels___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 factor];
  id v6 = [v5 name];
  uint64_t v7 = [v4 factor];

  uint64_t v8 = [v7 name];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (id)uniqueDataRepresentation
{
  id v3 = [(TRIFactorLevel *)self factor];
  id v4 = [v3 name];

  uint64_t v5 = [v4 dataUsingEncoding:2483028224 allowLossyConversion:0];
  id v6 = v5;
  if (!v4 || ![v5 length])
  {
    id v12 = 0;
    goto LABEL_43;
  }
  uint64_t v7 = [(TRIFactorLevel *)self level];
  uint64_t v8 = v7;
  if (v7)
  {
    int v9 = [v7 levelOneOfCase];
    v10 = 0;
    if (v9 <= 99)
    {
      switch(v9)
      {
        case 10:
          int v11 = [v8 BOOLeanValue];
          goto LABEL_18;
        case 11:
          v15 = [v8 stringValue];
          v10 = [(__CFString *)v15 dataUsingEncoding:2483028224 allowLossyConversion:0];
          goto LABEL_37;
        case 12:
          int v11 = [v8 intValue];
LABEL_18:
          LODWORD(v30) = v11;
          goto LABEL_19;
        case 13:
          uint64_t v30 = [v8 longValue];
          goto LABEL_22;
        case 14:
          [v8 floatValue];
          LODWORD(v30) = v16;
LABEL_19:
          long long v18 = (void *)MEMORY[0x1E4F1C9B8];
          uint64_t v19 = 4;
          goto LABEL_23;
        case 15:
          [v8 doubleValue];
          uint64_t v30 = v20;
LABEL_22:
          long long v18 = (void *)MEMORY[0x1E4F1C9B8];
          uint64_t v19 = 8;
LABEL_23:
          uint64_t v21 = [v18 dataWithBytes:&v30 length:v19];
          goto LABEL_24;
        case 16:
          uint64_t v21 = [v8 binaryValue];
LABEL_24:
          v10 = (void *)v21;
          break;
        default:
          goto LABEL_38;
      }
      goto LABEL_38;
    }
    switch(v9)
    {
      case 'd':
        long long v17 = [v8 fileValue];
        break;
      case 'e':
        long long v17 = [v8 directoryValue];
        break;
      case 'h':
        v13 = [v8 mobileAssetReferenceValue];
        if ([v13 hasAssetType])
        {
          id v14 = [v8 mobileAssetReferenceValue];
          v15 = [v14 assetType];
        }
        else
        {
          v15 = @"null";
        }

        v24 = [v8 mobileAssetReferenceValue];
        if ([v24 hasAssetSpecifier])
        {
          v25 = [v8 mobileAssetReferenceValue];
          uint64_t v22 = [v25 assetSpecifier];
        }
        else
        {
          uint64_t v22 = @"null";
        }

        v26 = [v8 mobileAssetReferenceValue];
        if ([v26 hasAssetVersion])
        {
          v27 = [v8 mobileAssetReferenceValue];
          v23 = [v27 assetVersion];
        }
        else
        {
          v23 = @"null";
        }

        v28 = (void *)[[NSString alloc] initWithFormat:@"%@-%@-%@", v15, v22, v23];
        v10 = [v28 dataUsingEncoding:2483028224 allowLossyConversion:0];

LABEL_36:
LABEL_37:

        goto LABEL_38;
      default:
LABEL_38:
        if ([v10 length])
        {
          id v12 = objc_opt_new();
          [v12 appendData:v6];
          [v12 appendData:v10];
        }
        else
        {
          id v12 = 0;
        }

        goto LABEL_42;
    }
    v15 = v17;
    uint64_t v22 = [(__CFString *)v17 asset];
    v23 = [(__CFString *)v22 assetId];
    v10 = [(__CFString *)v23 dataUsingEncoding:2483028224 allowLossyConversion:0];
    goto LABEL_36;
  }
  id v12 = 0;
LABEL_42:

LABEL_43:
  return v12;
}

@end