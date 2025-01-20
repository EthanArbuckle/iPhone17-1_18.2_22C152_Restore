@interface _UIIntelligenceSystemNoiseView
- (_UIIntelligenceSystemNoiseView)initWithFrame:(CGRect)a3 preferringAudioReactivity:(BOOL)a4;
- (_UIIntelligenceSystemNoiseView)initWithFrame:(CGRect)a3 serviceIdentity:(id)a4 sceneSpecification:(id)a5;
@end

@implementation _UIIntelligenceSystemNoiseView

- (_UIIntelligenceSystemNoiseView)initWithFrame:(CGRect)a3 preferringAudioReactivity:(BOOL)a4
{
  return (_UIIntelligenceSystemNoiseView *)_UIIntelligenceSystemNoiseView.init(frame:preferringAudioReactivity:)(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UIIntelligenceSystemNoiseView)initWithFrame:(CGRect)a3 serviceIdentity:(id)a4 sceneSpecification:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  result = (_UIIntelligenceSystemNoiseView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end