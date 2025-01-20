@interface PFArtworkFormatter
+ (id)formatArtworkUrlWithString:(id)a3 for:(CGSize)a4 cropCode:(id)a5 fileExtension:(id)a6;
+ (id)formatArtworkUrlWithUrl:(id)a3 for:(CGSize)a4 cropCode:(id)a5 fileExtension:(id)a6;
- (PFArtworkFormatter)init;
@end

@implementation PFArtworkFormatter

+ (id)formatArtworkUrlWithString:(id)a3 for:(CGSize)a4 cropCode:(id)a5 fileExtension:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7731B0);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE761B8();
  if (a5)
  {
    sub_1ACE761B8();
    a5 = v12;
  }
  sub_1ACE761B8();
  static ArtworkFormatter.formatArtworkUrl(string:for:cropCode:fileExtension:)((uint64_t)a5, (uint64_t)v11, width, height);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v13 = sub_1ACE74F28();
  uint64_t v14 = *(void *)(v13 - 8);
  v15 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v11, 1, v13) != 1)
  {
    v15 = (void *)sub_1ACE74E18();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v11, v13);
  }
  return v15;
}

+ (id)formatArtworkUrlWithUrl:(id)a3 for:(CGSize)a4 cropCode:(id)a5 fileExtension:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v9 = sub_1ACE74F28();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB7731B0);
  MEMORY[0x1F4188790](v13 - 8);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE74E98();
  if (a5)
  {
    sub_1ACE761B8();
    a5 = v16;
  }
  sub_1ACE761B8();
  sub_1ACE74DD8();
  static ArtworkFormatter.formatArtworkUrl(string:for:cropCode:fileExtension:)((uint64_t)a5, (uint64_t)v15, width, height);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v10 + 8);
  v17(v12, v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9) == 1)
  {
    v18 = 0;
  }
  else
  {
    v18 = (void *)sub_1ACE74E18();
    v17(v15, v9);
  }
  return v18;
}

- (PFArtworkFormatter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ArtworkFormatter();
  return [(PFArtworkFormatter *)&v3 init];
}

@end