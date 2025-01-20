@interface SVXDeviceProblemsState
+ (BOOL)supportsSecureCoding;
+ (id)newWithBuilder:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFixingProblems;
- (SVXDeviceProblemsState)initWithCoder:(id)a3;
- (SVXDeviceProblemsState)initWithIsFixingProblems:(BOOL)a3 problems:(unint64_t)a4;
- (id)_descriptionWithIndent:(unint64_t)a3;
- (id)description;
- (id)mutatedCopyWithMutator:(id)a3;
- (unint64_t)hash;
- (unint64_t)problems;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVXDeviceProblemsState

- (unint64_t)problems
{
  return self->_problems;
}

- (BOOL)isFixingProblems
{
  return self->_isFixingProblems;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  BOOL isFixingProblems = self->_isFixingProblems;
  id v6 = a3;
  v7 = [v4 numberWithBool:isFixingProblems];
  [v6 encodeObject:v7 forKey:@"SVXDeviceProblemsState::isFixingProblems"];

  id v8 = [NSNumber numberWithUnsignedInteger:self->_problems];
  [v6 encodeObject:v8 forKey:@"SVXDeviceProblemsState::problems"];
}

- (SVXDeviceProblemsState)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceProblemsState::isFixingProblems"];
  uint64_t v6 = [v5 BOOLValue];

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVXDeviceProblemsState::problems"];

  uint64_t v8 = [v7 unsignedIntegerValue];

  return [(SVXDeviceProblemsState *)self initWithIsFixingProblems:v6 problems:v8];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SVXDeviceProblemsState *)a3;
  if (self == v4)
  {
    BOOL v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      BOOL isFixingProblems = self->_isFixingProblems;
      if (isFixingProblems == [(SVXDeviceProblemsState *)v5 isFixingProblems])
      {
        unint64_t problems = self->_problems;
        BOOL v8 = problems == [(SVXDeviceProblemsState *)v5 problems];
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  v3 = [NSNumber numberWithBool:self->_isFixingProblems];
  uint64_t v4 = [v3 hash];
  v5 = [NSNumber numberWithUnsignedInteger:self->_problems];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4 = [NSString alloc];
  v15.receiver = self;
  v15.super_class = (Class)SVXDeviceProblemsState;
  v5 = [(SVXDeviceProblemsState *)&v15 description];
  BOOL isFixingProblems = self->_isFixingProblems;
  unint64_t problems = self->_problems;
  if (problems)
  {
    id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    v9 = v8;
    if (problems)
    {
      [v8 addObject:@"unspecified"];
      if ((problems & 2) == 0)
      {
LABEL_4:
        if ((problems & 4) == 0) {
          goto LABEL_5;
        }
        goto LABEL_33;
      }
    }
    else if ((problems & 2) == 0)
    {
      goto LABEL_4;
    }
    [v9 addObject:@"iCloud"];
    if ((problems & 4) == 0)
    {
LABEL_5:
      if ((problems & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_34;
    }
LABEL_33:
    [v9 addObject:@"iTunes"];
    if ((problems & 8) == 0)
    {
LABEL_6:
      if ((problems & 0x10) == 0) {
        goto LABEL_7;
      }
      goto LABEL_35;
    }
LABEL_34:
    [v9 addObject:@"HomeKit"];
    if ((problems & 0x10) == 0)
    {
LABEL_7:
      if ((problems & 0x20) == 0) {
        goto LABEL_8;
      }
      goto LABEL_36;
    }
LABEL_35:
    [v9 addObject:@"wiFi"];
    if ((problems & 0x20) == 0)
    {
LABEL_8:
      if ((problems & 0x40) == 0) {
        goto LABEL_9;
      }
      goto LABEL_37;
    }
LABEL_36:
    [v9 addObject:@"wiFiPerformance"];
    if ((problems & 0x40) == 0)
    {
LABEL_9:
      if ((problems & 0x80) == 0) {
        goto LABEL_10;
      }
      goto LABEL_38;
    }
LABEL_37:
    [v9 addObject:@"internet"];
    if ((problems & 0x80) == 0)
    {
LABEL_10:
      if ((problems & 0x100) == 0) {
        goto LABEL_11;
      }
      goto LABEL_39;
    }
LABEL_38:
    [v9 addObject:@"hardware"];
    if ((problems & 0x100) == 0)
    {
LABEL_11:
      if ((problems & 0x200) == 0) {
        goto LABEL_12;
      }
      goto LABEL_40;
    }
LABEL_39:
    [v9 addObject:@"bluetooth"];
    if ((problems & 0x200) == 0)
    {
LABEL_12:
      if ((problems & 0x400) == 0) {
        goto LABEL_13;
      }
      goto LABEL_41;
    }
LABEL_40:
    [v9 addObject:@"thermal"];
    if ((problems & 0x400) == 0)
    {
LABEL_13:
      if ((problems & 0x800) == 0) {
        goto LABEL_14;
      }
      goto LABEL_42;
    }
LABEL_41:
    [v9 addObject:@"recovery"];
    if ((problems & 0x800) == 0)
    {
LABEL_14:
      if ((problems & 0x1000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_43;
    }
LABEL_42:
    [v9 addObject:@"stereoNotFound"];
    if ((problems & 0x1000) == 0)
    {
LABEL_15:
      if ((problems & 0x2000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_44;
    }
LABEL_43:
    [v9 addObject:@"stereoVersion"];
    if ((problems & 0x2000) == 0)
    {
LABEL_16:
      if ((problems & 0x4000) == 0) {
        goto LABEL_17;
      }
      goto LABEL_45;
    }
LABEL_44:
    [v9 addObject:@"stereoError"];
    if ((problems & 0x4000) == 0)
    {
LABEL_17:
      if ((problems & 0x8000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_46;
    }
LABEL_45:
    [v9 addObject:@"VPN"];
    if ((problems & 0x8000) == 0)
    {
LABEL_18:
      if ((problems & 0x10000) == 0) {
        goto LABEL_19;
      }
      goto LABEL_47;
    }
LABEL_46:
    [v9 addObject:@"WiFi8021x"];
    if ((problems & 0x10000) == 0)
    {
LABEL_19:
      if ((problems & 0x20000) == 0) {
        goto LABEL_20;
      }
      goto LABEL_48;
    }
LABEL_47:
    [v9 addObject:@"CDP"];
    if ((problems & 0x20000) == 0)
    {
LABEL_20:
      if ((problems & 0x40000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_49;
    }
LABEL_48:
    [v9 addObject:@"networkProfile"];
    if ((problems & 0x40000) == 0)
    {
LABEL_21:
      if ((problems & 0x80000) == 0)
      {
LABEL_23:
        v10 = (void *)[v9 copy];

        goto LABEL_25;
      }
LABEL_22:
      [v9 addObject:@"networkProfileRequired"];
      goto LABEL_23;
    }
LABEL_49:
    [v9 addObject:@"networkNotShareable"];
    if ((problems & 0x80000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  v10 = (void *)MEMORY[0x263EFFA68];
LABEL_25:
  if (isFixingProblems) {
    v11 = @"YES";
  }
  else {
    v11 = @"NO";
  }
  v12 = [v10 componentsJoinedByString:@"|"];
  v13 = (void *)[v4 initWithFormat:@"%@ {BOOL isFixingProblems = %@, problems = %@}", v5, v11, v12];

  return v13;
}

- (id)description
{
  return [(SVXDeviceProblemsState *)self _descriptionWithIndent:0];
}

- (SVXDeviceProblemsState)initWithIsFixingProblems:(BOOL)a3 problems:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SVXDeviceProblemsState;
  result = [(SVXDeviceProblemsState *)&v7 init];
  if (result)
  {
    result->_BOOL isFixingProblems = a3;
    result->_unint64_t problems = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  id v4 = (void (**)(id, _SVXDeviceProblemsStateMutation *))a3;
  if (v4)
  {
    v5 = [[_SVXDeviceProblemsStateMutation alloc] initWithBaseModel:self];
    v4[2](v4, v5);
    unint64_t v6 = [(_SVXDeviceProblemsStateMutation *)v5 generate];
  }
  else
  {
    unint64_t v6 = (void *)[(SVXDeviceProblemsState *)self copy];
  }

  return v6;
}

+ (id)newWithBuilder:(id)a3
{
  v3 = (void (**)(id, _SVXDeviceProblemsStateMutation *))a3;
  id v4 = objc_alloc_init(_SVXDeviceProblemsStateMutation);
  if (v3) {
    v3[2](v3, v4);
  }
  v5 = [(_SVXDeviceProblemsStateMutation *)v4 generate];

  return v5;
}

@end