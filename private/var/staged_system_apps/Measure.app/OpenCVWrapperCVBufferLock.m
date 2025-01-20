@interface OpenCVWrapperCVBufferLock
- (id)initInternal;
- (void)dealloc;
@end

@implementation OpenCVWrapperCVBufferLock

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC7Measure25OpenCVWrapperCVBufferLock_buffer);
  CVPixelBufferLockFlags v5 = *(CVPixelBufferLockFlags *)((char *)&self->super.super.isa
                                 + OBJC_IVAR____TtC7Measure25OpenCVWrapperCVBufferLock_lockFlags);
  v6 = self;
  Swift::Int32 v7 = CVPixelBufferUnlockBaseAddress(v4, v5);
  v8._object = (void *)0x80000001004282C0;
  v8._countAndFlagsBits = 0xD00000000000001ELL;
  logCVError(_:label:)(v7, v8);
  v9.receiver = v6;
  v9.super_class = ObjectType;
  [(OpenCVWrapperCVBufferLock *)&v9 dealloc];
}

- (void).cxx_destruct
{
}

- (id)initInternal
{
  id result = (id)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end