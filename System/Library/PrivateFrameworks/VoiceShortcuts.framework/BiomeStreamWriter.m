@interface BiomeStreamWriter
- (void)debouncerFired:(id)a3;
- (void)handleNotification:(id)a3;
@end

@implementation BiomeStreamWriter

- (void)handleNotification:(id)a3
{
  uint64_t v3 = sub_1C7E97E90();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1C7E97E50();
  swift_retain();
  sub_1C7DF9BEC((uint64_t)v6);
  swift_release();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (void)debouncerFired:(id)a3
{
  id v3 = a3;
  swift_retain();
  sub_1C7DF9FE8(v3);

  swift_release();
}

@end