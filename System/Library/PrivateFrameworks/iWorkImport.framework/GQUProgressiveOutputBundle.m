@interface GQUProgressiveOutputBundle
- (BOOL)appendData:(__CFData *)a3 mimeType:(__CFString *)a4 resourceName:(__CFString *)a5;
- (BOOL)setData:(__CFData *)a3 mimeType:(__CFString *)a4 forNamedResource:(__CFString *)a5;
- (BOOL)setDataForMainHtmlResource:(__CFData *)a3;
- (GQUProgressiveOutputBundle)initWithHandler:(id)a3;
- (__CFString)createUriForResource:(__CFString *)a3;
- (__CFURL)getAttachmentURL:(__CFString *)a3 mimeType:(__CFString *)a4;
- (void)closeAttachment:(__CFString *)a3;
- (void)dealloc;
- (void)setCurrentSheetUri:(__CFString *)a3;
- (void)setDocumentSize:(CGSize)a3;
- (void)setPageElementXPath:(__CFString *)a3 withThumbnailsOnLeft:(BOOL)a4;
- (void)startProgressiveData;
@end

@implementation GQUProgressiveOutputBundle

- (GQUProgressiveOutputBundle)initWithHandler:(id)a3
{
  if (a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)GQUProgressiveOutputBundle;
    v4 = [(GQUProgressiveOutputBundle *)&v8 init];
    if (v4)
    {
      v4->mHelper = (GQUProgressiveHelper *)a3;
      v4->mAttachmentsURLs = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      v4->mQuickLookProperties = Mutable;
      CFDictionarySetValue(Mutable, kQLPreviewPropertyTextEncodingNameKey, @"UTF-8");
      CFDictionarySetValue(v4->mQuickLookProperties, kQLPreviewPropertyMIMETypeKey, @"text/html");
      CFDictionarySetValue(v4->mQuickLookProperties, @"CanHavePages", kCFBooleanTrue);
      v4->mUriScheme = @"cid";
      CFUUIDRef v6 = CFUUIDCreate(0);
      v4->mUuidStr = (__CFString *)CFUUIDCreateString(0, v6);
      CFRelease(v6);
      v4->mPreviewStarted = 0;
    }
  }
  else
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  [(GQUProgressiveHelper *)self->mHelper closeAttachment:0];

  mAttachmentsURLs = self->mAttachmentsURLs;
  if (mAttachmentsURLs) {
    CFRelease(mAttachmentsURLs);
  }
  mQuickLookProperties = self->mQuickLookProperties;
  if (mQuickLookProperties) {
    CFRelease(mQuickLookProperties);
  }
  mUuidStr = self->mUuidStr;
  if (mUuidStr) {
    CFRelease(mUuidStr);
  }
  mUriScheme = self->mUriScheme;
  if (mUriScheme) {
    CFRelease(mUriScheme);
  }
  mComputedAttachments = self->mComputedAttachments;
  if (mComputedAttachments) {
    CFRelease(mComputedAttachments);
  }
  v8.receiver = self;
  v8.super_class = (Class)GQUProgressiveOutputBundle;
  [(GQUProgressiveOutputBundle *)&v8 dealloc];
}

- (__CFString)createUriForResource:(__CFString *)a3
{
  CFStringRef v3 = CFURLGetString([(GQUProgressiveOutputBundle *)self getAttachmentURL:a3 mimeType:0]);
  return (__CFString *)CFRetain(v3);
}

- (BOOL)setDataForMainHtmlResource:(__CFData *)a3
{
  return 1;
}

- (BOOL)appendData:(__CFData *)a3 mimeType:(__CFString *)a4 resourceName:(__CFString *)a5
{
  if (self->mPreviewStarted) {
    [(GQUProgressiveHelper *)self->mHelper appendDataToAttachment:[(GQUProgressiveOutputBundle *)self getAttachmentURL:a5 mimeType:a4] chunk:a3];
  }
  return 1;
}

- (BOOL)setData:(__CFData *)a3 mimeType:(__CFString *)a4 forNamedResource:(__CFString *)a5
{
  if (self->mPreviewStarted)
  {
    v9 = [(GQUProgressiveOutputBundle *)self getAttachmentURL:a5 mimeType:a4];
    [(GQUProgressiveHelper *)self->mHelper appendDataToAttachment:v9 chunk:a3];
    [(GQUProgressiveHelper *)self->mHelper closeAttachment:v9];
  }
  else
  {
    if (!self->mComputedAttachments)
    {
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      self->mComputedAttachments = Mutable;
      CFDictionarySetValue(self->mQuickLookProperties, kQLPreviewPropertyAttachmentsKey, Mutable);
    }
    v11 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v12 = v11;
    if (a4) {
      CFDictionarySetValue(v11, kQLPreviewPropertyMIMETypeKey, a4);
    }
    CFDictionarySetValue(v12, kQLPreviewPropertyTextEncodingNameKey, @"UTF-8");
    CFDictionarySetValue(v12, kQLPreviewPropertyAttachmentDataKey, a3);
    CFStringRef v13 = CFStringCreateWithFormat(0, 0, @"%@-%@", self->mUuidStr, a5);
    CFDictionarySetValue(self->mComputedAttachments, v13, v12);
    CFRelease(v13);
    CFRelease(v12);
  }
  return 1;
}

