@interface PersonalizationConfigurationService
- (void)onConfigurationChange:(id)a3;
@end

@implementation PersonalizationConfigurationService

- (void)onConfigurationChange:(id)a3
{
  uint64_t v4 = sub_100058D18(&qword_100B27720);
  __chkstk_darwin(v4 - 8);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1007F25F0();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007F25C0();
  uint64_t v11 = sub_1007FE150();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v6, 1, 1, v11);
  uint64_t v12 = qword_100B22A48;
  swift_retain_n();
  if (v12 != -1) {
    swift_once();
  }
  uint64_t v13 = qword_100B323F8;
  uint64_t v14 = sub_100081714(&qword_100B32588, (void (*)(uint64_t))_s5Books18PropertyValueActorV9ActorTypeCMa_0);
  v15 = (void *)swift_allocObject();
  v15[2] = v13;
  v15[3] = v14;
  v15[4] = self;
  swift_retain();
  sub_10004BC14((uint64_t)v6, (uint64_t)&unk_100B32608, (uint64_t)v15);
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

@end