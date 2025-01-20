@interface _UIContextMenuLayoutArbiterOutput
- ($0B15E5176FD367B837238C983E599B83)menu;
- ($0B15E5176FD367B837238C983E599B83)preview;
- ($9638EFF0CCCAFE90921E224CC361F7AC)anchor;
- (CGRect)contentBounds;
- (NSMapTable)accessoryPositions;
- (unint64_t)type;
- (void)setAccessoryPositions:(id)a3;
- (void)setAnchor:(id *)a3;
- (void)setContentBounds:(CGRect)a3;
- (void)setMenu:(id *)a3;
- (void)setPreview:(id *)a3;
- (void)setType:(unint64_t)a3;
@end

@implementation _UIContextMenuLayoutArbiterOutput

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (CGRect)contentBounds
{
  double x = self->_contentBounds.origin.x;
  double y = self->_contentBounds.origin.y;
  double width = self->_contentBounds.size.width;
  double height = self->_contentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setContentBounds:(CGRect)a3
{
  self->_contentBounds = a3;
}

- ($0B15E5176FD367B837238C983E599B83)preview
{
  long long v3 = *(_OWORD *)&self[1].var1.z;
  *(_OWORD *)&retstr->var2.double y = *(_OWORD *)&self[1].var1.x;
  *(_OWORD *)&retstr->var3.b = v3;
  long long v4 = *(_OWORD *)&self[1].var3.b;
  *(_OWORD *)&retstr->var3.d = *(_OWORD *)&self[1].var2.y;
  *(_OWORD *)&retstr->var3.tdouble y = v4;
  CGSize v5 = *(CGSize *)&self->var3.ty;
  retstr->var0.origin = *(CGPoint *)&self->var3.d;
  retstr->var0.CGSize size = v5;
  CGSize size = self[1].var0.size;
  *(CGPoint *)&retstr->var1.double x = self[1].var0.origin;
  *(CGSize *)&retstr->var1.z = size;
  return self;
}

- (void)setPreview:(id *)a3
{
  CGPoint origin = a3->var0.origin;
  CGSize size = a3->var0.size;
  long long v5 = *(_OWORD *)&a3->var1.z;
  *(_OWORD *)&self->_preview.center.double x = *(_OWORD *)&a3->var1.x;
  *(_OWORD *)&self->_preview.center.z = v5;
  self->_preview.bounds.CGPoint origin = origin;
  self->_preview.bounds.CGSize size = size;
  long long v6 = *(_OWORD *)&a3->var2.y;
  long long v7 = *(_OWORD *)&a3->var3.b;
  long long v8 = *(_OWORD *)&a3->var3.ty;
  *(_OWORD *)&self->_preview.transform.d = *(_OWORD *)&a3->var3.d;
  *(_OWORD *)&self->_preview.transform.tdouble y = v8;
  *(_OWORD *)&self->_preview.anchorPoint.double y = v6;
  *(_OWORD *)&self->_preview.transform.b = v7;
}

- ($0B15E5176FD367B837238C983E599B83)menu
{
  long long v3 = *(_OWORD *)&self[2].var1.z;
  *(_OWORD *)&retstr->var2.double y = *(_OWORD *)&self[2].var1.x;
  *(_OWORD *)&retstr->var3.b = v3;
  long long v4 = *(_OWORD *)&self[2].var3.b;
  *(_OWORD *)&retstr->var3.d = *(_OWORD *)&self[2].var2.y;
  *(_OWORD *)&retstr->var3.tdouble y = v4;
  CGSize v5 = *(CGSize *)&self[1].var3.ty;
  retstr->var0.CGPoint origin = *(CGPoint *)&self[1].var3.d;
  retstr->var0.CGSize size = v5;
  CGSize size = self[2].var0.size;
  *(CGPoint *)&retstr->var1.double x = self[2].var0.origin;
  *(CGSize *)&retstr->var1.z = size;
  return self;
}

- (void)setMenu:(id *)a3
{
  CGPoint origin = a3->var0.origin;
  CGSize size = a3->var0.size;
  long long v5 = *(_OWORD *)&a3->var1.z;
  *(_OWORD *)&self->_menu.center.double x = *(_OWORD *)&a3->var1.x;
  *(_OWORD *)&self->_menu.center.z = v5;
  self->_menu.bounds.CGPoint origin = origin;
  self->_menu.bounds.CGSize size = size;
  long long v6 = *(_OWORD *)&a3->var2.y;
  long long v7 = *(_OWORD *)&a3->var3.b;
  long long v8 = *(_OWORD *)&a3->var3.ty;
  *(_OWORD *)&self->_menu.transform.d = *(_OWORD *)&a3->var3.d;
  *(_OWORD *)&self->_menu.transform.tdouble y = v8;
  *(_OWORD *)&self->_menu.anchorPoint.double y = v6;
  *(_OWORD *)&self->_menu.transform.b = v7;
}

- ($9638EFF0CCCAFE90921E224CC361F7AC)anchor
{
  long long v3 = *(_OWORD *)&self[1].var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var2;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[2].var1;
  return self;
}

- (void)setAnchor:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var2;
  self->_anchor.gravitdouble y = a3->var4;
  *(_OWORD *)&self->_anchor.attachmentOffset = v4;
  *(_OWORD *)&self->_anchor.attachment = v3;
}

- (NSMapTable)accessoryPositions
{
  return self->_accessoryPositions;
}

- (void)setAccessoryPositions:(id)a3
{
}

- (void).cxx_destruct
{
}

@end