@interface ListeningLayerPlatformWrapper.ListeningUIView
- (_TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView)initWithCoder:(id)a3;
- (_TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ListeningLayerPlatformWrapper.ListeningUIView

- (_TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView)initWithCoder:(id)a3
{
  result = (_TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView *)sub_236CFC590();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v2 = (char *)v13.receiver;
  [(ListeningLayerPlatformWrapper.ListeningUIView *)&v13 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView_listeningLayer];
  id v4 = objc_msgSend(v2, sel_layer, v13.receiver, v13.super_class);
  objc_msgSend(v4, sel_bounds);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, sel_setFrame_, v6, v8, v10, v12);
}

- (_TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView)initWithFrame:(CGRect)a3
{
  result = (_TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCV11ShazamKitUI29ListeningLayerPlatformWrapper15ListeningUIView_listeningLayer));
}

@end