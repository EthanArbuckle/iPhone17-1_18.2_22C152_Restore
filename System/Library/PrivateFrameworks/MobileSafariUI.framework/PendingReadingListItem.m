@interface PendingReadingListItem
+ (id)itemWithBookmark:(id)a3 provider:(id)a4;
- (ReadingListMetadataProvider)provider;
- (WebBookmark)bookmark;
@end

@implementation PendingReadingListItem

+ (id)itemWithBookmark:(id)a3 provider:(id)a4
{
  v5 = (WebBookmark *)a3;
  v6 = (ReadingListMetadataProvider *)a4;
  v7 = objc_alloc_init(PendingReadingListItem);
  bookmark = v7->_bookmark;
  v7->_bookmark = v5;
  v9 = v5;

  provider = v7->_provider;
  v7->_provider = v6;

  return v7;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (ReadingListMetadataProvider)provider
{
  return self->_provider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
}

@end