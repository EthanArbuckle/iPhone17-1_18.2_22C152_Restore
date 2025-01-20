@interface UpNextQueueButton
- (_TtC9SeymourUI17UpNextQueueButton)initWithCoder:(id)a3;
- (_TtC9SeymourUI17UpNextQueueButton)initWithFrame:(CGRect)a3;
- (void)primaryActionTriggered:(id)a3;
@end

@implementation UpNextQueueButton

- (_TtC9SeymourUI17UpNextQueueButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17UpNextQueueButton *)sub_23A13DB68(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI17UpNextQueueButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A13FD38();
}

- (void)primaryActionTriggered:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23A13E508((uint64_t)v4);
}

- (void).cxx_destruct
{
  long long v3 = *(_OWORD *)((char *)&self->super.super.super._minXVariable
                 + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[10] = *(_OWORD *)((char *)&self->super.super.super._layer
                     + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[11] = v3;
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super._boundsWidthVariable
                   + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  long long v4 = *(_OWORD *)((char *)&self->super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider
                 + 16);
  v9[6] = *(_OWORD *)((char *)&self->super.super.super._viewFlags
                    + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[7] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super.super._minimumSafeAreaInsets.bottom
                 + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[8] = *(_OWORD *)((char *)&self->super.super.super._minimumSafeAreaInsets.top
                    + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[9] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.super._traitChangeRegistry
                 + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[2] = *(_OWORD *)((char *)&self->super.super.super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[3] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super.super.super._gestureRecognizers
                 + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[4] = *(_OWORD *)((char *)&self->super.super.super._subviewCache
                    + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[5] = v7;
  long long v8 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_styleProvider);
  v9[1] = v8;
  sub_23A13FE60((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17UpNextQueueButton_visualEffectView));
}

@end