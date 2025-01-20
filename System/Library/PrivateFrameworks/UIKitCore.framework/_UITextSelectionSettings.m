@interface _UITextSelectionSettings
+ (id)sharedInstance;
- (NSNumber)allowExtendingSelections;
- (NSNumber)enableDeepPress;
- (NSNumber)shouldPreferEndOfWord;
- (NSNumber)shouldUseAcceleration;
- (double)allowableForceMovement;
- (double)allowableSeparation;
- (double)gain;
- (double)linear;
- (double)maxPinkWidth;
- (double)minPinkWidth;
- (double)parabolic;
- (double)pinkWidthFactor;
- (void)setAllowExtendingSelections:(id)a3;
- (void)setAllowableForceMovement:(double)a3;
- (void)setAllowableSeparation:(double)a3;
- (void)setDefaultValues;
- (void)setEnableDeepPress:(id)a3;
- (void)setGain:(double)a3;
- (void)setLinear:(double)a3;
- (void)setMaxPinkWidth:(double)a3;
- (void)setMinPinkWidth:(double)a3;
- (void)setParabolic:(double)a3;
- (void)setPinkWidthFactor:(double)a3;
- (void)setShouldPreferEndOfWord:(id)a3;
- (void)setShouldUseAcceleration:(id)a3;
@end

@implementation _UITextSelectionSettings

- (double)allowableSeparation
{
  return self->_allowableSeparation;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42___UITextSelectionSettings_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB259A00 != -1) {
    dispatch_once(&qword_1EB259A00, block);
  }
  v2 = (void *)_MergedGlobals_8_0;
  return v2;
}

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)_UITextSelectionSettings;
  [(PTSettings *)&v5 setDefaultValues];
  [(_UITextSelectionSettings *)self setMinPinkWidth:10.0];
  [(_UITextSelectionSettings *)self setMaxPinkWidth:30.0];
  [(_UITextSelectionSettings *)self setPinkWidthFactor:0.3];
  [(_UITextSelectionSettings *)self setLinear:2.0];
  [(_UITextSelectionSettings *)self setParabolic:5.0];
  [(_UITextSelectionSettings *)self setGain:0.2];
  [(_UITextSelectionSettings *)self setAllowableSeparation:300.0];
  [(_UITextSelectionSettings *)self setAllowableForceMovement:15.0];
  uint64_t v3 = MEMORY[0x1E4F1CC38];
  [(_UITextSelectionSettings *)self setAllowExtendingSelections:MEMORY[0x1E4F1CC38]];
  [(_UITextSelectionSettings *)self setShouldUseAcceleration:v3];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  [(_UITextSelectionSettings *)self setShouldPreferEndOfWord:MEMORY[0x1E4F1CC28]];
  [(_UITextSelectionSettings *)self setEnableDeepPress:v4];
}

- (void)setShouldUseAcceleration:(id)a3
{
}

- (void)setShouldPreferEndOfWord:(id)a3
{
}

- (void)setPinkWidthFactor:(double)a3
{
  self->_pinkWidthFactor = a3;
}

- (void)setParabolic:(double)a3
{
  self->_parabolic = a3;
}

- (void)setMinPinkWidth:(double)a3
{
  self->_minPinkWidth = a3;
}

- (void)setMaxPinkWidth:(double)a3
{
  self->_maxPinkWidth = a3;
}

- (void)setLinear:(double)a3
{
  self->_linear = a3;
}

- (void)setGain:(double)a3
{
  self->_gain = a3;
}

- (void)setEnableDeepPress:(id)a3
{
}

- (void)setAllowableSeparation:(double)a3
{
  self->_allowableSeparation = a3;
}

- (void)setAllowableForceMovement:(double)a3
{
  self->_allowableForceMovement = a3;
}

- (void)setAllowExtendingSelections:(id)a3
{
}

- (double)minPinkWidth
{
  return self->_minPinkWidth;
}

- (double)maxPinkWidth
{
  return self->_maxPinkWidth;
}

- (double)pinkWidthFactor
{
  return self->_pinkWidthFactor;
}

- (double)linear
{
  return self->_linear;
}

- (double)parabolic
{
  return self->_parabolic;
}

- (double)gain
{
  return self->_gain;
}

- (double)allowableForceMovement
{
  return self->_allowableForceMovement;
}

- (NSNumber)shouldUseAcceleration
{
  return self->_shouldUseAcceleration;
}

- (NSNumber)shouldPreferEndOfWord
{
  return self->_shouldPreferEndOfWord;
}

- (NSNumber)allowExtendingSelections
{
  return self->_allowExtendingSelections;
}

- (NSNumber)enableDeepPress
{
  return self->_enableDeepPress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableDeepPress, 0);
  objc_storeStrong((id *)&self->_allowExtendingSelections, 0);
  objc_storeStrong((id *)&self->_shouldPreferEndOfWord, 0);
  objc_storeStrong((id *)&self->_shouldUseAcceleration, 0);
}

@end