@interface TPSSavedTipEntry
+ (BOOL)supportsSecureCoding;
- (NSDate)savedDate;
- (NSString)lastUsedVersion;
- (NSString)tipIdentifier;
- (TPSSavedTipEntry)init;
- (TPSSavedTipEntry)initWithCoder:(id)a3;
- (TPSSavedTipEntry)initWithTipIdentifier:(id)a3 savedDate:(id)a4 lastUsedVersion:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)setLastUsedVersion:(id)a3;
- (void)setSavedDate:(id)a3;
- (void)setTipIdentifier:(id)a3;
@end

@implementation TPSSavedTipEntry

- (NSString)tipIdentifier
{
  return (NSString *)sub_19C93CE90();
}

- (void)setTipIdentifier:(id)a3
{
}

- (NSDate)savedDate
{
  uint64_t v3 = sub_19C976560();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_19C976510();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v8;
}

- (void)setSavedDate:(id)a3
{
  uint64_t v4 = sub_19C976560();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_19C976530();
  v8 = (char *)self + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (NSString)lastUsedVersion
{
  return (NSString *)sub_19C93CE90();
}

- (void)setLastUsedVersion:(id)a3
{
}

- (TPSSavedTipEntry)initWithTipIdentifier:(id)a3 savedDate:(id)a4 lastUsedVersion:(id)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = sub_19C976560();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_19C9768B0();
  uint64_t v13 = v12;
  sub_19C976530();
  uint64_t v14 = sub_19C9768B0();
  uint64_t v16 = v15;
  v17 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSavedTipEntry_tipIdentifier);
  uint64_t *v17 = v11;
  v17[1] = v13;
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)self + OBJC_IVAR___TPSSavedTipEntry_savedDate, v10, v7);
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___TPSSavedTipEntry_lastUsedVersion);
  uint64_t *v18 = v14;
  v18[1] = v16;
  v21.receiver = self;
  v21.super_class = ObjectType;
  v19 = [(TPSSavedTipEntry *)&v21 init];
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v19;
}

- (TPSSavedTipEntry)init
{
  result = (TPSSavedTipEntry *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___TPSSavedTipEntry_savedDate;
  uint64_t v4 = sub_19C976560();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  TPSSavedTipEntry.encode(with:)((NSCoder)v4);
}

- (TPSSavedTipEntry)initWithCoder:(id)a3
{
  return (TPSSavedTipEntry *)TPSSavedTipEntry.init(coder:)(a3);
}

@end