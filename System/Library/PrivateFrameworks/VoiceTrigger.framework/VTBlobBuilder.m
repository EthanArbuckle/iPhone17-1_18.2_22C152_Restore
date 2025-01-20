@interface VTBlobBuilder
+ (id)getBlobWithConfigFilename:(id)a3 rootDirectory:(id)a4;
+ (id)getDefaultBlob;
@end

@implementation VTBlobBuilder

+ (id)getDefaultBlob
{
  return (id)[MEMORY[0x263EFF8F8] dataWithBytes:&gVTRTModelData length:40960];
}

+ (id)getBlobWithConfigFilename:(id)a3 rootDirectory:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v17 = 0;
  id v7 = v5;
  v8 = (const char *)[v7 cStringUsingEncoding:4];
  id v9 = v6;
  int BlobSize = NDBlobGetBlobSize(v8, [v9 cStringUsingEncoding:4], 1, 0, &v17);
  id v11 = 0;
  if (!BlobSize && v17)
  {
    v12 = objc_msgSend(MEMORY[0x263EFF990], "dataWithLength:");
    v13 = (const char *)[v7 cStringUsingEncoding:4];
    uint64_t v14 = [v9 cStringUsingEncoding:4];
    id v15 = v12;
    if (NDBlobBuildBlob(v13, v14, 1, 0, [v15 bytes])) {
      id v11 = 0;
    }
    else {
      id v11 = v15;
    }
  }

  return v11;
}

@end