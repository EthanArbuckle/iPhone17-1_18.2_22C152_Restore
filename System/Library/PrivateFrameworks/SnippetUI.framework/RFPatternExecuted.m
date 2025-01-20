@interface RFPatternExecuted
- (NSString)patternId;
- (NSString)patternType;
- (NSString)responseMode;
- (NSString)responseViewId;
- (_TtC9SnippetUI17RFPatternExecuted)init;
- (_TtC9SnippetUI17RFPatternExecuted)initWithPatternId:(id)a3 patternType:(id)a4 responseMode:(id)a5;
- (_TtC9SnippetUI17RFPatternExecuted)initWithPatternId:(id)a3 patternType:(id)a4 responseViewId:(id)a5 responseMode:(id)a6;
- (void)emitWithTurnIdentifier:(id)a3;
- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4;
@end

@implementation RFPatternExecuted

- (NSString)patternId
{
  return (NSString *)sub_22C3E3504(self, (uint64_t)a2, (void (*)(void))RFPatternExecuted.patternId.getter);
}

- (NSString)patternType
{
  return (NSString *)sub_22C3E3504(self, (uint64_t)a2, (void (*)(void))RFPatternExecuted.patternType.getter);
}

- (NSString)responseViewId
{
  return (NSString *)sub_22C3E3504(self, (uint64_t)a2, (void (*)(void))RFPatternExecuted.responseViewId.getter);
}

- (NSString)responseMode
{
  return (NSString *)sub_22C3E3504(self, (uint64_t)a2, (void (*)(void))RFPatternExecuted.responseMode.getter);
}

- (_TtC9SnippetUI17RFPatternExecuted)initWithPatternId:(id)a3 patternType:(id)a4 responseMode:(id)a5
{
  if (a3)
  {
    sub_22C64F480();
    if (a4) {
      goto LABEL_3;
    }
LABEL_6:
    if (!a5) {
      return (_TtC9SnippetUI17RFPatternExecuted *)RFPatternExecuted.init(patternId:patternType:responseMode:)();
    }
    goto LABEL_4;
  }
  if (!a4) {
    goto LABEL_6;
  }
LABEL_3:
  sub_22C64F480();
  if (a5) {
LABEL_4:
  }
    sub_22C64F480();
  return (_TtC9SnippetUI17RFPatternExecuted *)RFPatternExecuted.init(patternId:patternType:responseMode:)();
}

- (_TtC9SnippetUI17RFPatternExecuted)initWithPatternId:(id)a3 patternType:(id)a4 responseViewId:(id)a5 responseMode:(id)a6
{
  uint64_t v8 = (uint64_t)a4;
  if (a3)
  {
    uint64_t v9 = sub_22C64F480();
    uint64_t v11 = v10;
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v11 = 0;
    if (a4)
    {
LABEL_3:
      uint64_t v8 = sub_22C64F480();
      uint64_t v13 = v12;
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v15 = 0;
      if (a6) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v16 = 0;
      uint64_t v18 = 0;
      return (_TtC9SnippetUI17RFPatternExecuted *)RFPatternExecuted.init(patternId:patternType:responseViewId:responseMode:)(v9, v11, v8, v13, (uint64_t)a5, v15, v16, v18);
    }
  }
  uint64_t v13 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  a5 = (id)sub_22C64F480();
  uint64_t v15 = v14;
  if (!a6) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v16 = sub_22C64F480();
  uint64_t v18 = v17;
  return (_TtC9SnippetUI17RFPatternExecuted *)RFPatternExecuted.init(patternId:patternType:responseViewId:responseMode:)(v9, v11, v8, v13, (uint64_t)a5, v15, v16, v18);
}

- (void)emitWithTurnIdentifier:(id)a3
{
  uint64_t v4 = sub_22C648FF0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22C648FD0();
  uint64_t v8 = self;
  sub_22C3E39AC((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)emitWithTurnIdentifier:(id)a3 aceViewId:(id)a4
{
  uint64_t v5 = sub_22C648FF0();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v14 - v10;
  sub_22C648FD0();
  sub_22C648FD0();
  uint64_t v12 = self;
  sub_22C3E3B88((uint64_t)v11, (uint64_t)v8);

  uint64_t v13 = *(void (**)(char *, uint64_t))(v6 + 8);
  v13(v8, v5);
  v13(v11, v5);
}

- (_TtC9SnippetUI17RFPatternExecuted)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9SnippetUI17RFPatternExecuted_instrumentationClient;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end