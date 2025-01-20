@interface TRIFBCloudKitAssetRecordAssetBuilder
- (void)dealloc;
@end

@implementation TRIFBCloudKitAssetRecordAssetBuilder

- (void)dealloc
{
  bldr = self->_bldr;
  if (bldr) {
    MEMORY[0x19F3ACBD0](bldr, 0x1020C403A5D3213);
  }
  v4.receiver = self;
  v4.super_class = (Class)TRIFBCloudKitAssetRecordAssetBuilder;
  [(TRIFBCloudKitAssetRecordAssetBuilder *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end