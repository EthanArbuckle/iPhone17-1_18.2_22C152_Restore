@interface TabBarItem
+ (id)placeholderItem;
- (BOOL)isActive;
- (BOOL)isPinned;
- (BOOL)isPlaceholder;
- (BOOL)isUnread;
- (NSArray)shareParticipants;
- (NSString)title;
- (NSUUID)UUID;
- (TabBar)tabBar;
- (TabBarItem)init;
- (TabBarItemLayoutInfo)layoutInfo;
- (UIImage)icon;
- (id)menuElementRepresentationWithSelectionHandler:(id)a3;
- (int64_t)dragState;
- (unint64_t)mediaStateIcon;
- (void)setActive:(BOOL)a3;
- (void)setDragState:(int64_t)a3;
- (void)setIcon:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setLayoutInfo:(id)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setPinned:(BOOL)a3;
- (void)setShareParticipants:(id)a3;
- (void)setTabBar:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUUID:(id)a3;
- (void)setUnread:(BOOL)a3;
@end

@implementation TabBarItem

- (BOOL)isPinned
{
  return self->_pinned;
}

- (NSUUID)UUID
{
  return self->_UUID;
}

- (int64_t)dragState
{
  return self->_dragState;
}

- (void)setTitle:(id)a3
{
  if (self->_title != a3)
  {
    v4 = (NSString *)[a3 copy];
    title = self->_title;
    self->_title = v4;

    layoutInfo = self->_layoutInfo;
    [(TabBarItemLayoutInfo *)layoutInfo itemDidUpdateTitle];
  }
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (TabBarItemLayoutInfo)layoutInfo
{
  return self->_layoutInfo;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setTabBar:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_tabBar, obj);
    if (obj)
    {
      v6 = [[TabBarItemLayoutInfo alloc] initWithTabBar:obj item:self];
      layoutInfo = self->_layoutInfo;
      self->_layoutInfo = v6;
    }
    else
    {
      layoutInfo = self->_layoutInfo;
      self->_layoutInfo = 0;
    }

    v5 = obj;
  }
}

- (NSArray)shareParticipants
{
  return self->_shareParticipants;
}

- (unint64_t)mediaStateIcon
{
  return self->_mediaStateIcon;
}

- (BOOL)isUnread
{
  return self->_unread;
}

- (void)setUUID:(id)a3
{
}

- (TabBarItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)TabBarItem;
  v2 = [(TabBarItem *)&v7 init];
  v3 = v2;
  if (v2)
  {
    shareParticipants = v2->_shareParticipants;
    v2->_shareParticipants = (NSArray *)MEMORY[0x1E4F1CBF0];

    v5 = v3;
  }

  return v3;
}

- (void)setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    [(TabBarItemLayoutInfo *)self->_layoutInfo itemDidUpdateIsActive];
  }
}

- (void)setIcon:(id)a3
{
  id v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_icon, a3);
    [(TabBarItemLayoutInfo *)self->_layoutInfo itemDidUpdateIcon];
  }
}

- (UIImage)icon
{
  return self->_icon;
}

+ (id)placeholderItem
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x1E4F29128] UUID];
  [v2 setUUID:v3];

  [v2 setIsPlaceholder:1];
  return v2;
}

- (void)setIsPlaceholder:(BOOL)a3
{
  if (self->_isPlaceholder != a3)
  {
    self->_isPlaceholder = a3;
    [(TabBarItemLayoutInfo *)self->_layoutInfo itemDidUpdateIsPlaceholder];
  }
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  if (self->_mediaStateIcon != a3)
  {
    self->_mediaStateIcon = a3;
    [(TabBarItemLayoutInfo *)self->_layoutInfo itemDidUpdateMediaState];
  }
}

- (void)setPinned:(BOOL)a3
{
  if (self->_pinned != a3)
  {
    self->_pinned = a3;
    [(TabBarItemLayoutInfo *)self->_layoutInfo itemDidUpdateIsPinned];
  }
}

- (id)menuElementRepresentationWithSelectionHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4FB13F0];
  title = self->_title;
  icon = self->_icon;
  v8 = icon;
  if (!icon)
  {
    v8 = [MEMORY[0x1E4F78580] fallbackFavicon];
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__TabBarItem_menuElementRepresentationWithSelectionHandler___block_invoke;
  v12[3] = &unk_1E6D7C190;
  v12[4] = self;
  id v13 = v4;
  id v9 = v4;
  v10 = [v5 actionWithTitle:title image:v8 identifier:0 handler:v12];

  if (!icon) {
  return v10;
  }
}

uint64_t __60__TabBarItem_menuElementRepresentationWithSelectionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setUnread:(BOOL)a3
{
  if (self->_unread != a3)
  {
    self->_unread = a3;
    [(TabBarItemLayoutInfo *)self->_layoutInfo itemDidUpdateIsUnread];
  }
}

- (void)setShareParticipants:(id)a3
{
  id v6 = a3;
  if (!-[NSArray isEqualToArray:](self->_shareParticipants, "isEqualToArray:"))
  {
    id v4 = (NSArray *)[v6 copy];
    shareParticipants = self->_shareParticipants;
    self->_shareParticipants = v4;

    [(TabBarItemLayoutInfo *)self->_layoutInfo itemDidUpdateShareParticipants];
  }
}

- (void)setDragState:(int64_t)a3
{
  self->_dragState = a3;
}

- (TabBar)tabBar
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tabBar);
  return (TabBar *)WeakRetained;
}

- (void)setLayoutInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_layoutInfo, 0);
  objc_destroyWeak((id *)&self->_tabBar);
  objc_storeStrong((id *)&self->_shareParticipants, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end