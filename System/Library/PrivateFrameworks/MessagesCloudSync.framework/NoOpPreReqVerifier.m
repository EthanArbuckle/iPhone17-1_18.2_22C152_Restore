@interface NoOpPreReqVerifier
- (void)verifyAllPreReqsWithRequireEnablement:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation NoOpPreReqVerifier

- (void)verifyAllPreReqsWithRequireEnablement:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_22331E640(&qword_26AD5E1C8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_22342C5D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_267FA39A8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_267FA3380;
  v14[5] = v13;
  swift_retain();
  sub_22341E488((uint64_t)v9, (uint64_t)&unk_267FA3388, (uint64_t)v14);
  swift_release();
}

@end