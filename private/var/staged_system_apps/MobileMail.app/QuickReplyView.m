@interface QuickReplyView
+ (double)cornerRadius;
+ (double)defaultHeight;
+ (double)horizontalPadding;
+ (double)innerVerticalPadding;
- (BOOL)isComposing;
- (UIButton)quickReplyExpandButton;
- (UIButton)quickReplySendButton;
- (UIView)animationSourceView;
- (UIView)contentView;
- (_TtC10MobileMail14QuickReplyView)initWithCoder:(id)a3;
- (_TtC10MobileMail14QuickReplyView)initWithFrame:(CGRect)a3;
- (_TtP10MobileMail22QuickReplyViewDelegate_)delegate;
- (double)bottomInset;
- (double)horizontalInset;
- (double)topInset;
- (id)contentViewSnapshot;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
- (void)addComposeView:(id)a3;
- (void)animationContext:(id)a3;
- (void)contentSizeCategoryDidChange:(id)a3;
- (void)didTapContentView:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)removeSnapshotIfNeeded;
- (void)resetWithReason:(int64_t)a3;
- (void)setBottomInset:(double)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHorizontalInset:(double)a3;
- (void)setQuickReplyPlaceholderLabelState:(BOOL)a3;
- (void)setTopInset:(double)a3;
- (void)showSnapshot;
- (void)updatePlaceholderWithMessage:(id)a3;
- (void)updateQuickReplySendButtonTopOffset:(double)a3;
@end

@implementation QuickReplyView

+ (double)defaultHeight
{
  return static QuickReplyView.defaultHeight.getter();
}

+ (double)innerVerticalPadding
{
  return static QuickReplyView.innerVerticalPadding.getter();
}

+ (double)horizontalPadding
{
  return static QuickReplyView.horizontalPadding.getter();
}

+ (double)cornerRadius
{
  return static QuickReplyView.cornerRadius.getter();
}

- (_TtP10MobileMail22QuickReplyViewDelegate_)delegate
{
  v2 = self;
  id v5 = (id)QuickReplyView.delegate.getter();

  return (_TtP10MobileMail22QuickReplyViewDelegate_ *)v5;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  QuickReplyView.delegate.setter();
}

- (double)horizontalInset
{
  v2 = self;
  double v5 = QuickReplyView.horizontalInset.getter();

  return v5;
}

- (void)setHorizontalInset:(double)a3
{
  v3 = self;
  QuickReplyView.horizontalInset.setter(a3);
}

- (double)topInset
{
  v2 = self;
  double v5 = QuickReplyView.topInset.getter();

  return v5;
}

- (void)setTopInset:(double)a3
{
  v3 = self;
  QuickReplyView.topInset.setter(a3);
}

- (double)bottomInset
{
  v2 = self;
  double v5 = QuickReplyView.bottomInset.getter();

  return v5;
}

- (void)setBottomInset:(double)a3
{
  v3 = self;
  QuickReplyView.bottomInset.setter(a3);
}

- (UIView)animationSourceView
{
  v2 = self;
  id v5 = QuickReplyView.animationSourceView.getter();

  return (UIView *)v5;
}

- (BOOL)isComposing
{
  v2 = self;
  QuickReplyView.isComposing.getter();

  return _convertBoolToObjCBool(_:)() & 1;
}

- (UIView)contentView
{
  v2 = self;
  id v5 = QuickReplyView.contentView.getter();

  return (UIView *)v5;
}

- (void)setContentView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  QuickReplyView.contentView.setter(a3);
}

- (_TtC10MobileMail14QuickReplyView)initWithFrame:(CGRect)a3
{
  return (_TtC10MobileMail14QuickReplyView *)QuickReplyView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10MobileMail14QuickReplyView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1003C1E94();
}

- (void)layoutSubviews
{
  v2 = self;
  QuickReplyView.layoutSubviews()();
}

- (void)prepareForReuse
{
  v2 = self;
  QuickReplyView.prepareForReuse()();
}

- (void)resetWithReason:(int64_t)a3
{
  id v3 = self;
  QuickReplyView.resetWithReason(_:)(a3);
}

- (void)updatePlaceholderWithMessage:(id)a3
{
  id v4 = a3;
  id v5 = self;
  QuickReplyView.updatePlaceholder(message:)(a3);
}

- (void)addComposeView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  QuickReplyView.addComposeView(_:)((UIView)a3);
}

- (void)setQuickReplyPlaceholderLabelState:(BOOL)a3
{
  id v3 = self;
  char v4 = _convertObjCBoolToBool(_:)();
  sub_1003C59D8(v4 & 1);
}

- (void)updateQuickReplySendButtonTopOffset:(double)a3
{
  id v3 = self;
  QuickReplyView.updateQuickReplySendButtonTopOffset(_:)(a3);
}

- (void)animationContext:(id)a3
{
  id v5 = _Block_copy(a3);
  char v4 = self;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  QuickReplyView.animationContext(_:)((void (*)(void))sub_1003CC0B4, v6);
  swift_release();
}

- (id)contentViewSnapshot
{
  v2 = self;
  id v5 = (id)QuickReplyView.contentViewSnapshot()();

  return v5;
}

- (void)showSnapshot
{
  v2 = self;
  QuickReplyView.showSnapshot()();
}

- (void)removeSnapshotIfNeeded
{
  v2 = self;
  QuickReplyView.removeSnapshotIfNeeded()();
}

- (void)didTapContentView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003CA240((uint64_t)a3);
}

- (void)contentSizeCategoryDidChange:(id)a3
{
  v13 = self;
  id v12 = a3;
  uint64_t v11 = type metadata accessor for Notification();
  uint64_t v8 = *(void *)(v11 - 8);
  uint64_t v9 = v11 - 8;
  unint64_t v7 = (*(void *)(v8 + 64) + 15) & 0xFFFFFFFFFFFFFFF0;
  v10 = (char *)&v6 - v7;
  id v4 = (id)__chkstk_darwin(v12);
  id v5 = self;
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  sub_1003CAEE8();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v11);
}

- (void).cxx_destruct
{
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_sendButtonTopConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_contentViewLeadingConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_contentViewTrailingConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_contentViewTopConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_contentViewBottomConstraint));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView_composeView));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC10MobileMail14QuickReplyView_snapshot));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___contentView));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___placeholderLabel));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___sendButton));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___expandButton));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___buttonStackView));
  sub_10024C328((id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC10MobileMail14QuickReplyView____lazy_storage___tapGesture));
}

- (UIButton)quickReplySendButton
{
  v2 = self;
  Class v5 = QuickReplyView.quickReplySendButton.getter();

  return (UIButton *)v5;
}

- (UIButton)quickReplyExpandButton
{
  v2 = self;
  Class v5 = QuickReplyView.quickReplyExpandButton.getter();

  return (UIButton *)v5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = self;
  id v12 = (id)QuickReplyView.pointerInteraction(_:styleFor:)((UIPointerInteraction)a3, (UIPointerRegion)a4);

  return v12;
}

@end