@interface Legacy.JSLocalizerObject
- (NSString)identifier;
- (_TtCO10PodcastsUI6Legacy17JSLocalizerObject)init;
- (id)decimal:(id)a3 :(int64_t)a4 :(int64_t)a5;
- (id)duration:(double)a3;
- (id)duration:(double)a3 abbreviated:(BOOL)a4;
- (id)formatDate:(id)a3 :(id)a4;
- (id)formattedCount:(id)a3;
- (id)friendlyDate:(id)a3;
- (id)stringWithCount:(id)a3 :(int64_t)a4;
- (id)timeAgo:(id)a3;
- (id)timeRange:(id)a3 :(id)a4 :(id)a5;
- (id)timeRangeWithFormat:(id)a3 :(id)a4 :(id)a5 :(id)a6;
@end

@implementation Legacy.JSLocalizerObject

- (NSString)identifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (id)decimal:(id)a3 :(int64_t)a4 :(int64_t)a5
{
  v8 = self;
  id v9 = a3;
  sub_1E3DBDC90(a3, a4, a5);
  uint64_t v11 = v10;

  if (v11)
  {
    v12 = (void *)sub_1E3E7CCF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)duration:(double)a3
{
  if (a3 == 0.0) {
    goto LABEL_2;
  }
  v6 = self;
  v7 = self;
  id v8 = objc_msgSend(v6, sel_prettyShortStringWithDuration_abbreviated_, 0, a3);
  if (!v8)
  {

LABEL_2:
    v3 = 0;
    goto LABEL_5;
  }
  id v9 = v8;
  sub_1E3E7CD30();

  v3 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();
LABEL_5:

  return v3;
}

- (id)duration:(double)a3 abbreviated:(BOOL)a4
{
  if (a3 == 0.0) {
    goto LABEL_2;
  }
  BOOL v5 = a4;
  id v8 = self;
  id v9 = self;
  id v10 = objc_msgSend(v8, sel_prettyShortStringWithDuration_abbreviated_, v5, a3);
  if (!v10)
  {

LABEL_2:
    v4 = 0;
    goto LABEL_5;
  }
  uint64_t v11 = v10;
  sub_1E3E7CD30();

  v4 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();
LABEL_5:

  return v4;
}

- (id)formatDate:(id)a3 :(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBFDEDF0);
  MEMORY[0x1F4188790](v6 - 8);
  id v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1E3E7CD30();
  uint64_t v11 = v10;
  if (a4)
  {
    sub_1E3E77DF0();
    uint64_t v12 = sub_1E3E77E20();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_1E3E77E20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v8, 1, 1, v13);
  }
  v14 = self;
  sub_1E3DBE4B4(v9, v11, (uint64_t)v8);
  uint64_t v16 = v15;

  swift_bridgeObjectRelease();
  sub_1E3C10CE0((uint64_t)v8, (uint64_t *)&unk_1EBFDEDF0);
  if (v16)
  {
    v17 = (void *)sub_1E3E7CCF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)formattedCount:(id)a3
{
  uint64_t v5 = sub_1E3E77F00();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  id v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = self;
  id v10 = a3;
  sub_1E3E77EB0();
  sub_1E3DBEB28(a3);
  uint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  if (v12)
  {
    uint64_t v13 = (void *)sub_1E3E7CCF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)friendlyDate:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBFDEDF0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v8);
  id v10 = (char *)&v16 - v9;
  if (a3)
  {
    sub_1E3E77DF0();
    uint64_t v11 = sub_1E3E77E20();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  }
  else
  {
    uint64_t v11 = sub_1E3E77E20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 1, 1, v11);
  }
  sub_1E3D76104((uint64_t)v10, (uint64_t)v7);
  sub_1E3E77E20();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) == 1)
  {
    sub_1E3C10CE0((uint64_t)v7, (uint64_t *)&unk_1EBFDEDF0);
    sub_1E3C10CE0((uint64_t)v10, (uint64_t *)&unk_1EBFDEDF0);
    uint64_t v13 = 0;
  }
  else
  {
    v14 = self;
    sub_1E3E77DA0();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);

    sub_1E3C10CE0((uint64_t)v10, (uint64_t *)&unk_1EBFDEDF0);
    uint64_t v13 = (void *)sub_1E3E7CCF0();
    swift_bridgeObjectRelease();
  }

  return v13;
}

- (id)stringWithCount:(id)a3 :(int64_t)a4
{
  uint64_t v6 = sub_1E3E7CD30();
  uint64_t v8 = v7;
  uint64_t v9 = self;
  sub_1E3DBF0F8(v6, v8, a4);

  swift_bridgeObjectRelease();
  id v10 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();

  return v10;
}

- (id)timeAgo:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBFDEDF0);
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1E3E77DF0();
    uint64_t v8 = sub_1E3E77E20();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1E3E77E20();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  id v10 = self;
  sub_1E3DBF380((uint64_t)v7);
  uint64_t v12 = v11;

  sub_1E3C10CE0((uint64_t)v7, (uint64_t *)&unk_1EBFDEDF0);
  if (v12)
  {
    uint64_t v13 = (void *)sub_1E3E7CCF0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)timeRange:(id)a3 :(id)a4 :(id)a5
{
  uint64_t v6 = sub_1E3E77E20();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  uint64_t v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v10);
  uint64_t v12 = (char *)&v24 - v11;
  sub_1E3E77DF0();
  sub_1E3E77DF0();
  uint64_t v13 = sub_1E3E7CD30();
  uint64_t v15 = v14;
  uint64_t v16 = self;
  id v17 = sub_1E3DBFACC(v13, v15);
  v18 = (void *)sub_1E3E77DD0();
  uint64_t v19 = (void *)sub_1E3E77DD0();
  id v20 = objc_msgSend(v17, sel_stringFromDate_toDate_, v18, v19);

  sub_1E3E7CD30();
  swift_bridgeObjectRelease();

  v21 = *(void (**)(char *, uint64_t))(v7 + 8);
  v21(v9, v6);
  v21(v12, v6);
  v22 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();

  return v22;
}

- (id)timeRangeWithFormat:(id)a3 :(id)a4 :(id)a5 :(id)a6
{
  uint64_t v8 = sub_1E3E77E20();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x1F4188790](v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1F4188790](v12);
  uint64_t v14 = (char *)&v24 - v13;
  sub_1E3E77DF0();
  sub_1E3E77DF0();
  uint64_t v15 = sub_1E3E7CD30();
  uint64_t v17 = v16;
  if (a6)
  {
    uint64_t v18 = sub_1E3E7CD30();
    a6 = v19;
  }
  else
  {
    uint64_t v18 = 0;
  }
  id v20 = self;
  sub_1E3DBFE30((uint64_t)v14, (uint64_t)v11, v15, v17, v18, (uint64_t)a6);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v21 = *(void (**)(char *, uint64_t))(v9 + 8);
  v21(v11, v8);
  v21(v14, v8);
  v22 = (void *)sub_1E3E7CCF0();
  swift_bridgeObjectRelease();

  return v22;
}

- (_TtCO10PodcastsUI6Legacy17JSLocalizerObject)init
{
  result = (_TtCO10PodcastsUI6Legacy17JSLocalizerObject *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtCO10PodcastsUI6Legacy17JSLocalizerObject_locale;
  uint64_t v4 = sub_1E3E77F00();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end