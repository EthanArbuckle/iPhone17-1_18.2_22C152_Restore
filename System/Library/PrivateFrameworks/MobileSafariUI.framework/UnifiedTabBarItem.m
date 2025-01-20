@interface UnifiedTabBarItem
+ (id)placeholderItem;
- (BOOL)isDragging;
- (BOOL)isDropping;
- (id)secondaryItem;
- (int64_t)dragState;
- (void)_updateHidden;
- (void)setDragState:(int64_t)a3;
- (void)setIcon:(id)a3;
- (void)setIsPlaceholder:(BOOL)a3;
- (void)setMediaStateIcon:(unint64_t)a3;
- (void)setPinned:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUUID:(id)a3;
@end

@implementation UnifiedTabBarItem

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  id v4 = a3;
  [(SFUnifiedTabBarItem *)&v5 setTitle:v4];
  -[UnifiedTabBarItem setTitle:](self->_secondaryItem, "setTitle:", v4, v5.receiver, v5.super_class);
}

- (void)setUUID:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  id v4 = a3;
  [(SFUnifiedTabBarItem *)&v5 setUUID:v4];
  -[UnifiedTabBarItem setUUID:](self->_secondaryItem, "setUUID:", v4, v5.receiver, v5.super_class);
}

- (void)setIcon:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  id v4 = a3;
  [(SFUnifiedTabBarItem *)&v5 setIcon:v4];
  -[UnifiedTabBarItem setIcon:](self->_secondaryItem, "setIcon:", v4, v5.receiver, v5.super_class);
}

+ (id)placeholderItem
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = [MEMORY[0x1E4F29128] UUID];
  [v2 setUUID:v3];

  [v2 setIsPlaceholder:1];
  return v2;
}

- (BOOL)isDragging
{
  return self->_dragState == 1;
}

- (BOOL)isDropping
{
  return (self->_dragState & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)setDragState:(int64_t)a3
{
  self->_dragState = a3;
  [(UnifiedTabBarItem *)self _updateHidden];
}

- (void)setIsPlaceholder:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  -[SFUnifiedBarItem setIsPlaceholder:](&v5, sel_setIsPlaceholder_);
  [(UnifiedTabBarItem *)self _updateHidden];
  [(UnifiedTabBarItem *)self->_secondaryItem setIsPlaceholder:v3];
}

- (void)_updateHidden
{
  BOOL v3 = [(SFUnifiedBarItem *)self isPlaceholder] || [(UnifiedTabBarItem *)self isDropping];
  [(SFUnifiedBarItem *)self setHidden:v3];
}

- (id)secondaryItem
{
  secondaryItem = self->_secondaryItem;
  if (!secondaryItem)
  {
    id v4 = objc_alloc_init(UnifiedTabBarItem);
    objc_super v5 = self->_secondaryItem;
    self->_secondaryItem = v4;

    v6 = [(SFUnifiedTabBarItem *)self icon];
    [(UnifiedTabBarItem *)self->_secondaryItem setIcon:v6];

    v7 = [(SFUnifiedTabBarItem *)self title];
    [(UnifiedTabBarItem *)self->_secondaryItem setTitle:v7];

    [(UnifiedTabBarItem *)self->_secondaryItem setMediaStateIcon:[(SFUnifiedTabBarItem *)self mediaStateIcon]];
    v8 = [(SFUnifiedTabBarItem *)self UUID];
    [(UnifiedTabBarItem *)self->_secondaryItem setUUID:v8];

    [(UnifiedTabBarItem *)self->_secondaryItem setPinned:[(SFUnifiedBarItem *)self isPinned]];
    [(UnifiedTabBarItem *)self->_secondaryItem setIsPlaceholder:[(SFUnifiedBarItem *)self isPlaceholder]];
    secondaryItem = self->_secondaryItem;
  }
  v9 = secondaryItem;
  return v9;
}

- (void)setMediaStateIcon:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  -[SFUnifiedTabBarItem setMediaStateIcon:](&v5, sel_setMediaStateIcon_);
  [(UnifiedTabBarItem *)self->_secondaryItem setMediaStateIcon:a3];
}

- (void)setPinned:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)UnifiedTabBarItem;
  -[SFUnifiedBarItem setPinned:](&v5, sel_setPinned_);
  [(UnifiedTabBarItem *)self->_secondaryItem setPinned:v3];
}

- (int64_t)dragState
{
  return self->_dragState;
}

- (void).cxx_destruct
{
}

@end