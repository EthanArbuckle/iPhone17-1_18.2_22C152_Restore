@interface _UIIntelligenceLightSourceConfiguration
- (BOOL)prefersAudioReactivity;
- (_UIIntelligenceLightSourceConfiguration)init;
- (void)setPrefersAudioReactivity:(BOOL)a3;
@end

@implementation _UIIntelligenceLightSourceConfiguration

- (BOOL)prefersAudioReactivity
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____UIIntelligenceLightSourceConfiguration_wrapped);
}

- (void)setPrefersAudioReactivity:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____UIIntelligenceLightSourceConfiguration_wrapped) = a3;
}

- (_UIIntelligenceLightSourceConfiguration)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____UIIntelligenceLightSourceConfiguration_wrapped) = 0;
  v3.receiver = self;
  v3.super_class = (Class)_UIIntelligenceLightSourceConfiguration;
  return [(_UIIntelligenceLightSourceConfiguration *)&v3 init];
}

@end