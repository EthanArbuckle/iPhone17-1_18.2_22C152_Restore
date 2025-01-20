@interface SecondPassConfig
- (BOOL)useEndpointer;
- (BOOL)waitForFinal;
- (NSString)description;
- (SecondPassConfig)init;
- (void)setUseEndpointer:(BOOL)a3;
- (void)setWaitForFinal:(BOOL)a3;
@end

@implementation SecondPassConfig

- (BOOL)waitForFinal
{
  v2 = (BOOL *)self + OBJC_IVAR___SecondPassConfig_waitForFinal;
  swift_beginAccess();
  return *v2;
}

- (void)setWaitForFinal:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SecondPassConfig_waitForFinal;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (BOOL)useEndpointer
{
  v2 = (BOOL *)self + OBJC_IVAR___SecondPassConfig_useEndpointer;
  swift_beginAccess();
  return *v2;
}

- (void)setUseEndpointer:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___SecondPassConfig_useEndpointer;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (SecondPassConfig)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SecondPassConfig_waitForFinal) = 1;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___SecondPassConfig_useEndpointer) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SecondPassConfig();
  return [(SecondPassConfig *)&v3 init];
}

- (NSString)description
{
  uint64_t v3 = sub_2614D5408();
  MEMORY[0x270FA5388](v3 - 8);
  sub_2614D4AE8();
  swift_allocObject();
  v4 = self;
  sub_2614D4AD8();
  type metadata accessor for SecondPassConfig();
  sub_2614393F8(&qword_26A915490, v5, (void (*)(uint64_t))type metadata accessor for SecondPassConfig);
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