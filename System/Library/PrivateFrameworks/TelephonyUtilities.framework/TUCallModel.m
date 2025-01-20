@interface TUCallModel
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsAddCall;
- (BOOL)supportsDTMF;
- (BOOL)supportsGrouping;
- (BOOL)supportsHolding;
- (BOOL)supportsSendingToVoicemail;
- (BOOL)supportsUnambiguousMultiPartyState;
- (BOOL)supportsUngrouping;
- (TUCallModel)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setSupportsAddCall:(BOOL)a3;
- (void)setSupportsDTMF:(BOOL)a3;
- (void)setSupportsGrouping:(BOOL)a3;
- (void)setSupportsHolding:(BOOL)a3;
- (void)setSupportsSendingToVoicemail:(BOOL)a3;
- (void)setSupportsUnambiguousMultiPartyState:(BOOL)a3;
- (void)setSupportsUngrouping:(BOOL)a3;
@end

@implementation TUCallModel

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    int v6 = [(TUCallModel *)self supportsHolding];
    if (v6 == [v5 supportsHolding]
      && (int v7 = [(TUCallModel *)self supportsGrouping],
          v7 == [v5 supportsGrouping])
      && (int v8 = [(TUCallModel *)self supportsUngrouping],
          v8 == [v5 supportsUngrouping])
      && (int v9 = -[TUCallModel supportsDTMF](self, "supportsDTMF"), v9 == [v5 supportsDTMF])
      && (int v10 = [(TUCallModel *)self supportsUnambiguousMultiPartyState],
          v10 == [v5 supportsUnambiguousMultiPartyState])
      && (int v11 = [(TUCallModel *)self supportsAddCall],
          v11 == [v5 supportsAddCall]))
    {
      BOOL v14 = [(TUCallModel *)self supportsSendingToVoicemail];
      int v12 = v14 ^ [v5 supportsSendingToVoicemail] ^ 1;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  if ([(TUCallModel *)self supportsHolding]) {
    uint64_t v3 = 1231;
  }
  else {
    uint64_t v3 = 1237;
  }
  if ([(TUCallModel *)self supportsGrouping]) {
    uint64_t v4 = 1231;
  }
  else {
    uint64_t v4 = 1237;
  }
  uint64_t v5 = v4 ^ v3;
  if ([(TUCallModel *)self supportsUngrouping]) {
    uint64_t v6 = 1231;
  }
  else {
    uint64_t v6 = 1237;
  }
  if ([(TUCallModel *)self supportsDTMF]) {
    uint64_t v7 = 1231;
  }
  else {
    uint64_t v7 = 1237;
  }
  uint64_t v8 = v5 ^ v6 ^ v7;
  if ([(TUCallModel *)self supportsUnambiguousMultiPartyState]) {
    uint64_t v9 = 1231;
  }
  else {
    uint64_t v9 = 1237;
  }
  if ([(TUCallModel *)self supportsAddCall]) {
    uint64_t v10 = 1231;
  }
  else {
    uint64_t v10 = 1237;
  }
  uint64_t v11 = v9 ^ v10;
  if ([(TUCallModel *)self supportsSendingToVoicemail]) {
    uint64_t v12 = 1231;
  }
  else {
    uint64_t v12 = 1237;
  }
  return v8 ^ v11 ^ v12;
}

