@interface UnifiedMessages.Coordinator
- (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator)init;
- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6;
- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5;
- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5;
@end

@implementation UnifiedMessages.Coordinator

- (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator)init
{
  return (_TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator *)sub_F1064();
}

- (void)engagement:(id)a3 didUpdateRequest:(id)a4 placement:(id)a5 serviceType:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_DC1000);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_AB6510();
  uint64_t v16 = v15;
  uint64_t v17 = sub_AB6C00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v13, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = self;
  v18[5] = v14;
  v18[6] = v16;
  v18[7] = a4;
  id v19 = a4;
  v20 = self;
  id v21 = v19;
  id v22 = a3;
  id v23 = a5;
  id v24 = a6;
  swift_bridgeObjectRetain();
  sub_EED00((uint64_t)v13, (uint64_t)&unk_DC5CF8, (uint64_t)v18);
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)engagement:(id)a3 handleDialogRequest:(id)a4 completion:(id)a5
{
}

- (void)engagement:(id)a3 handleEngagementRequest:(id)a4 completion:(id)a5
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator_engagement));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator_bag));
  swift_bridgeObjectRelease();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator_userDefaults));
  swift_release();
  v3 = (char *)self
     + OBJC_IVAR____TtCE16MusicApplicationO9MusicCore15UnifiedMessages11Coordinator__inlineBubbleTipRequests;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_DC5D00);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end