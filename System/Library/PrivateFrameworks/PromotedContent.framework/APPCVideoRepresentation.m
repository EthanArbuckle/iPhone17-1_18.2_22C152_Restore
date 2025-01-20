@interface APPCVideoRepresentation
- ($F24F406B2B787EFB06265DBA3D28CBD5)videoSize;
- (APPCVideoRepresentation)initWithIdentifier:(id)a3 adType:(int64_t)a4 desiredPosition:(int64_t)a5 videoURL:(id)a6 duration:(double)a7 fileSize:(int64_t)a8 skipThreshold:(double)a9 skipEnabled:(BOOL)a10 unbranded:(BOOL)a11 bitrate:(double)a12 connectionType:(int64_t)a13 signalStrength:(unint64_t)a14 videoSize:(id)a15 tapAction:(id)a16 adPolicyData:(id)a17;
- (BOOL)skipEnabled;
- (BOOL)unbranded;
- (NSURL)videoURL;
- (double)bitrate;
- (double)skipThreshold;
- (int64_t)connectionType;
- (int64_t)fileSize;
- (unint64_t)signalStrength;
- (void)setVideoURL:(id)a3;
@end

@implementation APPCVideoRepresentation

- (int64_t)fileSize
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_fileSize);
}

- (double)skipThreshold
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_skipThreshold);
}

- (BOOL)skipEnabled
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_skipEnabled);
}

- (BOOL)unbranded
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_unbranded);
}

- (double)bitrate
{
  return *(double *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_bitrate);
}

- (unint64_t)signalStrength
{
  return *(unint64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_signalStrength);
}

- (int64_t)connectionType
{
  return *(int64_t *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_connectionType);
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)videoSize
{
  double v2 = *(double *)((char *)&self->super.super.isa + OBJC_IVAR___APPCVideoRepresentation_videoSize);
  double v3 = *(double *)&self->super.identifier[OBJC_IVAR___APPCVideoRepresentation_videoSize];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (NSURL)videoURL
{
  uint64_t v3 = sub_1B5CB2FC0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_1B5C2BD5C(v6);

  v8 = (void *)sub_1B5CB2F90();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSURL *)v8;
}

- (void)setVideoURL:(id)a3
{
  uint64_t v4 = sub_1B5BFE044((uint64_t *)&unk_1EB851560);
  MEMORY[0x1F4188790](v4 - 8);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1B5CB2FC0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CB2FA0();
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v6, v10, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  v11 = (char *)self + OBJC_IVAR___APPCVideoRepresentation____lazy_storage___videoURL;
  swift_beginAccess();
  v12 = self;
  sub_1B5C2C5B4((uint64_t)v6, (uint64_t)v11);
  swift_endAccess();
}

- (APPCVideoRepresentation)initWithIdentifier:(id)a3 adType:(int64_t)a4 desiredPosition:(int64_t)a5 videoURL:(id)a6 duration:(double)a7 fileSize:(int64_t)a8 skipThreshold:(double)a9 skipEnabled:(BOOL)a10 unbranded:(BOOL)a11 bitrate:(double)a12 connectionType:(int64_t)a13 signalStrength:(unint64_t)a14 videoSize:(id)a15 tapAction:(id)a16 adPolicyData:(id)a17
{
  BOOL v35 = a10;
  uint64_t v33 = a5;
  uint64_t v34 = a8;
  uint64_t v32 = a4;
  double var1 = a15.var1;
  double var0 = a15.var0;
  uint64_t v22 = sub_1B5CB2FC0();
  MEMORY[0x1F4188790](v22 - 8);
  v24 = (char *)&v32 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1B5CB3100();
  MEMORY[0x1F4188790](v25 - 8);
  v27 = (char *)&v32 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CB30E0();
  sub_1B5CB2FA0();
  id v28 = a16;
  id v29 = a17;
  v30 = (APPCVideoRepresentation *)sub_1B5C2E730((uint64_t)v27, v32, v33, (uint64_t)v24, v34, v35, a11, a13, a7, a9, a12, var0, var1, a14, a16, a17);

  return v30;
}

- (void).cxx_destruct
{
  sub_1B5C077A4((uint64_t)self + OBJC_IVAR___APPCVideoRepresentation____lazy_storage___videoURL);
  uint64_t v3 = (char *)self + OBJC_IVAR___APPCVideoRepresentation_originalVideoURL;
  uint64_t v4 = sub_1B5CB2FC0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end