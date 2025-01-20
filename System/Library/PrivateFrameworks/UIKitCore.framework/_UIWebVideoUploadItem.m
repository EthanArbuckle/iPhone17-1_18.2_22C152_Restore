@interface _UIWebVideoUploadItem
- (BOOL)isVideo;
- (id)displayImage;
@end

@implementation _UIWebVideoUploadItem

- (id)displayImage
{
  v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", -[_UIWebFileUploadItem filePath](self, "filePath"));
  return iconForVideoFile(v2);
}

- (BOOL)isVideo
{
  return 1;
}

@end