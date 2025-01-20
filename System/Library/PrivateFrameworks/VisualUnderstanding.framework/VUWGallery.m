@interface VUWGallery
- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 observation:(id)a5 context:(id)a6 type:(int64_t)a7 boundingBox:(id)a8 error:(id *)a9;
- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 observation:(id)a5 context:(id)a6 type:(int64_t)a7 error:(id *)a8;
- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 observation:(id)a5 context:(id)a6 type:(int64_t)a7 randomizeWithSeed:(int64_t)a8 error:(id *)a9;
- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 observation:(id)a5 type:(int64_t)a6 options:(id)a7 error:(id *)a8;
- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 tag:(id)a5 client:(int64_t)a6 type:(int64_t)a7 boundingBox:(id)a8 error:(id *)a9;
- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 tag:(id)a5 client:(int64_t)a6 type:(int64_t)a7 error:(id *)a8;
- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 tag:(id)a5 client:(int64_t)a6 type:(int64_t)a7 options:(id)a8 error:(id *)a9;
- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 tag:(id)a5 client:(int64_t)a6 type:(int64_t)a7 randomizeWithSeed:(int64_t)a8 error:(id *)a9;
- (BOOL)prewarmAndReturnError:(id *)a3;
- (BOOL)resetForType:(int64_t)a3 error:(id *)a4;
- (BOOL)updateForType:(int64_t)a3 withVectorStore:(id)a4 force:(BOOL)a5 progressHandler:(id)a6 error:(id *)a7;
- (BOOL)updateForType:(int64_t)a3 withVectorStore:(id)a4 mode:(int64_t)a5 progressHandler:(id)a6 error:(id *)a7;
- (BOOL)updateForType:(int64_t)a3 withVectorStore:(id)a4 progressHandler:(id)a5 error:(id *)a6;
- (BOOL)updatePlugin:(int64_t)a3 progressHandler:(id)a4 error:(id *)a5;
- (VUWGallery)init;
- (VUWGallery)initWithPath:(id)a3 error:(id *)a4;
- (id)tokenEmbeddingsForObservation:(id)a3 type:(int64_t)a4 error:(id *)a5;
- (id)tokenEmbeddingsForTag:(id)a3 client:(int64_t)a4 type:(int64_t)a5 error:(id *)a6;
- (int64_t)assetCountForType:(int64_t)a3;
@end

@implementation VUWGallery

- (VUWGallery)initWithPath:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_26111E618();
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26111E5A8();
  return (VUWGallery *)sub_26110BA0C((uint64_t)v6);
}

- (BOOL)prewarmAndReturnError:(id *)a3
{
  return 1;
}

- (id)tokenEmbeddingsForTag:(id)a3 client:(int64_t)a4 type:(int64_t)a5 error:(id *)a6
{
  uint64_t v8 = sub_26111E778();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_26111E768();
  v12 = self;
  v13 = sub_26110E500((uint64_t)v11, a5);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);

  return v13;
}

