@interface TIKeyboardCandidateSingle
+ (BOOL)supportsSecureCoding;
+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4;
+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 cursorMovement:(int64_t)a5;
+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 customInfoType:(unint64_t)a5;
+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 extensionCandidate:(BOOL)a5;
+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 property:(unint64_t)a5;
+ (id)candidateWithUnchangedInput:(id)a3;
+ (id)candidateWithUnchangedInput:(id)a3 learningFlagsMask:(unint64_t)a4;
+ (id)secureCandidateForInput:(id)a3 slotID:(unsigned int)a4;
+ (id)secureCandidateForInput:(id)a3 slotID:(unsigned int)a4 customInfoType:(unint64_t)a5;
+ (id)secureCandidateForInput:(id)a3 slotID:(unsigned int)a4 customInfoType:(unint64_t)a5 applicationKey:(id)a6 applicationBundleId:(id)a7 altDSID:(id)a8;
+ (id)secureCandidateWithCandidate:(id)a3 forInput:(id)a4 slotID:(unsigned int)a5 customInfoType:(unint64_t)a6 stickerIdentifier:(id)a7;
+ (int)type;
- (BOOL)isAutocorrectionIgnoringCaseAndDiacriticsAndSupplementalItemPrefix;
- (BOOL)isAutocorrectionIgnoringCaseAndSupplementalItemPrefix;
- (BOOL)isContinuousPathConversion;
- (BOOL)isExtensionCandidate;
- (BOOL)isHideMyEmailType;
- (BOOL)isStickerCandidate;
- (BOOL)shouldAccept;
- (NSNumber)learningFlags;
- (NSString)altDSID;
- (NSString)applicationBundleId;
- (NSString)applicationKey;
- (NSString)candidate;
- (NSString)input;
- (NSString)rawInput;
- (NSUUID)stickerIdentifier;
- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3;
- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4;
- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5;
- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 extensionCandidate:(BOOL)a6;
- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 extensionCandidate:(BOOL)a6 sourceMask:(unsigned int)a7 learningFlagsMask:(unint64_t)a8;
- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 learningFlagsMask:(unint64_t)a6;
- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 sourceMask:(unsigned int)a6;
- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 sourceMask:(unsigned int)a6 learningFlagsMask:(unint64_t)a7;
- (TIKeyboardCandidateSingle)initWithCandidateResultSetCoder:(id)a3;
- (TIKeyboardCandidateSingle)initWithCoder:(id)a3;
- (TIKeyboardCandidateSingle)initWithResponseCandidate:(id)a3;
- (TIKeyboardCandidateSingle)initWithUnchangedInput:(id)a3;
- (TIKeyboardCandidateSingle)initWithUnchangedInput:(id)a3 learningFlagsMask:(unint64_t)a4;
- (id)candidateByReplacingWithCandidate:(id)a3;
- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4;
- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 rawInput:(id)a5;
- (id)candidateByReplacingWithSourceMask:(unsigned int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)cursorMovement;
- (unint64_t)learningFlagsMask;
- (unsigned)sourceMask;
- (void)encodeWithCandidateResultSetCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAltDSID:(id)a3;
- (void)setApplicationBundleId:(id)a3;
- (void)setApplicationKey:(id)a3;
- (void)setCandidate:(id)a3;
- (void)setContinuousPathConversion:(BOOL)a3;
- (void)setCursorMovement:(int64_t)a3;
- (void)setExtensionCandidate:(BOOL)a3;
- (void)setInput:(id)a3;
- (void)setLearningFlags:(id)a3;
- (void)setLearningFlagsMask:(unint64_t)a3;
- (void)setRawInput:(id)a3;
- (void)setShouldAccept:(BOOL)a3;
- (void)setSourceMask:(unsigned int)a3;
- (void)setStickerIdentifier:(id)a3;
@end

@implementation TIKeyboardCandidateSingle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stickerIdentifier, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_applicationBundleId, 0);
  objc_storeStrong((id *)&self->_applicationKey, 0);
  objc_storeStrong((id *)&self->_rawInput, 0);
  objc_storeStrong((id *)&self->_input, 0);

  objc_storeStrong((id *)&self->_candidate, 0);
}

