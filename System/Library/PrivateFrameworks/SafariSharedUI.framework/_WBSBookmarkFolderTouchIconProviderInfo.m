@interface _WBSBookmarkFolderTouchIconProviderInfo
+ (id)new;
- (NSArray)backgroundColors;
- (NSArray)thumbnailImages;
- (UIImage)touchIcon;
- (_WBSBookmarkFolderTouchIconProviderInfo)init;
- (_WBSBookmarkFolderTouchIconProviderInfo)initWithThumbnailImages:(id)a3 backgroundColors:(id)a4 touchIcon:(id)a5;
@end

@implementation _WBSBookmarkFolderTouchIconProviderInfo

- (_WBSBookmarkFolderTouchIconProviderInfo)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (_WBSBookmarkFolderTouchIconProviderInfo)initWithThumbnailImages:(id)a3 backgroundColors:(id)a4 touchIcon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)_WBSBookmarkFolderTouchIconProviderInfo;
  v11 = [(_WBSBookmarkFolderTouchIconProviderInfo *)&v18 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    thumbnailImages = v11->_thumbnailImages;
    v11->_thumbnailImages = (NSArray *)v12;

    uint64_t v14 = [v9 copy];
    backgroundColors = v11->_backgroundColors;
    v11->_backgroundColors = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_touchIcon, a5);
    v16 = v11;
  }

  return v11;
}

- (NSArray)thumbnailImages
{
  return self->_thumbnailImages;
}

- (NSArray)backgroundColors
{
  return self->_backgroundColors;
}

- (UIImage)touchIcon
{
  return self->_touchIcon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchIcon, 0);
  objc_storeStrong((id *)&self->_backgroundColors, 0);
  objc_storeStrong((id *)&self->_thumbnailImages, 0);
}

@end