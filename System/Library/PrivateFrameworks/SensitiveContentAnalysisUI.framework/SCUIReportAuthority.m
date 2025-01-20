@interface SCUIReportAuthority
- (SCUIReportAuthority)init;
- (SCUIReportAuthority)initWithLocale:(id)a3 moreHelpMenuOptions:(int64_t)a4 interventionType:(int64_t)a5;
- (unint64_t)kind;
@end

@implementation SCUIReportAuthority

- (unint64_t)kind
{
  uint64_t v3 = type metadata accessor for Report.Authority(0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C02FB24((uint64_t)self + OBJC_IVAR___SCUIReportAuthority_authority, (uint64_t)v5, type metadata accessor for Report.Authority);
  uint64_t v6 = type metadata accessor for Report.Authority.DirectAuthorityDetails(0);
  unint64_t v7 = 1;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v5, 1, v6) != 1)
  {
    sub_25C028464((uint64_t)v5, type metadata accessor for Report.Authority);
    return 0;
  }
  return v7;
}

- (SCUIReportAuthority)initWithLocale:(id)a3 moreHelpMenuOptions:(int64_t)a4 interventionType:(int64_t)a5
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A588308);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_25C0EA3C8();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  v15 = (char *)&v19 - v14;
  sub_25C0EA378();
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  sub_25C02873C(v13, a4, (uint64_t)v8);
  v17 = (SCUIReportAuthority *)(*(uint64_t (**)(char *))(ObjectType + 96))(v8);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
  swift_deallocPartialClassInstance();
  return v17;
}

- (SCUIReportAuthority)init
{
  result = (SCUIReportAuthority *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end