@interface REBookProviderService
- (REBookProviderService)init;
@end

@implementation REBookProviderService

- (REBookProviderService)init
{
  result = (REBookProviderService *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR___REBookProviderService_bookEntity);
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR___REBookProviderService_storeController);
  _s5Books15CurrentPageViewVwxx_0((uint64_t)self + OBJC_IVAR___REBookProviderService_epubParser);
  v3 = (char *)self + OBJC_IVAR___REBookProviderService_logger;
  uint64_t v4 = sub_1007F6BC0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end