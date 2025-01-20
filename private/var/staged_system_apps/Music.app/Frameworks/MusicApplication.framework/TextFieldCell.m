@interface TextFieldCell
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)isFirstResponder;
- (BOOL)resignFirstResponder;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (BOOL)textFieldShouldEndEditing:(id)a3;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsForProposedInsets:(NSDirectionalEdgeInsets)a3;
- (_TtC16MusicApplication13TextFieldCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication13TextFieldCell)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)music_inheritedLayoutInsetsDidChange;
- (void)textFieldDidBeginEditing:(id)a3;
- (void)textFieldDidEndEditing:(id)a3;
@end

@implementation TextFieldCell

- (_TtC16MusicApplication13TextFieldCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13TextFieldCell *)sub_76C34(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13TextFieldCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_7831C();
}

- (BOOL)canBecomeFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField) canBecomeFirstResponder];
}

- (BOOL)becomeFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField) becomeFirstResponder];
}

- (BOOL)canResignFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField) canResignFirstResponder];
}

- (BOOL)resignFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField) resignFirstResponder];
}

- (BOOL)isFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField) isFirstResponder];
}

- (void)music_inheritedLayoutInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TextFieldCell();
  id v2 = v3.receiver;
  [(TextFieldCell *)&v3 music_inheritedLayoutInsetsDidChange];
  [v2 setNeedsLayout];
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_772B8();
}

- (NSDirectionalEdgeInsets)_preferredSeparatorInsetsForProposedInsets:(NSDirectionalEdgeInsets)a3
{
  CGFloat trailing = a3.trailing;
  CGFloat bottom = a3.bottom;
  CGFloat top = a3.top;
  v6 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_descriptionLabel);
  v7 = self;
  [v6 frame];
  CGFloat MinX = CGRectGetMinX(v13);

  double v9 = top;
  double v10 = MinX;
  double v11 = bottom;
  double v12 = trailing;
  result.CGFloat trailing = v12;
  result.CGFloat bottom = v11;
  result.leading = v10;
  result.CGFloat top = v9;
  return result;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_77788(v4);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  sub_AB6510();
  id v10 = a3;
  id v11 = a5;
  double v12 = self;
  sub_77A4C(v10, location, length);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 24);
    id v8 = a3;
    double v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
  return 0;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_delegate;
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 32);
    id v8 = a3;
    double v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  swift_getObjectType();
  id v5 = a3;
  uint64_t v6 = self;
  id v7 = [(TextFieldCell *)v6 traitCollection];
  sub_77DF8(v7, 0.0);

  [v5 frame];
  [v5 setFrame:];

  return v5;
}

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_delegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_descriptionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextFieldCell_valueTextField));

  swift_bridgeObjectRelease();
}

@end