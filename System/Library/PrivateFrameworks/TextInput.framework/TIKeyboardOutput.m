@interface TIKeyboardOutput
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)producedByDeleteInput;
- (BOOL)shouldSendCurrentLocation;
- (BOOL)unmarkIfNecessary;
- (NSIndexSet)handwritingStrokesToDelete;
- (NSMutableDictionary)customInfo;
- (NSString)insertionText;
- (NSString)insertionTextAfterSelection;
- (NSString)textToCommit;
- (TIKeyboardCandidate)acceptedCandidate;
- (TIKeyboardCandidate)shortcutConversion;
- (TIKeyboardOutput)initWithCoder:(id)a3;
- (id)description;
- (int64_t)positionOffset;
- (unint64_t)deletionCount;
- (unint64_t)forwardDeletionCount;
- (unint64_t)hash;
- (void)deleteBackward;
- (void)deleteBackward:(unint64_t)a3;
- (void)deleteForward;
- (void)deleteForward:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)insertText:(id)a3;
- (void)insertTextAfterSelection:(id)a3;
- (void)setAcceptedCandidate:(id)a3;
- (void)setCustomInfo:(id)a3;
- (void)setDeletionCount:(unint64_t)a3;
- (void)setForwardDeletionCount:(unint64_t)a3;
- (void)setHandwritingStrokesToDelete:(id)a3;
- (void)setInsertionText:(id)a3;
- (void)setInsertionTextAfterSelection:(id)a3;
- (void)setPositionOffset:(int64_t)a3;
- (void)setProducedByDeleteInput:(BOOL)a3;
- (void)setShortcutConversion:(id)a3;
- (void)setShouldSendCurrentLocation:(BOOL)a3;
- (void)setTextToCommit:(id)a3;
- (void)setUnmarkIfNecessary:(BOOL)a3;
@end

@implementation TIKeyboardOutput

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customInfo, 0);
  objc_storeStrong((id *)&self->_handwritingStrokesToDelete, 0);
  objc_storeStrong((id *)&self->_shortcutConversion, 0);
  objc_storeStrong((id *)&self->_insertionTextAfterSelection, 0);
  objc_storeStrong((id *)&self->_insertionText, 0);
  objc_storeStrong((id *)&self->_textToCommit, 0);

  objc_storeStrong((id *)&self->_acceptedCandidate, 0);
}

- (void)setProducedByDeleteInput:(BOOL)a3
{
  self->_producedByDeleteInput = a3;
}

- (BOOL)producedByDeleteInput
{
  return self->_producedByDeleteInput;
}

- (void)setCustomInfo:(id)a3
{
}

- (NSMutableDictionary)customInfo
{
  return self->_customInfo;
}

- (void)setShouldSendCurrentLocation:(BOOL)a3
{
  self->_shouldSendCurrentLocation = a3;
}

- (BOOL)shouldSendCurrentLocation
{
  return self->_shouldSendCurrentLocation;
}

- (void)setHandwritingStrokesToDelete:(id)a3
{
}

- (NSIndexSet)handwritingStrokesToDelete
{
  return self->_handwritingStrokesToDelete;
}

- (void)setShortcutConversion:(id)a3
{
}

- (TIKeyboardCandidate)shortcutConversion
{
  return self->_shortcutConversion;
}

- (void)setInsertionTextAfterSelection:(id)a3
{
}

- (NSString)insertionTextAfterSelection
{
  return self->_insertionTextAfterSelection;
}

- (void)setForwardDeletionCount:(unint64_t)a3
{
  self->_forwardDeletionCount = a3;
}

- (unint64_t)forwardDeletionCount
{
  return self->_forwardDeletionCount;
}

- (void)setInsertionText:(id)a3
{
}

- (NSString)insertionText
{
  return self->_insertionText;
}

- (void)setDeletionCount:(unint64_t)a3
{
  self->_deletionCount = a3;
}

- (unint64_t)deletionCount
{
  return self->_deletionCount;
}

- (void)setPositionOffset:(int64_t)a3
{
  self->_positionOffset = a3;
}

- (int64_t)positionOffset
{
  return self->_positionOffset;
}

- (void)setUnmarkIfNecessary:(BOOL)a3
{
  self->_unmarkIfNecessary = a3;
}

