@interface WKWallpaperPosterLook
- (NSString)displayName;
- (NSString)identifier;
- (_TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook)init;
- (_TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook)initWithDisplayName:(id)a3;
- (_TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook)initWithIdentifier:(id)a3 displayName:(id)a4;
- (void)setDisplayName:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation WKWallpaperPosterLook

- (_TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook)initWithIdentifier:(id)a3 displayName:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_1BE1CF460();
  uint64_t v8 = v7;
  uint64_t v9 = sub_1BE1CF460();
  v10 = (uint64_t *)((char *)self
                  + OBJC_IVAR____TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook_identifier);
  uint64_t *v10 = v6;
  v10[1] = v8;
  v11 = (uint64_t *)((char *)self
                  + OBJC_IVAR____TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook_displayName);
  uint64_t *v11 = v9;
  v11[1] = v12;
  v14.receiver = self;
  v14.super_class = ObjectType;
  return [(WKWallpaperPosterLook *)&v14 init];
}

- (_TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook)initWithDisplayName:(id)a3
{
  uint64_t v4 = sub_1BE1CEBE0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BE1CF460();
  sub_1BE1CEBD0();
  sub_1BE1CEBA0();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v8 = (void *)sub_1BE1CF430();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_1BE1CF430();
  swift_bridgeObjectRelease();
  v10 = [(WKWallpaperPosterLook *)self initWithIdentifier:v8 displayName:v9];

  return v10;
}

- (NSString)displayName
{
  return (NSString *)sub_1BE1B3F80();
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)identifier
{
  return (NSString *)sub_1BE1B3F80();
}

- (void)setIdentifier:(id)a3
{
}

- (_TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook)init
{
  result = (_TtC12WallpaperKitP33_EFDDAE94C6722FEA4441550D18B5A9BD21WKWallpaperPosterLook *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end