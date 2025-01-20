@interface PFXFrameSpec
- (NSDictionary)infoDictionary;
- (NSString)bundleBasePath;
- (PFXArchive)archive;
- (PFXFrameSpec)initWithBundle:(id)a3 basePath:(id)a4 readerState:(id)a5 isVolatile:(BOOL)a6;
- (TSPObjectContext)tspContext;
- (id)newDataWithBundleResource:(id)a3;
- (id)p_documentURIForResourcePath:(id)a3;
- (id)p_imageDataForKey:(id)a3;
- (id)p_infoDictionary;
- (void)dealloc;
- (void)setArchive:(id)a3;
- (void)setBundleBasePath:(id)a3;
- (void)setInfoDictionary:(id)a3;
- (void)setTspContext:(id)a3;
@end

@implementation PFXFrameSpec

- (PFXFrameSpec)initWithBundle:(id)a3 basePath:(id)a4 readerState:(id)a5 isVolatile:(BOOL)a6
{
  BOOL v6 = a6;
  v11 = (PFXArchive *)[a5 archive];
  v12 = (NSString *)[a4 copy];
  self->mArchive = v11;
  self->mBundleBasePath = v12;
  self->mTSPContext = (TSPObjectContext *)[a5 tspContext];
  v15.receiver = self;
  v15.super_class = (Class)PFXFrameSpec;
  v13 = [(PFXFrameSpec *)&v15 initWithBundle:a3 isVolatile:v6];
  if (!v13)
  {
  }
  return v13;
}

- (void)dealloc
{
  [(PFXFrameSpec *)self setInfoDictionary:0];
  [(PFXFrameSpec *)self setBundleBasePath:0];
  [(PFXFrameSpec *)self setArchive:0];
  [(PFXFrameSpec *)self setTspContext:0];
  v3.receiver = self;
  v3.super_class = (Class)PFXFrameSpec;
  [(PFXFrameSpec *)&v3 dealloc];
}

- (NSDictionary)infoDictionary
{
  return self->mInfoDictionary;
}

- (void)setInfoDictionary:(id)a3
{
}

- (PFXArchive)archive
{
  return self->mArchive;
}

- (void)setArchive:(id)a3
{
}

- (NSString)bundleBasePath
{
  return self->mBundleBasePath;
}

- (void)setBundleBasePath:(id)a3
{
}

- (TSPObjectContext)tspContext
{
  return self->mTSPContext;
}

- (void)setTspContext:(id)a3
{
  self->mTSPContext = (TSPObjectContext *)a3;
}

- (id)newDataWithBundleResource:(id)a3
{
  id v4 = [(PFXFrameSpec *)self p_documentURIForResourcePath:a3];
  mArchive = self->mArchive;

  return [(PFXArchive *)mArchive createDataWithName:v4 error:0];
}

- (id)p_infoDictionary
{
  if (![(PFXFrameSpec *)self infoDictionary])
  {
    id v3 = -[PFXFrameSpec newDataWithBundleResource:](self, "newDataWithBundleResource:", [*(id *)&self->TSDFrameSpec_opaque[OBJC_IVAR___TSDFrameSpec_mBundle] pathForResource:@"index" ofType:@"plist"]);
    if (v3)
    {
      id v4 = v3;
      CFErrorRef error = 0;
      CFPropertyListRef v5 = CFPropertyListCreateWithData(kCFAllocatorDefault, (CFDataRef)v3, 0, 0, &error);

      if (v5)
      {
        CFTypeID v6 = CFGetTypeID(v5);
        if (v6 == CFDictionaryGetTypeID()) {
          CFPropertyListRef v7 = v5;
        }
        else {
          CFPropertyListRef v7 = 0;
        }
        [(PFXFrameSpec *)self setInfoDictionary:v7];
        CFRelease(v5);
      }
    }
  }
  return [(PFXFrameSpec *)self infoDictionary];
}

- (id)p_imageDataForKey:(id)a3
{
  id result = [[self p_infoDictionary] objectForKey:a3];
  if (result)
  {
    id v5 = -[PFXFrameSpec p_documentURIForResourcePath:](self, "p_documentURIForResourcePath:", objc_msgSend(objc_msgSend(*(id *)&self->TSDFrameSpec_opaque[OBJC_IVAR___TSDFrameSpec_mBundle], "resourcePath"), "stringByAppendingPathComponent:", result));
    mTSPContext = self->mTSPContext;
    return +[TSPData dataFromDocumentURI:v5 context:mTSPContext];
  }
  return result;
}

- (id)p_documentURIForResourcePath:(id)a3
{
  id v3 = a3;
  uint64_t v5 = OBJC_IVAR___TSDFrameSpec_mBundle;
  if ([a3 hasPrefix:[self bundlePath]])id v3 = [v3 substringFromIndex:[self bundlePath].length]; {
  mBundleBasePath = self->mBundleBasePath;
  }

  return [(NSString *)mBundleBasePath stringByAppendingPathComponent:v3];
}

@end