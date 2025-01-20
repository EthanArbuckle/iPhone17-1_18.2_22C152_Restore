@interface UIKeyboardUISnapshotView
- (CGSize)intrinsicContentSize;
- (UIKeyboardUISnapshot)snapshot;
- (void)setSnapshot:(id)a3;
@end

@implementation UIKeyboardUISnapshotView

- (CGSize)intrinsicContentSize
{
  [(UIKeyboardUISnapshot *)self->_snapshot size];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setSnapshot:(id)a3
{
  v4 = (UIKeyboardUISnapshot *)a3;
  if (self->_snapshot != v4)
  {
    self->_snapshot = v4;
    v7 = v4;
    if ([(UIKeyboardUISnapshot *)v4 slotID])
    {
      v5 = objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:", -[UIKeyboardUISnapshot slotID](self->_snapshot, "slotID"));
      v6 = [(UIView *)self layer];
      [v6 setContents:v5];
    }
    else
    {
      v5 = [(UIView *)self layer];
      [v5 setContents:0];
    }

    v4 = v7;
  }
}

- (UIKeyboardUISnapshot)snapshot
{
  return self->_snapshot;
}

@end