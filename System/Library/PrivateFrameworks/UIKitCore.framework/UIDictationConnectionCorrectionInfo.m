@interface UIDictationConnectionCorrectionInfo
- (NSArray)selectedAlternativesInfo;
- (NSDictionary)recognizedTextInfo;
- (NSDictionary)userEditedTextInfo;
- (NSString)correctedText;
- (int)alternativeSelectionCount;
- (int)characterDeletionCount;
- (int)characterInsertionCount;
- (int)characterModificationCount;
- (int)characterSubstitutionCount;
- (void)setAlternativeSelectionCount:(int)a3;
- (void)setCharacterDeletionCount:(int)a3;
- (void)setCharacterInsertionCount:(int)a3;
- (void)setCharacterModificationCount:(int)a3;
- (void)setCharacterSubstitutionCount:(int)a3;
- (void)setCorrectedText:(id)a3;
- (void)setRecognizedTextInfo:(id)a3;
- (void)setSelectedAlternativesInfo:(id)a3;
- (void)setUserEditedTextInfo:(id)a3;
@end

@implementation UIDictationConnectionCorrectionInfo

- (int)alternativeSelectionCount
{
  return self->_alternativeSelectionCount;
}

- (void)setAlternativeSelectionCount:(int)a3
{
  self->_alternativeSelectionCount = a3;
}

- (int)characterModificationCount
{
  return self->_characterModificationCount;
}

- (void)setCharacterModificationCount:(int)a3
{
  self->_characterModificationCount = a3;
}

- (int)characterInsertionCount
{
  return self->_characterInsertionCount;
}

- (void)setCharacterInsertionCount:(int)a3
{
  self->_characterInsertionCount = a3;
}

- (int)characterDeletionCount
{
  return self->_characterDeletionCount;
}

- (void)setCharacterDeletionCount:(int)a3
{
  self->_characterDeletionCount = a3;
}

- (int)characterSubstitutionCount
{
  return self->_characterSubstitutionCount;
}

- (void)setCharacterSubstitutionCount:(int)a3
{
  self->_characterSubstitutionCount = a3;
}

- (NSString)correctedText
{
  return self->_correctedText;
}

- (void)setCorrectedText:(id)a3
{
}

- (NSDictionary)recognizedTextInfo
{
  return self->_recognizedTextInfo;
}

- (void)setRecognizedTextInfo:(id)a3
{
}

- (NSDictionary)userEditedTextInfo
{
  return self->_userEditedTextInfo;
}

- (void)setUserEditedTextInfo:(id)a3
{
}

- (NSArray)selectedAlternativesInfo
{
  return self->_selectedAlternativesInfo;
}

- (void)setSelectedAlternativesInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAlternativesInfo, 0);
  objc_storeStrong((id *)&self->_userEditedTextInfo, 0);
  objc_storeStrong((id *)&self->_recognizedTextInfo, 0);
  objc_storeStrong((id *)&self->_correctedText, 0);
}

@end