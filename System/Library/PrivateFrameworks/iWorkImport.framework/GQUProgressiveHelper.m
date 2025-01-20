@interface GQUProgressiveHelper
- (BOOL)previewHasStreamedMainHTML;
- (BOOL)progressiveStreamStarted;
- (GQUProgressiveHelper)initWithClient:(const void *)a3 andCallbacks:(id *)a4;
- (__CFString)getNumbersSheetUri;
- (__CFURL)createAttachment:(__CFString *)a3 options:(__CFDictionary *)a4;
- (float)getPreviewHeight;
- (float)getPreviewWidth;
- (void)appendDataToAttachment:(__CFURL *)a3 chunk:(__CFData *)a4;
- (void)closeAttachment:(__CFURL *)a3;
- (void)dealloc;
- (void)displayGenericError:(__CFError *)a3;
- (void)setNumbersSheetUri:(__CFString *)a3;
- (void)setPreviewHeight:(float)a3 andWidth:(float)a4;
- (void)startDataWithOptions:(__CFDictionary *)a3;
@end

@implementation GQUProgressiveHelper

- (GQUProgressiveHelper)initWithClient:(const void *)a3 andCallbacks:(id *)a4
{
  v9.receiver = self;
  v9.super_class = (Class)GQUProgressiveHelper;
  v6 = [(GQUProgressiveHelper *)&v9 init];
  v7 = v6;
  if (v6)
  {
    if (a3 && a4)
    {
      v6->mClient = a3;
      v6->mCallBacks = a4;
      v6->mStartedMainHTML = 0;
    }
    else
    {
    }
  }
  return v7;
}

- (void)dealloc
{
  mNumbersSheetUri = self->mNumbersSheetUri;
  if (mNumbersSheetUri) {
    CFRelease(mNumbersSheetUri);
  }
  v4.receiver = self;
  v4.super_class = (Class)GQUProgressiveHelper;
  [(GQUProgressiveHelper *)&v4 dealloc];
}

- (void)startDataWithOptions:(__CFDictionary *)a3
{
  if (!self->started)
  {
    ((void (*)(const void *, const CFStringRef, __CFDictionary *))self->mCallBacks->var0)(self->mClient, kUTTypeHTML, a3);
    self->started = 1;
  }
}

- (BOOL)progressiveStreamStarted
{
  return self->started != 0;
}

- (__CFURL)createAttachment:(__CFString *)a3 options:(__CFDictionary *)a4
{
  return (__CFURL *)((uint64_t (*)(const void *, __CFString *, __CFDictionary *))self->mCallBacks->var1)(self->mClient, a3, a4);
}

- (void)appendDataToAttachment:(__CFURL *)a3 chunk:(__CFData *)a4
{
  self->mStartedMainHTML = 1;
  if (((unsigned int (*)(const void *, SEL))self->mCallBacks->var3)(self->mClient, a2))
  {
    mClient = self->mClient;
    var2 = (void (*)(const void *, __CFURL *, __CFData *, void))self->mCallBacks->var2;
    var2(mClient, a3, a4, 0);
  }
  else
  {
    sub_3AC08();
  }
}

- (void)closeAttachment:(__CFURL *)a3
{
}

- (void)setNumbersSheetUri:(__CFString *)a3
{
  mNumbersSheetUri = self->mNumbersSheetUri;
  if (mNumbersSheetUri)
  {
    CFRelease(mNumbersSheetUri);
    self->mNumbersSheetUri = 0;
  }
  if (a3) {
    self->mNumbersSheetUri = (__CFString *)CFRetain(a3);
  }
}

- (__CFString)getNumbersSheetUri
{
  return self->mNumbersSheetUri;
}

- (void)setPreviewHeight:(float)a3 andWidth:(float)a4
{
  self->mPreviewHeight = a3;
  self->mPreviewWidth = a4;
}

- (float)getPreviewWidth
{
  return self->mPreviewWidth;
}

- (float)getPreviewHeight
{
  return self->mPreviewHeight;
}

- (void)displayGenericError:(__CFError *)a3
{
}

- (BOOL)previewHasStreamedMainHTML
{
  return self->mStartedMainHTML;
}

@end