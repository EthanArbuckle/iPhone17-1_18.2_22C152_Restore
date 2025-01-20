@interface _SEBrowserProcess
+ ($115C4C562B26FF47E01F9F4EA65B5887)_currentAuditToken;
+ (BOOL)checkBrowserEngineEntitlementForAuditToken:(id *)a3;
+ (BOOL)checkBrowserEngineEntitlementForCurrentProcess;
- (_SEBrowserProcess)init;
@end

@implementation _SEBrowserProcess

+ ($115C4C562B26FF47E01F9F4EA65B5887)_currentAuditToken
{
  uint64_t v4 = sub_25C221868();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25C221858();
  unint64_t v8 = sub_25C221848();
  unsigned int v9 = v8;
  unsigned int v11 = v10;
  unsigned int v13 = v12;
  unsigned int v15 = v14;
  unint64_t v16 = HIDWORD(v8);
  unint64_t v17 = HIDWORD(v10);
  unint64_t v21 = HIDWORD(v12);
  unint64_t v22 = HIDWORD(v14);
  result = ($115C4C562B26FF47E01F9F4EA65B5887 *)(*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  retstr->var0[0] = v9;
  retstr->var0[1] = v16;
  retstr->var0[2] = v11;
  retstr->var0[3] = v17;
  unsigned int v19 = v21;
  retstr->var0[4] = v13;
  retstr->var0[5] = v19;
  unsigned int v20 = v22;
  retstr->var0[6] = v15;
  retstr->var0[7] = v20;
  return result;
}

- (_SEBrowserProcess)init
{
  result = (_SEBrowserProcess *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (BOOL)checkBrowserEngineEntitlementForCurrentProcess
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FC58);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  _BrowserProcess.init()((uint64_t)v4);
  uint64_t v5 = type metadata accessor for _BrowserProcess(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 0, 1, v5);
  sub_25C2176CC((uint64_t)v4);
  return 1;
}

+ (BOOL)checkBrowserEngineEntitlementForAuditToken:(id *)a3
{
  uint64_t v3 = *(void *)&a3->var0[2];
  uint64_t v4 = *(void *)&a3->var0[4];
  uint64_t v5 = *(void *)&a3->var0[6];
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26B34FC58);
  MEMORY[0x270FA5388](v6 - 8);
  unint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  _BrowserProcess.init(auditToken:)(v3, v4, v5, (uint64_t)v8);
  uint64_t v9 = type metadata accessor for _BrowserProcess(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  sub_25C2176CC((uint64_t)v8);
  return 1;
}

@end