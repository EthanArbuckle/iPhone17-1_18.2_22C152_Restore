@interface MediaSocialProfileUpdateOperation
- (_TtC16MusicApplication33MediaSocialProfileUpdateOperation)init;
- (void)execute;
- (void)finishWithError:(id)a3;
@end

@implementation MediaSocialProfileUpdateOperation

- (void)execute
{
  v2 = self;
  sub_158DCC();
}

- (void)finishWithError:(id)a3
{
  v5 = *(void (**)(id))&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication33MediaSocialProfileUpdateOperation_responseHandler];
  if (!v5)
  {
    v9 = self;
    id v10 = a3;
    if (a3) {
      goto LABEL_3;
    }
LABEL_5:
    v8 = 0;
    goto LABEL_6;
  }
  v6 = self;
  id v7 = a3;
  v5(a3);
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  v8 = (void *)sub_AB07B0();
LABEL_6:
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MediaSocialProfileUpdateOperation();
  [(MediaSocialProfileUpdateOperation *)&v11 finishWithError:v8];
}

- (_TtC16MusicApplication33MediaSocialProfileUpdateOperation)init
{
  result = (_TtC16MusicApplication33MediaSocialProfileUpdateOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->profileUpdate[OBJC_IVAR____TtC16MusicApplication33MediaSocialProfileUpdateOperation_profileUpdate
                                    + 32];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_87510(v3);
  sub_1A528(*(void *)&self->MPAsyncOperation_opaque[OBJC_IVAR____TtC16MusicApplication33MediaSocialProfileUpdateOperation_responseHandler]);

  swift_bridgeObjectRelease();
}

@end