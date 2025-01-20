@interface _UIWebImageUploadItem
- (BOOL)isVideo;
- (id)displayImage;
@end

@implementation _UIWebImageUploadItem

- (id)displayImage
{
  CFURLRef v2 = (const __CFURL *)objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", -[_UIWebFileUploadItem filePath](self, "filePath"));
  return iconForImageFile(v2);
}

- (BOOL)isVideo
{
  return 0;
}

@end