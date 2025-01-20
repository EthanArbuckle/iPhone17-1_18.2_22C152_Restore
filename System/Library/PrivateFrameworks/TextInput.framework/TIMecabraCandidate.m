@interface TIMecabraCandidate
+ (BOOL)supportsSecureCoding;
+ (int)type;
- (BOOL)isAsIsCandidate;
- (BOOL)isAutocorrection;
- (BOOL)isBilingualCandidate;
- (BOOL)isContinuousPathConversion;
- (BOOL)isEmojiCandidate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtensionCandidate;
- (BOOL)isForShortcutConversion;
- (BOOL)isFullwidthCandidate;
- (BOOL)isMecabraCandidate;
- (BOOL)isOTAWordListCandidate;
- (BOOL)isPartialCandidate;
- (BOOL)isPrefixMatched;
- (BOOL)isRegionalCandidate;
- (BOOL)isResponseKitCandidate;
- (BOOL)isWubixingConvertedByPinyin;
- (BOOL)shouldAccept;
- (BOOL)shouldInsertSpaceAfterSelection;
- (BOOL)singlePhrase;
- (NSNumber)mecabraCandidatePointerValue;
- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 latinCandidate:(id)a5 mecabraCandidatePointerValue:(id)a6 withFlags:(unsigned __int16)a7;
- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 latinCandidate:(id)a5 mecabraCandidatePointerValue:(id)a6 withFlags:(unsigned __int16)a7 deleteCount:(unint64_t)a8 cursorMovement:(int64_t)a9;
- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 mecabraCandidatePointerValue:(id)a5 withFlags:(unsigned __int16)a6;
- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 mecabraCandidatePointerValue:(id)a5 withFlags:(unsigned __int16)a6 deleteCount:(unint64_t)a7 cursorMovement:(int64_t)a8;
- (TIMecabraCandidate)initWithCandidateResultSetCoder:(id)a3;
- (TIMecabraCandidate)initWithCoder:(id)a3;
- (TIMecabraCandidate)initWithResponseKitString:(id)a3 responseKitCategory:(id)a4 mecabraCandidatePointerValue:(id)a5;
- (TIMecabraCandidate)initWithSurface:(id)a3 input:(id)a4 mecabraCandidatePointerValue:(id)a5;
- (float)lmScore;
- (float)seq2seqScore;
- (id)candidate;
- (id)candidateByReplacingWithCandidate:(id)a3;
- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4;
- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 rawInput:(id)a5;
- (id)candidateByReplacingWithSourceMask:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)input;
- (id)label;
- (id)latinCandidate;
- (id)rawInput;
- (id)responseKitCategory;
- (int64_t)cursorMovement;
- (unint64_t)deleteCount;
- (unsigned)flags;
- (unsigned)sourceMask;
- (void)encodeWithCandidateResultSetCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setContinuousPathConversion:(BOOL)a3;
- (void)setLmScore:(float)a3;
- (void)setMecabraCandidatePointerValue:(id)a3;
- (void)setSeq2seqScore:(float)a3;
- (void)setShouldAccept:(BOOL)a3;
- (void)setShouldInsertSpaceAfterSelection:(BOOL)a3;
- (void)setSourceMask:(unsigned int)a3;
@end

@implementation TIMecabraCandidate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseKitCategory, 0);
  objc_storeStrong((id *)&self->_mecabraCandidatePointerValue, 0);
  objc_storeStrong((id *)&self->_rawInput, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_latinCandidate, 0);

  objc_storeStrong((id *)&self->_candidate, 0);
}

- (void)setLmScore:(float)a3
{
  self->_lmScore = a3;
}

- (float)lmScore
{
  return self->_lmScore;
}

- (void)setSeq2seqScore:(float)a3
{
  self->_seq2seqScore = a3;
}

- (float)seq2seqScore
{
  return self->_seq2seqScore;
}

