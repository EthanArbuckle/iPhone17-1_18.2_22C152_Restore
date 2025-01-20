@interface TabOverviewItem
+ (id)placeholderItem;
- (BOOL)closing;
- (BOOL)incoming;
- (BOOL)isAlternateItem;
- (BOOL)isPinned;
- (BOOL)isPlaceholder;
- (BOOL)isRecording;
- (BOOL)isUnread;
- (NSArray)shareParticipants;
- (NSString)title;
- (NSUUID)UUID;
- (TabOverviewItem)initWithUUID:(id)a3;
- (UIImage)icon;
- (_SFBarTheme)cachedTopBarTheme;
- (id)layoutInfo;
- (id)tabOverview;
- (int64_t)dragState;
- (uint64_t)setClosing:(uint64_t)result;
- (uint64_t)setIncoming:(uint64_t)result;
- (uint64_t)setIsAlternateItem:(uint64_t)result;
- (unint64_t)mediaStateIcon;
- (void)setCachedTopBarTheme:(id)a3;
- (void)setDragState:(int64_t)a3;
- (void)setIcon:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setPinned:(BOOL)a3;
- (void)setShareParticipants:(id)a3;
- (void)setTabOverview:(uint64_t)a1;
- (void)setTitle:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUnread:(BOOL)a3;
@end

@implementation TabOverviewItem

- (void)setTitle:(id)a3
{
  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_title != v4)
  {
    v9 = v4;
    BOOL v6 = -[NSString isEqualToString:](v4, "isEqualToString:");
    v5 = v9;
    if (!v6)
    {
      v7 = (NSString *)[(NSString *)v9 copy];
      title = self->_title;
      self->_title = v7;

      -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
      v5 = v9;
    }
  }
}

- (void)setIcon:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
  }
}

- (void)setPinned:(BOOL)a3
{
  if (self->_pinned != a3)
  {
    self->_pinned = a3;
    -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
  }
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
  }
}

- (TabOverviewItem)initWithUUID:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TabOverviewItem;
  BOOL v6 = [(TabOverviewItem *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_UUID, a3);
    shareParticipants = v7->_shareParticipants;
    v7->_shareParticipants = (NSArray *)MEMORY[0x1E4F1CBF0];

    v9 = v7;
  }

  return v7;
}

+ (id)placeholderItem
{
  id v2 = objc_alloc((Class)a1);
  v3 = [MEMORY[0x1E4F29128] UUID];
  v4 = (void *)[v2 initWithUUID:v3];

  [v4 setIsPlaceholder:1];
  return v4;
}

- (void)setTabOverview:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    id obj = v3;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));

    id v3 = obj;
    if (WeakRetained != obj)
    {
      objc_storeWeak((id *)(a1 + 80), obj);
      if (obj)
      {
        id v5 = -[TabOverviewItemLayoutInfo initWithTabOverview:item:]((id *)[TabOverviewItemLayoutInfo alloc], obj, (void *)a1);
        BOOL v6 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = v5;
      }
      else
      {
        BOOL v6 = *(void **)(a1 + 72);
        *(void *)(a1 + 72) = 0;
      }

      id v3 = obj;
    }
  }
}

- (id)layoutInfo
{
  if (a1)
  {
    a1 = (id *)a1[9];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (BOOL)isRecording
{
  return self->_mediaStateIcon != 0;
}

- (void)setUnread:(BOOL)a3
{
  if (self->_unread != a3)
  {
    self->_unread = a3;
    -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
  }
}

- (void)setShareParticipants:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_shareParticipants, "isEqualToArray:"))
  {
    v4 = (NSArray *)[v6 copy];
    shareParticipants = self->_shareParticipants;
    self->_shareParticipants = v4;

    -[TabOverviewItemLayoutInfo updateItemView]((uint64_t)self->_layoutInfo);
  }
}

- (_SFBarTheme)cachedTopBarTheme
{
  return self->_cachedTopBarTheme;
}

- (void)setCachedTopBarTheme:(id)a3
{
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  self->_isPlaceholder = a3;
}

- (NSString)title
{
  return self->_title;
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

- (void)setUUID:(id)a3
{
}

- (int64_t)dragState
{
  return self->_dragState;
}

- (void)setDragState:(int64_t)a3
{
  self->_dragState = a3;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (BOOL)closing
{
  if (result) {
    return *(unsigned char *)(result + 11) != 0;
  }
  return result;
}

- (uint64_t)setClosing:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 11) = a2;
  }
  return result;
}

- (BOOL)incoming
{
  if (result) {
    return *(unsigned char *)(result + 12) != 0;
  }
  return result;
}

- (uint64_t)setIncoming:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 12) = a2;
  }
  return result;
}

- (BOOL)isAlternateItem
{
  if (result) {
    return *(unsigned char *)(result + 13) != 0;
  }
  return result;
}

- (uint64_t)setIsAlternateItem:(uint64_t)result
{
  if (result) {
    *(unsigned char *)(result + 13) = a2;
  }
  return result;
}

- (id)tabOverview
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 10);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropPreviewLayoutInfo, 0);
  objc_destroyWeak((id *)&self->_tabOverview);
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_cachedTopBarTheme, 0);
}

@end