- (id)description
{
  uint64_t v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  objc_msgSend(v3, "appendFormat:", @" hold=%d", -[TUCallModel supportsHolding](self, "supportsHolding"));
  objc_msgSend(v3, "appendFormat:", @" grp=%d", -[TUCallModel supportsGrouping](self, "supportsGrouping"));
  objc_msgSend(v3, "appendFormat:", @" ungrp=%d", -[TUCallModel supportsUngrouping](self, "supportsUngrouping"));
  objc_msgSend(v3, "appendFormat:", @" DTMF=%d", -[TUCallModel supportsDTMF](self, "supportsDTMF"));
  objc_msgSend(v3, "appendFormat:", @" uMPS=%d", -[TUCallModel supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"));
  objc_msgSend(v3, "appendFormat:", @" aC=%d", -[TUCallModel supportsAddCall](self, "supportsAddCall"));
  objc_msgSend(v3, "appendFormat:", @" sTV=%d", -[TUCallModel supportsSendingToVoicemail](self, "supportsSendingToVoicemail"));
  [v3 appendString:@">"];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_msgSend(v4, "setSupportsHolding:", -[TUCallModel supportsHolding](self, "supportsHolding"));
  objc_msgSend(v4, "setSupportsGrouping:", -[TUCallModel supportsGrouping](self, "supportsGrouping"));
  objc_msgSend(v4, "setSupportsUngrouping:", -[TUCallModel supportsUngrouping](self, "supportsUngrouping"));
  objc_msgSend(v4, "setSupportsDTMF:", -[TUCallModel supportsDTMF](self, "supportsDTMF"));
  objc_msgSend(v4, "setSupportsUnambiguousMultiPartyState:", -[TUCallModel supportsUnambiguousMultiPartyState](self, "supportsUnambiguousMultiPartyState"));
  objc_msgSend(v4, "setSupportsAddCall:", -[TUCallModel supportsAddCall](self, "supportsAddCall"));
  objc_msgSend(v4, "setSupportsSendingToVoicemail:", -[TUCallModel supportsSendingToVoicemail](self, "supportsSendingToVoicemail"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCallModel)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(TUCallModel *)self init];
  if (v5)
  {
    uint64_t v6 = NSStringFromSelector(sel_supportsHolding);
    v5->_supportsHolding = [v4 decodeBoolForKey:v6];

    uint64_t v7 = NSStringFromSelector(sel_supportsGrouping);
    v5->_supportsGrouping = [v4 decodeBoolForKey:v7];

    uint64_t v8 = NSStringFromSelector(sel_supportsUngrouping);
    v5->_supportsUngrouping = [v4 decodeBoolForKey:v8];

    uint64_t v9 = NSStringFromSelector(sel_supportsDTMF);
    v5->_supportsDTMF = [v4 decodeBoolForKey:v9];

    uint64_t v10 = NSStringFromSelector(sel_supportsUnambiguousMultiPartyState);
    v5->_supportsUnambiguousMultiPartyState = [v4 decodeBoolForKey:v10];

    uint64_t v11 = NSStringFromSelector(sel_supportsAddCall);
    v5->_supportsAddCall = [v4 decodeBoolForKey:v11];

    uint64_t v12 = NSStringFromSelector(sel_supportsSendingToVoicemail);
    v5->_supportsSendingToVoicemail = [v4 decodeBoolForKey:v12];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUCallModel *)self supportsHolding];
  uint64_t v6 = NSStringFromSelector(sel_supportsHolding);
  [v4 encodeBool:v5 forKey:v6];

  BOOL v7 = [(TUCallModel *)self supportsGrouping];
  uint64_t v8 = NSStringFromSelector(sel_supportsGrouping);
  [v4 encodeBool:v7 forKey:v8];

  BOOL v9 = [(TUCallModel *)self supportsUngrouping];
  uint64_t v10 = NSStringFromSelector(sel_supportsUngrouping);
  [v4 encodeBool:v9 forKey:v10];

  BOOL v11 = [(TUCallModel *)self supportsDTMF];
  uint64_t v12 = NSStringFromSelector(sel_supportsDTMF);
  [v4 encodeBool:v11 forKey:v12];

  BOOL v13 = [(TUCallModel *)self supportsUnambiguousMultiPartyState];
  BOOL v14 = NSStringFromSelector(sel_supportsUnambiguousMultiPartyState);
  [v4 encodeBool:v13 forKey:v14];

  BOOL v15 = [(TUCallModel *)self supportsAddCall];
  v16 = NSStringFromSelector(sel_supportsAddCall);
  [v4 encodeBool:v15 forKey:v16];

  BOOL v17 = [(TUCallModel *)self supportsSendingToVoicemail];
  NSStringFromSelector(sel_supportsSendingToVoicemail);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeBool:v17 forKey:v18];
}

- (BOOL)supportsHolding
{
  return self->_supportsHolding;
}

- (void)setSupportsHolding:(BOOL)a3
{
  self->_supportsHolding = a3;
}

- (BOOL)supportsGrouping
{
  return self->_supportsGrouping;
}

- (void)setSupportsGrouping:(BOOL)a3
{
  self->_supportsGrouping = a3;
}

- (BOOL)supportsUngrouping
{
  return self->_supportsUngrouping;
}

- (void)setSupportsUngrouping:(BOOL)a3
{
  self->_supportsUngrouping = a3;
}

- (BOOL)supportsDTMF
{
  return self->_supportsDTMF;
}

- (void)setSupportsDTMF:(BOOL)a3
{
  self->_supportsDTMF = a3;
}

- (BOOL)supportsUnambiguousMultiPartyState
{
  return self->_supportsUnambiguousMultiPartyState;
}

- (void)setSupportsUnambiguousMultiPartyState:(BOOL)a3
{
  self->_supportsUnambiguousMultiPartyState = a3;
}

- (BOOL)supportsAddCall
{
  return self->_supportsAddCall;
}

- (void)setSupportsAddCall:(BOOL)a3
{
  self->_supportsAddCall = a3;
}

- (BOOL)supportsSendingToVoicemail
{
  return self->_supportsSendingToVoicemail;
}

- (void)setSupportsSendingToVoicemail:(BOOL)a3
{
  self->_supportsSendingToVoicemail = a3;
}

@end