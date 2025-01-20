@interface MTResizedArtworkURLProvider
+ (MTResizedArtworkURLProvider)sharedInstance;
+ (void)setSharedInstance:(id)a3;
- (MTResizedArtworkURLProvider)init;
- (id)resizedArtworkURLString:(id)a3 withDimension:(unint64_t)a4;
@end

@implementation MTResizedArtworkURLProvider

+ (MTResizedArtworkURLProvider)sharedInstance
{
  if (qword_1E99EFE78 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return (MTResizedArtworkURLProvider *)(id)qword_1E99F17A0;
}

+ (void)setSharedInstance:(id)a3
{
  uint64_t v3 = qword_1E99EFE78;
  id v4 = a3;
  if (v3 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v5 = (void *)qword_1E99F17A0;
  qword_1E99F17A0 = (uint64_t)v4;
}

- (id)resizedArtworkURLString:(id)a3 withDimension:(unint64_t)a4
{
  uint64_t v6 = sub_1ACE761B8();
  uint64_t v8 = v7;
  v9 = self;
  sub_1ACAAD148(v6, v8, a4);

  swift_bridgeObjectRelease();
  v10 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return v10;
}

- (MTResizedArtworkURLProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ResizedArtworkURLProvider();
  return [(MTResizedArtworkURLProvider *)&v3 init];
}

@end