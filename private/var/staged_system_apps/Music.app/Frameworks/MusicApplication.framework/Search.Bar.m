@interface Search.Bar
- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged;
- (BOOL)showsScopeBar;
- (NSArray)scopeButtonTitles;
- (NSString)placeholder;
- (NSString)text;
- (_TtCC16MusicApplication6Search3Bar)initWithCoder:(id)a3;
- (_TtCC16MusicApplication6Search3Bar)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setPlaceholder:(id)a3;
- (void)setShowsScopeBar:(BOOL)a3;
- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4;
- (void)setText:(id)a3;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation Search.Bar

- (_TtCC16MusicApplication6Search3Bar)initWithFrame:(CGRect)a3
{
  sub_2C349C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtCC16MusicApplication6Search3Bar)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2C7DD4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2C4660();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_2C47C0((uint64_t)a3);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = sub_2C495C((uint64_t)a4, x, y);

  return v10;
}

- (void)setShowsScopeBar:(BOOL)a3 animated:(BOOL)a4
{
  v6 = self;
  sub_2C4B44(a3, a4);
}

- (NSArray)scopeButtonTitles
{
  v2.super.isa = sub_AB6990().super.isa;

  return (NSArray *)v2.super.isa;
}

- (BOOL)_shouldSendContentChangedNotificationsIfOnlyMarkedTextChanged
{
  return 1;
}

- (NSString)text
{
  NSArray v2 = (char *)self + OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText;
  swift_beginAccess();
  if (*((void *)v2 + 1))
  {
    swift_bridgeObjectRetain();
    NSString v3 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_AB6510();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText);
  swift_beginAccess();
  uint64_t *v7 = v4;
  v7[1] = v6;
  id v8 = self;
  swift_bridgeObjectRelease();
  sub_2C584C();
}

- (NSString)placeholder
{
  NSArray v2 = self;
  sub_2C5420();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_AB64D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (void)setPlaceholder:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_AB6510();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v6 = 0;
  }
  v7 = (char *)self + OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText;
  swift_beginAccess();
  *((void *)v7 + 4) = v4;
  *((void *)v7 + 5) = v6;
  id v8 = self;
  swift_bridgeObjectRelease();
  sub_2C584C();
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2C584C();
}

- (void)textFieldDidBeginEditing:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2C7F58();
}

- (void)textFieldDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2C5650(v4);
}

- (BOOL)showsScopeBar
{
  return *((unsigned char *)&self->super.super.super.super.isa + OBJC_IVAR____TtCC16MusicApplication6Search3Bar__showsScopeBar);
}

- (void)setShowsScopeBar:(BOOL)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)&self->$__lazy_storage_$_impressionsTracker[OBJC_IVAR____TtCC16MusicApplication6Search3Bar_barText
                                                                + 7]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCC16MusicApplication6Search3Bar_scopeBarContentView);
}

@end