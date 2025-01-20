@interface TabDocumentCollectionItem
+ (id)placeholderItem;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPinned;
- (BOOL)isPlaceholder;
- (NSString)description;
- (NSString)title;
- (NSUUID)UUID;
- (TabDocumentCollectionItem)init;
- (UIImage)icon;
- (int64_t)dragState;
- (unint64_t)hash;
- (unint64_t)mediaStateIcon;
- (void)addTabCollectionItemObserver:(id)a3;
- (void)removeTabCollectionItemObserver:(id)a3;
- (void)setDragState:(int64_t)a3;
- (void)setIcon:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setPinned:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation TabDocumentCollectionItem

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v5 = (NSString *)[v4 copy];
    title = self->_title;
    self->_title = v5;

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    v7 = self->_observers;
    uint64_t v8 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v12, "tabCollectionItemDidChangeTitle:", self, (void)v13);
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [(NSHashTable *)v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
}

- (void)setUUID:(id)a3
{
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  self->_mediaStateIcon = a3;
}

- (TabDocumentCollectionItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)TabDocumentCollectionItem;
  v2 = [(TabDocumentCollectionItem *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = v2;
  }

  return v2;
}

- (void)setIcon:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    v6 = self->_observers;
    uint64_t v7 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v11, "tabCollectionItemDidChangeIcon:", self, (void)v12);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSHashTable *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

+ (id)placeholderItem
{
  id v2 = objc_alloc_init((Class)a1);
  uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
  [v2 setUUID:v3];

  [v2 setIsPlaceholder:1];
  return v2;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_UUID hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TabDocumentCollectionItem *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [(TabDocumentCollectionItem *)v4 UUID];
      char v6 = WBSIsEqual();
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void)addTabCollectionItemObserver:(id)a3
{
}

- (void)removeTabCollectionItemObserver:(id)a3
{
}

- (NSString)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  char v6 = [v3 stringWithFormat:@"<%@ %p: UUID = %@ title = %@>", v5, self, self->_UUID, self->_title];;

  return (NSString *)v6;
}

- (UIImage)icon
{
  return self->_icon;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (int64_t)dragState
{
  return self->_dragState;
}

- (void)setDragState:(int64_t)a3
{
  self->_dragState = a3;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end