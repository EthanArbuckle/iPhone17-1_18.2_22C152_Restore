@interface GQSDocument
- (BOOL)doCalculateThumbnailSize;
- (BOOL)doExternalTextWrap;
- (BOOL)generatorBeginWasCalled;
- (BOOL)isGeneratingThumbnail;
- (BOOL)isReadingStorageAttachments;
- (BOOL)isThumbnailGenerationDone;
- (BOOL)mustRegisterDrawables;
- (BOOL)shouldStreamTables;
- (Class)currentDrawablesGenerator;
- (Class)currentTableGenerator;
- (GQSDocument)initWithRoot:(id)a3 processor:(id)a4 archive:(id)a5 outputBundle:(id)a6 fileURL:(__CFURL *)a7;
- (GQSDocument)initWithRoot:(id)a3 processor:(id)a4 bundleUrl:(__CFURL *)a5 archive:(id)a6 outputBundle:(id)a7;
- (GQSDocument)initWithRoot:(id)a3 processor:(id)a4 outputBundle:(id)a5 fileURL:(__CFURL *)a6;
- (__CFString)filename;
- (__CFString)uriForBundleResource:(__CFString *)a3 ofType:(__CFString *)a4;
- (__CFURL)createUriToDocumentBundleResource:(__CFString *)a3;
- (__CFURL)createUrlToAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4 skipCachingPDFAndNoExtentionResources:(BOOL *)a5;
- (const)wrapPoints;
- (id)currentWrapPointGenerator;
- (id)generatorState;
- (id)outputBundle;
- (id)peekObject;
- (id)popRetainedObject;
- (id)processor;
- (id)root;
- (id)stylesheet;
- (id)tableState;
- (id)topObjectOfClass:(Class)a3;
- (int)objectStackDepth;
- (void)addWrapPoint:(id)a3;
- (void)clearWrapPoints;
- (void)createListOfWrapPointsAlongY:(float)a3 minX:(float)a4 maxX:(float)a5 zIndex:(int)a6;
- (void)dealloc;
- (void)pushObject:(id)a3;
- (void)setCurrentDrawablesGenerator:(Class)a3;
- (void)setCurrentTableGenerator:(Class)a3;
- (void)setCurrentWrapPointGenerator:(id)a3;
- (void)setDoCalculateThumbnailSize:(BOOL)a3;
- (void)setDoExternalTextWrap:(BOOL)a3;
- (void)setGeneratingThumbnail:(BOOL)a3;
- (void)setGeneratorBeginWasCalled;
- (void)setGeneratorState:(id)a3;
- (void)setIsReadingStorageAttachments:(BOOL)a3;
- (void)setMustRegisterDrawables:(BOOL)a3;
- (void)setShouldStreamTables:(BOOL)a3;
- (void)setStylesheet:(id)a3;
- (void)setTableState:(id)a3;
- (void)setThumbnailGenerationDone:(BOOL)a3;
@end

@implementation GQSDocument

