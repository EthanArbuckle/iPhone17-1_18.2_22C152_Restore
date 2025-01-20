@interface AudioCaptureConfig
- (AudioCaptureConfig)init;
- (NSString)description;
- (int64_t)leftOfStartFrameOffset;
- (int64_t)rightOfEndFrameOffset;
- (void)setLeftOfStartFrameOffset:(int64_t)a3;
- (void)setRightOfEndFrameOffset:(int64_t)a3;
@end

@implementation AudioCaptureConfig

- (int64_t)leftOfStartFrameOffset
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___AudioCaptureConfig_leftOfStartFrameOffset);
  swift_beginAccess();
  return *v2;
}

- (void)setLeftOfStartFrameOffset:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___AudioCaptureConfig_leftOfStartFrameOffset);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (int64_t)rightOfEndFrameOffset
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___AudioCaptureConfig_rightOfEndFrameOffset);
  swift_beginAccess();
  return *v2;
}

- (void)setRightOfEndFrameOffset:(int64_t)a3
{
  v4 = (int64_t *)((char *)self + OBJC_IVAR___AudioCaptureConfig_rightOfEndFrameOffset);
  swift_beginAccess();
  int64_t *v4 = a3;
}

- (AudioCaptureConfig)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AudioCaptureConfig_leftOfStartFrameOffset) = (Class)1;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AudioCaptureConfig_rightOfEndFrameOffset) = (Class)8;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudioCapture();
  return [(AudioCaptureConfig *)&v3 init];
}

- (NSString)description
{
  uint64_t v3 = sub_2614D5408();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2614D4AE8();
  swift_allocObject();
  v4 = self;
  sub_2614D4AD8();
  type metadata accessor for AudioCapture();
  sub_2614393F8(&qword_26A915548, v5, (void (*)(uint64_t))type metadata accessor for AudioCapture);
  uint64_t v6 = sub_2614D4AC8();
  unint64_t v8 = v7;
  swift_release();
  sub_2614D53F8();
  sub_2614D53C8();
  if (v9)
  {
    sub_2613C2314(v6, v8);

    v10 = (void *)sub_2614D5378();
    swift_bridgeObjectRelease();
    return (NSString *)v10;
  }
  else
  {
    __break(1u);
    result = (NSString *)swift_unexpectedError();
    __break(1u);
  }
  return result;
}

@end