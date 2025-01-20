@interface ToolbarStyleButtonBase
- (BOOL)isAccessibilityElement;
- (_TtC5Books22ToolbarStyleButtonBase)initWithCoder:(id)a3;
- (_TtC5Books22ToolbarStyleButtonBase)initWithFrame:(CGRect)a3;
- (void)didHover:(id)a3;
@end

@implementation ToolbarStyleButtonBase

- (_TtC5Books22ToolbarStyleButtonBase)initWithFrame:(CGRect)a3
{
  return (_TtC5Books22ToolbarStyleButtonBase *)sub_1004442A8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC5Books22ToolbarStyleButtonBase)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC5Books22ToolbarStyleButtonBase_isHovering) = 0;
  id v4 = a3;

  result = (_TtC5Books22ToolbarStyleButtonBase *)sub_1007FF260();
  __break(1u);
  return result;
}

- (void)didHover:(id)a3
{
  id v4 = a3;
  v6 = self;
  v5 = (char *)[v4 state];
  if ((unint64_t)(v5 - 1) <= 3) {
    (*(void (**)(void))((swift_isaMask & (uint64_t)v6->super.super.super.super.super.isa) + 0x80))((3u >> (((_BYTE)v5 - 1) & 0xF)) & 1);
  }
}

- (BOOL)isAccessibilityElement
{
  return [(ToolbarStyleButtonBase *)self isHidden] ^ 1;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Books22ToolbarStyleButtonBase_hoverRecognizer));
}

@end