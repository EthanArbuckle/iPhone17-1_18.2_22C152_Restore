@interface SBFMobileKeyBagState
- (BOOL)isEffectivelyLocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)permanentlyBlocked;
- (BOOL)recoveryEnabled;
- (BOOL)recoveryPossible;
- (BOOL)recoveryRequired;
- (BOOL)shouldWipe;
- (NSString)description;
- (SBFMobileKeyBagState)init;
- (SBFMobileKeyBagState)initWithKeyBagInfo:(id)a3 extended:(BOOL)a4;
- (double)backOffTime;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)publicDescription;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int64_t)escrowCount;
- (int64_t)lockState;
- (unint64_t)failedAttemptCount;
- (unint64_t)hash;
@end

@implementation SBFMobileKeyBagState

- (BOOL)isEffectivelyLocked
{
  unint64_t v2 = [(SBFMobileKeyBagState *)self lockState];
  return (v2 < 7) & (0x46u >> v2);
}

- (int64_t)lockState
{
  if (self->_extended) {
    unint64_t v2 = @"kSBFKeyBagInfoExtendedLockState";
  }
  else {
    unint64_t v2 = @"kSBFKeyBagInfoLockState";
  }
  v3 = [(NSDictionary *)self->_state objectForKeyedSubscript:v2];
  unint64_t v4 = [v3 integerValue];

  if (v4 <= 7) {
    return qword_18B5E45E0[v4];
  }
  return v4;
}

- (SBFMobileKeyBagState)initWithKeyBagInfo:(id)a3 extended:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBFMobileKeyBagState;
  v7 = [(SBFMobileKeyBagState *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    state = v7->_state;
    v7->_state = (NSDictionary *)v8;

    v7->_extended = a4;
  }

  return v7;
}

- (void).cxx_destruct
{
}

- (SBFMobileKeyBagState)init
{
  return [(SBFMobileKeyBagState *)self initWithKeyBagInfo:MEMORY[0x1E4F1CC08] extended:0];
}

- (double)backOffTime
{
  unint64_t v2 = [(NSDictionary *)self->_state objectForKeyedSubscript:@"kSBFKeyBagInfoBackOff"];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (unint64_t)failedAttemptCount
{
  unint64_t v2 = [(NSDictionary *)self->_state objectForKeyedSubscript:@"kSBFKeyBagInfoFailedAttempts"];
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

- (BOOL)permanentlyBlocked
{
  unint64_t v2 = [(NSDictionary *)self->_state objectForKeyedSubscript:@"kSBFKeyBagInfoPermanentlyBlocked"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)shouldWipe
{
  unint64_t v2 = [(NSDictionary *)self->_state objectForKeyedSubscript:@"kSBFKeyBagInfoShouldWipe"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (BOOL)recoveryRequired
{
  unint64_t v2 = [(NSDictionary *)self->_state objectForKeyedSubscript:@"kSBFKeyBagInfoKeyBagState"];
  unint64_t v3 = ((unint64_t)[v2 longLongValue] >> 5) & 1;

  return v3;
}

- (BOOL)recoveryPossible
{
  unint64_t v2 = [(NSDictionary *)self->_state objectForKeyedSubscript:@"kSBFKeyBagInfoKeyBagState"];
  BOOL v3 = ([v2 longLongValue] & 0x40) == 0;

  return v3;
}

- (BOOL)recoveryEnabled
{
  unint64_t v2 = [(NSDictionary *)self->_state objectForKeyedSubscript:@"kSBFKeyBagInfoKeyBagState"];
  unint64_t v3 = ((unint64_t)[v2 longLongValue] >> 9) & 1;

  return v3;
}

- (int64_t)escrowCount
{
  unint64_t v2 = [(NSDictionary *)self->_state objectForKeyedSubscript:@"kSBFKeyBagInfoRecoveryCountdown"];
  int64_t v3 = [v2 longLongValue];

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  double v4 = [SBFMutableMobileKeyBagState alloc];
  state = self->_state;
  BOOL extended = self->_extended;
  return [(SBFMutableMobileKeyBagState *)v4 initWithKeyBagInfo:state extended:extended];
}

- (unint64_t)hash
{
  return [(NSDictionary *)self->_state hash];
}

- (BOOL)isEqual:(id)a3
{
  double v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(NSDictionary *)self->_state isEqual:v4[1]]
    && self->_extended == *((unsigned __int8 *)v4 + 16);

  return v5;
}

- (id)publicDescription
{
  int64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t v4 = [(SBFMobileKeyBagState *)self lockState];
  if (v4 > 7) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = off_1E548DD40[v4];
  }
  [v3 appendString:v5 withName:@"lockState"];
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState isEffectivelyLocked](self, "isEffectivelyLocked"), @"isEffectivelyLocked");
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState permanentlyBlocked](self, "permanentlyBlocked"), @"permanentlyBlocked");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState recoveryRequired](self, "recoveryRequired"), @"recoveryRequired");
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState recoveryPossible](self, "recoveryPossible"), @"recoveryPossible");
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState shouldWipe](self, "shouldWipe"), @"shouldWipe");
  objc_super v11 = [v3 build];

  return v11;
}

- (NSString)description
{
  return (NSString *)[(SBFMobileKeyBagState *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  unint64_t v2 = [(SBFMobileKeyBagState *)self succinctDescriptionBuilder];
  int64_t v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  int64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  unint64_t v4 = [(SBFMobileKeyBagState *)self lockState];
  if (v4 > 7) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = off_1E548DD40[v4];
  }
  [v3 appendString:v5 withName:@"lockState"];
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[SBFMobileKeyBagState isEffectivelyLocked](self, "isEffectivelyLocked"), @"isEffectivelyLocked");
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  int64_t v3 = [(SBFMobileKeyBagState *)self descriptionBuilderWithMultilinePrefix:a3];
  unint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  unint64_t v4 = [(SBFMobileKeyBagState *)self succinctDescriptionBuilder];
  id v5 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFMobileKeyBagState permanentlyBlocked](self, "permanentlyBlocked"), @"permanentlyBlocked");
  id v6 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFMobileKeyBagState shouldWipe](self, "shouldWipe"), @"shouldWipe");
  id v7 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFMobileKeyBagState recoveryRequired](self, "recoveryRequired"), @"recoveryRequired");
  id v8 = (id)objc_msgSend(v4, "appendBool:withName:", -[SBFMobileKeyBagState recoveryPossible](self, "recoveryPossible"), @"recoveryPossible");
  id v9 = NSNumber;
  [(SBFMobileKeyBagState *)self backOffTime];
  id v10 = objc_msgSend(v9, "numberWithDouble:");
  id v11 = (id)[v4 appendObject:v10 withName:@"backOffTime"];

  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SBFMobileKeyBagState failedAttemptCount](self, "failedAttemptCount"));
  id v13 = (id)[v4 appendObject:v12 withName:@"failedAttemptCount"];

  v14 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SBFMobileKeyBagState escrowCount](self, "escrowCount"));
  id v15 = (id)[v4 appendObject:v14 withName:@"escrowCount"];

  return v4;
}

@end