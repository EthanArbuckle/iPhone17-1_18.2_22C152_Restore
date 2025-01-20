@interface RAPTextViewCollectionViewCell
+ (NSString)reuseIdentifier;
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3;
- (TextViewWithPlaceholderText)textView;
- (_TtC4Maps29RAPTextViewCollectionViewCell)initWithCoder:(id)a3;
- (_TtC4Maps29RAPTextViewCollectionViewCell)initWithFrame:(CGRect)a3;
- (_TtP4Maps37RAPTextViewCollectionViewCellDelegate_)delegate;
- (double)preferredHeight;
- (void)setDelegate:(id)a3;
- (void)textViewDidChange:(id)a3;
@end

@implementation RAPTextViewCollectionViewCell

+ (NSString)reuseIdentifier
{
  type metadata accessor for RAPTextViewCollectionViewCell();
  sub_1000FF33C(&qword_1015CE5E8);
  String.init<A>(describing:)();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (TextViewWithPlaceholderText)textView
{
  return (TextViewWithPlaceholderText *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super
                                                                                + OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_textView));
}

- (_TtP4Maps37RAPTextViewCollectionViewCellDelegate_)delegate
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP4Maps37RAPTextViewCollectionViewCellDelegate_ *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (_TtC4Maps29RAPTextViewCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v8 = OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_textView;
  id v9 = objc_allocWithZone((Class)TextViewWithPlaceholderText);
  v10 = self;
  *(MapsThemeCollectionViewListCell *)((char *)&self->super + v8) = (MapsThemeCollectionViewListCell)[v9 init];
  swift_unknownObjectWeakInit();

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for RAPTextViewCollectionViewCell();
  v11 = -[RAPTextViewCollectionViewCell initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
  sub_100123334();
  sub_1001234C0();

  return v11;
}

- (_TtC4Maps29RAPTextViewCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_textView;
  id v6 = objc_allocWithZone((Class)TextViewWithPlaceholderText);
  id v7 = a3;
  *(MapsThemeCollectionViewListCell *)((char *)&self->super + v5) = (MapsThemeCollectionViewListCell)[v6 init];
  swift_unknownObjectWeakInit();

  result = (_TtC4Maps29RAPTextViewCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)&self->super + OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_delegate;

  sub_100123CE4((uint64_t)v3);
}

- (double)preferredHeight
{
  NSString v2 = *(void **)((char *)&self->super + OBJC_IVAR____TtC4Maps29RAPTextViewCollectionViewCell_textView);
  v3 = self;
  v4 = (_TtC4Maps29RAPTextViewCollectionViewCell *)[v2 font];
  if (v4)
  {
    uint64_t v5 = v4;
    [(RAPTextViewCollectionViewCell *)v4 _mapkit_scaledValueForValue:100.0];
    double v7 = v6;

    v3 = v5;
  }
  else
  {
    double v7 = 100.0;
  }

  return v7;
}

- (CGSize)intrinsicContentSize
{
  NSString v2 = self;
  id v3 = [(RAPTextViewCollectionViewCell *)v2 contentView];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v18.origin.double x = v5;
  v18.origin.double y = v7;
  v18.size.double width = v9;
  v18.size.double height = v11;
  CGFloat Width = CGRectGetWidth(v18);
  [(RAPTextViewCollectionViewCell *)v2 preferredHeight];
  double v14 = v13;

  double v15 = Width;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3
{
  CGFloat width = a3.width;
  [(RAPTextViewCollectionViewCell *)self intrinsicContentSize];
  double v5 = width;
  result.double height = v4;
  result.CGFloat width = v5;
  return result;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_100123B70(v4);
}

@end