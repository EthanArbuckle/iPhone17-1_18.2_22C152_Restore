@interface _DryRestoreDomainOperation
- (_TtC7backupdP33_A98A1189104A0FB44C8DB626A50FE70726_DryRestoreDomainOperation)init;
- (void)cancel;
- (void)main;
@end

@implementation _DryRestoreDomainOperation

- (void)main
{
  v2 = self;
  sub_10001234C();
}

- (void)cancel
{
  v2 = self;
  sub_100012774();
}

- (_TtC7backupdP33_A98A1189104A0FB44C8DB626A50FE70726_DryRestoreDomainOperation)init
{
  result = (_TtC7backupdP33_A98A1189104A0FB44C8DB626A50FE70726_DryRestoreDomainOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7backupdP33_A98A1189104A0FB44C8DB626A50FE70726_DryRestoreDomainOperation__context));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC7backupdP33_A98A1189104A0FB44C8DB626A50FE70726_DryRestoreDomainOperation__domain));
  swift_release();
  swift_release();
}

@end