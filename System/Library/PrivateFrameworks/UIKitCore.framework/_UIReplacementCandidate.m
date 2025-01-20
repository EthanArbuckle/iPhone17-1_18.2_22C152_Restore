@interface _UIReplacementCandidate
+ (id)candidateForAutocorrection:(id)a3 range:(id)a4 underlineStyle:(int64_t)a5 promptStyle:(int64_t)a6 promptButton:(int64_t)a7;
+ (id)candidateForAutocorrectionCandidate:(id)a3 range:(id)a4;
+ (id)candidateForDocumentText:(id)a3 revertText:(id)a4 candidateChoices:(id)a5 range:(id)a6 underlineStyle:(int64_t)a7 promptStyle:(int64_t)a8 promptButton:(int64_t)a9;
+ (id)candidateForDocumentText:(id)a3 revertText:(id)a4 textChoices:(id)a5 range:(id)a6 underlineStyle:(int64_t)a7 promptStyle:(int64_t)a8 promptButton:(int64_t)a9;
+ (id)candidateForDocumentText:(id)a3 revertText:(id)a4 textChoices:(id)a5 range:(id)a6 underlineStyle:(int64_t)a7 promptStyle:(int64_t)a8 promptButton:(int64_t)a9 voiceCommandDisambiguationSelectedIndex:(id)a10 voiceCommandDisambiguationTargetCount:(id)a11;
- (NSArray)alternativeRevertTexts;
- (NSArray)candidateChoices;
- (NSArray)textChoices;
- (NSArray)underlines;
- (NSNumber)voiceCommandDisambiguationSelectedIndex;
- (NSNumber)voiceCommandDisambiguationTargetCount;
- (NSString)documentTextToReplace;
- (NSString)revertText;
- (NSUUID)voiceCommandTrackingUUID;
- (UITextRange)rangeInDocument;
- (_UIReplacementCandidate)initWithText:(id)a3;
- (int64_t)preferredPromptButton;
- (int64_t)preferredPromptStyle;
- (int64_t)underlineStyle;
- (void)setAlternativeRevertTexts:(id)a3;
- (void)setCandidateChoices:(id)a3;
- (void)setDocumentTextToReplace:(id)a3;
- (void)setPreferredPromptButton:(int64_t)a3;
- (void)setPreferredPromptStyle:(int64_t)a3;
- (void)setRangeInDocument:(id)a3;
- (void)setRevertText:(id)a3;
- (void)setTextChoices:(id)a3;
- (void)setUnderlineStyle:(int64_t)a3;
- (void)setUnderlines:(id)a3;
- (void)setVoiceCommandDisambiguationSelectedIndex:(id)a3;
- (void)setVoiceCommandDisambiguationTargetCount:(id)a3;
- (void)setVoiceCommandTrackingUUID:(id)a3;
@end

@implementation _UIReplacementCandidate

- (_UIReplacementCandidate)initWithText:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIReplacementCandidate;
  v6 = [(_UIReplacementCandidate *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_documentTextToReplace, a3);
  }

  return v7;
}

+ (id)candidateForAutocorrectionCandidate:(id)a3 range:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [_UIReplacementCandidate alloc];
  v8 = [v6 candidate];
  objc_super v9 = [(_UIReplacementCandidate *)v7 initWithText:v8];

  v10 = [v6 input];

  [(_UIReplacementCandidate *)v9 setRevertText:v10];
  [(_UIReplacementCandidate *)v9 setRangeInDocument:v5];

  [(_UIReplacementCandidate *)v9 setUnderlineStyle:1];
  [(_UIReplacementCandidate *)v9 setPreferredPromptStyle:2];
  [(_UIReplacementCandidate *)v9 setPreferredPromptButton:2];
  return v9;
}

+ (id)candidateForAutocorrection:(id)a3 range:(id)a4 underlineStyle:(int64_t)a5 promptStyle:(int64_t)a6 promptButton:(int64_t)a7
{
  id v11 = a4;
  id v12 = a3;
  v13 = [_UIReplacementCandidate alloc];
  v14 = [v12 candidate];
  v15 = [(_UIReplacementCandidate *)v13 initWithText:v14];

  v16 = [v12 input];

  [(_UIReplacementCandidate *)v15 setRevertText:v16];
  [(_UIReplacementCandidate *)v15 setRangeInDocument:v11];

  [(_UIReplacementCandidate *)v15 setUnderlineStyle:a5];
  [(_UIReplacementCandidate *)v15 setPreferredPromptStyle:a6];
  [(_UIReplacementCandidate *)v15 setPreferredPromptButton:a7];
  return v15;
}

+ (id)candidateForDocumentText:(id)a3 revertText:(id)a4 textChoices:(id)a5 range:(id)a6 underlineStyle:(int64_t)a7 promptStyle:(int64_t)a8 promptButton:(int64_t)a9
{
  return (id)[a1 candidateForDocumentText:a3 revertText:a4 textChoices:a5 range:a6 underlineStyle:a7 promptStyle:a8 promptButton:a9 voiceCommandDisambiguationSelectedIndex:0 voiceCommandDisambiguationTargetCount:0];
}

