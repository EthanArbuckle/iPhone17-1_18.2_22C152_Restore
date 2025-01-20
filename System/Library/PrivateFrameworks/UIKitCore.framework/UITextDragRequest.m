@interface UITextDragRequest
- (BOOL)isSelected;
- (NSArray)existingItems;
- (NSArray)suggestedItems;
- (UIDragSession)dragSession;
- (UITextDragRequest)initWithRange:(id)a3 inSession:(id)a4;
- (UITextRange)dragRange;
- (void)setSelected:(BOOL)a3;
- (void)setSuggestedItems:(id)a3;
@end

@implementation UITextDragRequest

- (UITextDragRequest)initWithRange:(id)a3 inSession:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UITextDragRequest;
  v9 = [(UITextDragRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_dragRange, a3);
    objc_storeStrong((id *)&v10->_dragSession, a4);
    uint64_t v11 = [v8 items];
    existingItems = v10->_existingItems;
    v10->_existingItems = (NSArray *)v11;
  }
  return v10;
}

- (UITextRange)dragRange
{
  return self->_dragRange;
}

- (NSArray)existingItems
{
  return self->_existingItems;
}

- (UIDragSession)dragSession
{
  return self->_dragSession;
}

- (NSArray)suggestedItems
{
  return self->_suggestedItems;
}

- (void)setSuggestedItems:(id)a3
{
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedItems, 0);
  objc_storeStrong((id *)&self->_dragSession, 0);
  objc_storeStrong((id *)&self->_existingItems, 0);
  objc_storeStrong((id *)&self->_dragRange, 0);
}

@end