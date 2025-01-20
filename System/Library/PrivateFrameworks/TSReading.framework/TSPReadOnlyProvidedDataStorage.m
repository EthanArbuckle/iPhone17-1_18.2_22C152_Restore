@interface TSPReadOnlyProvidedDataStorage
- (BOOL)isInPackage:(id)a3;
- (BOOL)readOnly;
- (BOOL)writeToBundleWriter:(id)a3 preferredFilename:(id)a4 filename:(id *)a5 didCopyDataToBundle:(BOOL *)a6;
- (CGDataProvider)newCGDataProvider;
- (CGImageSource)newCGImageSource;
- (NSString)documentResourceLocator;
- (NSString)packageLocator;
- (TSPReadOnlyProvidedDataStorage)initWithDataRepresentation:(id)a3;
- (id)AVAssetWithOptions:(id)a3;
- (id)AVAssetWithOptions:(id)a3 contentTypeUTI:(id)a4;
- (id)AVAssetWithOptions:(id)a3 usingResourceLoaderWithContentTypeUTI:(id)a4;
- (id)NSDataWithOptions:(unint64_t)a3;
- (id)applicationDataLocator;
- (id)bookmarkDataWithOptions:(unint64_t)a3;
- (id)filenameForPreferredFilename:(id)a3;
- (unint64_t)encodedLength;
- (unint64_t)length;
- (unsigned)packageIdentifier;
- (void)performIOChannelReadWithAccessor:(id)a3;
- (void)performReadWithAccessor:(id)a3;
@end

@implementation TSPReadOnlyProvidedDataStorage

- (TSPReadOnlyProvidedDataStorage)initWithDataRepresentation:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSPReadOnlyProvidedDataStorage;
  v6 = [(TSPReadOnlyProvidedDataStorage *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dataRep, a3);
    v8 = v7;
  }

  return v7;
}

- (NSString)documentResourceLocator
{
  return 0;
}

- (id)filenameForPreferredFilename:(id)a3
{
  id v3 = a3;

  return v3;
}

- (id)bookmarkDataWithOptions:(unint64_t)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  v4 = [NSString stringWithUTF8String:"-[TSPReadOnlyProvidedDataStorage bookmarkDataWithOptions:]"];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyProvidedDataStorage.mm"];
  [v3 handleFailureInFunction:v4 file:v5 lineNumber:42 description:@"Can't create a bookmark for read only TSPData backed by NSData"];

  return 0;
}

- (CGDataProvider)newCGDataProvider
{
  v2 = (CGDataProvider *)[(SFUDataRepresentation *)self->_dataRep cgDataProvider];
  if (!v2) {
    TSULogErrorInFunction();
  }
  return v2;
}

- (unint64_t)encodedLength
{
  return [(SFUDataRepresentation *)self->_dataRep dataLength];
}

- (CGImageSource)newCGImageSource
{
  v2 = [(TSPReadOnlyProvidedDataStorage *)self newCGDataProvider];
  id v3 = v2;
  if (!v2 || (v4 = CGImageSourceCreateWithDataProvider(v2, 0)) == 0)
  {
    TSULogErrorInFunction();
    v4 = 0;
  }
  CGDataProviderRelease(v3);
  return v4;
}

- (id)NSDataWithOptions:(unint64_t)a3
{
  v4 = objc_msgSend(MEMORY[0x263EFF990], "data", a3);
  [(SFUDataRepresentation *)self->_dataRep readIntoData:v4];

  return v4;
}

- (id)AVAssetWithOptions:(id)a3
{
  id v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  v4 = [NSString stringWithUTF8String:"-[TSPReadOnlyProvidedDataStorage AVAssetWithOptions:]"];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyProvidedDataStorage.mm"];
  [v3 handleFailureInFunction:v4 file:v5 lineNumber:88 description:@"Can't create an AVAsset for read only TSPData backed by NSData"];

  return 0;
}

- (id)applicationDataLocator
{
  return 0;
}

- (unint64_t)length
{
  return [(SFUDataRepresentation *)self->_dataRep dataLength];
}

- (void)performReadWithAccessor:(id)a3
{
}

- (void)performIOChannelReadWithAccessor:(id)a3
{
  v6 = (void (**)(id, void))a3;
  id v3 = [MEMORY[0x263F7C7F0] currentHandler];
  v4 = [NSString stringWithUTF8String:"-[TSPReadOnlyProvidedDataStorage performIOChannelReadWithAccessor:]"];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyProvidedDataStorage.mm"];
  [v3 handleFailureInFunction:v4 file:v5 lineNumber:122 description:@"need to implement"];

  v6[2](v6, 0);
}

- (BOOL)readOnly
{
  return 1;
}

- (BOOL)isInPackage:(id)a3
{
  return 0;
}

- (NSString)packageLocator
{
  return 0;
}

- (unsigned)packageIdentifier
{
  return 1;
}

- (id)AVAssetWithOptions:(id)a3 contentTypeUTI:(id)a4
{
  return 0;
}

- (id)AVAssetWithOptions:(id)a3 usingResourceLoaderWithContentTypeUTI:(id)a4
{
  return 0;
}

- (BOOL)writeToBundleWriter:(id)a3 preferredFilename:(id)a4 filename:(id *)a5 didCopyDataToBundle:(BOOL *)a6
{
  return 0;
}

- (void).cxx_destruct
{
}

@end