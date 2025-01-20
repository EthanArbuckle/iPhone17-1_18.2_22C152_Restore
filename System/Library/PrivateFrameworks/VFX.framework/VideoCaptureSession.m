@interface VideoCaptureSession
- (_TtC3VFX19VideoCaptureSession)init;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)dealloc;
@end

@implementation VideoCaptureSession

- (void)dealloc
{
  sub_1B68098FC((char *)self, (uint64_t)a2, &OBJC_IVAR____TtC3VFX19VideoCaptureSession_session, (SEL *)&selRef_stopRunning, v2, (uint64_t (*)(uint64_t))type metadata accessor for VideoCaptureSession);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC3VFX19VideoCaptureSession_sampleBuffer);
}

- (_TtC3VFX19VideoCaptureSession)init
{
  result = (_TtC3VFX19VideoCaptureSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8 = a3;
  v9 = a4;
  id v10 = a5;
  v12 = self;
  v11 = (void *)MEMORY[0x1BA9B6EE0]();
  sub_1B68070F8((uint64_t)v8, v9, (uint64_t)v12);
}

@end