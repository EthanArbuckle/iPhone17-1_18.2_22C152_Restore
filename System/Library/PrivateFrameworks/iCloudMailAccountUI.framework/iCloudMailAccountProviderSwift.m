@interface iCloudMailAccountProviderSwift
- (iCloudMailAccountProviderSwift)init;
- (iCloudMailAccountProviderSwift)initWithPresenter:(id)a3 appleAccount:(id)a4 accountStore:(id)a5;
- (void)presentWith:(BOOL)a3 completion:(id)a4;
- (void)presentWith:(id)a3;
@end

@implementation iCloudMailAccountProviderSwift

- (iCloudMailAccountProviderSwift)initWithPresenter:(id)a3 appleAccount:(id)a4 accountStore:(id)a5
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___iCloudMailAccountProviderSwift_presenter) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___iCloudMailAccountProviderSwift_appleAccount) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___iCloudMailAccountProviderSwift_accountStore) = (Class)a5;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for iCloudMailAccountProviderSwift();
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  return [(iCloudMailAccountProviderSwift *)&v12 init];
}

- (void)presentWith:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = self;
  sub_262971D98(v4, (uint64_t)sub_262972DFC, v7);

  swift_release();
}

- (void)presentWith:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = self;
  sub_26297234C((uint64_t)sub_262972DAC, v5);

  swift_release();
}

- (iCloudMailAccountProviderSwift)init
{
  result = (iCloudMailAccountProviderSwift *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___iCloudMailAccountProviderSwift____lazy_storage___legacyMailCreator);
}

@end