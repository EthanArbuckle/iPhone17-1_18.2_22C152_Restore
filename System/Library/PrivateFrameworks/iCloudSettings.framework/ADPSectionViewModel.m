@interface ADPSectionViewModel
- (_TtC14iCloudSettings19ADPSectionViewModel)init;
- (void)beginEnablementFlow:(id)a3;
- (void)presentAccountRecoveryFlow;
- (void)remoteUIDidDismiss:(id)a3;
- (void)remoteUIDidReceiveHTTPResponse:(id)a3;
- (void)remoteUIRequestComplete:(id)a3 error:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation ADPSectionViewModel

- (_TtC14iCloudSettings19ADPSectionViewModel)init
{
  result = (_TtC14iCloudSettings19ADPSectionViewModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19ADPSectionViewModel__navigationController));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC14iCloudSettings19ADPSectionViewModel__grandSlamPresenter));

  sub_2629F23F8((uint64_t)self + OBJC_IVAR____TtC14iCloudSettings19ADPSectionViewModel__adpLearnMoreURL, &qword_26B4229F0);
  v3 = (char *)self + OBJC_IVAR____TtC14iCloudSettings19ADPSectionViewModel___observationRegistrar;
  uint64_t v4 = sub_262B02B38();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

- (void)beginEnablementFlow:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B422A40);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B4229F0);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  uint64_t v11 = MEMORY[0x270FA5388](v8 - 8);
  v12 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v23 - v13;
  if (a3)
  {
    sub_262B029F8();
    uint64_t v15 = sub_262B02A38();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 0, 1, v15);
  }
  else
  {
    uint64_t v16 = sub_262B02A38();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v14, 1, 1, v16);
  }
  uint64_t v17 = sub_262B04698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v7, 1, 1, v17);
  sub_2629CCC24((uint64_t)v14, (uint64_t)v12, &qword_26B4229F0);
  sub_262B04648();
  v18 = self;
  uint64_t v19 = sub_262B04638();
  unint64_t v20 = (*(unsigned __int8 *)(v9 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v21 = (void *)swift_allocObject();
  uint64_t v22 = MEMORY[0x263F8F500];
  v21[2] = v19;
  v21[3] = v22;
  v21[4] = v18;
  sub_2629CCD80((uint64_t)v12, (uint64_t)v21 + v20, &qword_26B4229F0);
  sub_2629DC6C8((uint64_t)v7, (uint64_t)&unk_26A986280, (uint64_t)v21);

  swift_release();
  sub_2629F23F8((uint64_t)v14, &qword_26B4229F0);
}

- (void)setDelegate:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B422A40);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_262B04698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_262B04648();
  swift_unknownObjectRetain_n();
  uint64_t v9 = self;
  uint64_t v10 = sub_262B04638();
  uint64_t v11 = (void *)swift_allocObject();
  uint64_t v12 = MEMORY[0x263F8F500];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = v9;
  v11[5] = a3;
  sub_2629DC6C8((uint64_t)v7, (uint64_t)&unk_26A986278, (uint64_t)v11);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)presentAccountRecoveryFlow
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B422A40);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_262B04698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  sub_262B04648();
  v7 = self;
  uint64_t v8 = sub_262B04638();
  uint64_t v9 = (void *)swift_allocObject();
  uint64_t v10 = MEMORY[0x263F8F500];
  v9[2] = v8;
  v9[3] = v10;
  v9[4] = v7;
  sub_2629DC6C8((uint64_t)v5, (uint64_t)&unk_26A986270, (uint64_t)v9);

  swift_release();
}

- (void)remoteUIRequestComplete:(id)a3 error:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B422A40);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_262B02888();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_262B02838();
  uint64_t v13 = sub_262B04698();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  sub_262B04648();
  v14 = self;
  id v15 = a4;
  uint64_t v16 = v14;
  uint64_t v17 = sub_262B04638();
  v18 = (void *)swift_allocObject();
  uint64_t v19 = MEMORY[0x263F8F500];
  v18[2] = v17;
  v18[3] = v19;
  v18[4] = a4;
  v18[5] = v16;
  sub_2629DC6C8((uint64_t)v8, (uint64_t)&unk_26A986268, (uint64_t)v18);

  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

- (void)remoteUIDidReceiveHTTPResponse:(id)a3
{
  uint64_t v4 = (objc_class *)a3;
  v7.super._internal = (NSURLResponseInternal *)self;
  internal = v7.super._internal;
  v7.super.super.isa = v4;
  ADPSectionViewModel.remoteUIDidReceiveHTTPResponse(_:)(v7);
}

- (void)remoteUIDidDismiss:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  _s14iCloudSettings19ADPSectionViewModelC18remoteUIDidDismissyySo18RemoteUIControllerCF_0();
}

@end