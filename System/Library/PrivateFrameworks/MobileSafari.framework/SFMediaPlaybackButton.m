@interface SFMediaPlaybackButton
- (BOOL)isHighlighted;
- (SFMediaPlaybackButton)initWithCoder:(id)a3;
- (SFMediaPlaybackButton)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setHighlighted:(BOOL)a3;
- (void)updateHighlightIndicator;
@end

@implementation SFMediaPlaybackButton

- (SFMediaPlaybackButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18C5EAD88();
}

- (void)updateHighlightIndicator
{
  v2 = self;
  sub_18C5E9EAC();
}

- (BOOL)isHighlighted
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MediaPlaybackButton();
  return [(SFMediaPlaybackButton *)&v3 isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MediaPlaybackButton();
  id v4 = v5.receiver;
  [(SFMediaPlaybackButton *)&v5 setHighlighted:v3];
  sub_18C5EA0DC();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MediaPlaybackButton();
  v2 = (char *)v5.receiver;
  [(SFMediaPlaybackButton *)&v5 layoutSubviews];
  BOOL v3 = *(void **)&v2[OBJC_IVAR___SFMediaPlaybackButton_highlightIndicatorView];
  id v4 = objc_msgSend(v3, sel_layer, v5.receiver, v5.super_class);
  objc_msgSend(v3, sel_bounds);
  objc_msgSend(v4, sel_setCornerRadius_, CGRectGetWidth(v6) * 0.5);
}

- (SFMediaPlaybackButton)initWithFrame:(CGRect)a3
{
  result = (SFMediaPlaybackButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR___SFMediaPlaybackButton_highlightIndicatorView));

  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR___SFMediaPlaybackButton_highlightSizeAnchor);
}

@end