- (void)setShouldAccept:(BOOL)a3
{
  self->_shouldAccept = a3;
}

- (BOOL)shouldAccept
{
  return self->_shouldAccept;
}

- (void)setContinuousPathConversion:(BOOL)a3
{
  self->_continuousPathConversion = a3;
}

- (void)setSourceMask:(unsigned int)a3
{
  self->_sourceMask = a3;
}

- (unsigned)sourceMask
{
  return self->_sourceMask;
}

- (void)setLearningFlagsMask:(unint64_t)a3
{
  self->_learningFlagsMask = a3;
}

- (unint64_t)learningFlagsMask
{
  return self->_learningFlagsMask;
}

- (void)setCursorMovement:(int64_t)a3
{
  self->_cursorMovement = a3;
}

- (int64_t)cursorMovement
{
  return self->_cursorMovement;
}

- (void)setExtensionCandidate:(BOOL)a3
{
  self->_extensionCandidate = a3;
}

- (BOOL)isExtensionCandidate
{
  return self->_extensionCandidate;
}

- (void)setStickerIdentifier:(id)a3
{
}

- (NSUUID)stickerIdentifier
{
  return self->_stickerIdentifier;
}

- (void)setAltDSID:(id)a3
{
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setApplicationBundleId:(id)a3
{
}

- (NSString)applicationBundleId
{
  return self->_applicationBundleId;
}

- (void)setApplicationKey:(id)a3
{
}

- (NSString)applicationKey
{
  return self->_applicationKey;
}

- (void)setRawInput:(id)a3
{
}

- (NSString)rawInput
{
  return self->_rawInput;
}

- (void)setInput:(id)a3
{
}

- (NSString)input
{
  return self->_input;
}

- (void)setCandidate:(id)a3
{
}

- (NSString)candidate
{
  return self->_candidate;
}

- (void)encodeWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIKeyboardCandidateSingle;
  [(TIKeyboardCandidate *)&v11 encodeWithCandidateResultSetCoder:v4];
  if (![(TIKeyboardCandidate *)self slotID])
  {
    v5 = [(TIKeyboardCandidateSingle *)self candidate];
    [v4 encodeString:v5];
  }
  v6 = [(TIKeyboardCandidateSingle *)self input];
  [v4 encodeString:v6];

  v7 = [(TIKeyboardCandidateSingle *)self rawInput];
  [v4 encodeString:v7];

  v8 = [(TIKeyboardCandidateSingle *)self applicationKey];
  [v4 encodeString:v8];

  v9 = [(TIKeyboardCandidateSingle *)self applicationBundleId];
  [v4 encodeString:v9];

  v10 = [(TIKeyboardCandidateSingle *)self altDSID];
  [v4 encodeString:v10];

  objc_msgSend(v4, "encodeBool:", -[TIKeyboardCandidateSingle isExtensionCandidate](self, "isExtensionCandidate"));
  objc_msgSend(v4, "encodeUInt64:", -[TIKeyboardCandidateSingle cursorMovement](self, "cursorMovement"));
  objc_msgSend(v4, "encodeUInt64:", -[TIKeyboardCandidateSingle learningFlagsMask](self, "learningFlagsMask"));
  objc_msgSend(v4, "encodeUInt32:", -[TIKeyboardCandidateSingle sourceMask](self, "sourceMask"));
  objc_msgSend(v4, "encodeBool:", -[TIKeyboardCandidateSingle isContinuousPathConversion](self, "isContinuousPathConversion"));
  objc_msgSend(v4, "encodeBool:", -[TIKeyboardCandidateSingle shouldAccept](self, "shouldAccept"));
}