- (void)setShouldInsertSpaceAfterSelection:(BOOL)a3
{
  self->_shouldInsertSpaceAfterSelection = a3;
}

- (BOOL)shouldInsertSpaceAfterSelection
{
  return self->_shouldInsertSpaceAfterSelection;
}

- (BOOL)singlePhrase
{
  return self->_singlePhrase;
}

- (void)setSourceMask:(unsigned int)a3
{
  self->_sourceMask = a3;
}

- (unsigned)sourceMask
{
  return self->_sourceMask;
}

- (void)setShouldAccept:(BOOL)a3
{
  self->_shouldAccept = a3;
}

- (BOOL)shouldAccept
{
  return self->_shouldAccept;
}

- (BOOL)isPrefixMatched
{
  return self->_prefixMatched;
}

- (BOOL)isWubixingConvertedByPinyin
{
  return self->_wubixingConvertedByPinyin;
}

- (BOOL)isPartialCandidate
{
  return self->_partialCandidate;
}

- (void)setContinuousPathConversion:(BOOL)a3
{
  self->_continuousPathConversion = a3;
}

- (BOOL)isAsIsCandidate
{
  return self->_asIsCandidate;
}

- (BOOL)isBilingualCandidate
{
  return self->_bilingualCandidate;
}

- (id)responseKitCategory
{
  return self->_responseKitCategory;
}

- (BOOL)isResponseKitCandidate
{
  return self->_responseKitCandidate;
}

- (int64_t)cursorMovement
{
  return self->_cursorMovement;
}

- (BOOL)isRegionalCandidate
{
  return self->_regionalCandidate;
}

- (BOOL)isOTAWordListCandidate
{
  return self->_OTAWordListCandidate;
}

- (BOOL)isAutocorrection
{
  return self->_isAutocorrection;
}

- (BOOL)isForShortcutConversion
{
  return self->_isForShortcutConversion;
}

- (BOOL)isExtensionCandidate
{
  return self->_extensionCandidate;
}

- (BOOL)isEmojiCandidate
{
  return self->_emojiCandidate;
}

- (void)setMecabraCandidatePointerValue:(id)a3
{
}

- (NSNumber)mecabraCandidatePointerValue
{
  return self->_mecabraCandidatePointerValue;
}

- (id)rawInput
{
  return self->_rawInput;
}

- (id)input
{
  return self->_input;
}

- (id)latinCandidate
{
  return self->_latinCandidate;
}

- (id)candidate
{
  return self->_candidate;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TIMecabraCandidate;
  id v4 = a3;
  [(TIKeyboardCandidate *)&v5 encodeWithCandidateResultSetCoder:v4];
  objc_msgSend(v4, "encodeString:", self->_candidate, v5.receiver, v5.super_class);
  [v4 encodeString:self->_latinCandidate];
  [v4 encodeString:self->_input];
  [v4 encodeString:self->_rawInput];
  objc_msgSend(v4, "encodeUInt64:", -[NSNumber unsignedLongLongValue](self->_mecabraCandidatePointerValue, "unsignedLongLongValue"));
  objc_msgSend(v4, "encodeShort:", -[TIMecabraCandidate flags](self, "flags"));
  [v4 encodeUInt32:LODWORD(self->_deleteCount)];
  [v4 encodeUInt32:LODWORD(self->_cursorMovement)];
  [v4 encodeBool:self->_shouldAccept];
  objc_msgSend(v4, "encodeUInt32:", -[TIMecabraCandidate sourceMask](self, "sourceMask"));
  [v4 encodeBool:self->_shouldInsertSpaceAfterSelection];
}

