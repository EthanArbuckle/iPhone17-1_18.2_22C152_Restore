@interface SASProximityHandshake
+ (BOOL)supportsSecureCoding;
- (BOOL)hasPasscodeSet;
- (SASProximityHandshake)initWithCoder:(id)a3;
- (int)simplePasscodeType;
- (int)unlockType;
- (int64_t)platformType;
- (void)encodeWithCoder:(id)a3;
- (void)loadInformation;
- (void)setHasPasscodeSet:(BOOL)a3;
- (void)setPlatformType:(int64_t)a3;
- (void)setSimplePasscodeType:(int)a3;
- (void)setUnlockType:(int)a3;
@end

@implementation SASProximityHandshake

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithInteger:", -[SASProximityHandshake platformType](self, "platformType"));
  [v5 encodeObject:v6 forKey:@"platformType"];

  objc_msgSend(v5, "encodeBool:forKey:", -[SASProximityHandshake hasPasscodeSet](self, "hasPasscodeSet"), @"hasPasscodeSet");
  v7 = objc_msgSend(NSNumber, "numberWithInt:", -[SASProximityHandshake simplePasscodeType](self, "simplePasscodeType"));
  [v5 encodeObject:v7 forKey:@"simplePasscodeType"];

  objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SASProximityHandshake unlockType](self, "unlockType"));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 encodeObject:v8 forKey:@"unlockType"];
}

- (SASProximityHandshake)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SASProximityHandshake;
  id v5 = [(SASProximityHandshake *)&v10 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"platformType"];
    -[SASProximityHandshake setPlatformType:](v5, "setPlatformType:", [v6 integerValue]);

    -[SASProximityHandshake setHasPasscodeSet:](v5, "setHasPasscodeSet:", [v4 decodeBoolForKey:@"hasPasscodeSet"]);
    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"simplePasscodeType"];
    -[SASProximityHandshake setSimplePasscodeType:](v5, "setSimplePasscodeType:", [v7 integerValue]);

    id v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unlockType"];
    -[SASProximityHandshake setUnlockType:](v5, "setUnlockType:", [v8 integerValue]);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)loadInformation
{
  [(SASProximityHandshake *)self setPlatformType:1];
  unsigned int v5 = 0;
  v3 = [MEMORY[0x1E4F74230] sharedConnection];
  -[SASProximityHandshake setUnlockType:](self, "setUnlockType:", [v3 unlockScreenTypeWithOutSimplePasscodeType:&v5]);

  [(SASProximityHandshake *)self setSimplePasscodeType:v5];
  id v4 = [MEMORY[0x1E4F74230] sharedConnection];
  -[SASProximityHandshake setHasPasscodeSet:](self, "setHasPasscodeSet:", [v4 isPasscodeSet]);
}

- (int64_t)platformType
{
  return self->_platformType;
}

- (void)setPlatformType:(int64_t)a3
{
  self->_platformType = a3;
}

- (BOOL)hasPasscodeSet
{
  return self->_hasPasscodeSet;
}

- (void)setHasPasscodeSet:(BOOL)a3
{
  self->_hasPasscodeSet = a3;
}

- (int)simplePasscodeType
{
  return self->_simplePasscodeType;
}

- (void)setSimplePasscodeType:(int)a3
{
  self->_simplePasscodeType = a3;
}

- (int)unlockType
{
  return self->_unlockType;
}

- (void)setUnlockType:(int)a3
{
  self->_unlockType = a3;
}

@end