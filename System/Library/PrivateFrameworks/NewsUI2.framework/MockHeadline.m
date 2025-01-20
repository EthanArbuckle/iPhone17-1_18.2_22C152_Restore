@interface MockHeadline
- (BOOL)isIssueOnly;
- (NSDate)displayDate;
- (_TtC7NewsUI212MockHeadline)init;
- (void)setDisplayDate:(id)a3;
@end

@implementation MockHeadline

- (NSDate)displayDate
{
  sub_1DEA83C40();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC7NewsUI212MockHeadline__date;
  swift_beginAccess();
  uint64_t v7 = sub_1DFDE7600();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1DFDE74D0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)v9;
}

- (void)setDisplayDate:(id)a3
{
  uint64_t v5 = sub_1DFDE7600();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DEA83C40();
  uint64_t v10 = MEMORY[0x1F4188790](v9 - 8);
  v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  v14 = (char *)&v18 - v13;
  if (a3)
  {
    sub_1DFDE7570();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v14, 0, 1, v5);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))((char *)&v18 - v13, 1, 1, v5);
  }
  sub_1DEA1F784((uint64_t)v14, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v12, 1, v5) == 1)
  {
    v15 = self;
    sub_1DFDE7480();
    sub_1DEAEA868((uint64_t)v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v12, v5);
    v16 = self;
  }
  v17 = (char *)self + OBJC_IVAR____TtC7NewsUI212MockHeadline__date;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v6 + 40))(v17, v8, v5);
  swift_endAccess();
  sub_1DEAEA868((uint64_t)v14);
}

- (BOOL)isIssueOnly
{
  return *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC7NewsUI212MockHeadline__isIssueOnly);
}

- (_TtC7NewsUI212MockHeadline)init
{
  result = (_TtC7NewsUI212MockHeadline *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC7NewsUI212MockHeadline__date;
  uint64_t v3 = sub_1DFDE7600();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

@end