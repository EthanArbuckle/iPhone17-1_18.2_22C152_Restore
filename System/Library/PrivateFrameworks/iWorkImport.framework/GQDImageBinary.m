@interface GQDImageBinary
- (CGSize)size;
- (__CFString)relativePath;
- (__CFURL)createAbsoluteUrlForState:(id)a3;
- (int)readDataAttributesFromReader:(_xmlTextReader *)a3;
- (int)resourceType;
- (void)dealloc;
@end

@implementation GQDImageBinary

- (void)dealloc
{
  mPath = self->mPath;
  if (mPath) {
    CFRelease(mPath);
  }
  mAbsoluteUrl = self->mAbsoluteUrl;
  if (mAbsoluteUrl) {
    CFRelease(mAbsoluteUrl);
  }
  v5.receiver = self;
  v5.super_class = (Class)GQDImageBinary;
  [(GQDImageBinary *)&v5 dealloc];
}

- (CGSize)size
{
  double width = self->mSize.width;
  double height = self->mSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (__CFURL)createAbsoluteUrlForState:(id)a3
{
  mAbsoluteUrl = self->mAbsoluteUrl;
  if (!mAbsoluteUrl)
  {
    mPath = self->mPath;
    if (mPath)
    {
      int mResourceType = self->mResourceType;
      if (mResourceType == 1)
      {
        mAbsoluteUrl = (__CFURL *)objc_msgSend(a3, "createUrlToAppBundleResource:processorBundle:skipCachingPDFAndNoExtentionResources:", mPath, objc_msgSend(objc_msgSend(a3, "processor"), "bundle"), 0);
      }
      else
      {
        if (mResourceType) {
          return 0;
        }
        mAbsoluteUrl = (__CFURL *)[a3 createUriToDocumentBundleResource:self->mPath];
      }
      self->mAbsoluteUrl = mAbsoluteUrl;
      if (mAbsoluteUrl) {
        goto LABEL_2;
      }
    }
    return 0;
  }
LABEL_2:
  return (__CFURL *)CFRetain(mAbsoluteUrl);
}

- (int)resourceType
{
  return self->mResourceType;
}

- (__CFString)relativePath
{
  return self->mPath;
}

- (int)readDataAttributesFromReader:(_xmlTextReader *)a3
{
  self->mPath = (__CFString *)sub_4340C(a3, qword_A35E8, (xmlChar *)"path");
  self->int mResourceType = sub_42F04(a3, qword_A35E8, (xmlChar *)"resource-type", 0);
  return 1;
}

@end