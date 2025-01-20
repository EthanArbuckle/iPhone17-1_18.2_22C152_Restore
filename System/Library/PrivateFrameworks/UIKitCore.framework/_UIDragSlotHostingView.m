@interface _UIDragSlotHostingView
- (_UIDragSlotHostingView)initWithFrame:(CGRect)a3 contentSize:(id)a4 slotID:(unsigned int)a5;
@end

@implementation _UIDragSlotHostingView

- (_UIDragSlotHostingView)initWithFrame:(CGRect)a3 contentSize:(id)a4 slotID:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  v10.receiver = self;
  v10.super_class = (Class)_UIDragSlotHostingView;
  v6 = -[UIView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.var0, a4.var1, a4.var2);
  if (v6)
  {
    v7 = [MEMORY[0x1E4F39B58] objectForSlot:v5];
    v8 = [(UIView *)v6 layer];
    [v8 setContents:v7];
  }
  return v6;
}

@end