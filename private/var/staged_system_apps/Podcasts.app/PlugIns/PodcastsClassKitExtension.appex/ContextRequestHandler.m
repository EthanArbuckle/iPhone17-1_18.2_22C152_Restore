@interface ContextRequestHandler
- (_TtC25PodcastsClassKitExtension21ContextRequestHandler)init;
- (void)updateDescendantsOfContext:(id)a3 completion:(id)a4;
@end

@implementation ContextRequestHandler

- (void)updateDescendantsOfContext:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  v8 = self;
  sub_10000E474(v7, (void (**)(void, void))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (_TtC25PodcastsClassKitExtension21ContextRequestHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ContextRequestHandler();
  return [(ContextRequestHandler *)&v3 init];
}

@end