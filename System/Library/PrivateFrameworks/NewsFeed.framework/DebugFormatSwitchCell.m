@interface DebugFormatSwitchCell
- (_TtC8NewsFeed21DebugFormatSwitchCell)initWithCoder:(id)a3;
- (_TtC8NewsFeed21DebugFormatSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)valueChanged;
@end

@implementation DebugFormatSwitchCell

- (_TtC8NewsFeed21DebugFormatSwitchCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_1C151E62C();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC8NewsFeed21DebugFormatSwitchCell *)sub_1C09D0808(v4, v5);
}

- (_TtC8NewsFeed21DebugFormatSwitchCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_switchControl;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1CD0]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_onChangeBlock);
  void *v8 = 0;
  v8[1] = 0;

  result = (_TtC8NewsFeed21DebugFormatSwitchCell *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void)valueChanged
{
  v2 = *(void (**)(id))((char *)&self->super.super.super.super.isa
                                 + OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_onChangeBlock);
  if (v2)
  {
    v3 = *(Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_switchControl);
    uint64_t v4 = self;
    sub_1BFC648F8((uint64_t)v2);
    v2(objc_msgSend(v3, sel_isOn));
    sub_1BFC3E5C0((uint64_t)v2);
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_switchControl));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC8NewsFeed21DebugFormatSwitchCell_onChangeBlock);
  sub_1BFC3E5C0(v3);
}

@end