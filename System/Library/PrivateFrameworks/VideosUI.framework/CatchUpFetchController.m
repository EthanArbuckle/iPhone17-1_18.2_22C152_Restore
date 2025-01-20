@interface CatchUpFetchController
- (BOOL)mediaInfoContainsImageAtIndex:(unint64_t)a3;
- (BOOL)mediaInfoContainsPlayerAtIndex:(unint64_t)a3;
- (NSArray)mediaInfos;
- (_TtC8VideosUI22CatchUpFetchController)init;
- (_TtC8VideosUI22CatchUpFetchController)initWithMediaInfos:(id)a3;
- (id)loadPlayerAtIndex:(unint64_t)a3;
- (void)appendMediaInfos:(id)a3;
- (void)dealloc;
- (void)loadImageAtIndex:(unint64_t)a3 completion:(id)a4;
- (void)setMediaInfos:(id)a3;
@end

@implementation CatchUpFetchController

- (NSArray)mediaInfos
{
  v2 = self;
  sub_1E325AEB0();

  sub_1E2BE915C(0, (unint64_t *)&qword_1EBFAFAC0);
  OUTLINED_FUNCTION_17_57();
  OUTLINED_FUNCTION_11_4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (void)setMediaInfos:(id)a3
{
  sub_1E2BE915C(0, (unint64_t *)&qword_1EBFAFAC0);
  OUTLINED_FUNCTION_9_87();
  v4 = self;
  sub_1E325B250();
}

- (void)dealloc
{
  v2 = self;
  sub_1E325BBB8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22CatchUpFetchController_selectedAudioOption));

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8VideosUI22CatchUpFetchController_imageOperationQueue));
  swift_bridgeObjectRelease();
}

- (void)appendMediaInfos:(id)a3
{
  sub_1E2BE915C(0, (unint64_t *)&qword_1EBFAFAC0);
  OUTLINED_FUNCTION_9_87();
  v4 = self;
  OUTLINED_FUNCTION_11_4();
  sub_1E325BECC();

  swift_bridgeObjectRelease();
}

- (void)loadImageAtIndex:(unint64_t)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = self;
  sub_1E317843C((uint64_t)&unk_1EADED900, (uint64_t)v7);
}

- (BOOL)mediaInfoContainsImageAtIndex:(unint64_t)a3
{
  v4 = self;
  uint64_t v5 = OUTLINED_FUNCTION_11_4();
  char v6 = sub_1E325C7F0(v5);

  return v6 & 1;
}

- (BOOL)mediaInfoContainsPlayerAtIndex:(unint64_t)a3
{
  return sub_1E325C8B8(a3) & 1;
}

- (id)loadPlayerAtIndex:(unint64_t)a3
{
  v4 = self;
  unint64_t v5 = OUTLINED_FUNCTION_11_4();
  char v6 = (void *)sub_1E325C934(v5);

  return v6;
}

- (_TtC8VideosUI22CatchUpFetchController)initWithMediaInfos:(id)a3
{
}

- (_TtC8VideosUI22CatchUpFetchController)init
{
}

@end