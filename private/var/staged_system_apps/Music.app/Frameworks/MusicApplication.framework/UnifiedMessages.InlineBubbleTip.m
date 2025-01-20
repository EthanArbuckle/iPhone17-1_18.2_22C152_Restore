@interface UnifiedMessages.InlineBubbleTip
- (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip)initWithCoder:(id)a3;
- (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip)initWithNibName:(id)a3 bundle:(id)a4;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation UnifiedMessages.InlineBubbleTip

- (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip_handleUserDismissed);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip *)sub_AB8280();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_54B9A0();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  id v2 = v3.receiver;
  [(UnifiedMessages.InlineBubbleTip *)&v3 viewDidLayoutSubviews];
  sub_54BBAC();
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_54C42C(v7);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_54CCF4((uint64_t)a4);
}

- (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip_inlineBubbleTipViewController));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages15InlineBubbleTip_handleUserDismissed);

  sub_1A528(v3);
}

@end