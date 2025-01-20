@interface _UIContextMenuAccessoryView
- ($9638EFF0CCCAFE90921E224CC361F7AC)anchor;
- (CGPoint)offset;
- (_UIContextMenuAccessoryView)initWithFrame:(CGRect)a3 configuration:(id *)a4;
- (unint64_t)location;
- (unint64_t)trackingAxis;
- (void)setAnchor:(id *)a3;
- (void)setLocation:(unint64_t)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setTrackingAxis:(unint64_t)a3;
- (void)setVisible:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation _UIContextMenuAccessoryView

- (_UIContextMenuAccessoryView)initWithFrame:(CGRect)a3 configuration:(id *)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_UIContextMenuAccessoryView;
  v5 = -[UIView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    [(_UIContextMenuAccessoryView *)v5 setLocation:a4->var0];
    long long v7 = *(_OWORD *)&a4->var1.var2;
    v9[0] = *(_OWORD *)&a4->var1.var0;
    v9[1] = v7;
    int64_t var4 = a4->var1.var4;
    [(_UIContextMenuAccessoryView *)v6 setAnchor:v9];
    -[_UIContextMenuAccessoryView setOffset:](v6, "setOffset:", a4->var2.x, a4->var2.y);
    [(_UIContextMenuAccessoryView *)v6 setTrackingAxis:a4->var3];
  }
  return v6;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___UIContextMenuAccessoryView_setVisible_animated___block_invoke;
  v7[3] = &unk_1E52D9FC0;
  v7[4] = self;
  BOOL v8 = a3;
  v5 = _Block_copy(v7);
  v6 = v5;
  if (v4) {
    +[UIView animateWithDuration:0 delay:v5 usingSpringWithDamping:0 initialSpringVelocity:0.4 options:0.0 animations:0.7 completion:0.0];
  }
  else {
    (*((void (**)(void *))v5 + 2))(v5);
  }
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)anchor
{
  long long v3 = *(_OWORD *)&self[11].var2;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[11].var0;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->int64_t var4 = self[11].var4;
  return self;
}

- (void)setAnchor:(id *)a3
{
  int64_t var4 = a3->var4;
  long long v4 = *(_OWORD *)&a3->var2;
  *(_OWORD *)&self->_anchor.attachment = *(_OWORD *)&a3->var0;
  *(_OWORD *)&self->_anchor.attachmentOffset = v4;
  self->_anchor.gravity = var4;
}

- (CGPoint)offset
{
  double x = self->_offset.x;
  double y = self->_offset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  self->_offset = a3;
}

- (unint64_t)trackingAxis
{
  return self->_trackingAxis;
}

- (void)setTrackingAxis:(unint64_t)a3
{
  self->_trackingAxis = a3;
}

@end