- (TIMecabraCandidate)initWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)TIMecabraCandidate;
  objc_super v5 = [(TIKeyboardCandidate *)&v24 initWithCandidateResultSetCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeString];
    uint64_t v7 = [v6 copy];
    candidate = v5->_candidate;
    v5->_candidate = (NSString *)v7;

    v9 = [v4 decodeString];
    uint64_t v10 = [v9 copy];
    latinCandidate = v5->_latinCandidate;
    v5->_latinCandidate = (NSString *)v10;

    v12 = [v4 decodeString];
    uint64_t v13 = [v12 copy];
    input = v5->_input;
    v5->_input = (NSString *)v13;

    v15 = [v4 decodeString];
    uint64_t v16 = [v15 copy];
    rawInput = v5->_rawInput;
    v5->_rawInput = (NSString *)v16;

    if (![(NSString *)v5->_rawInput length])
    {
      v18 = v5->_rawInput;
      v5->_rawInput = 0;
    }
    uint64_t v19 = [v4 decodeUInt64];
    uint64_t v20 = [NSNumber numberWithUnsignedLongLong:v19];
    mecabraCandidatePointerValue = v5->_mecabraCandidatePointerValue;
    v5->_mecabraCandidatePointerValue = (NSNumber *)v20;

    __int16 v22 = [v4 decodeShort];
    v5->_extensionCandidate = v22 & 1;
    v5->_emojiCandidate = (v22 & 2) != 0;
    v5->_isForShortcutConversion = (v22 & 4) != 0;
    v5->_isAutocorrection = (v22 & 8) != 0;
    v5->_OTAWordListCandidate = (v22 & 0x10) != 0;
    v5->_regionalCandidate = (v22 & 0x20) != 0;
    v5->_responseKitCandidate = (v22 & 0x40) != 0;
    v5->_bilingualCandidate = (v22 & 0x80) != 0;
    v5->_asIsCandidate = HIBYTE(v22) & 1;
    v5->_partialCandidate = (v22 & 0x200) != 0;
    v5->_wubixingConvertedByPinyin = (v22 & 0x400) != 0;
    v5->_prefixMatched = (v22 & 0x800) != 0;
    v5->_deleteCount = [v4 decodeUInt32];
    v5->_cursorMovement = [v4 decodeUInt32];
    v5->_shouldAccept = [v4 decodeBool];
    v5->_sourceMask = [v4 decodeUInt32];
    v5->_shouldInsertSpaceAfterSelection = [v4 decodeBool];
  }

  return v5;
}

- (id)candidateByReplacingWithSourceMask:(unsigned int)a3
{
  id v4 = (_DWORD *)[(TIMecabraCandidate *)self copy];
  v4[40] = a3;

  return v4;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 rawInput:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)[(TIMecabraCandidate *)self copy];
  v12 = (void *)v11[22];
  v11[22] = v8;
  id v13 = v8;

  v14 = (void *)v11[24];
  v11[24] = v9;
  id v15 = v9;

  uint64_t v16 = (void *)v11[25];
  v11[25] = v10;

  return v11;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TIMecabraCandidate *)self rawInput];
  id v9 = [(TIMecabraCandidate *)self candidateByReplacingWithCandidate:v7 input:v6 rawInput:v8];

  return v9;
}

- (id)candidateByReplacingWithCandidate:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)[(TIMecabraCandidate *)self copy];
  uint64_t v6 = [v4 copy];

  id v7 = (void *)v5[22];
  v5[22] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TIMecabraCandidate *)a3;
  if (v4 == self)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v5 = v4;
      uint64_t v6 = [(TIMecabraCandidate *)v5 mecabraCandidatePointerValue];
      uint64_t v7 = [(TIMecabraCandidate *)self mecabraCandidatePointerValue];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        id v8 = (void *)v7;
        id v9 = [(TIMecabraCandidate *)v5 mecabraCandidatePointerValue];
        id v10 = [(TIMecabraCandidate *)self mecabraCandidatePointerValue];
        int v11 = [v9 isEqual:v10];

        if (!v11) {
          goto LABEL_12;
        }
      }
      BOOL v13 = [(TIMecabraCandidate *)v5 isContinuousPathConversion];
      if (v13 == [(TIMecabraCandidate *)self isContinuousPathConversion])
      {
        BOOL v14 = [(TIMecabraCandidate *)v5 shouldAccept];
        if (v14 == [(TIMecabraCandidate *)self shouldAccept])
        {
          BOOL v15 = [(TIMecabraCandidate *)v5 shouldInsertSpaceAfterSelection];
          if (v15 == [(TIMecabraCandidate *)self shouldInsertSpaceAfterSelection])
          {
            v17.receiver = self;
            v17.super_class = (Class)TIMecabraCandidate;
            BOOL v12 = [(TIKeyboardCandidate *)&v17 isEqual:v5];
            goto LABEL_13;
          }
        }
      }
