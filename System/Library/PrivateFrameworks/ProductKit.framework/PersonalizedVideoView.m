@interface PersonalizedVideoView
- (_TtC10ProductKit21PersonalizedVideoView)initWithCoder:(id)a3;
- (_TtC10ProductKit21PersonalizedVideoView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PersonalizedVideoView

- (_TtC10ProductKit21PersonalizedVideoView)initWithFrame:(CGRect)a3
{
  v3 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_startedHandler);
  void *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_completedHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_featureHandler);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_sceneDriver) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_hasSetUpSceneDriver) = 0;

  result = (_TtC10ProductKit21PersonalizedVideoView *)sub_21EFCEA18();
  __break(1u);
  return result;
}

- (_TtC10ProductKit21PersonalizedVideoView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_startedHandler);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_completedHandler);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_featureHandler);
  void *v6 = 0;
  v6[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_sceneDriver) = 0;
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_hasSetUpSceneDriver) = 0;
  id v7 = a3;

  result = (_TtC10ProductKit21PersonalizedVideoView *)sub_21EFCEA18();
  __break(1u);
  return result;
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_sceneView);
  v5 = self;
  objc_msgSend(v4, sel_setDelegate_, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  [(PersonalizedVideoView *)&v6 dealloc];
}

- (void).cxx_destruct
{
  sub_21EF608FC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_startedHandler));
  sub_21EF608FC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_completedHandler));
  sub_21EF608FC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_featureHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_sceneView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_sceneDriver));
  sub_21EF60ADC((uint64_t)self + OBJC_IVAR____TtC10ProductKit21PersonalizedVideoView_configuration, type metadata accessor for VideoViewConfiguration);
}

- (void)willMoveToSuperview:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_21EF5B168((uint64_t)a3);
}

@end