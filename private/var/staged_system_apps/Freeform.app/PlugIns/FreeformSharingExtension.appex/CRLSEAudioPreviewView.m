@interface CRLSEAudioPreviewView
- (_TtC24FreeformSharingExtension21CRLSEAudioPreviewView)initWithCoder:(id)a3;
- (_TtC24FreeformSharingExtension21CRLSEAudioPreviewView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CRLSEAudioPreviewView

- (_TtC24FreeformSharingExtension21CRLSEAudioPreviewView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_gradientBackground) = 0;
  id v4 = a3;

  result = (_TtC24FreeformSharingExtension21CRLSEAudioPreviewView *)sub_10005CC90();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLSEAudioPreviewView();
  v2 = (char *)v5.receiver;
  [(CRLSEAudioPreviewView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_gradientBackground];
  if (v3)
  {
    id v4 = v3;
    [v2 bounds];
    [v4 setFrame:];

    v2 = v4;
  }
}

- (_TtC24FreeformSharingExtension21CRLSEAudioPreviewView)initWithFrame:(CGRect)a3
{
  result = (_TtC24FreeformSharingExtension21CRLSEAudioPreviewView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_url;
  uint64_t v4 = sub_10005C300();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_super v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_gradientBackground);
}

@end