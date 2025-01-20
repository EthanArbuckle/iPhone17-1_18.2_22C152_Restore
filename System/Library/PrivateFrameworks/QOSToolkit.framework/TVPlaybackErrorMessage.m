@interface TVPlaybackErrorMessage
- (id)defaultAlert;
- (id)getLocalizedErrorMessageForItems:(id)a3 :(id)a4;
- (id)logger;
- (id)metricsRecorder;
- (void)fetchLocalizedErrorMessageForItems:(NSDictionary *)a3 :(NSError *)a4 completionHandler:(id)a5;
@end

@implementation TVPlaybackErrorMessage

- (id)logger
{
  uint64_t v2 = *(void *)&self->logger[8];
  v5[4] = *(void *)self->logger;
  v5[5] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_25AC82644;
  v5[3] = &block_descriptor_29;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();

  return v3;
}

- (id)metricsRecorder
{
  uint64_t v2 = *(void *)&self->metricsRecorder[8];
  v5[4] = *(void *)self->metricsRecorder;
  v5[5] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_25AC8276C;
  v5[3] = &block_descriptor_26;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();

  return v3;
}

- (id)defaultAlert
{
  uint64_t v2 = *(void *)&self->defaultAlert[8];
  v5[4] = *(void *)self->defaultAlert;
  v5[5] = v2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 1107296256;
  v5[2] = sub_25AC82890;
  v5[3] = &block_descriptor_0;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();

  return v3;
}

- (id)getLocalizedErrorMessageForItems:(id)a3 :(id)a4
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26A4AD988);
  uint64_t v6 = sub_25AC8ED88();
  v7 = *(void (**)(void))self->metricsRecorder;
  sub_25AC84FFC((uint64_t)v13);
  sub_25AC77BAC((uint64_t)v13, (uint64_t)v12, &qword_26A4ADCC0);
  id v8 = a4;
  swift_retain();
  sub_25AC85020(v6, (uint64_t)v12, (uint64_t)objc_msgSend(v8, sel_code), 1);
  v7();
  uint64_t v9 = swift_bridgeObjectRelease();
  v10 = (void *)(*(uint64_t (**)(uint64_t))self->defaultAlert)(v9);

  swift_release();
  swift_bridgeObjectRelease();

  return v10;
}

- (void)fetchLocalizedErrorMessageForItems:(NSDictionary *)a3 :(NSError *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B331E38);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_25AC8EFD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A4ADCF0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26A4ADD00;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_25AC844F4((uint64_t)v11, (uint64_t)&unk_26A4ADD10, (uint64_t)v16);
  swift_release();
}

@end