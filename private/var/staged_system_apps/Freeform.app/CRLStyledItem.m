@interface CRLStyledItem
- (BOOL)canCopyStyle;
- (BOOL)shouldForceStrokesToPencilKit;
- (CRLStroke)stroke;
- (void)_clearStrokeCache;
- (void)setStroke:(id)a3;
@end

@implementation CRLStyledItem

- (BOOL)shouldForceStrokesToPencilKit
{
  return 0;
}

- (CRLStroke)stroke
{
  v2 = self;
  v3 = (void *)sub_100BC934C();

  return (CRLStroke *)v3;
}

- (void)setStroke:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100BC9500(a3);
}

- (void)_clearStrokeCache
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform13CRLStyledItem__stroke);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform13CRLStyledItem__stroke) = 0;
}

- (BOOL)canCopyStyle
{
  return (*(unsigned __int8 (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x440))() != 6;
}

- (void).cxx_destruct
{
}

@end