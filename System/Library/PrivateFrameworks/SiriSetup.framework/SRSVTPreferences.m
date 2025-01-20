@interface SRSVTPreferences
- (BOOL)isCompactVoiceTriggerAvailableForLanguageCode:(id)a3;
- (BOOL)voiceTriggerEnabled;
- (SRSVTPreferences)init;
- (id)localizedCompactTriggerPhraseForLanguageCode:(id)a3;
- (id)localizedTriggerPhraseForLanguageCode:(id)a3;
- (void)setVoiceTriggerEnabled:(BOOL)a3;
@end

@implementation SRSVTPreferences

- (SRSVTPreferences)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRSVTPreferences;
  v2 = [(SRSVTPreferences *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F85AF0] sharedPreferences];
    preferences = v2->_preferences;
    v2->_preferences = (VTPreferences *)v3;
  }
  return v2;
}

- (void)setVoiceTriggerEnabled:(BOOL)a3
{
}

- (BOOL)voiceTriggerEnabled
{
  return [(VTPreferences *)self->_preferences voiceTriggerEnabled];
}

- (id)localizedTriggerPhraseForLanguageCode:(id)a3
{
  return (id)[(VTPreferences *)self->_preferences localizedTriggerPhraseForLanguageCode:a3];
}

- (BOOL)isCompactVoiceTriggerAvailableForLanguageCode:(id)a3
{
  return [(VTPreferences *)self->_preferences isCompactVoiceTriggerAvailableForLanguageCode:a3];
}

- (id)localizedCompactTriggerPhraseForLanguageCode:(id)a3
{
  return (id)[(VTPreferences *)self->_preferences localizedCompactTriggerPhraseForLanguageCode:a3];
}

- (void).cxx_destruct
{
}

@end