- (GQSDocument)initWithRoot:(id)a3 processor:(id)a4 outputBundle:(id)a5 fileURL:(__CFURL *)a6
{
  v12.receiver = self;
  v12.super_class = (Class)GQSDocument;
  v9 = [(GQSDocument *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->mProcessor = (GQPProcessor *)a4;
    v9->mRoot = (GQDRoot *)a3;
    v10->mOutputBundle = (GQUOutputBundle *)a5;
    v10->mObjectStack = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    operator new();
  }
  return 0;
}

- (GQSDocument)initWithRoot:(id)a3 processor:(id)a4 bundleUrl:(__CFURL *)a5 archive:(id)a6 outputBundle:(id)a7
{
  v9 = [(GQSDocument *)self initWithRoot:a3 processor:a4 outputBundle:a7 fileURL:a5];
  v10 = v9;
  if (v9)
  {
    if (a5)
    {
      v9->mBundleUrl = a5;
      CFRetain(a5);
    }
    if (a6) {
      v10->mArchive = (SFUZipArchive *)a6;
    }
  }
  return v10;
}

- (GQSDocument)initWithRoot:(id)a3 processor:(id)a4 archive:(id)a5 outputBundle:(id)a6 fileURL:(__CFURL *)a7
{
  v8 = [(GQSDocument *)self initWithRoot:a3 processor:a4 outputBundle:a6 fileURL:a7];
  if (v8) {
    v8->mArchive = (SFUZipArchive *)a5;
  }
  return v8;
}

- (void)dealloc
{
  mBundleUrl = self->mBundleUrl;
  if (mBundleUrl) {
    CFRelease(mBundleUrl);
  }

  CFRelease(self->mObjectStack);
  mWrapPoints = (void **)self->mWrapPoints;
  if (mWrapPoints)
  {
    sub_9FBC((uint64_t)self->mWrapPoints, mWrapPoints[1]);
    operator delete();
  }
  mBundleResourceUriMap = self->mBundleResourceUriMap;
  if (mBundleResourceUriMap) {
    CFRelease(mBundleResourceUriMap);
  }

  mFilename = self->mFilename;
  if (mFilename) {
    CFRelease(mFilename);
  }
  mDocumentUrl = self->mDocumentUrl;
  if (mDocumentUrl) {
    CFRelease(mDocumentUrl);
  }
  v8.receiver = self;
  v8.super_class = (Class)GQSDocument;
  [(GQSDocument *)&v8 dealloc];
}

- (id)processor
{
  return self->mProcessor;
}

- (id)root
{
  return self->mRoot;
}

- (__CFURL)createUrlToAppBundleResource:(__CFString *)a3 processorBundle:(__CFBundle *)a4 skipCachingPDFAndNoExtentionResources:(BOOL *)a5
{
  char v16 = 0;
  v7 = [(GQDRoot *)self->mRoot createUrlToAppBundleResource:a3 processorBundle:a4 fileExists:&v16 fileUrl:self->mDocumentUrl];
  objc_super v8 = v7;
  if (v16)
  {
    if (a5)
    {
      CFStringRef v9 = CFURLCopyPathExtension(v7);
      if (v9)
      {
        CFStringRef v10 = v9;
        *a5 = CFStringCompare(v9, @"pdf", 1uLL) == kCFCompareEqualTo;
        CFRelease(v10);
        if (*a5) {
          return v8;
        }
      }
      else
      {
        *a5 = 0;
      }
    }
    CFStringRef PathComponent = CFURLCopyLastPathComponent(v8);
    id v12 = [objc_alloc((Class)NSMutableData) initWithContentsOfURL:v8];
    if (v12)
    {
      v13 = v12;
      [(GQUOutputBundle *)self->mOutputBundle setData:v12 mimeType:0 forNamedResource:PathComponent];
    }
    if (v8) {
      CFRelease(v8);
    }
    CFStringRef v14 = (const __CFString *)[(GQUOutputBundle *)self->mOutputBundle createUriForResource:PathComponent];
    objc_super v8 = CFURLCreateWithString(0, v14, 0);
    if (v14) {
      CFRelease(v14);
    }
    if (PathComponent) {
      CFRelease(PathComponent);
    }
  }
  return v8;
}

- (__CFURL)createUriToDocumentBundleResource:(__CFString *)a3
{
  mBundleUrl = self->mBundleUrl;
  mArchive = self->mArchive;
  if (!mBundleUrl)
  {
    if (!mArchive) {
      return 0;
    }
LABEL_9:
    CFStringRef v15 = (const __CFString *)[(GQUOutputBundle *)self->mOutputBundle createUriForResource:a3];
    char v16 = CFURLCreateWithString(0, v15, 0);
    CFRelease(v15);
    id v17 = [(SFUZipArchive *)self->mArchive entryWithName:a3];
    if (v17)
    {
      if ([(GQPProcessor *)self->mProcessor cryptoKey])
      {
        id v18 = [(SFUZipArchive *)self->mArchive entryWithName:a3];
        id v19 = objc_msgSend(objc_alloc((Class)SFUFileDataRepresentation), "initWithInputStream:cryptoKey:dataLength:", objc_msgSend(v18, "inputStream"), -[GQPProcessor cryptoKey](self->mProcessor, "cryptoKey"), objc_msgSend(v18, "dataLength"));
        id v20 = objc_alloc_init((Class)NSMutableData);
        [v19 readIntoData:v20];
        [(GQUOutputBundle *)self->mOutputBundle setData:v20 mimeType:0 forNamedResource:a3];
      }
      else
      {
        -[GQUOutputBundle setData:mimeType:forNamedResource:](self->mOutputBundle, "setData:mimeType:forNamedResource:", [v17 data], 0, a3);
      }
    }
    return v16;
  }
  if (mArchive) {
    goto LABEL_9;
  }
  CFURLRef v7 = CFURLCreateCopyAppendingPathComponent(0, mBundleUrl, a3, 0);
  CFStringRef v8 = CFURLCopyFileSystemPath(v7, kCFURLPOSIXPathStyle);
  CFRelease(v7);
  id v9 = [objc_alloc((Class)NSMutableData) initWithContentsOfFile:v8];
  if ([(GQPProcessor *)self->mProcessor cryptoKey])
  {
    id v10 = [v9 length];

    id v11 = objc_msgSend(objc_alloc((Class)SFUFileDataRepresentation), "initWithPath:cryptoKey:dataLength:", v8, -[GQPProcessor cryptoKey](self->mProcessor, "cryptoKey"), v10);
    id v9 = objc_alloc_init((Class)NSMutableData);
    [v11 readIntoData:v9];
  }
  CFRelease(v8);
  if (v9)
  {
    [(GQUOutputBundle *)self->mOutputBundle setData:v9 mimeType:0 forNamedResource:a3];
  }
  CFStringRef v12 = (const __CFString *)[(GQUOutputBundle *)self->mOutputBundle createUriForResource:a3];
  v13 = CFURLCreateWithString(0, v12, 0);
  CFRelease(v12);
  return v13;
}

- (id)outputBundle
{
  return self->mOutputBundle;
}

- (id)peekObject
{
  int Count = CFArrayGetCount(self->mObjectStack);
  if (!Count) {
    return 0;
  }
  CFIndex v4 = (Count - 1);
  mObjectStack = self->mObjectStack;
  return (id)CFArrayGetValueAtIndex(mObjectStack, v4);
}

- (id)topObjectOfClass:(Class)a3
{
  CFIndex v4 = CFArrayGetCount(self->mObjectStack) - 1;
  while (v4 != -1)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mObjectStack, v4--);
    if (objc_opt_isKindOfClass()) {
      return ValueAtIndex;
    }
  }
  return 0;
}

