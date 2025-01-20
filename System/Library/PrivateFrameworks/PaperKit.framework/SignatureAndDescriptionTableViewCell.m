@interface SignatureAndDescriptionTableViewCell
- (_TtC8PaperKit36SignatureAndDescriptionTableViewCell)initWithCoder:(id)a3;
- (_TtC8PaperKit36SignatureAndDescriptionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation SignatureAndDescriptionTableViewCell

- (_TtC8PaperKit36SignatureAndDescriptionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  return (_TtC8PaperKit36SignatureAndDescriptionTableViewCell *)@objc SignatureTableViewCell.init(style:reuseIdentifier:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, uint64_t))SignatureAndDescriptionTableViewCell.init(style:reuseIdentifier:));
}

- (_TtC8PaperKit36SignatureAndDescriptionTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized SignatureAndDescriptionTableViewCell.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit36SignatureAndDescriptionTableViewCell_descriptionFont));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit36SignatureAndDescriptionTableViewCell_descriptionColor));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit36SignatureAndDescriptionTableViewCell_descriptionLabel);
}

@end