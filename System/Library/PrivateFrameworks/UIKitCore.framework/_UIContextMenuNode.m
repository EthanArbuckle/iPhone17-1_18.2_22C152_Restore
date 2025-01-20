@interface _UIContextMenuNode
- (BOOL)leftOfParentWhenCascading;
- (UIMenu)menu;
- (_UIContextMenuListView)listView;
- (_UIContextMenuNode)next;
- (_UIContextMenuNode)previous;
- (id)description;
- (void)setLeftOfParentWhenCascading:(BOOL)a3;
- (void)setListView:(id)a3;
- (void)setMenu:(id)a3;
- (void)setNext:(id)a3;
- (void)setPrevious:(id)a3;
@end

@implementation _UIContextMenuNode

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p", objc_opt_class(), self];
  v4 = [(_UIContextMenuNode *)self listView];
  [v4 frame];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;

  objc_msgSend(v3, "appendFormat:", @"; rect = (%g %g; %g %g)", v6, v8, v10, v12);
  [v3 appendString:@">"];
  return v3;
}

- (_UIContextMenuListView)listView
{
  return self->_listView;
}

- (void)setListView:(id)a3
{
}

- (UIMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (_UIContextMenuNode)previous
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previous);
  return (_UIContextMenuNode *)WeakRetained;
}

- (void)setPrevious:(id)a3
{
}

- (_UIContextMenuNode)next
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_next);
  return (_UIContextMenuNode *)WeakRetained;
}

- (void)setNext:(id)a3
{
}

- (BOOL)leftOfParentWhenCascading
{
  return self->_leftOfParentWhenCascading;
}

- (void)setLeftOfParentWhenCascading:(BOOL)a3
{
  self->_leftOfParentWhenCascading = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_next);
  objc_destroyWeak((id *)&self->_previous);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_listView, 0);
}

@end