- (BOOL)unmarkIfNecessary
{
  return self->_unmarkIfNecessary;
}

- (void)setTextToCommit:(id)a3
{
}

- (NSString)textToCommit
{
  return self->_textToCommit;
}

- (void)setAcceptedCandidate:(id)a3
{
}

- (TIKeyboardCandidate)acceptedCandidate
{
  return self->_acceptedCandidate;
}

- (void)deleteForward
{
}

- (void)deleteForward:(unint64_t)a3
{
  v5 = [(TIKeyboardOutput *)self insertionTextAfterSelection];
  unint64_t v6 = [v5 length];

  unint64_t v7 = 0;
  BOOL v8 = v6 != 0;
  if (a3 && v6)
  {
    unint64_t v7 = 0;
    do
    {
      v9 = [(TIKeyboardOutput *)self insertionTextAfterSelection];
      uint64_t v10 = [v9 rangeOfComposedCharacterSequenceAtIndex:v7];
      uint64_t v12 = v11;

      unint64_t v7 = v10 + v12;
      BOOL v8 = v7 < v6;
      --a3;
    }
    while (a3 && v7 < v6);
  }
  if (v8)
  {
    v13 = [(TIKeyboardOutput *)self insertionTextAfterSelection];
    v14 = [v13 substringFromIndex:v7];
    [(TIKeyboardOutput *)self setInsertionTextAfterSelection:v14];
  }
  else
  {
    [(TIKeyboardOutput *)self setInsertionTextAfterSelection:0];
  }
  self->_forwardDeletionCount += a3;
}

- (void)insertTextAfterSelection:(id)a3
{
  id v7 = a3;
  v4 = [(TIKeyboardOutput *)self insertionTextAfterSelection];
  if (v4)
  {
    v5 = [(TIKeyboardOutput *)self insertionTextAfterSelection];
    unint64_t v6 = [v7 stringByAppendingString:v5];
    [(TIKeyboardOutput *)self setInsertionTextAfterSelection:v6];
  }
  else
  {
    [(TIKeyboardOutput *)self setInsertionTextAfterSelection:v7];
  }
}

- (void)deleteBackward
{
}

- (void)deleteBackward:(unint64_t)a3
{
  v5 = [(TIKeyboardOutput *)self insertionText];
  uint64_t v6 = [v5 length];

  for (; a3 && v6; --a3)
  {
    id v7 = [(TIKeyboardOutput *)self insertionText];
    uint64_t v6 = [v7 _rangeOfBackwardDeletionClusterAtIndex:v6 - 1];
  }
  if (v6)
  {
    BOOL v8 = [(TIKeyboardOutput *)self insertionText];
    v9 = [v8 substringToIndex:v6];
    [(TIKeyboardOutput *)self setInsertionText:v9];
  }
  else
  {
    [(TIKeyboardOutput *)self setInsertionText:0];
  }
  self->_deletionCount += a3;
}

