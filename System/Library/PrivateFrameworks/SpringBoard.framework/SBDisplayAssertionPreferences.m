@interface SBDisplayAssertionPreferences
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsControlOfDisplay;
- (NSString)disableSystemIdleSleepReason;
- (SBDisplayArrangementItem)displayArrangement;
- (SBDisplayAssertionPreferences)init;
- (SBDisplayPowerLogEntry)powerLogEntry;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)cloneMirroringMode;
- (unint64_t)hash;
- (void)setCloneMirroringMode:(unint64_t)a3;
- (void)setDisableSystemIdleSleepReason:(id)a3;
- (void)setDisplayArrangement:(id)a3;
- (void)setPowerLogEntry:(id)a3;
- (void)setWantsControlOfDisplay:(BOOL)a3;
@end

@implementation SBDisplayAssertionPreferences

- (SBDisplayAssertionPreferences)init
{
  v7.receiver = self;
  v7.super_class = (Class)SBDisplayAssertionPreferences;
  v2 = [(SBDisplayAssertionPreferences *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_wantsControlOfDisplay = 0;
    displayArrangement = v2->_displayArrangement;
    v2->_displayArrangement = 0;

    disableSystemIdleSleepReason = v3->_disableSystemIdleSleepReason;
    v3->_disableSystemIdleSleepReason = 0;
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_alloc_init(SBDisplayAssertionPreferences);
  [(SBDisplayAssertionPreferences *)v4 setWantsControlOfDisplay:self->_wantsControlOfDisplay];
  [(SBDisplayAssertionPreferences *)v4 setDisplayArrangement:self->_displayArrangement];
  [(SBDisplayAssertionPreferences *)v4 setDisableSystemIdleSleepReason:self->_disableSystemIdleSleepReason];
  [(SBDisplayAssertionPreferences *)v4 setPowerLogEntry:self->_powerLogEntry];
  [(SBDisplayAssertionPreferences *)v4 setCloneMirroringMode:self->_cloneMirroringMode];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (SBDisplayAssertionPreferences *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL v6 = self->_wantsControlOfDisplay == v5->_wantsControlOfDisplay
        && [(SBDisplayArrangementItem *)self->_displayArrangement isEqual:v5->_displayArrangement]
        && [(NSString *)self->_disableSystemIdleSleepReason isEqualToString:v5->_disableSystemIdleSleepReason]&& [(SBDisplayPowerLogEntry *)self->_powerLogEntry isEqual:v5->_powerLogEntry]&& self->_cloneMirroringMode == v5->_cloneMirroringMode;
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendBool:self->_wantsControlOfDisplay];
  id v5 = (id)[v3 appendObject:self->_displayArrangement];
  id v6 = (id)[v3 appendString:self->_disableSystemIdleSleepReason];
  id v7 = (id)[v3 appendObject:self->_powerLogEntry];
  id v8 = (id)[v3 appendUnsignedInteger:self->_cloneMirroringMode];
  unint64_t v9 = [v3 hash];

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendBool:self->_wantsControlOfDisplay withName:@"wantsControl"];
  id v5 = (id)[v3 appendObject:self->_displayArrangement withName:@"arrangement"];
  [v3 appendString:self->_disableSystemIdleSleepReason withName:@"disableSystemIdleSleepReason"];
  id v6 = (id)[v3 appendObject:self->_powerLogEntry withName:@"powerLogEntry"];
  unint64_t cloneMirroringMode = self->_cloneMirroringMode;
  id v8 = @"<.Invalid>";
  if (cloneMirroringMode == 1) {
    id v8 = @".Default";
  }
  if (cloneMirroringMode == 2) {
    unint64_t v9 = @".Disabled";
  }
  else {
    unint64_t v9 = v8;
  }
  [v3 appendString:v9 withName:@"cloneMirroringMode"];
  v10 = [v3 build];

  return v10;
}

- (BOOL)wantsControlOfDisplay
{
  return self->_wantsControlOfDisplay;
}

- (void)setWantsControlOfDisplay:(BOOL)a3
{
  self->_wantsControlOfDisplay = a3;
}

- (SBDisplayArrangementItem)displayArrangement
{
  return self->_displayArrangement;
}

- (void)setDisplayArrangement:(id)a3
{
}

- (NSString)disableSystemIdleSleepReason
{
  return self->_disableSystemIdleSleepReason;
}

- (void)setDisableSystemIdleSleepReason:(id)a3
{
}

- (SBDisplayPowerLogEntry)powerLogEntry
{
  return self->_powerLogEntry;
}

- (void)setPowerLogEntry:(id)a3
{
}

- (unint64_t)cloneMirroringMode
{
  return self->_cloneMirroringMode;
}

- (void)setCloneMirroringMode:(unint64_t)a3
{
  self->_unint64_t cloneMirroringMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_powerLogEntry, 0);
  objc_storeStrong((id *)&self->_disableSystemIdleSleepReason, 0);
  objc_storeStrong((id *)&self->_displayArrangement, 0);
}

@end