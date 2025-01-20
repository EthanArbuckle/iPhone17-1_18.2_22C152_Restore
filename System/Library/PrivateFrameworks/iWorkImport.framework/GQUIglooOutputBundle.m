@interface GQUIglooOutputBundle
- (BOOL)setData:(__CFData *)a3 mimeType:(__CFString *)a4 forNamedResource:(__CFString *)a5;
- (BOOL)setDataForMainHtmlResource:(__CFData *)a3;
- (GQUIglooOutputBundle)init;
- (__CFData)mainHtmlData;
- (__CFDictionary)attachments;
- (__CFDictionary)createOutputDictionary;
- (__CFString)createUriForResource:(__CFString *)a3;
- (void)dealloc;
- (void)setUriPrefix:(__CFString *)a3;
@end

@implementation GQUIglooOutputBundle

- (GQUIglooOutputBundle)init
{
  v5.receiver = self;
  v5.super_class = (Class)GQUIglooOutputBundle;
  v2 = [(GQUIglooOutputBundle *)&v5 init];
  if (v2)
  {
    v2->mAttachments = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFUUIDRef v3 = CFUUIDCreate(0);
    v2->mUuidStr = (__CFString *)CFUUIDCreateString(0, v3);
    CFRelease(v3);
  }
  return v2;
}

- (void)dealloc
{
  mAttachments = self->mAttachments;
  if (mAttachments) {
    CFRelease(mAttachments);
  }
  mMainHtmlData = self->mMainHtmlData;
  if (mMainHtmlData) {
    CFRelease(mMainHtmlData);
  }
  mUriPrefix = self->mUriPrefix;
  if (mUriPrefix) {
    CFRelease(mUriPrefix);
  }
  mUuidStr = self->mUuidStr;
  if (mUuidStr) {
    CFRelease(mUuidStr);
  }
  v7.receiver = self;
  v7.super_class = (Class)GQUIglooOutputBundle;
  [(GQUIglooOutputBundle *)&v7 dealloc];
}

- (void)setUriPrefix:(__CFString *)a3
{
  CFRetain(a3);
  mUriPrefix = self->mUriPrefix;
  if (mUriPrefix) {
    CFRelease(mUriPrefix);
  }
  self->mUriPrefix = a3;
}

- (__CFString)createUriForResource:(__CFString *)a3
{
  if (qword_A4150 != -1) {
    dispatch_once(&qword_A4150, &stru_84B90);
  }
  mUriPrefix = &stru_85630;
  if (self->mUriPrefix) {
    mUriPrefix = self->mUriPrefix;
  }
  v6 = +[NSString stringWithFormat:@"%@%@-%@", mUriPrefix, self->mUuidStr, a3];
  objc_super v7 = [(NSString *)v6 stringByAddingPercentEncodingWithAllowedCharacters:qword_A4148];
  return (__CFString *)v7;
}

- (BOOL)setDataForMainHtmlResource:(__CFData *)a3
{
  self->mMainHtmlData = a3;
  CFRetain(a3);
  return 1;
}

- (BOOL)setData:(__CFData *)a3 mimeType:(__CFString *)a4 forNamedResource:(__CFString *)a5
{
  CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@-%@", a4, self->mUuidStr, a5);
  CFDictionarySetValue(self->mAttachments, v7, a3);
  CFRelease(v7);
  return 1;
}

- (__CFData)mainHtmlData
{
  return self->mMainHtmlData;
}

- (__CFDictionary)attachments
{
  return self->mAttachments;
}

- (__CFDictionary)createOutputDictionary
{
  if (!self->mMainHtmlData) {
    return 0;
  }
  Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(Mutable, off_9CBA8, self->mMainHtmlData);
  mAttachments = self->mAttachments;
  if (mAttachments) {
    CFDictionarySetValue(Mutable, off_9CBB0, mAttachments);
  }
  return Mutable;
}

@end