- (id)popRetainedObject
{
  int Count = CFArrayGetCount(self->mObjectStack);
  if (!Count) {
    return 0;
  }
  CFIndex v4 = (Count - 1);
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mObjectStack, v4);
  id v6 = ValueAtIndex;
  CFArrayRemoveValueAtIndex(self->mObjectStack, v4);
  return ValueAtIndex;
}

- (void)pushObject:(id)a3
{
}

- (int)objectStackDepth
{
  return CFArrayGetCount(self->mObjectStack);
}

- (id)tableState
{
  return self->mTableState;
}

- (void)setTableState:(id)a3
{
  id v5 = a3;

  self->mTableState = (GQSTable *)a3;
}

- (id)generatorState
{
  return self->mGeneratorState;
}

- (void)setGeneratorState:(id)a3
{
  id v5 = a3;

  self->mGeneratorState = a3;
}

- (Class)currentDrawablesGenerator
{
  return self->mCurrentDrawablesGenerator;
}

- (void)setCurrentDrawablesGenerator:(Class)a3
{
  self->mCurrentDrawablesGenerator = a3;
}

- (Class)currentTableGenerator
{
  return self->mCurrentTableGenerator;
}

- (void)setCurrentTableGenerator:(Class)a3
{
  self->mCurrentTableGenerator = a3;
}

- (BOOL)mustRegisterDrawables
{
  return self->mMustRegisterDrawables;
}

- (void)setMustRegisterDrawables:(BOOL)a3
{
  self->mMustRegisterDrawables = a3;
}

- (BOOL)shouldStreamTables
{
  return self->mShouldStreamTables;
}

