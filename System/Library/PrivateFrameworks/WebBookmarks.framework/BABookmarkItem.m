@interface BABookmarkItem
- (BABookmarkItem)initWithBookmarkCollection:(id)a3 bookmark:(id)a4;
- (WebBookmark)bookmark;
- (WebBookmarkCollection)collection;
- (id)description;
- (void)setBookmark:(id)a3;
@end

@implementation BABookmarkItem

- (BABookmarkItem)initWithBookmarkCollection:(id)a3 bookmark:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)BABookmarkItem;
  v9 = [(BABookmarkItem *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    objc_storeStrong((id *)&v10->_bookmark, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  v3 = NSString;
  if ([(WebBookmark *)self->_bookmark isFolder]) {
    v4 = "BAFolder";
  }
  else {
    v4 = "BABookmark";
  }
  uint64_t v5 = [(WebBookmark *)self->_bookmark identifier];
  v6 = [(WebBookmark *)self->_bookmark serverID];
  id v7 = objc_msgSend(v6, "wb_stringByRedactingBookmarkDAVServerID");
  objc_msgSend(v3, "stringWithFormat:", @"<%s %p; localID: %d; serverID: %@; item: %p>",
    v4,
    self,
    v5,
    v7,
  id v8 = self->_bookmark);

  return v8;
}

- (WebBookmarkCollection)collection
{
  return self->_collection;
}

- (WebBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

@end