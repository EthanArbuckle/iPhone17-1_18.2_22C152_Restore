@interface DirectReportNetworkManager
- (_TtC26SensitiveContentAnalysisUIP33_8A6FFD33D440B432C1F2FAE6B8721B9326DirectReportNetworkManager)init;
- (void)URLSession:(NSURLSession *)a3 didReceiveChallenge:(NSURLAuthenticationChallenge *)a4 completionHandler:(id)a5;
@end

@implementation DirectReportNetworkManager

- (void)URLSession:(NSURLSession *)a3 didReceiveChallenge:(NSURLAuthenticationChallenge *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5898D0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_25C0EBB08();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26A589EE0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26A589EF0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_25C03C70C((uint64_t)v11, (uint64_t)&unk_26A589F00, (uint64_t)v16);
  swift_release();
}

- (_TtC26SensitiveContentAnalysisUIP33_8A6FFD33D440B432C1F2FAE6B8721B9326DirectReportNetworkManager)init
{
  return (_TtC26SensitiveContentAnalysisUIP33_8A6FFD33D440B432C1F2FAE6B8721B9326DirectReportNetworkManager *)sub_25C0BE434();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC26SensitiveContentAnalysisUIP33_8A6FFD33D440B432C1F2FAE6B8721B9326DirectReportNetworkManager____lazy_storage___session));
  v3 = (char *)self
     + OBJC_IVAR____TtC26SensitiveContentAnalysisUIP33_8A6FFD33D440B432C1F2FAE6B8721B9326DirectReportNetworkManager_pinnedCertificateURL;
  uint64_t v4 = sub_25C0EA238();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end