- (TIKeyboardCandidateSingle)initWithCandidateResultSetCoder:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TIKeyboardCandidateSingle;
  v5 = [(TIKeyboardCandidate *)&v27 initWithCandidateResultSetCoder:v4];
  v6 = v5;
  if (v5)
  {
    if (![(TIKeyboardCandidate *)v5 slotID])
    {
      v7 = [v4 decodeString];
      uint64_t v8 = [v7 copy];
      candidate = v6->_candidate;
      v6->_candidate = (NSString *)v8;
    }
    v10 = [v4 decodeString];
    uint64_t v11 = [v10 copy];
    input = v6->_input;
    v6->_input = (NSString *)v11;

    v13 = [v4 decodeString];
    uint64_t v14 = [v13 copy];
    rawInput = v6->_rawInput;
    v6->_rawInput = (NSString *)v14;

    if (![(NSString *)v6->_rawInput length])
    {
      v16 = v6->_rawInput;
      v6->_rawInput = 0;
    }
    v17 = [v4 decodeString];
    uint64_t v18 = [v17 copy];
    applicationKey = v6->_applicationKey;
    v6->_applicationKey = (NSString *)v18;

    v20 = [v4 decodeString];
    uint64_t v21 = [v20 copy];
    applicationBundleId = v6->_applicationBundleId;
    v6->_applicationBundleId = (NSString *)v21;

    v23 = [v4 decodeString];
    uint64_t v24 = [v23 copy];
    altDSID = v6->_altDSID;
    v6->_altDSID = (NSString *)v24;

    v6->_extensionCandidate = [v4 decodeBool];
    v6->_cursorMovement = [v4 decodeUInt64];
    v6->_learningFlagsMask = [v4 decodeUInt64];
    v6->_sourceMask = [v4 decodeUInt32];
    v6->_continuousPathConversion = [v4 decodeBool];
    v6->_shouldAccept = [v4 decodeBool];
  }

  return v6;
}

- (BOOL)isStickerCandidate
{
  return [(TIKeyboardCandidate *)self customInfoType] == 4096;
}

- (BOOL)isHideMyEmailType
{
  return [(TIKeyboardCandidate *)self customInfoType] == 1024;
}

- (id)candidateByReplacingWithSourceMask:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = (void *)[(TIKeyboardCandidateSingle *)self copy];
  [v4 setSourceMask:v3];

  return v4;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4 rawInput:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = (void *)[(TIKeyboardCandidateSingle *)self copy];
  [v11 setCandidate:v10];

  [v11 setInput:v9];
  [v11 setRawInput:v8];

  [v11 setApplicationKey:@"replacing"];
  [v11 setApplicationBundleId:@"replacing"];
  [v11 setAltDSID:@"replace"];
  [v11 setLearningFlagsMask:0];

  return v11;
}

- (id)candidateByReplacingWithCandidate:(id)a3 input:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(TIKeyboardCandidateSingle *)self rawInput];
  id v9 = [(TIKeyboardCandidateSingle *)self candidateByReplacingWithCandidate:v7 input:v6 rawInput:v8];

  return v9;
}

- (id)candidateByReplacingWithCandidate:(id)a3
{
  id v4 = a3;
  v5 = (void *)[(TIKeyboardCandidateSingle *)self copy];
  [v5 setCandidate:v4];

  return v5;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(TIKeyboardCandidateSingle *)self candidate];
  v5 = [v3 stringWithFormat:@"<TIKeyboardCandidateSingle: candidate %@, learningflagsMask %llu>", v4, -[TIKeyboardCandidateSingle learningFlagsMask](self, "learningFlagsMask")];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TIKeyboardCandidateSingle;
  [(TIKeyboardCandidate *)&v12 encodeWithCoder:v4];
  if (self->_candidate && ![(TIKeyboardCandidate *)self slotID]) {
    [v4 encodeObject:self->_candidate forKey:@"candidate"];
  }
  applicationKey = self->_applicationKey;
  if (applicationKey) {
    [v4 encodeObject:applicationKey forKey:@"applicationKey"];
  }
  applicationBundleId = self->_applicationBundleId;
  if (applicationBundleId) {
    [v4 encodeObject:applicationBundleId forKey:@"applicationBundleId"];
  }
  altDSID = self->_altDSID;
  if (altDSID) {
    [v4 encodeObject:altDSID forKey:@"altDSID"];
  }
  stickerIdentifier = self->_stickerIdentifier;
  if (stickerIdentifier) {
    [v4 encodeObject:stickerIdentifier forKey:@"stickerIdentifier"];
  }
  input = self->_input;
  if (input) {
    [v4 encodeObject:input forKey:@"input"];
  }
  rawInput = self->_rawInput;
  if (rawInput) {
    [v4 encodeObject:rawInput forKey:@"rawInput"];
  }
  [v4 encodeBool:self->_extensionCandidate forKey:@"extensionCandidate"];
  [v4 encodeInteger:self->_cursorMovement forKey:@"cursorMovement"];
  uint64_t v11 = [NSNumber numberWithUnsignedLongLong:self->_learningFlagsMask];
  [v4 encodeObject:v11 forKey:@"learningFlagsMask"];

  [v4 encodeInteger:self->_sourceMask forKey:@"sourceMask"];
  if (self->_continuousPathConversion) {
    [v4 encodeBool:1 forKey:@"continuousPathConversion"];
  }
  if (self->_shouldAccept) {
    [v4 encodeBool:1 forKey:@"shouldAccept"];
  }
}

