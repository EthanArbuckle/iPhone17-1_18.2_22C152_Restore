@interface CRLiOSFolderGridViewController.iCloudStatusFooter
- (_TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter)initWithCoder:(id)a3;
- (_TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter)initWithFrame:(CGRect)a3;
- (void)dealloc;
@end

@implementation CRLiOSFolderGridViewController.iCloudStatusFooter

- (_TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter)initWithFrame:(CGRect)a3
{
  sub_10053AD7C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  return result;
}

- (_TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter_iCloudStatusLabel;
  id v6 = objc_allocWithZone((Class)UILabel);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter_syncDidEndObserver) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter_syncDidBeginObserver) = 0;

  result = (_TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_10053B9C4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8Freeform30CRLiOSFolderGridViewController18iCloudStatusFooter_iCloudStatusLabel));
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
}

@end