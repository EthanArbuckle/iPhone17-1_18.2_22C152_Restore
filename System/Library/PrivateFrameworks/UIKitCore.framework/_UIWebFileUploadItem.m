@interface _UIWebFileUploadItem
- (BOOL)isVideo;
- (NSString)filePath;
- (_UIWebFileUploadItem)initWithFilePath:(id)a3;
- (id)displayImage;
- (void)dealloc;
- (void)setFilePath:(id)a3;
@end

@implementation _UIWebFileUploadItem

- (_UIWebFileUploadItem)initWithFilePath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_UIWebFileUploadItem;
  v4 = [(_UIWebFileUploadItem *)&v7 init];
  v5 = v4;
  if (v4) {
    [(_UIWebFileUploadItem *)v4 setFilePath:a3];
  }
  return v5;
}

- (void)dealloc
{
  [(_UIWebFileUploadItem *)self setFilePath:0];
  v3.receiver = self;
  v3.super_class = (Class)_UIWebFileUploadItem;
  [(_UIWebFileUploadItem *)&v3 dealloc];
}

- (id)displayImage
{
  return 0;
}

- (BOOL)isVideo
{
  return 0;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void)setFilePath:(id)a3
{
}

@end