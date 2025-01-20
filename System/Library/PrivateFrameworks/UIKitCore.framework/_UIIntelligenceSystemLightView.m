@interface _UIIntelligenceSystemLightView
- (_UIIntelligenceSystemLightView)initWithFrame:(CGRect)a3 preferringAudioReactivity:(BOOL)a4;
- (_UIIntelligenceSystemLightView)initWithFrame:(CGRect)a3 serviceIdentity:(id)a4 sceneSpecification:(id)a5;
@end

@implementation _UIIntelligenceSystemLightView

- (_UIIntelligenceSystemLightView)initWithFrame:(CGRect)a3 preferringAudioReactivity:(BOOL)a4
{
  return (_UIIntelligenceSystemLightView *)_UIIntelligenceSystemLightView.init(frame:preferringAudioReactivity:)(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIIntelligenceSystemLightView)initWithFrame:(CGRect)a3 serviceIdentity:(id)a4 sceneSpecification:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  result = (_UIIntelligenceSystemLightView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end