LABEL_12:
      BOOL v12 = 0;
LABEL_13:

      goto LABEL_14;
    }
    BOOL v12 = 0;
  }
LABEL_14:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TIMecabraCandidate;
  [(TIKeyboardCandidate *)&v13 encodeWithCoder:v4];
  candidate = self->_candidate;
  if (candidate) {
    [v4 encodeObject:candidate forKey:@"candidate"];
  }
  latinCandidate = self->_latinCandidate;
  if (latinCandidate) {
    [v4 encodeObject:latinCandidate forKey:@"latinCandidate"];
  }
  input = self->_input;
  if (input) {
    [v4 encodeObject:input forKey:@"input"];
  }
  rawInput = self->_rawInput;
  if (rawInput) {
    [v4 encodeObject:rawInput forKey:@"rawInput"];
  }
  mecabraCandidatePointerValue = self->_mecabraCandidatePointerValue;
  if (mecabraCandidatePointerValue) {
    [v4 encodeObject:mecabraCandidatePointerValue forKey:@"mecabraCandidatePointerValue"];
  }
  if (self->_extensionCandidate) {
    [v4 encodeBool:1 forKey:@"extensionCandidate"];
  }
  if (self->_emojiCandidate) {
    [v4 encodeBool:1 forKey:@"emojiCandidate"];
  }
  if (self->_isForShortcutConversion) {
    [v4 encodeBool:1 forKey:@"isForShortcutConversion"];
  }
  if (self->_isAutocorrection) {
    [v4 encodeBool:1 forKey:@"isAutocorrection"];
  }
  if (self->_OTAWordListCandidate) {
    [v4 encodeBool:1 forKey:@"OTAWordListCandidate"];
  }
  if (self->_regionalCandidate) {
    [v4 encodeBool:1 forKey:@"regionalCandidate"];
  }
  if (self->_bilingualCandidate) {
    [v4 encodeBool:1 forKey:@"bilingualCandidate"];
  }
  if (self->_asIsCandidate) {
    [v4 encodeBool:1 forKey:@"asIsCandidate"];
  }
  if (self->_partialCandidate) {
    [v4 encodeBool:1 forKey:@"partialCandidate"];
  }
  if (self->_wubixingConvertedByPinyin) {
    [v4 encodeBool:1 forKey:@"wubixingConvertedByPinyin"];
  }
  if (self->_prefixMatched) {
    [v4 encodeBool:1 forKey:@"prefixMatched"];
  }
  unint64_t deleteCount = self->_deleteCount;
  if (deleteCount) {
    [v4 encodeInteger:deleteCount forKey:@"deleteCount"];
  }
  int64_t cursorMovement = self->_cursorMovement;
  if (cursorMovement) {
    [v4 encodeInteger:cursorMovement forKey:@"cursorMovement"];
  }
  if (self->_continuousPathConversion) {
    [v4 encodeBool:1 forKey:@"continuousPathConversion"];
  }
  if (self->_shouldAccept) {
    [v4 encodeBool:1 forKey:@"shouldAccept"];
  }
  uint64_t sourceMask = self->_sourceMask;
  if (sourceMask) {
    [v4 encodeInteger:sourceMask forKey:@"sourceMask"];
  }
  if (self->_singlePhrase) {
    [v4 encodeBool:1 forKey:@"singlePhrase"];
  }
  if (self->_shouldInsertSpaceAfterSelection) {
    [v4 encodeBool:1 forKey:@"shouldInsertSpaceAfterSelection"];
  }
}

