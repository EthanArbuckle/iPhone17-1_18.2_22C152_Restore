@interface VoiceDialResultHandlerContext
- (BOOL)allNamesMatchedType;
- (BOOL)allowFirstFT;
- (NSMutableDictionary)firstNamesByLastNames;
- (NSMutableDictionary)lastNamesByFirstNames;
- (NSMutableDictionary)phoneticNamesByName;
- (NSMutableSet)compositeNames;
- (NSMutableSet)localizedEmailLabels;
- (NSMutableSet)localizedPhoneLabels;
- (NSMutableSet)spokenCompositeNames;
- (NSMutableSet)topLevelNonNickNames;
- (NSMutableSet)unlocalizedEmailLabels;
- (NSMutableSet)unlocalizedPhoneLabels;
- (NSString)nameToMatch;
- (VoiceDialResultHandlerContext)init;
- (__CFString)contactInfo;
- (int)lastNameMatchType;
- (int)matchedLabelType;
- (int)requiredNameMatchType;
- (int)resultStatus;
- (int64_t)nicknameMatchCount;
- (void)dealloc;
- (void)resultPerson;
- (void)setAllNamesMatchedType:(BOOL)a3;
- (void)setAllowFirstFT:(BOOL)a3;
- (void)setCompositeNames:(id)a3;
- (void)setContactInfo:(__CFString *)a3;
- (void)setFirstNamesByLastNames:(id)a3;
- (void)setLastNameMatchType:(int)a3;
- (void)setLastNamesByFirstNames:(id)a3;
- (void)setLocalizedEmailLabels:(id)a3;
- (void)setLocalizedPhoneLabels:(id)a3;
- (void)setMatchedLabelType:(int)a3;
- (void)setNameToMatch:(id)a3;
- (void)setNicknameMatchCount:(int64_t)a3;
- (void)setPhoneticNamesByName:(id)a3;
- (void)setRequiredNameMatchType:(int)a3;
- (void)setResultPerson:(void *)a3;
- (void)setResultStatus:(int)a3;
- (void)setSpokenCompositeNames:(id)a3;
- (void)setTopLevelNonNickNames:(id)a3;
- (void)setUnlocalizedEmailLabels:(id)a3;
- (void)setUnlocalizedPhoneLabels:(id)a3;
@end

@implementation VoiceDialResultHandlerContext

- (VoiceDialResultHandlerContext)init
{
  v3.receiver = self;
  v3.super_class = (Class)VoiceDialResultHandlerContext;
  result = [(VoiceDialResultHandlerContext *)&v3 init];
  if (result)
  {
    *(_WORD *)&result->_allNamesMatchedType = 257;
    *(_OWORD *)&result->_resultStatus = xmmword_22A5F79E0;
  }
  return result;
}

- (void)dealloc
{
  resultPerson = self->_resultPerson;
  if (resultPerson) {
    CFRelease(resultPerson);
  }
  contactInfo = self->_contactInfo;
  if (contactInfo) {
    CFRelease(contactInfo);
  }
  v5.receiver = self;
  v5.super_class = (Class)VoiceDialResultHandlerContext;
  [(VoiceDialResultHandlerContext *)&v5 dealloc];
}

- (void)resultPerson
{
  return self->_resultPerson;
}

- (void)setResultPerson:(void *)a3
{
  self->_resultPerson = a3;
}

- (__CFString)contactInfo
{
  return self->_contactInfo;
}

- (void)setContactInfo:(__CFString *)a3
{
  self->_contactInfo = a3;
}

- (NSString)nameToMatch
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setNameToMatch:(id)a3
{
}

- (NSMutableSet)compositeNames
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCompositeNames:(id)a3
{
}

- (NSMutableSet)spokenCompositeNames
{
  return (NSMutableSet *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSpokenCompositeNames:(id)a3
{
}

- (NSMutableSet)topLevelNonNickNames
{
  return (NSMutableSet *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTopLevelNonNickNames:(id)a3
{
}

- (NSMutableSet)localizedPhoneLabels
{
  return (NSMutableSet *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLocalizedPhoneLabels:(id)a3
{
}

- (NSMutableSet)localizedEmailLabels
{
  return (NSMutableSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLocalizedEmailLabels:(id)a3
{
}

- (NSMutableSet)unlocalizedPhoneLabels
{
  return (NSMutableSet *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUnlocalizedPhoneLabels:(id)a3
{
}

- (NSMutableSet)unlocalizedEmailLabels
{
  return (NSMutableSet *)objc_getProperty(self, a2, 104, 1);
}

- (void)setUnlocalizedEmailLabels:(id)a3
{
}

- (NSMutableDictionary)lastNamesByFirstNames
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 112, 1);
}

- (void)setLastNamesByFirstNames:(id)a3
{
}

- (NSMutableDictionary)firstNamesByLastNames
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setFirstNamesByLastNames:(id)a3
{
}

- (NSMutableDictionary)phoneticNamesByName
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPhoneticNamesByName:(id)a3
{
}

- (int64_t)nicknameMatchCount
{
  return self->_nicknameMatchCount;
}

- (void)setNicknameMatchCount:(int64_t)a3
{
  self->_nicknameMatchCount = a3;
}

- (int)resultStatus
{
  return self->_resultStatus;
}

- (void)setResultStatus:(int)a3
{
  self->_resultStatus = a3;
}

- (int)requiredNameMatchType
{
  return self->_requiredNameMatchType;
}

- (void)setRequiredNameMatchType:(int)a3
{
  self->_requiredNameMatchType = a3;
}

- (int)lastNameMatchType
{
  return self->_lastNameMatchType;
}

- (void)setLastNameMatchType:(int)a3
{
  self->_lastNameMatchType = a3;
}

- (BOOL)allNamesMatchedType
{
  return self->_allNamesMatchedType;
}

- (void)setAllNamesMatchedType:(BOOL)a3
{
  self->_allNamesMatchedType = a3;
}

- (int)matchedLabelType
{
  return self->_matchedLabelType;
}

- (void)setMatchedLabelType:(int)a3
{
  self->_matchedLabelType = a3;
}

- (BOOL)allowFirstFT
{
  return self->_allowFirstFT;
}

- (void)setAllowFirstFT:(BOOL)a3
{
  self->_allowFirstFT = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticNamesByName, 0);
  objc_storeStrong((id *)&self->_firstNamesByLastNames, 0);
  objc_storeStrong((id *)&self->_lastNamesByFirstNames, 0);
  objc_storeStrong((id *)&self->_unlocalizedEmailLabels, 0);
  objc_storeStrong((id *)&self->_unlocalizedPhoneLabels, 0);
  objc_storeStrong((id *)&self->_localizedEmailLabels, 0);
  objc_storeStrong((id *)&self->_localizedPhoneLabels, 0);
  objc_storeStrong((id *)&self->_topLevelNonNickNames, 0);
  objc_storeStrong((id *)&self->_spokenCompositeNames, 0);
  objc_storeStrong((id *)&self->_compositeNames, 0);

  objc_storeStrong((id *)&self->_nameToMatch, 0);
}

@end