- (TIKeyboardCandidateSingle)initWithCoder:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)TIKeyboardCandidateSingle;
  v5 = [(TIKeyboardCandidate *)&v28 initWithCoder:v4];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"candidate"];
    uint64_t v7 = [v6 copy];
    candidate = v5->_candidate;
    v5->_candidate = (NSString *)v7;

    id v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"input"];
    uint64_t v10 = [v9 copy];
    input = v5->_input;
    v5->_input = (NSString *)v10;

    objc_super v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rawInput"];
    uint64_t v13 = [v12 copy];
    rawInput = v5->_rawInput;
    v5->_rawInput = (NSString *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationKey"];
    uint64_t v16 = [v15 copy];
    applicationKey = v5->_applicationKey;
    v5->_applicationKey = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleId"];
    uint64_t v19 = [v18 copy];
    applicationBundleId = v5->_applicationBundleId;
    v5->_applicationBundleId = (NSString *)v19;

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"altDSID"];
    uint64_t v22 = [v21 copy];
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stickerIdentifier"];
    stickerIdentifier = v5->_stickerIdentifier;
    v5->_stickerIdentifier = (NSUUID *)v24;

    v5->_extensionCandidate = [v4 decodeBoolForKey:@"extensionCandidate"];
    v5->_cursorMovement = [v4 decodeIntegerForKey:@"cursorMovement"];
    v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"learningFlagsMask"];
    v5->_learningFlagsMask = [v26 unsignedIntValue];

    v5->_sourceMask = [v4 decodeIntegerForKey:@"sourceMask"];
    v5->_continuousPathConversion = [v4 decodeBoolForKey:@"continuousPathConversion"];
    v5->_shouldAccept = [v4 decodeBoolForKey:@"shouldAccept"];
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v21.receiver = self;
  v21.super_class = (Class)TIKeyboardCandidateSingle;
  v5 = -[TIKeyboardCandidate copyWithZone:](&v21, sel_copyWithZone_);
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_candidate copyWithZone:a3];
    uint64_t v7 = (void *)v5[19];
    v5[19] = v6;

    uint64_t v8 = [(NSString *)self->_input copyWithZone:a3];
    id v9 = (void *)v5[20];
    v5[20] = v8;

    uint64_t v10 = [(NSString *)self->_rawInput copyWithZone:a3];
    uint64_t v11 = (void *)v5[21];
    v5[21] = v10;

    uint64_t v12 = [(NSString *)self->_applicationKey copyWithZone:a3];
    uint64_t v13 = (void *)v5[22];
    v5[22] = v12;

    uint64_t v14 = [(NSString *)self->_applicationBundleId copyWithZone:a3];
    v15 = (void *)v5[23];
    v5[23] = v14;

    uint64_t v16 = [(NSString *)self->_altDSID copyWithZone:a3];
    v17 = (void *)v5[24];
    v5[24] = v16;

    uint64_t v18 = [(NSUUID *)self->_stickerIdentifier copyWithZone:a3];
    uint64_t v19 = (void *)v5[25];
    v5[25] = v18;

    *((unsigned char *)v5 + 144) = self->_extensionCandidate;
    v5[26] = self->_cursorMovement;
    v5[27] = self->_learningFlagsMask;
    *((_DWORD *)v5 + 37) = self->_sourceMask;
    *((unsigned char *)v5 + 145) = self->_continuousPathConversion;
    *((unsigned char *)v5 + 146) = self->_shouldAccept;
  }
  return v5;
}

