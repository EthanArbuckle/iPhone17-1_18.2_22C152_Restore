@interface TSPReadOnlyMemoryDataStorage
- (BOOL)isInPackage:(id)a3;
- (BOOL)readOnly;
- (CGDataProvider)newCGDataProvider;
- (CGImageSource)newCGImageSource;
- (NSString)documentResourceLocator;
- (NSString)packageLocator;
- (TSPReadOnlyMemoryDataStorage)initWithNSData:(id)a3;
- (id)AVAssetWithOptions:(id)a3 contentTypeUTI:(id)a4;
- (id)AVAssetWithOptions:(id)a3 usingResourceLoaderWithContentTypeUTI:(id)a4;
- (id)NSDataWithOptions:(unint64_t)a3;
- (id)bookmarkDataWithOptions:(unint64_t)a3;
- (id)filenameForPreferredFilename:(id)a3;
- (unint64_t)encodedLength;
- (unsigned)packageIdentifier;
- (void)performIOChannelReadWithAccessor:(id)a3;
- (void)performReadWithAccessor:(id)a3;
@end

@implementation TSPReadOnlyMemoryDataStorage

- (TSPReadOnlyMemoryDataStorage)initWithNSData:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSPReadOnlyMemoryDataStorage;
  v6 = [(TSPReadOnlyMemoryDataStorage *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_NSData, a3);
    v8 = v7;
  }

  return v7;
}

- (id)bookmarkDataWithOptions:(unint64_t)a3
{
  v3 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3);
  v4 = [NSString stringWithUTF8String:"-[TSPReadOnlyMemoryDataStorage bookmarkDataWithOptions:]"];
  id v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyMemoryDataStorage.mm"];
  [v3 handleFailureInFunction:v4 file:v5 lineNumber:34 description:@"Can't create a bookmark for read only TSPData backed by NSData"];

  return 0;
}

- (CGDataProvider)newCGDataProvider
{
  v2 = CGDataProviderCreateWithCFData((CFDataRef)self->_NSData);
  if (!v2) {
    TSULogErrorInFunction();
  }
  return v2;
}

- (CGImageSource)newCGImageSource
{
  v2 = CGImageSourceCreateWithData((CFDataRef)self->_NSData, 0);
  if (!v2) {
    TSULogErrorInFunction();
  }
  return v2;
}

- (id)NSDataWithOptions:(unint64_t)a3
{
  return self->_NSData;
}

- (id)AVAssetWithOptions:(id)a3 contentTypeUTI:(id)a4
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  id v5 = [NSString stringWithUTF8String:"-[TSPReadOnlyMemoryDataStorage AVAssetWithOptions:contentTypeUTI:]"];
  v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyMemoryDataStorage.mm"];
  [v4 handleFailureInFunction:v5 file:v6 lineNumber:69 description:@"Can't create an AVAsset for read only TSPData backed by NSData"];

  return 0;
}

- (id)AVAssetWithOptions:(id)a3 usingResourceLoaderWithContentTypeUTI:(id)a4
{
  v4 = objc_msgSend(MEMORY[0x263F7C7F0], "currentHandler", a3, a4);
  id v5 = [NSString stringWithUTF8String:"-[TSPReadOnlyMemoryDataStorage AVAssetWithOptions:usingResourceLoaderWithContentTypeUTI:]"];
  v6 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/persistence/src/TSPReadOnlyMemoryDataStorage.mm"];
  [v4 handleFailureInFunction:v5 file:v6 lineNumber:75 description:@"Can't create an AVAsset for read only TSPData backed by NSData"];

  return 0;
}

- (NSString)documentResourceLocator
{
  return 0;
}

- (NSString)packageLocator
{
  return 0;
}

- (unsigned)packageIdentifier
{
  return 0;
}

- (id)filenameForPreferredFilename:(id)a3
{
  id v3 = a3;

  return v3;
}

- (unint64_t)encodedLength
{
  return [self->_NSData length];
}

- (void)performReadWithAccessor:(id)a3
{
}

- (void)performIOChannelReadWithAccessor:(id)a3
{
}

- (BOOL)readOnly
{
  return 1;
}

- (BOOL)isInPackage:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
}

@end