- (void)insertText:(id)a3
{
  id v4 = a3;
  id v8 = [(TIKeyboardOutput *)self insertionText];
  uint64_t v5 = [v8 stringByAppendingString:v4];
  uint64_t v6 = (void *)v5;
  if (v5) {
    id v7 = (id)v5;
  }
  else {
    id v7 = v4;
  }
  [(TIKeyboardOutput *)self setInsertionText:v7];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  id v7 = [(TIKeyboardOutput *)self acceptedCandidate];

  if (v7)
  {
    id v8 = [(TIKeyboardOutput *)self acceptedCandidate];
    v9 = [v8 candidate];
    [v6 appendFormat:@"; acceptedCandidate = %@", v9];
  }
  uint64_t v10 = [(TIKeyboardOutput *)self textToCommit];

  if (v10)
  {
    uint64_t v11 = [(TIKeyboardOutput *)self textToCommit];
    [v6 appendFormat:@"; textToCommit = %@", v11];
  }
  if ([(TIKeyboardOutput *)self unmarkIfNecessary]) {
    [v6 appendString:@"; unmarkIfNecessary = YES"];
  }
  if ([(TIKeyboardOutput *)self positionOffset]) {
    objc_msgSend(v6, "appendFormat:", @"; positionOffset = %d",
  }
      [(TIKeyboardOutput *)self positionOffset]);
  if ([(TIKeyboardOutput *)self deletionCount]) {
    objc_msgSend(v6, "appendFormat:", @"; delete %u", -[TIKeyboardOutput deletionCount](self, "deletionCount"));
  }
  uint64_t v12 = [(TIKeyboardOutput *)self insertionText];

  if (v12)
  {
    v13 = [(TIKeyboardOutput *)self insertionText];
    [v6 appendFormat:@"; insert %@", v13];
  }
  if ([(TIKeyboardOutput *)self forwardDeletionCount]) {
    objc_msgSend(v6, "appendFormat:", @"; delete forward %u",
  }
      [(TIKeyboardOutput *)self forwardDeletionCount]);
  v14 = [(TIKeyboardOutput *)self insertionTextAfterSelection];

  if (v14)
  {
    v15 = [(TIKeyboardOutput *)self insertionTextAfterSelection];
    [v6 appendFormat:@"; insert %@ (after selection)", v15];
  }
  v16 = [(TIKeyboardOutput *)self shortcutConversion];

  if (v16)
  {
    v17 = [(TIKeyboardOutput *)self shortcutConversion];
    v18 = [v17 candidate];
    [v6 appendFormat:@"; shortcutConversion = %@", v18];
  }
  v19 = [(TIKeyboardOutput *)self handwritingStrokesToDelete];

  if (v19)
  {
    v20 = [(TIKeyboardOutput *)self handwritingStrokesToDelete];
    [v6 appendFormat:@"; handwritingStrokesToDelete = %@", v20];
  }
  if ([(TIKeyboardOutput *)self shouldSendCurrentLocation]) {
    [v6 appendString:@"; shouldSendCurrentLocation = YES"];
  }
  v21 = [(TIKeyboardOutput *)self customInfo];

  if (v21)
  {
    v22 = [(TIKeyboardOutput *)self customInfo];
    [v6 appendFormat:@"; secureCandidateInfo = %@", v22];
  }
  if ([(TIKeyboardOutput *)self producedByDeleteInput]) {
    [v6 appendString:@"; producedByDeleteInput = YES"];
  }
  [v6 appendString:@">"];

  return v6;
}