- (BOOL)isAutocorrectionIgnoringCaseAndDiacriticsAndSupplementalItemPrefix
{
  uint64_t v3 = [(TIKeyboardCandidateSingle *)self candidate];
  if (v3)
  {
    id v4 = [(TIKeyboardCandidateSingle *)self candidate];
    id v5 = (id)[v4 _stringByReplacingCharacter:8217 withCharacter:39];
    uint64_t v6 = [(TIKeyboardCandidate *)self inputWithoutSupplementalItemPrefix];
    uint64_t v7 = objc_msgSend(v5, "compare:options:", objc_msgSend(v6, "_stringByReplacingCharacter:withCharacter:", 8217, 39), 129);

    BOOL v8 = v7 != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (BOOL)isAutocorrectionIgnoringCaseAndSupplementalItemPrefix
{
  uint64_t v3 = [(TIKeyboardCandidateSingle *)self candidate];
  if (v3)
  {
    id v4 = [(TIKeyboardCandidateSingle *)self candidate];
    id v5 = [(TIKeyboardCandidate *)self inputWithoutSupplementalItemPrefix];
    BOOL v6 = [v4 caseInsensitiveCompare:v5] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (TIKeyboardCandidateSingle)initWithResponseCandidate:(id)a3
{
  result = [(TIKeyboardCandidateSingle *)self initWithCandidate:a3 forInput:&stru_1EDBDCE38 rawInput:0];
  result->super._responseKitCandidate = 1;
  return result;
}

- (TIKeyboardCandidateSingle)initWithUnchangedInput:(id)a3 learningFlagsMask:(unint64_t)a4
{
  return [(TIKeyboardCandidateSingle *)self initWithCandidate:a3 forInput:a3 rawInput:0 learningFlagsMask:a4];
}

- (TIKeyboardCandidateSingle)initWithUnchangedInput:(id)a3
{
  return [(TIKeyboardCandidateSingle *)self initWithCandidate:a3 forInput:a3 rawInput:0];
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 extensionCandidate:(BOOL)a6
{
  return [(TIKeyboardCandidateSingle *)self initWithCandidate:a3 forInput:a4 rawInput:a5 extensionCandidate:a6 sourceMask:0 learningFlagsMask:0];
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 extensionCandidate:(BOOL)a6 sourceMask:(unsigned int)a7 learningFlagsMask:(unint64_t)a8
{
  uint64_t v9 = *(void *)&a7;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TIKeyboardCandidateSingle;
  v17 = [(TIKeyboardCandidate *)&v20 init];
  uint64_t v18 = v17;
  if (v17)
  {
    [(TIKeyboardCandidateSingle *)v17 setCandidate:v14];
    [(TIKeyboardCandidateSingle *)v18 setInput:v15];
    [(TIKeyboardCandidateSingle *)v18 setRawInput:v16];
    [(TIKeyboardCandidateSingle *)v18 setApplicationKey:&stru_1EDBDCE38];
    [(TIKeyboardCandidateSingle *)v18 setApplicationBundleId:&stru_1EDBDCE38];
    [(TIKeyboardCandidateSingle *)v18 setAltDSID:0];
    [(TIKeyboardCandidateSingle *)v18 setStickerIdentifier:0];
    [(TIKeyboardCandidateSingle *)v18 setExtensionCandidate:v10];
    [(TIKeyboardCandidate *)v18 setSlotID:0];
    [(TIKeyboardCandidate *)v18 setSecureCandidateWidth:0.0];
    [(TIKeyboardCandidate *)v18 setSecureCandidateHash:0];
    [(TIKeyboardCandidate *)v18 setCustomInfoType:0];
    [(TIKeyboardCandidate *)v18 setTypingEngine:0];
    [(TIKeyboardCandidateSingle *)v18 setSourceMask:v9];
    [(TIKeyboardCandidateSingle *)v18 setLearningFlagsMask:a8];
  }

  return v18;
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 sourceMask:(unsigned int)a6 learningFlagsMask:(unint64_t)a7
{
  return [(TIKeyboardCandidateSingle *)self initWithCandidate:a3 forInput:a4 rawInput:a5 extensionCandidate:0 sourceMask:*(void *)&a6 learningFlagsMask:a7];
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 learningFlagsMask:(unint64_t)a6
{
  return [(TIKeyboardCandidateSingle *)self initWithCandidate:a3 forInput:a4 rawInput:a5 extensionCandidate:0 sourceMask:0 learningFlagsMask:a6];
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5 sourceMask:(unsigned int)a6
{
  return [(TIKeyboardCandidateSingle *)self initWithCandidate:a3 forInput:a4 rawInput:a5 extensionCandidate:0 sourceMask:*(void *)&a6 learningFlagsMask:0];
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4 rawInput:(id)a5
{
  return [(TIKeyboardCandidateSingle *)self initWithCandidate:a3 forInput:a4 rawInput:a5 extensionCandidate:0];
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3 forInput:(id)a4
{
  return [(TIKeyboardCandidateSingle *)self initWithCandidate:a3 forInput:a4 rawInput:0];
}

- (TIKeyboardCandidateSingle)initWithCandidate:(id)a3
{
  return [(TIKeyboardCandidateSingle *)self initWithCandidate:a3 forInput:0 rawInput:0];
}

- (void)setLearningFlags:(id)a3
{
  self->_learningFlagsMask = [a3 unsignedIntValue];
}

- (BOOL)isContinuousPathConversion
{
  return self->_continuousPathConversion;
}

- (NSNumber)learningFlags
{
  return (NSNumber *)[NSNumber numberWithUnsignedInt:LODWORD(self->_learningFlagsMask)];
}

+ (int)type
{
  return 1;
}

+ (id)secureCandidateWithCandidate:(id)a3 forInput:(id)a4 slotID:(unsigned int)a5 customInfoType:(unint64_t)a6 stickerIdentifier:(id)a7
{
  uint64_t v8 = *(void *)&a5;
  id v11 = a7;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(id)objc_opt_class() secureCandidateForInput:v12 slotID:v8 customInfoType:a6];

  [v14 setCandidate:v13];
  [v14 setStickerIdentifier:v11];

  return v14;
}

+ (id)secureCandidateForInput:(id)a3 slotID:(unsigned int)a4 customInfoType:(unint64_t)a5 applicationKey:(id)a6 applicationBundleId:(id)a7 altDSID:(id)a8
{
  uint64_t v11 = *(void *)&a4;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  v17 = [(id)objc_opt_class() secureCandidateForInput:v16 slotID:v11 customInfoType:a5];

  [v17 setApplicationKey:v15];
  [v17 setApplicationBundleId:v14];

  [v17 setAltDSID:v13];

  return v17;
}

+ (id)secureCandidateForInput:(id)a3 slotID:(unsigned int)a4 customInfoType:(unint64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  uint64_t v8 = [(id)objc_opt_class() secureCandidateForInput:v7 slotID:v6];

  [v8 setCustomInfoType:a5];

  return v8;
}

+ (id)secureCandidateForInput:(id)a3 slotID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v5 = a3;
  uint64_t v6 = [(id)objc_opt_class() candidateWithUnchangedInput:v5];

  [v6 setSlotID:v4];

  return v6;
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 property:(unint64_t)a5
{
  id result = (id)[a1 candidateWithCandidate:a3 forInput:a4];
  *((void *)result + 2) = a5;
  return result;
}

+ (id)candidateWithUnchangedInput:(id)a3 learningFlagsMask:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithUnchangedInput:v6 learningFlagsMask:a4];

  return v7;
}

+ (id)candidateWithUnchangedInput:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithUnchangedInput:v4];

  return v5;
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 cursorMovement:(int64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(id)objc_opt_class() candidateWithCandidate:v8 forInput:v7];

  [v9 setCursorMovement:a5];

  return v9;
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 customInfoType:(unint64_t)a5
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(id)objc_opt_class() candidateWithCandidate:v8 forInput:v7];

  [v9 setCustomInfoType:a5];

  return v9;
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = (void *)[objc_alloc((Class)a1) initWithCandidate:v7 forInput:v6 rawInput:0];

  return v8;
}

+ (id)candidateWithCandidate:(id)a3 forInput:(id)a4 extensionCandidate:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  BOOL v10 = (void *)[objc_alloc((Class)a1) initWithCandidate:v9 forInput:v8 rawInput:0 extensionCandidate:v5];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end