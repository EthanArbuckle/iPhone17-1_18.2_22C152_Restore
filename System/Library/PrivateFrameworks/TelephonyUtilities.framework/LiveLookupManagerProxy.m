@interface LiveLookupManagerProxy
- (LiveLookupManagerProxy)init;
- (int64_t)extensionCount;
@end

@implementation LiveLookupManagerProxy

- (int64_t)extensionCount
{
  v2 = self;
  unint64_t v3 = sub_19C5E0CD8();
  if (v3 >> 62) {
    int64_t v4 = sub_19C5E1008();
  }
  else {
    int64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }

  swift_bridgeObjectRelease();
  return v4;
}

- (void).cxx_destruct
{
}

- (LiveLookupManagerProxy)init
{
  uint64_t v3 = OBJC_IVAR___LiveLookupManagerProxy_manager;
  sub_19C5E0CF8();
  int64_t v4 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)sub_19C5E0CE8();

  v6.receiver = v4;
  v6.super_class = (Class)LiveLookupManagerProxy;
  return [(LiveLookupManagerProxy *)&v6 init];
}

@end