- (TIMecabraCandidate)initWithCoder:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)TIMecabraCandidate;
  objc_super v5 = [(TIKeyboardCandidate *)&v21 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidate"];
    uint64_t v7 = [v6 copy];
    candidate = v5->_candidate;
    v5->_candidate = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"latinCandidate"];
    uint64_t v10 = [v9 copy];
    latinCandidate = v5->_latinCandidate;
    v5->_latinCandidate = (NSString *)v10;

    BOOL v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
    uint64_t v13 = [v12 copy];
    input = v5->_input;
    v5->_input = (NSString *)v13;

    BOOL v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawInput"];
    uint64_t v16 = [v15 copy];
    rawInput = v5->_rawInput;
    v5->_rawInput = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mecabraCandidatePointerValue"];
    mecabraCandidatePointerValue = v5->_mecabraCandidatePointerValue;
    v5->_mecabraCandidatePointerValue = (NSNumber *)v18;

    v5->_extensionCandidate = [v4 decodeBoolForKey:@"extensionCandidate"];
    v5->_emojiCandidate = [v4 decodeBoolForKey:@"emojiCandidate"];
    v5->_isForShortcutConversion = [v4 decodeBoolForKey:@"isForShortcutConversion"];
    v5->_isAutocorrection = [v4 decodeBoolForKey:@"isAutocorrection"];
    v5->_OTAWordListCandidate = [v4 decodeBoolForKey:@"OTAWordListCandidate"];
    v5->_regionalCandidate = [v4 decodeBoolForKey:@"regionalCandidate"];
    v5->_bilingualCandidate = [v4 decodeBoolForKey:@"bilingualCandidate"];
    v5->_asIsCandidate = [v4 decodeBoolForKey:@"asIsCandidate"];
    v5->_partialCandidate = [v4 decodeBoolForKey:@"partialCandidate"];
    v5->_wubixingConvertedByPinyin = [v4 decodeBoolForKey:@"wubixingConvertedByPinyin"];
    v5->_prefixMatched = [v4 decodeBoolForKey:@"prefixMatched"];
    v5->_unint64_t deleteCount = [v4 decodeIntegerForKey:@"deleteCount"];
    v5->_int64_t cursorMovement = [v4 decodeIntegerForKey:@"cursorMovement"];
    v5->_continuousPathConversion = [v4 decodeBoolForKey:@"continuousPathConversion"];
    v5->_shouldAccept = [v4 decodeBoolForKey:@"shouldAccept"];
    v5->_uint64_t sourceMask = [v4 decodeIntegerForKey:@"sourceMask"];
    v5->_singlePhrase = [v4 decodeBoolForKey:@"singlePhrase"];
    v5->_shouldInsertSpaceAfterSelection = [v4 decodeBoolForKey:@"shouldInsertSpaceAfterSelection"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v15.receiver = self;
  v15.super_class = (Class)TIMecabraCandidate;
  id v5 = -[TIKeyboardCandidate copyWithZone:](&v15, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_candidate copyWithZone:a3];
    uint64_t v7 = (void *)*((void *)v5 + 22);
    *((void *)v5 + 22) = v6;

    uint64_t v8 = [(NSString *)self->_latinCandidate copyWithZone:a3];
    id v9 = (void *)*((void *)v5 + 23);
    *((void *)v5 + 23) = v8;

    uint64_t v10 = [(NSString *)self->_input copyWithZone:a3];
    int v11 = (void *)*((void *)v5 + 24);
    *((void *)v5 + 24) = v10;

    uint64_t v12 = [(NSString *)self->_rawInput copyWithZone:a3];
    uint64_t v13 = (void *)*((void *)v5 + 25);
    *((void *)v5 + 25) = v12;

    objc_storeStrong((id *)v5 + 26, self->_mecabraCandidatePointerValue);
    *((unsigned char *)v5 + 145) = self->_extensionCandidate;
    *((unsigned char *)v5 + 144) = self->_emojiCandidate;
    *((unsigned char *)v5 + 146) = self->_isForShortcutConversion;
    *((unsigned char *)v5 + 147) = self->_isAutocorrection;
    *((unsigned char *)v5 + 148) = self->_OTAWordListCandidate;
    *((unsigned char *)v5 + 149) = self->_regionalCandidate;
    *((unsigned char *)v5 + 151) = self->_bilingualCandidate;
    *((unsigned char *)v5 + 152) = self->_asIsCandidate;
    *((unsigned char *)v5 + 154) = self->_partialCandidate;
    *((unsigned char *)v5 + 155) = self->_wubixingConvertedByPinyin;
    *((unsigned char *)v5 + 156) = self->_prefixMatched;
    *((void *)v5 + 27) = self->_deleteCount;
    *((void *)v5 + 28) = self->_cursorMovement;
    *((unsigned char *)v5 + 153) = self->_continuousPathConversion;
    *((unsigned char *)v5 + 157) = self->_shouldAccept;
    *((unsigned char *)v5 + 159) = self->_shouldInsertSpaceAfterSelection;
    *((_DWORD *)v5 + 40) = self->_sourceMask;
    *((unsigned char *)v5 + 158) = self->_singlePhrase;
  }
  return v5;
}