- (void)setShouldStreamTables:(BOOL)a3
{
  self->mShouldStreamTables = a3;
}

- (BOOL)doExternalTextWrap
{
  return self->mDoExternalTextWrap;
}

- (void)setDoExternalTextWrap:(BOOL)a3
{
  self->mDoExternalTextWrap = a3;
}

- (BOOL)generatorBeginWasCalled
{
  return self->mGeneratorBeginWasCalled;
}

- (void)setGeneratorBeginWasCalled
{
  self->mGeneratorBeginWasCalled = 1;
}

- (BOOL)isGeneratingThumbnail
{
  return self->mGeneratingThumbnail;
}

- (void)setGeneratingThumbnail:(BOOL)a3
{
  self->mGeneratingThumbnail = a3;
}

- (BOOL)isThumbnailGenerationDone
{
  return self->mThumbnailGenerationDone;
}

- (void)setThumbnailGenerationDone:(BOOL)a3
{
  self->mThumbnailGenerationDone = a3;
}

- (void)addWrapPoint:(id)a3
{
  mWrapPoints = (uint64_t **)self->mWrapPoints;
  id v5 = a3;
  id v4 = a3;
  sub_A038(mWrapPoints, &v5, &v5);
}

- (const)wrapPoints
{
  return self->mWrapPoints;
}

- (void)createListOfWrapPointsAlongY:(float)a3 minX:(float)a4 maxX:(float)a5 zIndex:(int)a6
{
}

- (void)clearWrapPoints
{
  mWrapPoints = (char *)self->mWrapPoints;
  sub_9FBC((uint64_t)mWrapPoints, *((void **)mWrapPoints + 1));
  *(void *)mWrapPoints = mWrapPoints + 8;
  *((void *)mWrapPoints + 2) = 0;
  *((void *)mWrapPoints + 1) = 0;
}

- (__CFString)uriForBundleResource:(__CFString *)a3 ofType:(__CFString *)a4
{
  value = 0;
  CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@.%@", a3, a4);
  if (!CFDictionaryGetValueIfPresent(self->mBundleResourceUriMap, v7, (const void **)&value))
  {
    CFStringRef v8 = [+[NSBundle bundleForClass:objc_opt_class()] pathForResource:a3 ofType:a4];
    if (v8)
    {
      id v9 = v8;
      CFUUIDRef v10 = CFUUIDCreate(0);
      CFStringRef v11 = CFUUIDCreateString(0, v10);
      CFRelease(v10);
      CFStringRef v12 = CFStringCreateWithFormat(0, 0, @"bundle-%@-%@", v11, v7);
      CFRelease(v11);
      value = [(GQUOutputBundle *)self->mOutputBundle createUriForResource:v12];
      CFDictionaryAddValue(self->mBundleResourceUriMap, v7, value);
      CFRelease(value);
      id v13 = [objc_alloc((Class)NSData) initWithContentsOfFile:v9];
      [(GQUOutputBundle *)self->mOutputBundle setData:v13 mimeType:&stru_85630 forNamedResource:v12];

      CFRelease(v12);
    }
  }
  CFRelease(v7);
  return (__CFString *)value;
}

- (id)currentWrapPointGenerator
{
  return self->mCurrentWrapPointGenerator;
}

- (void)setCurrentWrapPointGenerator:(id)a3
{
  self->mCurrentWrapPointGenerator = (GQWrapPointGenerator *)a3;
}

- (id)stylesheet
{
  return self->mStylesheet;
}

- (void)setStylesheet:(id)a3
{
  id v5 = a3;

  self->mStylesheet = (GQDSStylesheet *)a3;
}

- (void)setIsReadingStorageAttachments:(BOOL)a3
{
  self->mIsReadingStorageAttachments = a3;
}

- (BOOL)isReadingStorageAttachments
{
  return self->mIsReadingStorageAttachments;
}

- (__CFString)filename
{
  return self->mFilename;
}

- (BOOL)doCalculateThumbnailSize
{
  return self->_doCalculateThumbnailSize;
}

- (void)setDoCalculateThumbnailSize:(BOOL)a3
{
  self->_doCalculateThumbnailSize = a3;
}

@end