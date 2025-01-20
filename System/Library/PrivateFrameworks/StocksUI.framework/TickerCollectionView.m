@interface TickerCollectionView
- (_TtC8StocksUI20TickerCollectionView)initWithCoder:(id)a3;
- (_TtC8StocksUI20TickerCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)autoScrollWithDisplayWithDisplayLink:(id)a3;
- (void)dealloc;
- (void)handleAccessibilitySettingsChangedWithNotification:(id)a3;
- (void)layoutSubviews;
@end

@implementation TickerCollectionView

- (void)autoScrollWithDisplayWithDisplayLink:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_20A7629C4(v4);
}

- (void)handleAccessibilitySettingsChangedWithNotification:(id)a3
{
  uint64_t v4 = sub_20A8C2140();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20A8C2130();
  v8 = self;
  sub_20A762830();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC8StocksUI20TickerCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return (_TtC8StocksUI20TickerCollectionView *)sub_20A762C44(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8StocksUI20TickerCollectionView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A763284();
}

- (void)dealloc
{
  v2 = self;
  sub_20A762F98();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI20TickerCollectionView_displayLink));
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(TickerCollectionView *)&v3 layoutSubviews];
  sub_20A7630A8();
}

@end