@interface PXAppIntentsEngagementCompatibility
+ (void)donateSearchEvent;
- (_TtC12PhotosUICore35PXAppIntentsEngagementCompatibility)init;
@end

@implementation PXAppIntentsEngagementCompatibility

+ (void)donateSearchEvent
{
  sub_1A9CD7A64();
  MEMORY[0x1F4188790](v2 - 8, v3);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB23AD4C();
  uint64_t v6 = sub_1AB23AD7C();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = 0;
  *(void *)(v7 + 24) = 0;
  sub_1A9FA14C0((uint64_t)v5, (uint64_t)&unk_1E9836FA0, v7);
  swift_release();
  sub_1A9D7690C((uint64_t)v5);
}

- (_TtC12PhotosUICore35PXAppIntentsEngagementCompatibility)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for PXAppIntentsEngagementCompatibility();
  return [(PXAppIntentsEngagementCompatibility *)&v3 init];
}

@end