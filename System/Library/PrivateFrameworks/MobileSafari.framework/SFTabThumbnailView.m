@interface SFTabThumbnailView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (SFTabThumbnailView)initWithCoder:(id)a3;
- (SFTabThumbnailView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)contentSizeCategoryDidChange;
- (void)didMoveToWindow;
- (void)displayScaleDidChange;
- (void)layoutSubviews;
- (void)trailingCornerButtonReceivedTap;
@end

@implementation SFTabThumbnailView

- (SFTabThumbnailView)initWithFrame:(CGRect)a3
{
  return (SFTabThumbnailView *)sub_18C364410(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_18C45B838();
}

- (SFTabThumbnailView)initWithCoder:(id)a3
{
  return (SFTabThumbnailView *)sub_18C57DDD8(a3);
}

- (void)trailingCornerButtonReceivedTap
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR___SFTabThumbnailView_closeHandler);
  v3 = self;
  uint64_t v4 = sub_18C6F7B98();
  v2(v4);

  swift_release();
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = self;
  if (UIViewIgnoresTouchEvents())
  {

    v9 = 0;
  }
  else
  {
    id v10 = sub_18C57E40C((uint64_t)v7, x, y);
    if (!v10)
    {
      v12.receiver = v8;
      v12.super_class = (Class)type metadata accessor for TabThumbnailView();
      id v10 = -[SFTabThumbnailView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
    }
    v9 = v10;
  }

  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TabThumbnailView();
  id v7 = a4;
  id v8 = v11.receiver;
  if (-[SFTabThumbnailView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y))
  {

LABEL_5:
    return 1;
  }
  v9 = sub_18C57E40C((uint64_t)v7, x, y);

  if (v9)
  {
    id v8 = v9;
    goto LABEL_5;
  }
  return 0;
}

- (void)contentSizeCategoryDidChange
{
  v2 = self;
  sub_18C45A88C();
}

- (void)displayScaleDidChange
{
  v2 = self;
  sub_18C57E6D8();
}

- (void)didMoveToWindow
{
  v2 = self;
  sub_18C57EFEC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabThumbnailView_borrowedCapsuleViewRegistration));
  swift_release();
  v3 = *(id *)((char *)&self->super.super._swiftAnimationInfo + OBJC_IVAR___SFTabThumbnailView_configuration);
  uint64_t v4 = *(_UITraitChangeRegistry **)((char *)&self->super.super._traitChangeRegistry
                                  + OBJC_IVAR___SFTabThumbnailView_configuration);
  v5 = *(CALayer **)((char *)&self->super.super._layerRetained + OBJC_IVAR___SFTabThumbnailView_configuration);
  uint64_t v6 = *(uint64_t *)((char *)&self->super.super._subviewCache + OBJC_IVAR___SFTabThumbnailView_configuration);
  id v7 = *(UIWindow **)((char *)&self->super.super._window + OBJC_IVAR___SFTabThumbnailView_configuration);
  id v8 = *(NSArray **)((char *)&self->super.super._gestureRecognizers + OBJC_IVAR___SFTabThumbnailView_configuration);
  sub_18C3AE040(*(void *)((char *)&self->super.super.super._responderFlags + OBJC_IVAR___SFTabThumbnailView_configuration), *(uint64_t *)((char *)&self->super.super.super.__layeringSceneIdentity + OBJC_IVAR___SFTabThumbnailView_configuration), *(uint64_t *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR___SFTabThumbnailView_configuration));
  swift_bridgeObjectRelease();
  sub_18C3ADFD4(v3, v4, v5, v6, v7, v8);
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabThumbnailView_borrowedCapsuleContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabThumbnailView_borrowedContentContainerView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabThumbnailView_borrowedContentMatchMoveReferenceView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabThumbnailView_capsuleMatchMoveReferenceView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabThumbnailView____lazy_storage___controlsVisibility));
  swift_unknownObjectWeakDestroy();

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___SFTabThumbnailView____lazy_storage___attachedCapsuleVisibility));

  swift_release();
}

@end