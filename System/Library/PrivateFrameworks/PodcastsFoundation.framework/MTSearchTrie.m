@interface MTSearchTrie
- (MTSearchTrie)init;
- (void)addMatchCandidate:(id)a3;
@end

@implementation MTSearchTrie

- (MTSearchTrie)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___MTSearchTrie_rootNode;
  type metadata accessor for SearchTrie.Node();
  uint64_t v5 = swift_allocObject();
  *(unsigned char *)(v5 + 16) = 0;
  *(void *)(v5 + 24) = MEMORY[0x1E4FBC868];
  *(Class *)((char *)&self->super.isa + v4) = (Class)v5;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(MTSearchTrie *)&v7 init];
}

- (void).cxx_destruct
{
}

- (void)addMatchCandidate:(id)a3
{
  uint64_t v5 = sub_1ACE761B8();
  unint64_t v7 = v6;
  id v8 = a3;
  v9 = self;
  sub_1ACE27470(v5, v7);

  swift_bridgeObjectRelease();
}

@end