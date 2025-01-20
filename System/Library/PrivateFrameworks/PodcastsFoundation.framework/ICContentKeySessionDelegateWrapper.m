@interface ICContentKeySessionDelegateWrapper
- (_TtC18PodcastsFoundationP33_C5CCB7FDAA241CA13F97384CFFA3ACE334ICContentKeySessionDelegateWrapper)init;
- (void)contentKeySession:(id)a3 didFinishProcessingKey:(id)a4 withResponse:(id)a5 error:(id)a6;
@end

@implementation ICContentKeySessionDelegateWrapper

- (void)contentKeySession:(id)a3 didFinishProcessingKey:(id)a4 withResponse:(id)a5 error:(id)a6
{
  uint64_t v10 = sub_1ACE761B8();
  unint64_t v12 = v11;
  if (MEMORY[0x1AD11B470]((char *)self+ OBJC_IVAR____TtC18PodcastsFoundationP33_C5CCB7FDAA241CA13F97384CFFA3ACE334ICContentKeySessionDelegateWrapper_delegate))
  {
    id v13 = a3;
    id v14 = a5;
    v15 = self;
    id v16 = a6;
    sub_1ACE4DE18(v10, v12, a5, a6);

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (_TtC18PodcastsFoundationP33_C5CCB7FDAA241CA13F97384CFFA3ACE334ICContentKeySessionDelegateWrapper)init
{
  result = (_TtC18PodcastsFoundationP33_C5CCB7FDAA241CA13F97384CFFA3ACE334ICContentKeySessionDelegateWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end