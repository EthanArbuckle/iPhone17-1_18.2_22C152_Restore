@interface SUICVoiceSelectionViewModelVoice
- (AFVoiceInfo)voiceInfo;
- (BOOL)isCurrentSiriVoice;
- (CGColor)associatedCGColor;
- (NSString)localizedDisplayName;
- (SUICVoiceSelectionViewModelVoice)initWithVoice:(id)a3 isCurrentSiriVoice:(BOOL)a4;
@end

@implementation SUICVoiceSelectionViewModelVoice

- (SUICVoiceSelectionViewModelVoice)initWithVoice:(id)a3 isCurrentSiriVoice:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUICVoiceSelectionViewModelVoice;
  v8 = [(SUICVoiceSelectionViewModelVoice *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_voiceInfo, a3);
    v9->_isCurrentSiriVoice = a4;
  }

  return v9;
}

- (NSString)localizedDisplayName
{
  v3 = [MEMORY[0x1E4F4E4C8] sharedInstance];
  v4 = [(AFVoiceInfo *)self->_voiceInfo languageCode];
  v5 = [(AFVoiceInfo *)self->_voiceInfo name];
  v6 = [v3 outputVoiceDescriptorForOutputLanguageCode:v4 voiceName:v5];

  id v7 = [v6 localizedDisplay];

  return (NSString *)v7;
}

- (CGColor)associatedCGColor
{
  return CGColorCreateSRGB(0.0666666667, 0.564705882, 0.894117647, 1.0);
}

- (AFVoiceInfo)voiceInfo
{
  return self->_voiceInfo;
}

- (BOOL)isCurrentSiriVoice
{
  return self->_isCurrentSiriVoice;
}

- (void).cxx_destruct
{
}

@end