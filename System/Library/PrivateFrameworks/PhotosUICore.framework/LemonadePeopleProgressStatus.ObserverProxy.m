@interface LemonadePeopleProgressStatus.ObserverProxy
- (_TtCC12PhotosUICore28LemonadePeopleProgressStatusP33_47088FF21381BA82A88DD8E5E7C0CB8D13ObserverProxy)init;
- (void)photoLibraryDidChangeOnMainQueue:(id)a3;
@end

@implementation LemonadePeopleProgressStatus.ObserverProxy

- (void)photoLibraryDidChangeOnMainQueue:(id)a3
{
  if (swift_weakLoadStrong())
  {
    id v6 = a3;
    v5 = self;
    sub_1A9EF8B9C((uint64_t)v6);
    swift_release();
  }
}

- (_TtCC12PhotosUICore28LemonadePeopleProgressStatusP33_47088FF21381BA82A88DD8E5E7C0CB8D13ObserverProxy)init
{
  result = (_TtCC12PhotosUICore28LemonadePeopleProgressStatusP33_47088FF21381BA82A88DD8E5E7C0CB8D13ObserverProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end