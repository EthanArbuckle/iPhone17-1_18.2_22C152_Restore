@interface CardCollectionViewCell
- (_TtC17SequoiaTranslator22CardCollectionViewCell)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator22CardCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
@end

@implementation CardCollectionViewCell

- (_TtC17SequoiaTranslator22CardCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC17SequoiaTranslator22CardCollectionViewCell *)sub_100029BEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC17SequoiaTranslator22CardCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10002ADBC();
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CardCollectionViewCell();
  id v4 = [(CardCollectionViewCell *)&v6 preferredLayoutAttributesFittingAttributes:a3];

  return v4;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell_minHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell_leadingPadding));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell_trailingPadding));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell_cardHeight));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell____lazy_storage___containerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell____lazy_storage___cardView));
  id v3 = (char *)self + OBJC_IVAR____TtC17SequoiaTranslator22CardCollectionViewCell_delegate;

  sub_10002ACF4((uint64_t)v3);
}

@end