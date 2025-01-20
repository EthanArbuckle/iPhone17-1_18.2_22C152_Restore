@interface MusicVocalsAttenuationSlider
- (MusicVocalsAttenuationSlider)initWithCoder:(id)a3;
- (MusicVocalsAttenuationSlider)initWithFrame:(CGRect)a3;
- (float)accessibilitySliderCurrentPercentageValue;
@end

@implementation MusicVocalsAttenuationSlider

- (MusicVocalsAttenuationSlider)initWithFrame:(CGRect)a3
{
  return (MusicVocalsAttenuationSlider *)VocalsAttenuationSlider.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MusicVocalsAttenuationSlider)initWithCoder:(id)a3
{
  result = (MusicVocalsAttenuationSlider *)sub_1005363F0();
  __break(1u);
  return result;
}

- (float)accessibilitySliderCurrentPercentageValue
{
  VocalsAttenuationSlider.accessibilitySliderCurrentPercentageValue.getter();
  return result;
}

@end