- (unint64_t)hash
{
  v3 = [(TIKeyboardOutput *)self acceptedCandidate];
  uint64_t v4 = [v3 hash];

  uint64_t v5 = [(TIKeyboardOutput *)self textToCommit];
  uint64_t v6 = [v5 hash] + 257 * v4;

  uint64_t v7 = 257 * (257 * v6 + [(TIKeyboardOutput *)self positionOffset]);
  unint64_t v8 = 257 * (v7 + [(TIKeyboardOutput *)self deletionCount]);
  v9 = [(TIKeyboardOutput *)self insertionText];
  unint64_t v10 = v8 + [v9 hash];

  unint64_t v11 = 257 * (257 * v10 + [(TIKeyboardOutput *)self forwardDeletionCount]);
  uint64_t v12 = [(TIKeyboardOutput *)self insertionTextAfterSelection];
  unint64_t v13 = [v12 hash] + v11;

  v14 = [(TIKeyboardOutput *)self shortcutConversion];
  uint64_t v15 = [v14 hash] + 257 * v13;

  v16 = [(TIKeyboardOutput *)self handwritingStrokesToDelete];
  uint64_t v17 = [v16 hash] + 257 * v15;

  v18 = [(TIKeyboardOutput *)self customInfo];
  uint64_t v19 = [v18 hash] + 257 * v17;

  return 257 * v19 + [(TIKeyboardOutput *)self producedByDeleteInput];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = v4;
    uint64_t v6 = [(TIKeyboardOutput *)self acceptedCandidate];
    uint64_t v7 = [v5 acceptedCandidate];
    if (v6 == (void *)v7)
    {
    }
    else
    {
      unint64_t v8 = (void *)v7;
      v9 = [(TIKeyboardOutput *)self acceptedCandidate];
      unint64_t v10 = [v5 acceptedCandidate];
      int v11 = [v9 isEqual:v10];

      if (!v11) {
        goto LABEL_33;
      }
    }
    unint64_t v13 = [(TIKeyboardOutput *)self textToCommit];
    uint64_t v14 = [v5 textToCommit];
    if (v13 == (void *)v14)
    {
    }
    else
    {
      uint64_t v15 = (void *)v14;
      v16 = [(TIKeyboardOutput *)self textToCommit];
      uint64_t v17 = [v5 textToCommit];
      int v18 = [v16 isEqualToString:v17];

      if (!v18) {
        goto LABEL_33;
      }
    }
    int v19 = [(TIKeyboardOutput *)self unmarkIfNecessary];
    if (v19 != [v5 unmarkIfNecessary]) {
      goto LABEL_33;
    }
    int64_t v20 = [(TIKeyboardOutput *)self positionOffset];
    if (v20 != [v5 positionOffset]) {
      goto LABEL_33;
    }
    unint64_t v21 = [(TIKeyboardOutput *)self deletionCount];
    if (v21 != [v5 deletionCount]) {
      goto LABEL_33;
    }
    v22 = [(TIKeyboardOutput *)self insertionText];
    uint64_t v23 = [v5 insertionText];
    if (v22 == (void *)v23)
    {
    }
    else
    {
      v24 = (void *)v23;
      v25 = [(TIKeyboardOutput *)self insertionText];
      v26 = [v5 insertionText];
      int v27 = [v25 isEqualToString:v26];

      if (!v27) {
        goto LABEL_33;
      }
    }
    unint64_t v28 = [(TIKeyboardOutput *)self forwardDeletionCount];
    if (v28 == [v5 forwardDeletionCount])
    {
      v29 = [(TIKeyboardOutput *)self insertionTextAfterSelection];
      uint64_t v30 = [v5 insertionTextAfterSelection];
      if (v29 == (void *)v30)
      {
      }
      else
      {
        v31 = (void *)v30;
        v32 = [(TIKeyboardOutput *)self insertionTextAfterSelection];
        v33 = [v5 insertionTextAfterSelection];
        int v34 = [v32 isEqualToString:v33];

        if (!v34) {
          goto LABEL_33;
        }
      }
      v35 = [(TIKeyboardOutput *)self shortcutConversion];
      uint64_t v36 = [v5 shortcutConversion];
      if (v35 == (void *)v36)
      {
      }
      else
      {
        v37 = (void *)v36;
        v38 = [(TIKeyboardOutput *)self shortcutConversion];
        v39 = [v5 shortcutConversion];
        int v40 = [v38 isEqual:v39];

        if (!v40) {
          goto LABEL_33;
        }
      }
      v41 = [(TIKeyboardOutput *)self handwritingStrokesToDelete];
      uint64_t v42 = [v5 handwritingStrokesToDelete];
      if (v41 == (void *)v42)
      {
      }
      else
      {
        v43 = (void *)v42;
        v44 = [(TIKeyboardOutput *)self handwritingStrokesToDelete];
        v45 = [v5 handwritingStrokesToDelete];
        int v46 = [v44 isEqual:v45];

        if (!v46) {
          goto LABEL_33;
        }
      }
      int v47 = [(TIKeyboardOutput *)self shouldSendCurrentLocation];
      if (v47 == [v5 shouldSendCurrentLocation])
      {
        v48 = [(TIKeyboardOutput *)self customInfo];
        v49 = [v5 customInfo];

        if (v48 == v49)
        {
          BOOL v51 = [(TIKeyboardOutput *)self producedByDeleteInput];
          int v12 = v51 ^ [v5 producedByDeleteInput] ^ 1;
          goto LABEL_34;
        }
      }
    }
LABEL_33:
    LOBYTE(v12) = 0;
LABEL_34:

    goto LABEL_35;
  }
  LOBYTE(v12) = 0;
