@interface PhotosViewPersonBannerController
- (void)photosBannerProviderInvalidateLoadedBanner:(id)a3;
@end

@implementation PhotosViewPersonBannerController

- (void)photosBannerProviderInvalidateLoadedBanner:(id)a3
{
  sub_1A9B7F0E8(0, (unint64_t *)&qword_1E9821250, MEMORY[0x1E4FBCFE8]);
  MEMORY[0x1F4188790](v4 - 8, v5);
  v7 = (char *)&v12 - v6;
  uint64_t v8 = sub_1AB23AD7C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_1AB23AD0C();
  swift_retain_n();
  swift_unknownObjectRetain();
  uint64_t v9 = sub_1AB23ACFC();
  v10 = (void *)swift_allocObject();
  uint64_t v11 = MEMORY[0x1E4FBCFD8];
  v10[2] = v9;
  v10[3] = v11;
  v10[4] = self;
  sub_1A9BF49C0((uint64_t)v7, (uint64_t)&unk_1E9830F48, (uint64_t)v10);
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
}

@end