- (unsigned)flags
{
  unsigned __int16 extensionCandidate = self->_extensionCandidate;
  if (self->_emojiCandidate) {
    extensionCandidate |= 2u;
  }
  if (self->_isForShortcutConversion) {
    extensionCandidate |= 4u;
  }
  if (self->_isAutocorrection) {
    extensionCandidate |= 8u;
  }
  if (self->_OTAWordListCandidate) {
    extensionCandidate |= 0x10u;
  }
  if (self->_regionalCandidate) {
    extensionCandidate |= 0x20u;
  }
  if (self->_responseKitCandidate) {
    extensionCandidate |= 0x40u;
  }
  if (self->_bilingualCandidate) {
    extensionCandidate |= 0x80u;
  }
  if (self->_asIsCandidate) {
    extensionCandidate |= 0x100u;
  }
  if (self->_partialCandidate) {
    extensionCandidate |= 0x200u;
  }
  if (self->_wubixingConvertedByPinyin) {
    unsigned __int16 v3 = extensionCandidate | 0x400;
  }
  else {
    unsigned __int16 v3 = extensionCandidate;
  }
  BOOL v4 = [(TIMecabraCandidate *)self isPrefixMatched];
  unsigned __int16 v5 = v3 | 0x800;
  if (!v4) {
    return v3;
  }
  return v5;
}

- (BOOL)isMecabraCandidate
{
  return 1;
}

- (BOOL)isContinuousPathConversion
{
  return self->_continuousPathConversion;
}

- (unint64_t)deleteCount
{
  return self->_deleteCount;
}

- (BOOL)isFullwidthCandidate
{
  return [(NSString *)self->_candidate _containsFullwidthLettersAndNumbersOnly];
}

- (id)label
{
  v6.receiver = self;
  v6.super_class = (Class)TIMecabraCandidate;
  v2 = [(TIKeyboardCandidate *)&v6 label];
  unsigned __int16 v3 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  BOOL v4 = [v2 stringByTrimmingCharactersInSet:v3];

  return v4;
}

- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 latinCandidate:(id)a5 mecabraCandidatePointerValue:(id)a6 withFlags:(unsigned __int16)a7 deleteCount:(unint64_t)a8 cursorMovement:(int64_t)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  v27.receiver = self;
  v27.super_class = (Class)TIMecabraCandidate;
  uint64_t v19 = [(TIKeyboardCandidate *)&v27 init];
  if (v19)
  {
    uint64_t v20 = [v15 copy];
    candidate = v19->_candidate;
    v19->_candidate = (NSString *)v20;

    if (v17) {
      __int16 v22 = (void *)[v17 copy];
    }
    else {
      __int16 v22 = 0;
    }
    objc_storeStrong((id *)&v19->_latinCandidate, v22);
    if (v17) {

    }
    uint64_t v23 = [v16 copy];
    input = v19->_input;
    v19->_input = (NSString *)v23;

    rawInput = v19->_rawInput;
    v19->_rawInput = 0;

    objc_storeStrong((id *)&v19->_mecabraCandidatePointerValue, a6);
    v19->_unsigned __int16 extensionCandidate = a7 & 1;
    v19->_emojiCandidate = (a7 & 2) != 0;
    v19->_isForShortcutConversion = (a7 & 4) != 0;
    v19->_isAutocorrection = (a7 & 8) != 0;
    v19->_OTAWordListCandidate = (a7 & 0x10) != 0;
    v19->_regionalCandidate = (a7 & 0x20) != 0;
    v19->_responseKitCandidate = (a7 & 0x40) != 0;
    v19->_bilingualCandidate = (a7 & 0x80) != 0;
    v19->_asIsCandidate = HIBYTE(a7) & 1;
    v19->_partialCandidate = (a7 & 0x200) != 0;
    v19->_wubixingConvertedByPinyin = (a7 & 0x400) != 0;
    v19->_prefixMatched = (a7 & 0x800) != 0;
    v19->_singlePhrase = (a7 & 0x1000) != 0;
    v19->_unint64_t deleteCount = a8;
    v19->_int64_t cursorMovement = a9;
    [(TIKeyboardCandidate *)v19 setTypingEngine:5];
  }

  return v19;
}

- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 mecabraCandidatePointerValue:(id)a5 withFlags:(unsigned __int16)a6 deleteCount:(unint64_t)a7 cursorMovement:(int64_t)a8
{
  return [(TIMecabraCandidate *)self initWithCandidate:a3 forInput:a4 latinCandidate:0 mecabraCandidatePointerValue:a5 withFlags:a6 deleteCount:a7 cursorMovement:a8];
}

- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 latinCandidate:(id)a5 mecabraCandidatePointerValue:(id)a6 withFlags:(unsigned __int16)a7
{
  return [(TIMecabraCandidate *)self initWithCandidate:a3 forInput:a4 latinCandidate:a5 mecabraCandidatePointerValue:a6 withFlags:a7 deleteCount:0 cursorMovement:0];
}

- (TIMecabraCandidate)initWithCandidate:(id)a3 forInput:(id)a4 mecabraCandidatePointerValue:(id)a5 withFlags:(unsigned __int16)a6
{
  return [(TIMecabraCandidate *)self initWithCandidate:a3 forInput:a4 mecabraCandidatePointerValue:a5 withFlags:a6 deleteCount:0 cursorMovement:0];
}

- (TIMecabraCandidate)initWithResponseKitString:(id)a3 responseKitCategory:(id)a4 mecabraCandidatePointerValue:(id)a5
{
  id v8 = a4;
  id v9 = [(TIMecabraCandidate *)self initWithCandidate:a3 forInput:&stru_1EDBDCE38 mecabraCandidatePointerValue:a5 withFlags:64];
  if (v9)
  {
    uint64_t v10 = [v8 copy];
    responseKitCategory = v9->_responseKitCategory;
    v9->_responseKitCategory = (NSString *)v10;
  }
  return v9;
}

- (TIMecabraCandidate)initWithSurface:(id)a3 input:(id)a4 mecabraCandidatePointerValue:(id)a5
{
  return [(TIMecabraCandidate *)self initWithCandidate:a3 forInput:a4 mecabraCandidatePointerValue:a5 withFlags:0];
}

+ (int)type
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end