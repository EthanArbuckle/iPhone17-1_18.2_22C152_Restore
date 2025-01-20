@interface MoreHistoryCollectionViewCell
- (BOOL)isHighlighted;
- (_TtC17SequoiaTranslator29MoreHistoryCollectionViewCell)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator29MoreHistoryCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)gestureUpdated:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)tapped:(id)a3;
@end

@implementation MoreHistoryCollectionViewCell

- (_TtC17SequoiaTranslator29MoreHistoryCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator29MoreHistoryCollectionViewCell *)sub_100169AEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator29MoreHistoryCollectionViewCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_paddingDefault) = (Class)0x4028000000000000;
  uint64_t v5 = OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_moreHistoryView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for MoreHistoryView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 initWithFrame:0.0, 0.0, 0.0, 0.0];
  *(void *)&self->paddingDefault[OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_delegate] = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC17SequoiaTranslator29MoreHistoryCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MoreHistoryCollectionViewCell();
  return [(MoreHistoryCollectionViewCell *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MoreHistoryCollectionViewCell();
  v4 = (char *)v8.receiver;
  [(MoreHistoryCollectionViewCell *)&v8 setHighlighted:v3];
  uint64_t v5 = *(void **)&v4[OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_moreHistoryView];
  unsigned int v6 = [v4 isHighlighted];
  double v7 = 1.0;
  if (v6) {
    double v7 = 0.5;
  }
  [v5 setAlpha:v7];
}

- (void)tapped:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10016ADAC();
}

- (void)gestureUpdated:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  -[MoreHistoryCollectionViewCell setHighlighted:](v5, "setHighlighted:", [v4 state] != (id)3);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();

  if (Strong)
  {
    swift_unknownObjectRelease();
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_moreHistoryView));
  BOOL v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator29MoreHistoryCollectionViewCell_delegate;

  sub_100013384((uint64_t)v3);
}

@end