- (void)setDocumentSize:(CGSize)a3
{
  CGFloat height = a3.height;
  double valuePtr = a3.width;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberCGFloatType, &valuePtr);
  double v9 = height;
  CFNumberRef v6 = CFNumberCreate(0, kCFNumberCGFloatType, &v9);
  HIDWORD(v7) = HIDWORD(v9);
  HIDWORD(v8) = HIDWORD(valuePtr);
  *(float *)&double v7 = v9;
  *(float *)&double v8 = valuePtr;
  [(GQUProgressiveHelper *)self->mHelper setPreviewHeight:v7 andWidth:v8];
  CFDictionarySetValue(self->mQuickLookProperties, kQLPreviewPropertyWidthKey, v5);
  CFDictionarySetValue(self->mQuickLookProperties, kQLPreviewPropertyHeightKey, v6);
  CFRelease(v6);
  CFRelease(v5);
}

- (void)setPageElementXPath:(__CFString *)a3 withThumbnailsOnLeft:(BOOL)a4
{
}

- (void)startProgressiveData
{
  self->mPreviewStarted = 1;
  [(GQUProgressiveHelper *)self->mHelper startDataWithOptions:self->mQuickLookProperties];
  mComputedAttachments = self->mComputedAttachments;
  if (mComputedAttachments)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id obj = [(__CFDictionary *)mComputedAttachments allKeys];
    id v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v4)
    {
      id v5 = v4;
      uint64_t v16 = *(void *)v18;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v18 != v16) {
            objc_enumerationMutation(obj);
          }
          double v7 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(self->mComputedAttachments, v7);
          double v9 = CFDictionaryGetValue(Value, kQLPreviewPropertyMIMETypeKey);
          v10 = CFDictionaryGetValue(Value, kQLPreviewPropertyTextEncodingNameKey);
          v11 = CFDictionaryGetValue(Value, kQLPreviewPropertyAttachmentDataKey);
          Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFStringRef v13 = Mutable;
          if (v9) {
            CFDictionarySetValue(Mutable, kQLPreviewPropertyMIMETypeKey, v9);
          }
          CFDictionarySetValue(v13, kQLPreviewPropertyTextEncodingNameKey, v10);
          v14 = -[GQUProgressiveOutputBundle getAttachmentURL:mimeType:](self, "getAttachmentURL:mimeType:", [v7 substringFromIndex:37], v9);
          [(GQUProgressiveHelper *)self->mHelper appendDataToAttachment:v14 chunk:v11];
          [(GQUProgressiveHelper *)self->mHelper closeAttachment:v14];
        }
        id v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v5);
    }
    CFRelease(self->mComputedAttachments);
    self->mComputedAttachments = 0;
  }
}

- (void)closeAttachment:(__CFString *)a3
{
  id v4 = [(GQUProgressiveOutputBundle *)self getAttachmentURL:a3 mimeType:0];
  mHelper = self->mHelper;
  [(GQUProgressiveHelper *)mHelper closeAttachment:v4];
}

- (__CFURL)getAttachmentURL:(__CFString *)a3 mimeType:(__CFString *)a4
{
  CFDictionaryRef Value = (__CFURL *)CFDictionaryGetValue(self->mAttachmentsURLs, a3);
  if (!Value)
  {
    if (CFStringCompare(a3, @"index.html", 0)) {
      CFStringRef Copy = CFStringCreateWithFormat(0, 0, @"%@-%@", self->mUuidStr, a3);
    }
    else {
      CFStringRef Copy = CFStringCreateCopy(0, a3);
    }
    CFStringRef v9 = Copy;
    Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v11 = Mutable;
    if (a4) {
      CFDictionarySetValue(Mutable, kQLPreviewPropertyMIMETypeKey, a4);
    }
    CFDictionarySetValue(v11, kQLPreviewPropertyTextEncodingNameKey, @"UTF-8");
    CFDictionaryRef Value = [(GQUProgressiveHelper *)self->mHelper createAttachment:v9 options:v11];
    CFDictionarySetValue(self->mAttachmentsURLs, a3, Value);
    CFRelease(Value);
    CFRelease(v11);
    CFRelease(v9);
  }
  return Value;
}

- (void)setCurrentSheetUri:(__CFString *)a3
{
}

@end