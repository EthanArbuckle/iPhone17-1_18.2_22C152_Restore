@interface AXKonaVoice
- (AXKonaParameters)parameters;
- (NSString)identifier;
- (NSString)languageCode;
- (NSString)name;
- (int64_t)eciVoiceNumber;
- (unint64_t)konaLanguage;
- (void)setEciVoiceNumber:(int64_t)a3;
- (void)setKonaLanguage:(unint64_t)a3;
- (void)setLanguageCode:(id)a3;
- (void)setName:(id)a3;
- (void)setParameters:(id)a3;
@end

@implementation AXKonaVoice

- (NSString)identifier
{
  v3 = NSString;
  v4 = [(AXKonaVoice *)self languageCode];
  v5 = [(AXKonaVoice *)self name];
  v6 = [v3 stringWithFormat:@"%@%@.%@", @"com.apple.eloquence.", v4, v5];

  return (NSString *)v6;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)konaLanguage
{
  return self->_konaLanguage;
}

- (void)setKonaLanguage:(unint64_t)a3
{
  self->_konaLanguage = a3;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
}

- (int64_t)eciVoiceNumber
{
  return self->_eciVoiceNumber;
}

- (void)setEciVoiceNumber:(int64_t)a3
{
  self->_eciVoiceNumber = a3;
}

- (AXKonaParameters)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end