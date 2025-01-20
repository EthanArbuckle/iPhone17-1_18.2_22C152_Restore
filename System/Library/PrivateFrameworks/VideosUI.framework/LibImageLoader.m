@interface LibImageLoader
- (BOOL)hasImageCache;
- (_TtC8VideosUI14LibImageLoader)init;
- (id)URLForObject:(id)a3;
- (id)imageKeyForObject:(id)a3;
- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8;
- (void)cancelLoad:(id)a3;
@end

@implementation LibImageLoader

- (_TtC8VideosUI14LibImageLoader)init
{
  return (_TtC8VideosUI14LibImageLoader *)sub_1E31B153C();
}

- (BOOL)hasImageCache
{
  return 1;
}

- (id)URLForObject:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBF8F0E0);
  uint64_t v6 = OUTLINED_FUNCTION_7(v5);
  MEMORY[0x1F4188790](v6);
  OUTLINED_FUNCTION_18_2();
  swift_unknownObjectRetain();
  v7 = self;
  sub_1E387DB08();
  swift_unknownObjectRelease();
  sub_1E31B1618(v3);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v13);
  uint64_t v8 = sub_1E38760D8();
  v9 = 0;
  if (__swift_getEnumTagSinglePayload(v3, 1, v8) != 1)
  {
    v9 = (void *)sub_1E3876028();
    uint64_t v10 = OUTLINED_FUNCTION_54();
    v11(v10);
  }
  return v9;
}

- (id)imageKeyForObject:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1E387DB08();
  swift_unknownObjectRelease();
  sub_1E31B1770((uint64_t)v9);
  uint64_t v6 = v5;

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  if (v6)
  {
    OUTLINED_FUNCTION_54();
    v7 = (void *)sub_1E387C8E8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)cancelLoad:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1E387DB08();
  swift_unknownObjectRelease();
  sub_1E31B1B9C((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);
}

- (id)loadImageForObject:(id)a3 scaleToSize:(CGSize)a4 cropToFit:(BOOL)a5 imageDirection:(int64_t)a6 requestLoader:(id)a7 completionHandler:(id)a8
{
  OUTLINED_FUNCTION_5_1();
  v9 = v8;
  v11 = _Block_copy(v10);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v12 = v9;
  sub_1E387DB08();
  swift_unknownObjectRelease();
  *(void *)(OUTLINED_FUNCTION_21_0() + 16) = v11;
  sub_1E31B1E14();
  swift_unknownObjectRelease();

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v19);
  if (v21)
  {
    v13 = __swift_project_boxed_opaque_existential_1(v20, v21);
    MEMORY[0x1F4188790](v13);
    OUTLINED_FUNCTION_33();
    v14();
    OUTLINED_FUNCTION_166();
    v15 = (void *)sub_1E387E238();
    uint64_t v16 = OUTLINED_FUNCTION_166();
    v17(v16);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v20);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (void).cxx_destruct
{
}

@end