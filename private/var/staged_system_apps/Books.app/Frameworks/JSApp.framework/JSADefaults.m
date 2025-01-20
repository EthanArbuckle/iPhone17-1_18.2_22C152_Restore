@interface JSADefaults
+ (BOOL)showDebugMenu;
+ (void)setShowDebugMenu:(BOOL)a3;
- (JSADefaults)init;
@end

@implementation JSADefaults

+ (BOOL)showDebugMenu
{
  uint64_t v2 = sub_2D920(&qword_CC7D8);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = &v8[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_CC468 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_31DE4(v2, (uint64_t)qword_CCD58);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_86080();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v5, v2);
  return v8[15];
}

+ (void)setShowDebugMenu:(BOOL)a3
{
  uint64_t v4 = sub_2D920(&qword_CC7D8);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = &v9[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (qword_CC468 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_31DE4(v4, (uint64_t)qword_CCD58);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  v9[15] = a3;
  sub_86090();
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
}

- (JSADefaults)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Defaults();
  return [(JSADefaults *)&v3 init];
}

@end