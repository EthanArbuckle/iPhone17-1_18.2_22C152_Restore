@interface TVOpenInMusicView
- (_TtC9SeymourUI17TVOpenInMusicView)initWithCoder:(id)a3;
- (_TtC9SeymourUI17TVOpenInMusicView)initWithFrame:(CGRect)a3;
- (void)applyLayoutAttributes:(id)a3;
- (void)openInMusicPressed:(id)a3;
- (void)prepareForReuse;
@end

@implementation TVOpenInMusicView

- (_TtC9SeymourUI17TVOpenInMusicView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17TVOpenInMusicView *)sub_23A2A09C8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17TVOpenInMusicView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A2A1780();
}

- (void)applyLayoutAttributes:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0F400);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (objc_class *)type metadata accessor for TVOpenInMusicView();
  v15.receiver = self;
  v15.super_class = v8;
  id v9 = a3;
  v10 = self;
  [(TVOpenInMusicView *)&v15 applyLayoutAttributes:v9];
  id v11 = objc_msgSend(v9, sel_indexPath);
  sub_23A7F6AA8();

  uint64_t v12 = sub_23A7F6B08();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v7, 0, 1, v12);
  uint64_t v13 = (uint64_t)v10 + OBJC_IVAR____TtC9SeymourUI17TVOpenInMusicView_indexPath;
  swift_beginAccess();
  sub_239C24600((uint64_t)v7, v13);
  swift_endAccess();
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for TVOpenInMusicView();
  v2 = (char *)v4.receiver;
  [(TVOpenInMusicView *)&v4 prepareForReuse];
  id v3 = &v2[OBJC_IVAR____TtC9SeymourUI17TVOpenInMusicView_shelf];
  *(void *)id v3 = 0;
  *((void *)v3 + 1) = 0;

  swift_unknownObjectRelease();
}

- (void)openInMusicPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_23A2A1958();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI17TVOpenInMusicView_delegate);
  swift_unknownObjectRelease();

  sub_239C9D7E8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI17TVOpenInMusicView_indexPath);
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI17TVOpenInMusicView_focusGuide);
}

@end