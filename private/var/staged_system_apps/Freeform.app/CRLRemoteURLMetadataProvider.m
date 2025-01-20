@interface CRLRemoteURLMetadataProvider
- (void)webView:(id)a3 didFinishNavigation:(id)a4;
@end

@implementation CRLRemoteURLMetadataProvider

- (void).cxx_destruct
{
  sub_100522F00((uint64_t)self + OBJC_IVAR____TtC8Freeform28CRLRemoteURLMetadataProvider_navigationDidFinishContinuation, &qword_10169DC08);
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform28CRLRemoteURLMetadataProvider__image);
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_100E0DCDC(a4);
}

@end