@interface MPEmbeddedAssetManager
- (BOOL)isAssetAtPathASupportedAudio:(id)a3;
- (BOOL)isAssetAtPathASupportedImage:(id)a3;
- (BOOL)isAssetAtPathASupportedMovie:(id)a3;
- (CGSize)resolutionForAssetAtPath:(id)a3;
- (double)durationForAssetAtPath:(id)a3;
- (id)absolutePathFromPath:(id)a3;
@end

@implementation MPEmbeddedAssetManager

- (CGSize)resolutionForAssetAtPath:(id)a3
{
  if (!a3 || +[MPUtilities pathIsRelative:](MPUtilities, "pathIsRelative:")) {
    goto LABEL_15;
  }
  if ([a3 isAbsolutePath]) {
    v4 = +[NSURL fileURLWithPath:a3];
  }
  else {
    v4 = +[NSURL URLWithString:a3];
  }
  v5 = CGImageSourceCreateWithURL((CFURLRef)v4, 0);
  if (!v5)
  {
    NSLog(@"Marimba: Requesting size of path that dosen't exist: %@", a3);
LABEL_15:
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
    goto LABEL_16;
  }
  v6 = v5;
  CFDictionaryRef v7 = CGImageSourceCopyPropertiesAtIndex(v5, 0, 0);
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    objc_msgSend(-[__CFDictionary objectForKey:](v7, "objectForKey:", kCGImagePropertyPixelWidth), "floatValue");
    double height = v9;
    objc_msgSend(-[__CFDictionary objectForKey:](v8, "objectForKey:", kCGImagePropertyPixelHeight), "floatValue");
    double v12 = v11;
    unsigned __int8 v13 = objc_msgSend(-[__CFDictionary objectForKey:](v8, "objectForKey:", kCGImagePropertyOrientation), "integerValue");
    if (v13 <= 4uLL) {
      double width = height;
    }
    else {
      double width = v12;
    }
    if (v13 <= 4uLL) {
      double height = v12;
    }
    CFRelease(v8);
  }
  else
  {
    double width = CGSizeZero.width;
    double height = CGSizeZero.height;
  }
  CFRelease(v6);
LABEL_16:
  double v15 = width;
  double v16 = height;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (BOOL)isAssetAtPathASupportedImage:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    id v4 = [a3 rangeOfString:@"?"];
    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL) {
      id v3 = [v3 substringToIndex:v4];
    }
    CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (CFStringRef)[v3 pathExtension], 0);
    LOBYTE(v3) = UTTypeConformsTo(PreferredIdentifierForTag, kUTTypeImage) != 0;
    CFRelease(PreferredIdentifierForTag);
  }
  return (char)v3;
}

- (BOOL)isAssetAtPathASupportedMovie:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    id v4 = [a3 rangeOfString:@"?"];
    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL) {
      id v3 = [v3 substringToIndex:v4];
    }
    CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (CFStringRef)[v3 pathExtension], 0);
    LOBYTE(v3) = UTTypeConformsTo(PreferredIdentifierForTag, kUTTypeMovie) != 0;
    CFRelease(PreferredIdentifierForTag);
  }
  return (char)v3;
}

- (BOOL)isAssetAtPathASupportedAudio:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    id v4 = [a3 rangeOfString:@"?"];
    if (v4 != (id)0x7FFFFFFFFFFFFFFFLL) {
      id v3 = [v3 substringToIndex:v4];
    }
    CFStringRef PreferredIdentifierForTag = UTTypeCreatePreferredIdentifierForTag(kUTTagClassFilenameExtension, (CFStringRef)[v3 pathExtension], 0);
    LOBYTE(v3) = UTTypeConformsTo(PreferredIdentifierForTag, kUTTypeAudio) != 0;
    CFRelease(PreferredIdentifierForTag);
  }
  return (char)v3;
}

- (double)durationForAssetAtPath:(id)a3
{
  double Seconds = 0.0;
  if (!-[MPEmbeddedAssetManager isAssetAtPathASupportedImage:](self, "isAssetAtPathASupportedImage:"))
  {
    if ([a3 isAbsolutePath]) {
      v5 = +[NSURL fileURLWithPath:a3];
    }
    else {
      v5 = +[NSURL URLWithString:a3];
    }
    id v6 = [objc_alloc((Class)AVURLAsset) initWithURL:v5 options:0];
    CFDictionaryRef v7 = v6;
    memset(&v9[1], 0, sizeof(CMTime));
    if (v6) {
      [v6 duration];
    }
    v9[0] = v9[1];
    double Seconds = CMTimeGetSeconds(v9);
  }
  return Seconds;
}

- (id)absolutePathFromPath:(id)a3
{
  return a3;
}

@end