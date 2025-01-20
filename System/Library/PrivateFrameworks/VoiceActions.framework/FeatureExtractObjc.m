@interface FeatureExtractObjc
- (FeatureExtractObjc)init;
- (FeatureExtractObjc)initWithConfig:(id)a3;
- (id)audioForKeywordWithStartFrame:(int64_t)a3 endFrame:(int64_t)a4 actualEndFrame:(int64_t *)a5;
- (id)configuration;
- (id)saveAudioBufferToFileWithPcmBuffer:(id)a3 keyword:(id)a4 score:(id)a5 duration:(int)a6;
- (id)saveAudioDataToFileWithData:(id)a3 keyword:(id)a4 score:(id)a5 duration:(int)a6;
- (id)saveStandaloneDebugSamplesToFileWithDebugAudioSamples:(id)a3 keyword:(id)a4 score:(id)a5 duration:(int)a6;
- (void)addCallbackForAcousticModelOutputAvailableWithCallback:(id)a3;
- (void)addFloatSamples:(const float *)a3 count:(int64_t)a4;
- (void)addSamples:(const signed __int16 *)a3 count:(int64_t)a4;
- (void)reset;
- (void)setCmvnMinWindowLengthWithCmvnMinWindowLength:(int64_t)a3;
- (void)setStreamingModeWithStreaming:(BOOL)a3;
- (void)startWithCompletionHandlerWithCompletionHandler:(id)a3;
- (void)stopWithCompletionHandlerWithCompletionHandler:(id)a3;
@end

@implementation FeatureExtractObjc

- (FeatureExtractObjc)initWithConfig:(id)a3
{
  return (FeatureExtractObjc *)FeatureExtract.init(config:)(a3);
}

- (void)addCallbackForAcousticModelOutputAvailableWithCallback:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (uint64_t (**)())((char *)self + OBJC_IVAR___FeatureExtractObjc_acousticModelOutputAvailable);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractObjc_acousticModelOutputAvailable);
  *v6 = sub_2614667E0;
  v6[1] = (uint64_t (*)())v5;
  sub_26143039C(v7);
}

- (void)setCmvnMinWindowLengthWithCmvnMinWindowLength:(int64_t)a3
{
  v4 = (void *)MEMORY[0x263F8EED0];
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractObjc_config);
  v6 = *(uint64_t (**)(void))((*v5 & *MEMORY[0x263F8EED0]) + 0x90);
  uint64_t v7 = self;
  v8 = v5;
  v9 = (void *)v6();

  (*(void (**)(int64_t))((*v4 & *v9) + 0xA8))(a3);
}

- (id)configuration
{
  return *(id *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractObjc_config);
}

- (void)setStreamingModeWithStreaming:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___FeatureExtractObjc_streamingMode) = a3;
}

- (void)startWithCompletionHandlerWithCompletionHandler:(id)a3
{
}

- (void)reset
{
  v2 = self;
  sub_26145E398();
}

- (id)audioForKeywordWithStartFrame:(int64_t)a3 endFrame:(int64_t)a4 actualEndFrame:(int64_t *)a5
{
  v8 = self;
  v9 = sub_26145E544(a3, a4, (uint64_t)a5);

  return v9;
}

- (void)addFloatSamples:(const float *)a3 count:(int64_t)a4
{
  v6 = self;
  sub_26145F430((uint64_t)a3, a4);
}

- (void)addSamples:(const signed __int16 *)a3 count:(int64_t)a4
{
  v6 = self;
  sub_26145F808((uint64_t)a3, a4);
}

- (void)stopWithCompletionHandlerWithCompletionHandler:(id)a3
{
}

- (id)saveAudioBufferToFileWithPcmBuffer:(id)a3 keyword:(id)a4 score:(id)a5 duration:(int)a6
{
  uint64_t v9 = sub_2613C23AC(&qword_26A9150A0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_2614D53A8();
  uint64_t v14 = v13;
  uint64_t v15 = sub_2614D53A8();
  uint64_t v17 = v16;
  id v18 = a3;
  v19 = self;
  sub_261460054((uint64_t)v18, v12, v14, v15, v17, a6, (uint64_t)v11);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_2614D4C78();
  uint64_t v21 = *(void *)(v20 - 8);
  v22 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v11, 1, v20) != 1)
  {
    v22 = (void *)sub_2614D4C38();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v20);
  }
  return v22;
}

- (id)saveAudioDataToFileWithData:(id)a3 keyword:(id)a4 score:(id)a5 duration:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  uint64_t v11 = sub_2613C23AC(&qword_26A9150A0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v17 = self;
  uint64_t v18 = sub_2614D4CA8();
  unint64_t v20 = v19;

  uint64_t v21 = sub_2614D53A8();
  uint64_t v23 = v22;

  uint64_t v24 = sub_2614D53A8();
  uint64_t v26 = v25;

  sub_261460A04(v18, v20, v21, v23, v24, v26, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2613C2314(v18, v20);

  uint64_t v27 = sub_2614D4C78();
  uint64_t v28 = *(void *)(v27 - 8);
  v29 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v28 + 48))(v13, 1, v27) != 1)
  {
    v29 = (void *)sub_2614D4C38();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v13, v27);
  }
  return v29;
}

- (id)saveStandaloneDebugSamplesToFileWithDebugAudioSamples:(id)a3 keyword:(id)a4 score:(id)a5 duration:(int)a6
{
  uint64_t v8 = sub_2613C23AC(&qword_26A9150A0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_2614D5658();
  uint64_t v12 = sub_2614D53A8();
  uint64_t v14 = v13;
  uint64_t v15 = sub_2614D53A8();
  uint64_t v17 = v16;
  uint64_t v18 = self;
  sub_261460F50(v11, v12, v14, v15, v17, a6, (uint64_t)v10);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v19 = sub_2614D4C78();
  uint64_t v20 = *(void *)(v19 - 8);
  uint64_t v21 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v10, 1, v19) != 1)
  {
    uint64_t v21 = (void *)sub_2614D4C38();
    (*(void (**)(char *, uint64_t))(v20 + 8))(v10, v19);
  }
  return v21;
}

- (FeatureExtractObjc)init
{
  result = (FeatureExtractObjc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_26143039C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractObjc_acousticModelOutputAvailable));
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FeatureExtractObjc_config);
}

@end