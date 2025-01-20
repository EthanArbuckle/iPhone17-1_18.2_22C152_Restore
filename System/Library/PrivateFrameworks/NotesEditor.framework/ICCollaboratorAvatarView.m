@interface ICCollaboratorAvatarView
+ (double)animationDuration;
+ (double)animationSpringDamping;
+ (double)contentHeight;
- (BOOL)frameAnchorIsInverted;
- (BOOL)isExpanded;
- (CGPoint)frameAnchorPoint;
- (ICCollaboratorAvatarView)initWithCoder:(id)a3;
- (ICCollaboratorAvatarView)initWithFrame:(CGRect)a3;
- (NSString)name;
- (UIColor)color;
- (UIView)boundingSuperview;
- (void)didMoveToWindow;
- (void)handleHoverWithRecognizer:(id)a3;
- (void)handleTap:(id)a3;
- (void)removeFromSuperviewAnimatedWithCompletion:(id)a3;
- (void)setFrameAnchorIsInverted:(BOOL)a3;
- (void)setFrameAnchorPoint:(CGPoint)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setIsExpanded:(BOOL)a3 animated:(BOOL)a4;
- (void)updateWithoutAnimation;
@end

@implementation ICCollaboratorAvatarView

+ (double)animationDuration
{
  return 0.375;
}

+ (double)animationSpringDamping
{
  return 0.85;
}

+ (double)contentHeight
{
  id v2 = objc_msgSend(self, sel_ic_preferredFontForStyle_withFontWeight_, *MEMORY[0x263F835F0], *MEMORY[0x263F81828]);
  if (v2)
  {
    v4 = v2;
    objc_msgSend(v2, sel_lineHeight);
    double v6 = v5;

    double result = v6 + 6.0;
    if (v6 + 6.0 <= 30.0) {
      return 30.0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (NSString)name
{
  swift_bridgeObjectRetain();
  id v2 = (void *)sub_20C162A80();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (UIColor)color
{
  return (UIColor *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                            + OBJC_IVAR___ICCollaboratorAvatarView_color));
}

- (UIView)boundingSuperview
{
  return (UIView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                           + OBJC_IVAR___ICCollaboratorAvatarView_boundingSuperview));
}

- (CGPoint)frameAnchorPoint
{
  double v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorAvatarView_frameAnchorPoint);
  double v3 = *(double *)((char *)&self->super.super._responderFlags + OBJC_IVAR___ICCollaboratorAvatarView_frameAnchorPoint);
  result.y = v3;
  result.x = v2;
  return result;
}

- (void)setFrameAnchorPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = self;
  sub_20BFD5990(x, y);
}

- (BOOL)frameAnchorIsInverted
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorAvatarView_frameAnchorIsInverted);
}

- (void)setFrameAnchorIsInverted:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorAvatarView_frameAnchorIsInverted) = a3;
}

- (BOOL)isExpanded
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorAvatarView_isExpanded);
}

- (void)setIsExpanded:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___ICCollaboratorAvatarView_isExpanded) = a3;
}

- (ICCollaboratorAvatarView)initWithFrame:(CGRect)a3
{
}

- (ICCollaboratorAvatarView)initWithCoder:(id)a3
{
}

- (void)didMoveToWindow
{
  double v2 = self;
  CollaboratorAvatarView.didMoveToWindow()();
}

- (void)setIsExpanded:(BOOL)a3 animated:(BOOL)a4
{
  double v6 = self;
  sub_20BFD6B00(a3, a4);
}

- (void)removeFromSuperviewAnimatedWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    double v5 = v4;
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v5;
    v7 = sub_20BFD9168;
  }
  else
  {
    v7 = 0;
    uint64_t v6 = 0;
  }
  v8 = self;
  sub_20BFD6CA8((uint64_t)v7, v6);
  sub_20BFCDA14((uint64_t)v7);
}

- (void)updateWithoutAnimation
{
  double v2 = self;
  sub_20BFD5AD0(0);
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_20BFD8ED8();
}

- (void)handleHoverWithRecognizer:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_20BFD880C(v4);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___label));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___imageViewTopConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___imageViewBottomConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___imageViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___labelWidthConstraint));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___ICCollaboratorAvatarView____lazy_storage___labelHeightConstraint);
}

@end