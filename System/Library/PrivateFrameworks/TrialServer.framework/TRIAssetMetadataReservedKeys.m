@interface TRIAssetMetadataReservedKeys
+ ($61A80719B04F7407D3E47539F1B23CAA)compressionModeForMetadata:(id)a3;
+ (BOOL)isEncryptedForMetadata:(id)a3;
@end

@implementation TRIAssetMetadataReservedKeys

+ (BOOL)isEncryptedForMetadata:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = [a3 objectForKeyedSubscript:@"trialIsEncrypted"];
  v4 = v3;
  if (v3) {
    char v5 = [v3 BOOLValue];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

+ ($61A80719B04F7407D3E47539F1B23CAA)compressionModeForMetadata:(id)a3
{
  if (a3)
  {
    v3 = [a3 objectForKeyedSubscript:@"__trialAppleFSCompressionMode"];
    v4 = [v3 lowercaseString];

    BOOL v5 = v4 && ([v4 isEqualToString:@"lzbitmap"] & 1) != 0;
  }
  else
  {
    return ($61A80719B04F7407D3E47539F1B23CAA)0;
  }
  return ($61A80719B04F7407D3E47539F1B23CAA)v5;
}

@end