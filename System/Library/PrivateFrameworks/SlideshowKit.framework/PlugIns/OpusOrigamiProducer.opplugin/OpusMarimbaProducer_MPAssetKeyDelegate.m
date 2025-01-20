@interface OpusMarimbaProducer_MPAssetKeyDelegate
- (CGSize)resolutionForAssetKey:(id)a3;
- (OKPresentationLookupDelegate)lookupDelegate;
- (id)absolutePathForAssetKey:(id)a3;
- (id)absolutePathForAssetKey:(id)a3 andSize:(CGSize)a4;
- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4;
- (id)mediaItemForAssetPath:(id)a3;
- (id)updatedAssetPathForAssetPath:(id)a3;
- (id)urlForAssetKey:(id)a3;
- (void)setLookupDelegate:(id)a3;
@end

@implementation OpusMarimbaProducer_MPAssetKeyDelegate

- (id)absolutePathForAssetKey:(id)a3
{
  if (OFLoggerLevel >= 4) {
    +[OFLogger logMessageWithLevel:4, "/Library/Caches/com.apple.xbs/Sources/SlideshowKit/OpusKitPlugins/OpusProducers/OpusMarimbaProducer/OpusMarimbaProducer.m", 965, @"OpusMarimbaProducer_MPAssetKeyDelegate: absolutePathForAssetKey:%@", a3 file line andFormat];
  }
  id v5 = [(OpusMarimbaProducer_MPAssetKeyDelegate *)self mediaItemForAssetPath:a3];
  if (!v5) {
    return a3;
  }
  id v6 = [v5 resourceURL];
  return [v6 path];
}

- (id)absolutePathForAssetKey:(id)a3 andSize:(CGSize)a4
{
  if (OFLoggerLevel >= 4) {
    +[OFLogger logMessageWithLevel:4, "/Library/Caches/com.apple.xbs/Sources/SlideshowKit/OpusKitPlugins/OpusProducers/OpusMarimbaProducer/OpusMarimbaProducer.m", 976, @"OpusMarimbaProducer_MPAssetKeyDelegate: absolutePathForAssetKey:%@ andSize:%@", a3, NSStringFromCGSize(a4) file line andFormat];
  }
  return [(OpusMarimbaProducer_MPAssetKeyDelegate *)self absolutePathForAssetKey:a3];
}

- (id)absolutePathForStillAssetAtPath:(id)a3 andSize:(CGSize)a4
{
  if (OFLoggerLevel >= 4) {
    +[OFLogger logMessageWithLevel:4, "/Library/Caches/com.apple.xbs/Sources/SlideshowKit/OpusKitPlugins/OpusProducers/OpusMarimbaProducer/OpusMarimbaProducer.m", 982, @"OpusMarimbaProducer_MPAssetKeyDelegate: absolutePathForStillAssetAtPath:%@ andSize:@", a3, NSStringFromCGSize(a4) file line andFormat];
  }
  return [(OpusMarimbaProducer_MPAssetKeyDelegate *)self absolutePathForAssetKey:a3];
}

- (CGSize)resolutionForAssetKey:(id)a3
{
  id v3 = [(OpusMarimbaProducer_MPAssetKeyDelegate *)self mediaItemForAssetPath:a3];
  if (v3)
  {
    objc_msgSend(objc_msgSend(v3, "metadata"), "resolution");
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (id)updatedAssetPathForAssetPath:(id)a3
{
  id v4 = -[OpusMarimbaProducer_MPAssetKeyDelegate mediaItemForAssetPath:](self, "mediaItemForAssetPath:");
  if (!v4) {
    return a3;
  }
  id v5 = [v4 uniqueURL];
  return [v5 absoluteString];
}

- (id)mediaItemForAssetPath:(id)a3
{
  if ([a3 isAbsolutePath]) {
    return 0;
  }
  id result = [(OKPresentationLookupDelegate *)self->_lookupDelegate mediaItemForURL:[(OpusMarimbaProducer_MPAssetKeyDelegate *)self urlForAssetKey:a3]];
  if (!result) {
    return 0;
  }
  return result;
}

- (id)urlForAssetKey:(id)a3
{
  if ([a3 hasPrefix:@"iphoto://"])
  {
    id v4 = objc_alloc_init((Class)NSURLComponents);
    id v5 = v4;
    CFStringRef v6 = @"iphoto";
LABEL_5:
    [v4 setScheme:v6];
    objc_msgSend(v5, "setHost:", objc_msgSend(a3, "lastPathComponent"));
    id v7 = [v5 URL];

    return v7;
  }
  if ([a3 hasPrefix:@"aperture://"])
  {
    id v4 = objc_alloc_init((Class)NSURLComponents);
    id v5 = v4;
    CFStringRef v6 = @"aperture";
    goto LABEL_5;
  }
  return +[NSURL URLWithString:a3];
}

- (OKPresentationLookupDelegate)lookupDelegate
{
  return self->_lookupDelegate;
}

- (void)setLookupDelegate:(id)a3
{
  self->_lookupDelegate = (OKPresentationLookupDelegate *)a3;
}

@end