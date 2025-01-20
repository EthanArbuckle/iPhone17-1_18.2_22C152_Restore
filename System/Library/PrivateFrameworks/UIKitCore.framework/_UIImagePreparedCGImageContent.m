@interface _UIImagePreparedCGImageContent
- (BOOL)isPreparedCGImage;
- (id)typeName;
- (void)dealloc;
@end

@implementation _UIImagePreparedCGImageContent

- (void)dealloc
{
  CARenderRelease();
  v3.receiver = self;
  v3.super_class = (Class)_UIImagePreparedCGImageContent;
  [(_UIImageCGImageContent *)&v3 dealloc];
}

- (id)typeName
{
  return @"prepared CGImage";
}

- (BOOL)isPreparedCGImage
{
  return 1;
}

@end