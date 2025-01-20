@interface TextInputCollectionViewCell
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)resignFirstResponder;
- (_TtC23ShelfKitCollectionViews27TextInputCollectionViewCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews27TextInputCollectionViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)textFieldEditingDidEndOnExit;
- (void)textFieldValueChanged;
@end

@implementation TextInputCollectionViewCell

- (_TtC23ShelfKitCollectionViews27TextInputCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViews27TextInputCollectionViewCell *)sub_36E67C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViews27TextInputCollectionViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_37057C();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_36EDE8();
}

- (BOOL)canBecomeFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField) canBecomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField) becomeFirstResponder];
}

- (BOOL)canResignFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField) canResignFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField) resignFirstResponder];
}

- (void)textFieldValueChanged
{
  v2 = self;
  sub_36FDA4();
}

- (void)textFieldEditingDidEndOnExit
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_returnPressedCallback);
  if (v2)
  {
    uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField);
    v4 = self;
    sub_3C800((uint64_t)v2);
    v2(v3);
    sub_27760((uint64_t)v2);
  }
}

- (void)prepareForReuse
{
  v2 = self;
  sub_36FF6C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textInputField));
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_textChangedCallback));
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_returnPressedCallback));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_bottomDivider));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews27TextInputCollectionViewCell_topDivider);
}

@end