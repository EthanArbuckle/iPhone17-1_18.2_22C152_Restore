@interface _UIIntelligenceLightSourceView
- (_UIIntelligenceLightSourceView)initWithCoder:(id)a3;
- (_UIIntelligenceLightSourceView)initWithFrame:(CGRect)a3;
- (_UIIntelligenceLightSourceView)initWithFrame:(CGRect)a3 configuration:(id)a4;
- (_UIIntelligenceLightSourceView)initWithFrame:(CGRect)a3 preferAudioReactivity:(BOOL)a4;
@end

@implementation _UIIntelligenceLightSourceView

- (_UIIntelligenceLightSourceView)initWithFrame:(CGRect)a3 preferAudioReactivity:(BOOL)a4
{
  return (_UIIntelligenceLightSourceView *)sub_1858E6A98(a4);
}

- (_UIIntelligenceLightSourceView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v10 = -[_UIIntelligenceLightSourceView initWithFrame:preferAudioReactivity:](self, sel_initWithFrame_preferAudioReactivity_, objc_msgSend(v9, sel_prefersAudioReactivity), x, y, width, height);
  char v11 = *((unsigned char *)v9 + OBJC_IVAR____UIIntelligenceLightSourceConfiguration_wrapped);
  v12 = v10;

  v13 = (char *)v12 + OBJC_IVAR____UIIntelligenceLightSourceView_configuration;
  swift_beginAccess();
  unsigned char *v13 = v11;

  return v12;
}

- (_UIIntelligenceLightSourceView)initWithCoder:(id)a3
{
  result = (_UIIntelligenceLightSourceView *)sub_186A1F60C();
  __break(1u);
  return result;
}

- (_UIIntelligenceLightSourceView)initWithFrame:(CGRect)a3
{
  result = (_UIIntelligenceLightSourceView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end