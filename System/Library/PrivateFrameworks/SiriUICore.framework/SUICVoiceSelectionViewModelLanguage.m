@interface SUICVoiceSelectionViewModelLanguage
- (BOOL)isCurrentOutputLanguage;
- (NSString)languageCode;
- (NSString)localizedDisplayName;
- (SUICVoiceSelectionViewModelLanguage)initWithLanguageCode:(id)a3 localizedDisplayName:(id)a4 isCurrentOutputLanguage:(BOOL)a5;
@end

@implementation SUICVoiceSelectionViewModelLanguage

- (SUICVoiceSelectionViewModelLanguage)initWithLanguageCode:(id)a3 localizedDisplayName:(id)a4 isCurrentOutputLanguage:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SUICVoiceSelectionViewModelLanguage;
  v11 = [(SUICVoiceSelectionViewModelLanguage *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_languageCode, a3);
    uint64_t v13 = [v10 copy];
    localizedDisplayName = v12->_localizedDisplayName;
    v12->_localizedDisplayName = (NSString *)v13;

    v12->_isCurrentOutputLanguage = a5;
  }

  return v12;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (BOOL)isCurrentOutputLanguage
{
  return self->_isCurrentOutputLanguage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageCode, 0);

  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end