@interface SFSpeechSynthesisRequest
- (BOOL)isPrivate;
- (BOOL)returnFrontEndFeature;
- (BOOL)useCache;
- (NSString)clientBundleIdentifier;
- (NSString)devServiceType;
- (NSString)gender;
- (NSString)locale;
- (NSString)requestIdentifer;
- (NSString)text;
- (NSString)voiceName;
- (ProsodyTransferData)prosodyTransferData;
- (SFSpeechSynthesisRequest)init;
- (SFSpeechSynthesisVoice)voice;
- (id)description;
- (int64_t)phoneSetType;
- (int64_t)solutionType;
- (int64_t)type;
- (void)setClientBundleIdentifier:(id)a3;
- (void)setDevServiceType:(id)a3;
- (void)setGender:(id)a3;
- (void)setIsPrivate:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setPhoneSetType:(int64_t)a3;
- (void)setProsodyTransferData:(id)a3;
- (void)setRequestIdentifer:(id)a3;
- (void)setReturnFrontEndFeature:(BOOL)a3;
- (void)setSolutionType:(int64_t)a3;
- (void)setText:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUseCache:(BOOL)a3;
- (void)setVoice:(id)a3;
- (void)setVoiceName:(id)a3;
@end

@implementation SFSpeechSynthesisRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devServiceType, 0);
  objc_storeStrong((id *)&self->_prosodyTransferData, 0);
  objc_destroyWeak((id *)&self->_voice);
  objc_storeStrong((id *)&self->_requestIdentifer, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setDevServiceType:(id)a3
{
}

- (NSString)devServiceType
{
  return self->_devServiceType;
}

- (void)setProsodyTransferData:(id)a3
{
}

- (ProsodyTransferData)prosodyTransferData
{
  return self->_prosodyTransferData;
}

- (void)setPhoneSetType:(int64_t)a3
{
  self->_phoneSetType = a3;
}

- (int64_t)phoneSetType
{
  return self->_phoneSetType;
}

- (void)setReturnFrontEndFeature:(BOOL)a3
{
  self->_returnFrontEndFeature = a3;
}

- (BOOL)returnFrontEndFeature
{
  return self->_returnFrontEndFeature;
}

- (void)setUseCache:(BOOL)a3
{
  self->_useCache = a3;
}

- (BOOL)useCache
{
  return self->_useCache;
}

- (void)setVoice:(id)a3
{
}

- (SFSpeechSynthesisVoice)voice
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voice);
  return (SFSpeechSynthesisVoice *)WeakRetained;
}

- (void)setRequestIdentifer:(id)a3
{
}

- (NSString)requestIdentifer
{
  return self->_requestIdentifer;
}

- (void)setClientBundleIdentifier:(id)a3
{
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setVoiceName:(id)a3
{
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setGender:(id)a3
{
}

- (NSString)gender
{
  return self->_gender;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setSolutionType:(int64_t)a3
{
  self->_solutionType = a3;
}

- (int64_t)solutionType
{
  return self->_solutionType;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (void)setIsPrivate:(BOOL)a3
{
  self->_isPrivate = a3;
}

- (BOOL)isPrivate
{
  return self->_isPrivate;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)type
{
  return self->_type;
}

- (id)description
{
  v3 = NSString;
  long long v13 = *(_OWORD *)&self->_locale;
  int64_t type = self->_type;
  text = self->_text;
  int64_t solutionType = self->_solutionType;
  voiceName = self->_voiceName;
  clientBundleIdentifier = self->_clientBundleIdentifier;
  requestIdentifer = self->_requestIdentifer;
  v10 = [NSNumber numberWithBool:self->_useCache];
  v11 = [v3 stringWithFormat:@"locale:%@, gender:%@, voiceName:%@, text:'%@', requestType:%ld, solutionType:%ld, appId:%@, requestId:%@, useCache:%@, devServiceType:%@", v13, voiceName, text, type, solutionType, clientBundleIdentifier, requestIdentifer, v10, self->_devServiceType];

  return v11;
}

- (SFSpeechSynthesisRequest)init
{
  v3.receiver = self;
  v3.super_class = (Class)SFSpeechSynthesisRequest;
  result = [(SFSpeechSynthesisRequest *)&v3 init];
  if (result) {
    result->_useCache = 1;
  }
  return result;
}

@end