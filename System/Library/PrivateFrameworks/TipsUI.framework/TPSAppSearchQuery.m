@interface TPSAppSearchQuery
+ (id)queryWithSearchTerm:(id)a3 origin:(int64_t)a4;
- (NSString)identifier;
- (NSString)searchTerm;
- (TPSAppSearchQuery)init;
- (TPSAppSearchQuery)initWithSearchTerm:(id)a3 origin:(int64_t)a4 identifier:(id)a5;
- (int64_t)origin;
- (void)executeWithCompletionHandler:(id)a3;
- (void)setOrigin:(int64_t)a3;
- (void)setSearchTerm:(id)a3;
@end

@implementation TPSAppSearchQuery

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (NSString)searchTerm
{
  uint64_t v3 = sub_2179E2820();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = self;
  sub_2179E2800();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  v9 = (void *)sub_2179E2900();
  swift_bridgeObjectRelease();

  return (NSString *)v9;
}

- (void)setSearchTerm:(id)a3
{
  sub_2179E2930();
  swift_beginAccess();
  uint64_t v4 = self;
  sub_2179E2810();
  swift_endAccess();
}

- (int64_t)origin
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___TPSAppSearchQuery_origin);
  swift_beginAccess();
  return *v2;
}

- (void)setOrigin:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___TPSAppSearchQuery_origin);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (TPSAppSearchQuery)initWithSearchTerm:(id)a3 origin:(int64_t)a4 identifier:(id)a5
{
  uint64_t v7 = sub_2179E2930();
  uint64_t v9 = v8;
  if (a5)
  {
    uint64_t v10 = sub_2179E2930();
    uint64_t v12 = v11;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v12 = 0;
  }
  return (TPSAppSearchQuery *)TPSAppSearchQuery.init(searchTerm:origin:identifier:)(v7, v9, a4, v10, v12);
}

+ (id)queryWithSearchTerm:(id)a3 origin:(int64_t)a4
{
  uint64_t v5 = sub_2179E2930();
  id C04makeE04with6originACXDSS_AC6OriginOtFZ_0 = _s6TipsUI17TPSAppSearchQueryC04makeE04with6originACXDSS_AC6OriginOtFZ_0(v5, v6, a4);
  swift_bridgeObjectRelease();

  return C04makeE04with6originACXDSS_AC6OriginOtFZ_0;
}

- (void)executeWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_267BA6270);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_2179E2A80();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = asc_267BA6280;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_267BA6290;
  v12[5] = v11;
  v13 = self;
  sub_21799D300((uint64_t)v7, (uint64_t)&unk_267BA62A0, (uint64_t)v12);
  swift_release();
}

- (TPSAppSearchQuery)init
{
  result = (TPSAppSearchQuery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___TPSAppSearchQuery__searchTerm;
  uint64_t v4 = sub_2179E2820();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end