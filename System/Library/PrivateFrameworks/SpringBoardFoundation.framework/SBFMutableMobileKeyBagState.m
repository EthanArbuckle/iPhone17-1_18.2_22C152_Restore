@interface SBFMutableMobileKeyBagState
- (SBFMutableMobileKeyBagState)init;
- (SBFMutableMobileKeyBagState)initWithKeyBagInfo:(id)a3 extended:(BOOL)a4;
- (id)_mutableState;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBackOffTime:(double)a3;
- (void)setEscrowCount:(int64_t)a3;
- (void)setFailedAttemptCount:(unint64_t)a3;
- (void)setLockState:(int64_t)a3;
- (void)setPermanentlyBlocked:(BOOL)a3;
- (void)setRecoveryEnabled:(BOOL)a3;
- (void)setRecoveryPossible:(BOOL)a3;
- (void)setRecoveryRequired:(BOOL)a3;
- (void)setShouldWipe:(BOOL)a3;
@end

@implementation SBFMutableMobileKeyBagState

- (SBFMutableMobileKeyBagState)initWithKeyBagInfo:(id)a3 extended:(BOOL)a4
{
  v10.receiver = self;
  v10.super_class = (Class)SBFMutableMobileKeyBagState;
  v5 = -[SBFMobileKeyBagState initWithKeyBagInfo:extended:](&v10, sel_initWithKeyBagInfo_extended_, a3);
  v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(NSDictionary *)v5->super._state mutableCopy];
    state = v6->super._state;
    v6->super._state = (NSDictionary *)v7;

    v6->super._extended = a4;
  }
  return v6;
}

- (SBFMutableMobileKeyBagState)init
{
  return [(SBFMutableMobileKeyBagState *)self initWithKeyBagInfo:MEMORY[0x1E4F1CC08] extended:0];
}

- (id)_mutableState
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"SBFMobileKeyBagState.m" lineNumber:265 description:@"Unexpected non-mutable _state"];
  }
  state = self->super._state;
  return state;
}

- (void)setLockState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = qword_18B5E4620[a3 - 1];
  }
  id v6 = [NSNumber numberWithInteger:v4];
  v5 = [(SBFMutableMobileKeyBagState *)self _mutableState];
  [v5 setObject:v6 forKeyedSubscript:@"kSBFKeyBagInfoLockState"];
}

- (void)setBackOffTime:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  uint64_t v4 = [(SBFMutableMobileKeyBagState *)self _mutableState];
  [v4 setObject:v5 forKeyedSubscript:@"kSBFKeyBagInfoBackOff"];
}

- (void)setFailedAttemptCount:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v4 = [(SBFMutableMobileKeyBagState *)self _mutableState];
  [v4 setObject:v5 forKeyedSubscript:@"kSBFKeyBagInfoFailedAttempts"];
}

- (void)setPermanentlyBlocked:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  uint64_t v4 = [(SBFMutableMobileKeyBagState *)self _mutableState];
  [v4 setObject:v5 forKeyedSubscript:@"kSBFKeyBagInfoPermanentlyBlocked"];
}

- (void)setShouldWipe:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  uint64_t v4 = [(SBFMutableMobileKeyBagState *)self _mutableState];
  [v4 setObject:v5 forKeyedSubscript:@"kSBFKeyBagInfoShouldWipe"];
}

- (void)setRecoveryRequired:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(NSDictionary *)self->super._state objectForKeyedSubscript:@"kSBFKeyBagInfoKeyBagState"];
  uint64_t v5 = [v9 longLongValue];
  uint64_t v6 = 32;
  if (!v3) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5 & 0xFFFFFFFFFFFFFFDFLL | v6];
  v8 = [(SBFMutableMobileKeyBagState *)self _mutableState];
  [v8 setObject:v7 forKeyedSubscript:@"kSBFKeyBagInfoKeyBagState"];
}

- (void)setRecoveryPossible:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(NSDictionary *)self->super._state objectForKeyedSubscript:@"kSBFKeyBagInfoKeyBagState"];
  uint64_t v5 = [v9 longLongValue];
  uint64_t v6 = 64;
  if (v3) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5 & 0xFFFFFFFFFFFFFFBFLL | v6];
  v8 = [(SBFMutableMobileKeyBagState *)self _mutableState];
  [v8 setObject:v7 forKeyedSubscript:@"kSBFKeyBagInfoKeyBagState"];
}

- (void)setRecoveryEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(NSDictionary *)self->super._state objectForKeyedSubscript:@"kSBFKeyBagInfoKeyBagState"];
  uint64_t v5 = [v9 longLongValue];
  uint64_t v6 = 512;
  if (!v3) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:v5 & 0xFFFFFFFFFFFFFDFFLL | v6];
  v8 = [(SBFMutableMobileKeyBagState *)self _mutableState];
  [v8 setObject:v7 forKeyedSubscript:@"kSBFKeyBagInfoKeyBagState"];
}

- (void)setEscrowCount:(int64_t)a3
{
  id v5 = [NSNumber numberWithLongLong:a3];
  uint64_t v4 = [(SBFMutableMobileKeyBagState *)self _mutableState];
  [v4 setObject:v5 forKeyedSubscript:@"kSBFKeyBagInfoRecoveryCountdown"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [SBFMobileKeyBagState alloc];
  state = self->super._state;
  BOOL extended = self->super._extended;
  return [(SBFMobileKeyBagState *)v4 initWithKeyBagInfo:state extended:extended];
}

@end