- (id)tokenEmbeddingsForObservation:(id)a3 type:(int64_t)a4 error:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = self;
  sub_26110BE34((uint64_t)v7, a4);
  uint64_t v10 = v9;

  return v10;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 tag:(id)a5 client:(int64_t)a6 type:(int64_t)a7 options:(id)a8 error:(id *)a9
{
  uint64_t v14 = sub_26111E778();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  v17 = ((char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_26111E768();
  id v18 = a8;
  v19 = self;
  sub_26110E5BC(a3, a4, v17, a7, (uint64_t)a8);
  (*(void (**)(NSObject *, uint64_t))(v15 + 8))(v17, v14);

  return 1;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 observation:(id)a5 type:(int64_t)a6 options:(id)a7 error:(id *)a8
{
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = self;
  sub_26110C3E8(a3, a4, v13, a6, (uint64_t)a7);

  return 1;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 tag:(id)a5 client:(int64_t)a6 type:(int64_t)a7 error:(id *)a8
{
  uint64_t v12 = sub_26111E778();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = ((char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_26111E768();
  uint64_t v16 = self;
  sub_26110E744(a3, a4, v15, a7);
  (*(void (**)(NSObject *, uint64_t))(v13 + 8))(v15, v12);

  return 1;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 tag:(id)a5 client:(int64_t)a6 type:(int64_t)a7 randomizeWithSeed:(int64_t)a8 error:(id *)a9
{
  uint64_t v14 = sub_26111E778();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  v17 = ((char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_26111E768();
  uint64_t v18 = self;
  sub_26110E84C(a3, a4, v17, a7, a8);
  (*(void (**)(NSObject *, uint64_t))(v15 + 8))(v17, v14);

  return 1;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 tag:(id)a5 client:(int64_t)a6 type:(int64_t)a7 boundingBox:(id)a8 error:(id *)a9
{
  uint64_t v14 = sub_26111E778();
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  v17 = ((char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_26111E768();
  if (a8)
  {
    sub_261071924(0, (unint64_t *)&qword_26B40AC30);
    a8 = (id)sub_26111ED88();
  }
  uint64_t v18 = self;
  sub_26110E958(a3, a4, v17, a7, (unint64_t)a8);
  (*(void (**)(NSObject *, uint64_t))(v15 + 8))(v17, v14);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 observation:(id)a5 context:(id)a6 type:(int64_t)a7 error:(id *)a8
{
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = self;
  sub_26110EBD4(a3, a4, v13, a7);

  return 1;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 observation:(id)a5 context:(id)a6 type:(int64_t)a7 randomizeWithSeed:(int64_t)a8 error:(id *)a9
{
  id v15 = a5;
  id v16 = a6;
  v17 = self;
  sub_26110ECD4(a3, a4, v15, a7, a8);

  return 1;
}

- (BOOL)personalizeEmbeddingLayer:(id *)a3 index:(int64_t)a4 observation:(id)a5 context:(id)a6 type:(int64_t)a7 boundingBox:(id)a8 error:(id *)a9
{
  unint64_t v9 = (unint64_t)a8;
  if (a8)
  {
    sub_261071924(0, (unint64_t *)&qword_26B40AC30);
    unint64_t v9 = sub_26111ED88();
  }
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = self;
  sub_26110EDD8(a3, a4, v16, a7, v9);

  swift_bridgeObjectRelease();
  return 1;
}

- (BOOL)updateForType:(int64_t)a3 withVectorStore:(id)a4 progressHandler:(id)a5 error:(id *)a6
{
  uint64_t v9 = sub_26111E618();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v13 = _Block_copy(a5);
  sub_26111E5A8();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v13;
  id v15 = self;
  sub_26110CD94(a3, (uint64_t)v12, (uint64_t)sub_26110F398, v14);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  swift_release();

  return 1;
}

- (BOOL)updateForType:(int64_t)a3 withVectorStore:(id)a4 mode:(int64_t)a5 progressHandler:(id)a6 error:(id *)a7
{
  uint64_t v11 = sub_26111E618();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = _Block_copy(a6);
  sub_26111E5A8();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  uint64_t v17 = self;
  sub_26110D178(a3, (uint64_t)v14, a5, (uint64_t)sub_26110F398, v16);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_release();

  return 1;
}

- (BOOL)updateForType:(int64_t)a3 withVectorStore:(id)a4 force:(BOOL)a5 progressHandler:(id)a6 error:(id *)a7
{
  uint64_t v11 = sub_26111E618();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v15 = _Block_copy(a6);
  sub_26111E5A8();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v15;
  uint64_t v17 = self;
  sub_26110D590(a3, (uint64_t)v14, a5, (uint64_t)sub_26110F398, v16);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  swift_release();

  return 1;
}

- (BOOL)updatePlugin:(int64_t)a3 progressHandler:(id)a4 error:(id *)a5
{
  id v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v7;
  uint64_t v9 = self;
  sub_26110D990(a3, (uint64_t)sub_26110F30C, v8);
  swift_release();

  return 1;
}

- (int64_t)assetCountForType:(int64_t)a3
{
  uint64_t v4 = self;
  int64_t v5 = sub_26110DB68(a3);

  return v5;
}

- (BOOL)resetForType:(int64_t)a3 error:(id *)a4
{
  int64_t v5 = self;
  sub_26110DD0C(a3);

  return 1;
}

- (VUWGallery)init
{
  result = (VUWGallery *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end