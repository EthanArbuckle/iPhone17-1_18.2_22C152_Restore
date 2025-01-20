@interface MediaSocialProfileRequestOperation
- (_TtC16MusicApplication34MediaSocialProfileRequestOperation)init;
- (void)execute;
- (void)finishWithError:(id)a3;
@end

@implementation MediaSocialProfileRequestOperation

- (void)execute
{
  v2 = self;
  sub_180B44();
}

- (void)finishWithError:(id)a3
{
  v5 = *(void (**)(void *, id))&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication34MediaSocialProfileRequestOperation_responseHandler];
  sub_9B984((uint64_t)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication34MediaSocialProfileRequestOperation_loadedProfile], (uint64_t)v10);
  v6 = self;
  sub_181E78(v10, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_D0C60);
  id v7 = a3;
  v5(v10, a3);
  sub_181E78(v10, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_9BA68);
  if (a3) {
    v8 = (void *)sub_AB07B0();
  }
  else {
    v8 = 0;
  }
  v9.receiver = v6;
  v9.super_class = (Class)type metadata accessor for MediaSocialProfileRequestOperation();
  [(MediaSocialProfileRequestOperation *)&v9 finishWithError:v8];
}

- (_TtC16MusicApplication34MediaSocialProfileRequestOperation)init
{
  result = (_TtC16MusicApplication34MediaSocialProfileRequestOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_9B984((uint64_t)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication34MediaSocialProfileRequestOperation_loadedProfile], (uint64_t)v3);
  sub_181E78(v3, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_9BA68);
}

@end