@interface _WBSBookmarkFolderTouchIconProviderRequestInfo
- (BOOL)hasScheduledCoalescedUpdate;
- (NSArray)backgroundColors;
- (NSArray)subrequests;
- (NSArray)thumbnailImages;
- (NSSet)subrequestTokens;
- (_WBSBookmarkFolderTouchIconProviderRequestInfo)init;
- (void)setBackgroundColor:(id)a3 atIndex:(unint64_t)a4;
- (void)setHasScheduledCoalescedUpdate:(BOOL)a3;
- (void)setSubrequestTokens:(id)a3;
- (void)setSubrequests:(id)a3;
- (void)setThumbnailImage:(id)a3 atIndex:(unint64_t)a4;
@end

@implementation _WBSBookmarkFolderTouchIconProviderRequestInfo

- (_WBSBookmarkFolderTouchIconProviderRequestInfo)init
{
  v9.receiver = self;
  v9.super_class = (Class)_WBSBookmarkFolderTouchIconProviderRequestInfo;
  v2 = [(_WBSBookmarkFolderTouchIconProviderRequestInfo *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
    thumbnailImages = v2->_thumbnailImages;
    v2->_thumbnailImages = (NSMutableArray *)v3;

    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    backgroundColors = v2->_backgroundColors;
    v2->_backgroundColors = (NSMutableArray *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)setThumbnailImage:(id)a3 atIndex:(unint64_t)a4
{
  thumbnailImages = self->_thumbnailImages;
  v6 = (void *)MEMORY[0x1E4F1CA98];
  id v7 = a3;
  id v8 = [v6 null];
  [(NSMutableArray *)thumbnailImages safari_setObject:v7 atIndex:a4 withPaddingObject:v8];
}

- (void)setBackgroundColor:(id)a3 atIndex:(unint64_t)a4
{
  backgroundColors = self->_backgroundColors;
  v6 = (void *)MEMORY[0x1E4F1CA98];
  id v7 = a3;
  id v8 = [v6 null];
  [(NSMutableArray *)backgroundColors safari_setObject:v7 atIndex:a4 withPaddingObject:v8];
}

- (NSArray)thumbnailImages
{
  v2 = (void *)[(NSMutableArray *)self->_thumbnailImages copy];
  return (NSArray *)v2;
}

- (NSArray)backgroundColors
{
  v2 = (void *)[(NSMutableArray *)self->_backgroundColors copy];
  return (NSArray *)v2;
}

- (NSArray)subrequests
{
  return self->_subrequests;
}

- (void)setSubrequests:(id)a3
{
}

- (NSSet)subrequestTokens
{
  return self->_subrequestTokens;
}

- (void)setSubrequestTokens:(id)a3
{
}

- (BOOL)hasScheduledCoalescedUpdate
{
  return self->_hasScheduledCoalescedUpdate;
}

- (void)setHasScheduledCoalescedUpdate:(BOOL)a3
{
  self->_hasScheduledCoalescedUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subrequestTokens, 0);
  objc_storeStrong((id *)&self->_subrequests, 0);
  objc_storeStrong((id *)&self->_backgroundColors, 0);
  objc_storeStrong((id *)&self->_thumbnailImages, 0);
}

@end