LABEL_35:

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v14 = a3;
  acceptedCandidate = self->_acceptedCandidate;
  if (acceptedCandidate) {
    [v14 encodeObject:acceptedCandidate forKey:@"acceptedCandidate"];
  }
  textToCommit = self->_textToCommit;
  if (textToCommit) {
    [v14 encodeObject:textToCommit forKey:@"textToCommit"];
  }
  if (self->_unmarkIfNecessary) {
    [v14 encodeBool:1 forKey:@"unmarkIfNecessary"];
  }
  if (self->_positionOffset) {
    objc_msgSend(v14, "encodeInteger:forKey:", -[TIKeyboardOutput positionOffset](self, "positionOffset"), @"positionOffset");
  }
  unint64_t deletionCount = self->_deletionCount;
  if (deletionCount) {
    [v14 encodeInteger:deletionCount forKey:@"deletionCount"];
  }
  insertionText = self->_insertionText;
  unint64_t v8 = v14;
  if (insertionText)
  {
    [v14 encodeObject:insertionText forKey:@"insertionText"];
    unint64_t v8 = v14;
  }
  unint64_t forwardDeletionCount = self->_forwardDeletionCount;
  if (forwardDeletionCount)
  {
    [v14 encodeInteger:forwardDeletionCount forKey:@"forwardDeletionCount"];
    unint64_t v8 = v14;
  }
  insertionTextAfterSelection = self->_insertionTextAfterSelection;
  if (insertionTextAfterSelection)
  {
    [v14 encodeObject:insertionTextAfterSelection forKey:@"insertionTextAfterSelection"];
    unint64_t v8 = v14;
  }
  shortcutConversion = self->_shortcutConversion;
  if (shortcutConversion)
  {
    [v14 encodeObject:shortcutConversion forKey:@"shortcutConversion"];
    unint64_t v8 = v14;
  }
  handwritingStrokesToDelete = self->_handwritingStrokesToDelete;
  if (handwritingStrokesToDelete)
  {
    [v14 encodeObject:handwritingStrokesToDelete forKey:@"handwritingStrokesToDelete"];
    unint64_t v8 = v14;
  }
  if (self->_shouldSendCurrentLocation)
  {
    [v14 encodeBool:1 forKey:@"shouldSendCurrentLocation"];
    unint64_t v8 = v14;
  }
  customInfo = self->_customInfo;
  if (customInfo)
  {
    [v14 encodeObject:customInfo forKey:@"customInfo"];
    unint64_t v8 = v14;
  }
  if (self->_producedByDeleteInput)
  {
    [v14 encodeBool:1 forKey:@"producedByDeleteInput"];
    unint64_t v8 = v14;
  }
}

- (TIKeyboardOutput)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)TIKeyboardOutput;
  id v5 = [(TIKeyboardOutput *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acceptedCandidate"];
    acceptedCandidate = v5->_acceptedCandidate;
    v5->_acceptedCandidate = (TIKeyboardCandidate *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"textToCommit"];
    textToCommit = v5->_textToCommit;
    v5->_textToCommit = (NSString *)v8;

    v5->_unmarkIfNecessary = [v4 decodeBoolForKey:@"_unmarkIfNecessary"];
    v5->_positionOffset = [v4 decodeIntegerForKey:@"positionOffset"];
    v5->_unint64_t deletionCount = [v4 decodeIntegerForKey:@"deletionCount"];
    unint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"insertionText"];
    uint64_t v11 = [v10 copy];
    insertionText = v5->_insertionText;
    v5->_insertionText = (NSString *)v11;

    v5->_unint64_t forwardDeletionCount = [v4 decodeIntegerForKey:@"forwardDeletionCount"];
    unint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"insertionTextAfterSelection"];
    uint64_t v14 = [v13 copy];
    insertionTextAfterSelection = v5->_insertionTextAfterSelection;
    v5->_insertionTextAfterSelection = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"shortcutConversion"];
    shortcutConversion = v5->_shortcutConversion;
    v5->_shortcutConversion = (TIKeyboardCandidate *)v16;

    int v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"handwritingStrokesToDelete"];
    uint64_t v19 = [v18 copy];
    handwritingStrokesToDelete = v5->_handwritingStrokesToDelete;
    v5->_handwritingStrokesToDelete = (NSIndexSet *)v19;

    v5->_shouldSendCurrentLocation = [v4 decodeBoolForKey:@"shouldSendCurrentLocation"];
    unint64_t v21 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    int v27 = objc_msgSend(v21, "setWithObjects:", v22, v23, v24, v25, v26, objc_opt_class(), 0);
    unint64_t v28 = [v4 decodeObjectOfClasses:v27 forKey:@"customInfo"];
    uint64_t v29 = [v28 mutableCopy];
    customInfo = v5->_customInfo;
    v5->_customInfo = (NSMutableDictionary *)v29;

    v5->_producedByDeleteInput = [v4 decodeBoolForKey:@"producedByDeleteInput"];
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end