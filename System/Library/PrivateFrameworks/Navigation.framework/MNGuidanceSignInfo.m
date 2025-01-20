@interface MNGuidanceSignInfo
+ (BOOL)supportsSecureCoding;
- (MNGuidanceSignDescription)primarySign;
- (MNGuidanceSignDescription)secondarySign;
- (MNGuidanceSignInfo)initWithCoder:(id)a3;
- (MNGuidanceSignInfo)initWithPrimarySign:(id)a3 secondarySign:(id)a4 stepIndex:(unint64_t)a5 primaryDistance:(double)a6 secondaryDistance:(double)a7 timeUntilPrimarySign:(double)a8 timeUntilSecondarySign:(double)a9;
- (double)primaryDistance_SIRI_USE_ONLY;
- (double)secondaryDistance_SIRI_USE_ONLY;
- (double)timeUntilPrimarySign_SIRI_USE_ONLY;
- (double)timeUntilSecondarySign_SIRI_USE_ONLY;
- (id)debugDescription;
- (id)description;
- (unint64_t)stepIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MNGuidanceSignInfo

- (MNGuidanceSignInfo)initWithPrimarySign:(id)a3 secondarySign:(id)a4 stepIndex:(unint64_t)a5 primaryDistance:(double)a6 secondaryDistance:(double)a7 timeUntilPrimarySign:(double)a8 timeUntilSecondarySign:(double)a9
{
  id v17 = a3;
  id v18 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MNGuidanceSignInfo;
  v19 = [(MNGuidanceSignInfo *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_primarySign, a3);
    objc_storeStrong((id *)&v20->_secondarySign, a4);
    v20->_stepIndex = a5;
    v20->_primaryDistance_SIRI_USE_ONLY = a6;
    v20->_secondaryDistance_SIRI_USE_ONLY = a7;
    v20->_timeUntilPrimarySign_SIRI_USE_ONLY = a8;
    v20->_timeUntilSecondarySign_SIRI_USE_ONLY = a9;
  }

  return v20;
}

- (id)debugDescription
{
  primarySign = self->_primarySign;
  if (primarySign)
  {
    v4 = [(MNGuidanceSignDescription *)primarySign debugDescription];
    v5 = [&stru_1F0E08010 stringByAppendingFormat:@"primary sign: %@", v4];
  }
  else
  {
    v5 = &stru_1F0E08010;
  }
  secondarySign = self->_secondarySign;
  if (secondarySign)
  {
    v7 = [(MNGuidanceSignDescription *)secondarySign debugDescription];
    uint64_t v8 = [(__CFString *)v5 stringByAppendingFormat:@"secondary sign: %@", v7];

    v5 = (__CFString *)v8;
  }
  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  if (self->_stepIndex != 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = objc_msgSend(NSString, "stringWithFormat:", @"Step %d", self->_stepIndex);
    [v3 addObject:v4];
  }
  if (self->_primarySign)
  {
    v5 = [NSString stringWithFormat:@"[%@]", self->_primarySign];
    [v3 addObject:v5];
  }
  if (self->_secondarySign)
  {
    v6 = [NSString stringWithFormat:@"[%@]", self->_secondarySign];
    [v3 addObject:v6];
  }
  v7 = [v3 componentsJoinedByString:@", "];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceSignInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MNGuidanceSignInfo;
  v5 = [(MNGuidanceSignInfo *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_primarySign"];
    primarySign = v5->_primarySign;
    v5->_primarySign = (MNGuidanceSignDescription *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_secondarySign"];
    secondarySign = v5->_secondarySign;
    v5->_secondarySign = (MNGuidanceSignDescription *)v8;

    v5->_stepIndex = [v4 decodeIntegerForKey:@"_stepIndex"];
    [v4 decodeDoubleForKey:@"_primaryDistance_SIRI_USE_ONLY"];
    v5->_primaryDistance_SIRI_USE_ONLY = v10;
    [v4 decodeDoubleForKey:@"_secondaryDistance_SIRI_USE_ONLY"];
    v5->_secondaryDistance_SIRI_USE_ONLY = v11;
    [v4 decodeDoubleForKey:@"_timeUntilPrimarySign_SIRI_USE_ONLY"];
    v5->_timeUntilPrimarySign_SIRI_USE_ONLY = v12;
    [v4 decodeDoubleForKey:@"_timeUntilSecondarySign_SIRI_USE_ONLY"];
    v5->_timeUntilSecondarySign_SIRI_USE_ONLY = v13;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  primarySign = self->_primarySign;
  id v5 = a3;
  [v5 encodeObject:primarySign forKey:@"_primarySign"];
  [v5 encodeObject:self->_secondarySign forKey:@"_secondarySign"];
  [v5 encodeInteger:self->_stepIndex forKey:@"_stepIndex"];
  [v5 encodeDouble:@"_primaryDistance_SIRI_USE_ONLY" forKey:self->_primaryDistance_SIRI_USE_ONLY];
  [v5 encodeDouble:@"_secondaryDistance_SIRI_USE_ONLY" forKey:self->_secondaryDistance_SIRI_USE_ONLY];
  [v5 encodeDouble:@"_timeUntilPrimarySign_SIRI_USE_ONLY" forKey:self->_timeUntilPrimarySign_SIRI_USE_ONLY];
  [v5 encodeDouble:@"_timeUntilSecondarySign_SIRI_USE_ONLY" forKey:self->_timeUntilSecondarySign_SIRI_USE_ONLY];
}

- (MNGuidanceSignDescription)primarySign
{
  return self->_primarySign;
}

- (MNGuidanceSignDescription)secondarySign
{
  return self->_secondarySign;
}

- (unint64_t)stepIndex
{
  return self->_stepIndex;
}

- (double)primaryDistance_SIRI_USE_ONLY
{
  return self->_primaryDistance_SIRI_USE_ONLY;
}

- (double)secondaryDistance_SIRI_USE_ONLY
{
  return self->_secondaryDistance_SIRI_USE_ONLY;
}

- (double)timeUntilPrimarySign_SIRI_USE_ONLY
{
  return self->_timeUntilPrimarySign_SIRI_USE_ONLY;
}

- (double)timeUntilSecondarySign_SIRI_USE_ONLY
{
  return self->_timeUntilSecondarySign_SIRI_USE_ONLY;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySign, 0);
  objc_storeStrong((id *)&self->_primarySign, 0);
}

@end