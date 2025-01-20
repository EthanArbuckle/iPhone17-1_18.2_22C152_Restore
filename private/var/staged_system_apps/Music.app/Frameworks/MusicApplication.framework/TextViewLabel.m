@interface TextViewLabel
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)accessibilityStringValue;
- (UIView)viewForLastBaselineLayout;
- (_TtC16MusicApplication13TextViewLabel)initWithCoder:(id)a3;
- (_TtC16MusicApplication13TextViewLabel)initWithFrame:(CGRect)a3;
- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5;
- (void)sizeToFit;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation TextViewLabel

- (_TtC16MusicApplication13TextViewLabel)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13TextViewLabel *)sub_2600BC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13TextViewLabel)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_261DC8();
}

- (UIView)viewForLastBaselineLayout
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_textView));
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_2605D4();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)sizeToFit
{
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v4 = self;
  double v5 = sub_2606FC(width);
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.double width = v8;
  return result;
}

- (BOOL)becomeFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextViewLabel_textView) becomeFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
  return [*(id *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication13TextViewLabel_textView) canBecomeFirstResponder];
}

- (NSString)accessibilityStringValue
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_textView);
  double v3 = self;
  id v4 = [v2 textStorage];
  id v5 = [v4 string];
  sub_AB6510();

  NSString v6 = sub_AB64D0();
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_placeholderTextColor));
  uint64_t v3 = *(void *)&self->textColor[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
  uint64_t v4 = *(void *)&self->maximumNumberOfLines[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate));
  sub_1A528(v3);
  sub_1A528(v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_baselinesLayoutGuide));
  sub_261CC4(*(void **)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13TextViewLabel__text), *(id *)&self->font[OBJC_IVAR____TtC16MusicApplication13TextViewLabel__text], self->textColor[OBJC_IVAR____TtC16MusicApplication13TextViewLabel__text]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextViewLabel____lazy_storage___baselinesLayoutGuideFirst));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13TextViewLabel____lazy_storage___baselinesLayoutGuideLast));
  id v5 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC16MusicApplication13TextViewLabel_textView);
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  if (sub_AB6510() == 10 && v5 == 0xE100000000000000)
  {
    swift_bridgeObjectRelease();
    char v6 = 0;
  }
  else
  {
    char v7 = sub_AB8640();
    swift_bridgeObjectRelease();
    char v6 = v7 ^ 1;
  }
  return v6 & 1;
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_26136C(v4);
}

- (void)textViewDidEndEditing:(id)a3
{
  uint64_t v3 = *(void (**)(_TtC16MusicApplication13TextViewLabel *))&self->textColor[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
  if (v3)
  {
    id v5 = a3;
    char v6 = self;
    sub_363A8((uint64_t)v3);
    v3(v6);
    sub_1A528((uint64_t)v3);
  }
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  if (a5)
  {
    char v6 = *(void (**)(_TtC16MusicApplication13TextViewLabel *))&self->maximumNumberOfLines[OBJC_IVAR____TtC16MusicApplication13TextViewLabel_delegate];
    if (v6)
    {
      id v8 = a3;
      id v9 = a4;
      v10 = self;
      sub_363A8((uint64_t)v6);
      v6(v10);
      sub_1A528((uint64_t)v6);
    }
  }
}

@end