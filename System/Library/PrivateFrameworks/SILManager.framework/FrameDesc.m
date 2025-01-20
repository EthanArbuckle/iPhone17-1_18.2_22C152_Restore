@interface FrameDesc
- (BOOL)skipEic;
- (BOOL)unnoticeable;
- (SILFrameDesc)getSILFrameDesc;
- (_TtC10SILManager9FrameDesc)init;
- (float)size;
- (float)time;
- (unsigned)dataOffset;
- (unsigned)dataSize;
@end

@implementation FrameDesc

- (unsigned)dataOffset
{
  return *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager9FrameDesc_dataOffset);
}

- (unsigned)dataSize
{
  return *(_DWORD *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager9FrameDesc_dataSize);
}

- (float)time
{
  return *(float *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager9FrameDesc_time);
}

- (float)size
{
  return *(float *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager9FrameDesc_size);
}

- (BOOL)unnoticeable
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager9FrameDesc_unnoticeable);
}

- (BOOL)skipEic
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC10SILManager9FrameDesc_skipEic);
}

- (SILFrameDesc)getSILFrameDesc
{
  float v3 = *(float *)((char *)&self->var0 + OBJC_IVAR____TtC10SILManager9FrameDesc_size);
  unsigned int v4 = *(_DWORD *)((char *)&self->var0 + OBJC_IVAR____TtC10SILManager9FrameDesc_dataOffset);
  unsigned int v5 = *(_DWORD *)((char *)&self->var0 + OBJC_IVAR____TtC10SILManager9FrameDesc_dataSize);
  char v6 = *((unsigned char *)&self->var0 + OBJC_IVAR____TtC10SILManager9FrameDesc_unnoticeable);
  char v7 = *((unsigned char *)&self->var0 + OBJC_IVAR____TtC10SILManager9FrameDesc_skipEic);
  retstr->var0 = *(float *)((char *)&self->var0 + OBJC_IVAR____TtC10SILManager9FrameDesc_time);
  retstr->var1 = v3;
  retstr->var2 = v4;
  retstr->var3 = v5;
  retstr->var4 = v6;
  retstr->var5 = v7;
  return self;
}

- (_TtC10SILManager9FrameDesc)init
{
  result = (_TtC10SILManager9FrameDesc *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end