+ (id)candidateForDocumentText:(id)a3 revertText:(id)a4 textChoices:(id)a5 range:(id)a6 underlineStyle:(int64_t)a7 promptStyle:(int64_t)a8 promptButton:(int64_t)a9 voiceCommandDisambiguationSelectedIndex:(id)a10 voiceCommandDisambiguationTargetCount:(id)a11
{
  id v16 = a11;
  id v17 = a10;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  v22 = [[_UIReplacementCandidate alloc] initWithText:v21];
  [(_UIReplacementCandidate *)v22 setRevertText:v20];

  v23 = _candidatesChoicesFromTextChoices(v19, v21);

  [(_UIReplacementCandidate *)v22 setCandidateChoices:v23];
  [(_UIReplacementCandidate *)v22 setRangeInDocument:v18];

  [(_UIReplacementCandidate *)v22 setUnderlineStyle:a7];
  [(_UIReplacementCandidate *)v22 setPreferredPromptStyle:a8];
  [(_UIReplacementCandidate *)v22 setPreferredPromptButton:a9];
  [(_UIReplacementCandidate *)v22 setVoiceCommandDisambiguationSelectedIndex:v17];

  [(_UIReplacementCandidate *)v22 setVoiceCommandDisambiguationTargetCount:v16];
  return v22;
}

+ (id)candidateForDocumentText:(id)a3 revertText:(id)a4 candidateChoices:(id)a5 range:(id)a6 underlineStyle:(int64_t)a7 promptStyle:(int64_t)a8 promptButton:(int64_t)a9
{
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [[_UIReplacementCandidate alloc] initWithText:v17];

  [(_UIReplacementCandidate *)v18 setRevertText:v16];
  [(_UIReplacementCandidate *)v18 setCandidateChoices:v15];

  [(_UIReplacementCandidate *)v18 setRangeInDocument:v14];
  [(_UIReplacementCandidate *)v18 setUnderlineStyle:a7];
  [(_UIReplacementCandidate *)v18 setPreferredPromptStyle:a8];
  [(_UIReplacementCandidate *)v18 setPreferredPromptButton:a9];
  return v18;
}

- (NSArray)textChoices
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  v4 = [(_UIReplacementCandidate *)self candidateChoices];
  id v5 = objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = [(_UIReplacementCandidate *)self candidateChoices];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = [v11 label];
        if (v12)
        {
          [v5 addObject:v12];
        }
        else
        {
          uint64_t v13 = [v11 candidate];
          id v14 = (void *)v13;
          if (v13) {
            id v15 = (__CFString *)v13;
          }
          else {
            id v15 = &stru_1ED0E84C0;
          }
          [v5 addObject:v15];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  id v16 = (void *)[v5 copy];
  return (NSArray *)v16;
}

- (void)setTextChoices:(id)a3
{
  id v4 = a3;
  id v6 = [(_UIReplacementCandidate *)self documentTextToReplace];
  id v5 = _candidatesChoicesFromTextChoices(v4, v6);

  [(_UIReplacementCandidate *)self setCandidateChoices:v5];
}

- (NSString)documentTextToReplace
{
  return self->_documentTextToReplace;
}

- (void)setDocumentTextToReplace:(id)a3
{
}

- (NSString)revertText
{
  return self->_revertText;
}

- (void)setRevertText:(id)a3
{
}

- (NSArray)alternativeRevertTexts
{
  return self->_alternativeRevertTexts;
}

- (void)setAlternativeRevertTexts:(id)a3
{
}

- (NSArray)candidateChoices
{
  return self->_candidateChoices;
}

- (void)setCandidateChoices:(id)a3
{
}

- (NSArray)underlines
{
  return self->_underlines;
}

- (void)setUnderlines:(id)a3
{
}

- (UITextRange)rangeInDocument
{
  return self->_rangeInDocument;
}

- (void)setRangeInDocument:(id)a3
{
}

- (int64_t)underlineStyle
{
  return self->_underlineStyle;
}

- (void)setUnderlineStyle:(int64_t)a3
{
  self->_underlineStyle = a3;
}

- (int64_t)preferredPromptStyle
{
  return self->_preferredPromptStyle;
}

- (void)setPreferredPromptStyle:(int64_t)a3
{
  self->_preferredPromptStyle = a3;
}

- (int64_t)preferredPromptButton
{
  return self->_preferredPromptButton;
}

- (void)setPreferredPromptButton:(int64_t)a3
{
  self->_preferredPromptButton = a3;
}

- (NSNumber)voiceCommandDisambiguationSelectedIndex
{
  return self->_voiceCommandDisambiguationSelectedIndex;
}

- (void)setVoiceCommandDisambiguationSelectedIndex:(id)a3
{
}

- (NSUUID)voiceCommandTrackingUUID
{
  return self->_voiceCommandTrackingUUID;
}

- (void)setVoiceCommandTrackingUUID:(id)a3
{
}

- (NSNumber)voiceCommandDisambiguationTargetCount
{
  return self->_voiceCommandDisambiguationTargetCount;
}

- (void)setVoiceCommandDisambiguationTargetCount:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceCommandDisambiguationTargetCount, 0);
  objc_storeStrong((id *)&self->_voiceCommandTrackingUUID, 0);
  objc_storeStrong((id *)&self->_voiceCommandDisambiguationSelectedIndex, 0);
  objc_storeStrong((id *)&self->_rangeInDocument, 0);
  objc_storeStrong((id *)&self->_underlines, 0);
  objc_storeStrong((id *)&self->_candidateChoices, 0);
  objc_storeStrong((id *)&self->_alternativeRevertTexts, 0);
  objc_storeStrong((id *)&self->_revertText, 0);
  objc_storeStrong((id *)&self->_documentTextToReplace, 0);
}

@end