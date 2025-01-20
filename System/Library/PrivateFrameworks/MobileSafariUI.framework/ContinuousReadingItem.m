@interface ContinuousReadingItem
+ (ContinuousReadingItem)itemWithReadingListItem:(id)a3;
+ (id)keyPathsForValuesAffectingValueForKey:(id)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)previewText;
- (NSString)title;
- (NSURL)URL;
- (WebBookmark)readingListBookmark;
- (id)_initWithReadingListItem:(id)a3;
- (id)_siteNameForReadingListItem;
- (unint64_t)hash;
- (void)_readingListItemDidUpdate:(id)a3;
- (void)_setReadingListBookmark:(id)a3;
- (void)dealloc;
@end

@implementation ContinuousReadingItem

+ (ContinuousReadingItem)itemWithReadingListItem:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) _initWithReadingListItem:v4];

  return (ContinuousReadingItem *)v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ContinuousReadingItem;
  [(ContinuousReadingItem *)&v4 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  objc_super v4 = (ContinuousReadingItem *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(ContinuousReadingItem *)self readingListBookmark];
      int v7 = [v6 identifier];
      v8 = [(ContinuousReadingItem *)v5 readingListBookmark];

      BOOL v9 = v7 == [v8 identifier];
    }
    else
    {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(ContinuousReadingItem *)self readingListBookmark];
  unint64_t v3 = (int)[v2 identifier];

  return v3;
}

+ (id)keyPathsForValuesAffectingValueForKey:(id)a3
{
  id v4 = a3;
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ContinuousReadingItem;
  v5 = objc_msgSendSuper2(&v9, sel_keyPathsForValuesAffectingValueForKey_, v4);
  v6 = (void *)keyPathsForValuesAffectingValueForKey__derivedKeys;
  if (!keyPathsForValuesAffectingValueForKey__derivedKeys)
  {
    keyPathsForValuesAffectingValueForKey__derivedKeys = (uint64_t)&unk_1F3C73F50;

    v6 = &unk_1F3C73F50;
  }
  if ([v6 containsObject:v4])
  {
    uint64_t v7 = [v5 setByAddingObject:@"readingListBookmark"];

    v5 = (void *)v7;
  }

  return v5;
}

- (NSString)title
{
  v2 = [(ContinuousReadingItem *)self readingListBookmark];
  unint64_t v3 = [v2 title];

  return (NSString *)v3;
}

- (NSString)previewText
{
  v2 = [(ContinuousReadingItem *)self readingListBookmark];
  unint64_t v3 = [v2 previewText];

  return (NSString *)v3;
}

- (NSURL)URL
{
  v2 = [(ContinuousReadingItem *)self readingListBookmark];
  unint64_t v3 = -[WebBookmark safari_bestCurrentURL](v2);

  return (NSURL *)v3;
}

- (id)_siteNameForReadingListItem
{
  v2 = [(ContinuousReadingItem *)self readingListBookmark];
  unint64_t v3 = [v2 address];
  id v4 = objc_msgSend(v3, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 511, 1, 0);

  return v4;
}

- (id)_initWithReadingListItem:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ContinuousReadingItem;
  v6 = [(ContinuousReadingItem *)&v11 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_readingListBookmark, a3);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:v7 selector:sel__readingListItemDidUpdate_ name:@"ReadingListBookmarkDidUpdateNotification" object:0];

    objc_super v9 = v7;
  }

  return v7;
}

- (void)_readingListItemDidUpdate:(id)a3
{
  id v7 = [a3 object];
  int v4 = [v7 identifier];
  id v5 = [(ContinuousReadingItem *)self readingListBookmark];
  int v6 = [v5 identifier];

  if (v4 == v6) {
    [(ContinuousReadingItem *)self _setReadingListBookmark:v7];
  }
}

- (WebBookmark)readingListBookmark
{
  return self->_readingListBookmark;
}

- (void)_setReadingListBookmark:(id)a3
{
}

- (void).cxx_destruct
{
}

@end