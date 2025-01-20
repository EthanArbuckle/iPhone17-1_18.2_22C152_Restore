@interface HeaderView
- (_TtC10WorkflowUIP33_AAF3D332C57B0C13AFF481CC7D699DEC10HeaderView)initWithCoder:(id)a3;
- (_TtC10WorkflowUIP33_AAF3D332C57B0C13AFF481CC7D699DEC10HeaderView)initWithFrame:(CGRect)a3;
@end

@implementation HeaderView

- (_TtC10WorkflowUIP33_AAF3D332C57B0C13AFF481CC7D699DEC10HeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC10WorkflowUIP33_AAF3D332C57B0C13AFF481CC7D699DEC10HeaderView *)sub_22DA6CDCC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10WorkflowUIP33_AAF3D332C57B0C13AFF481CC7D699DEC10HeaderView)initWithCoder:(id)a3
{
  return (_TtC10WorkflowUIP33_AAF3D332C57B0C13AFF481CC7D699DEC10HeaderView *)sub_22DA6CE88(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_AAF3D332C57B0C13AFF481CC7D699DEC10HeaderView____lazy_storage___iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_AAF3D332C57B0C13AFF481CC7D699DEC10HeaderView____lazy_storage___iconStackImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10WorkflowUIP33_AAF3D332C57B0C13AFF481CC7D699DEC10HeaderView____lazy_storage___titleLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC10WorkflowUIP33_AAF3D332C57B0C13AFF481CC7D699DEC10HeaderView____lazy_storage___subtitleLabel);
}

@end