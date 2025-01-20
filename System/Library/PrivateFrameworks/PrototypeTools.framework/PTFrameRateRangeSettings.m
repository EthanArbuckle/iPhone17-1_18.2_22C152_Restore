@interface PTFrameRateRangeSettings
+ (BOOL)ignoresKey:(id)a3;
+ (id)settingsControllerModule;
- (CAFrameRateRange)frameRateRange;
- (NSString)description;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)drillDownSummary;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)maximum;
- (int)minimum;
- (int)preferred;
- (unint64_t)preset;
- (unsigned)highFrameRateReason;
- (unsigned)reason;
- (unsigned)reasonComponent;
- (void)setDefaultValues;
- (void)setFrameRateRange:(CAFrameRateRange)a3;
- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4;
- (void)setFrameRateRange:(CAFrameRateRange)a3 reasonComponent:(unsigned __int16)a4 reason:(unsigned __int16)a5;
- (void)setHighFrameRateReason:(unsigned int)a3;
- (void)setMaximum:(int)a3;
- (void)setMinimum:(int)a3;
- (void)setPreferred:(int)a3;
- (void)setPreset:(unint64_t)a3;
- (void)setReason:(unsigned __int16)a3;
- (void)setReasonComponent:(unsigned __int16)a3;
- (void)validate;
@end

@implementation PTFrameRateRangeSettings

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  -[PTFrameRateRangeSettings setFrameRateRange:](self, "setFrameRateRange:", *(double *)&a3.minimum, *(double *)&a3.maximum, *(double *)&a3.preferred);
  [(PTFrameRateRangeSettings *)self setHighFrameRateReason:v4];
}

- (void)setPreferred:(int)a3
{
  self->_preferred = a3;
}

- (void)setFrameRateRange:(CAFrameRateRange)a3
{
  float preferred = a3.preferred;
  float maximum = a3.maximum;
  float minimum = a3.minimum;
  if (CAFrameRateRangeIsEqualToRange(*MEMORY[0x1E4F39AF0], a3))
  {
    if (!self->_preset) {
      goto LABEL_14;
    }
    [(PTFrameRateRangeSettings *)self willChangeValueForKey:@"preset"];
    self->_unint64_t preset = 0;
  }
  else
  {
    CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    v13.float minimum = minimum;
    v13.float maximum = maximum;
    v13.float preferred = preferred;
    if (CAFrameRateRangeIsEqualToRange(v11, v13))
    {
      if (self->_preset == 1) {
        goto LABEL_14;
      }
      [(PTFrameRateRangeSettings *)self willChangeValueForKey:@"preset"];
      unint64_t v7 = 1;
    }
    else
    {
      CAFrameRateRange v12 = CAFrameRateRangeMake(80.0, 120.0, 80.0);
      v14.float minimum = minimum;
      v14.float maximum = maximum;
      v14.float preferred = preferred;
      BOOL IsEqualToRange = CAFrameRateRangeIsEqualToRange(v12, v14);
      unint64_t preset = self->_preset;
      if (IsEqualToRange)
      {
        if (preset == 2) {
          goto LABEL_14;
        }
        [(PTFrameRateRangeSettings *)self willChangeValueForKey:@"preset"];
        unint64_t v7 = 2;
      }
      else
      {
        if (preset == 3) {
          goto LABEL_14;
        }
        [(PTFrameRateRangeSettings *)self willChangeValueForKey:@"preset"];
        unint64_t v7 = 3;
      }
    }
    self->_unint64_t preset = v7;
  }
  [(PTFrameRateRangeSettings *)self didChangeValueForKey:@"preset"];
LABEL_14:
  [(PTFrameRateRangeSettings *)self setMinimum:(int)minimum];
  [(PTFrameRateRangeSettings *)self setMaximum:(int)maximum];
  [(PTFrameRateRangeSettings *)self setPreferred:(int)preferred];
}

- (void)setMinimum:(int)a3
{
  self->_float minimum = a3;
}

- (void)setMaximum:(int)a3
{
  self->_float maximum = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (([(PTFrameRateRangeSettings *)self isEqual:v4] & 1) == 0)
  {
    *(_DWORD *)(v4 + 52) = self->_minimum;
    *(_DWORD *)(v4 + 56) = self->_maximum;
    *(_DWORD *)(v4 + 60) = self->_preferred;
    *(void *)(v4 + 64) = self->_preset;
    *(_WORD *)(v4 + 48) = self->_reasonComponent;
    *(_WORD *)(v4 + 50) = self->_reason;
  }
  return (id)v4;
}

- (void)setDefaultValues
{
  float v2 = *(float *)(MEMORY[0x1E4F39AF0] + 4);
  float v3 = *(float *)(MEMORY[0x1E4F39AF0] + 8);
  self->_float minimum = (int)*MEMORY[0x1E4F39AF0];
  self->_float maximum = (int)v2;
  self->_float preferred = (int)v3;
  self->_unint64_t preset = 0;
  self->_reasonComponent = 0;
  self->_reason = 0;
}

+ (BOOL)ignoresKey:(id)a3
{
  id v3 = a3;
  char v4 = [v3 isEqualToString:@"frameRateRange"];
  char v5 = [v3 isEqualToString:@"highFrameRateReason"];

  return v4 | v5;
}

- (unsigned)highFrameRateReason
{
  return self->_reason | (self->_reasonComponent << 16);
}

- (void)setReason:(unsigned __int16)a3
{
  self->_reason = a3;
}

- (CAFrameRateRange)frameRateRange
{
  return CAFrameRateRangeMake((float)self->_minimum, (float)self->_maximum, (float)self->_preferred);
}

- (void)setHighFrameRateReason:(unsigned int)a3
{
  unsigned __int16 v3 = a3;
  [(PTFrameRateRangeSettings *)self setReasonComponent:HIWORD(a3)];
  [(PTFrameRateRangeSettings *)self setReason:v3];
}

- (void)setReasonComponent:(unsigned __int16)a3
{
  self->_reasonComponent = a3;
}

+ (id)settingsControllerModule
{
  v31[7] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF.preset == 3"];
  unsigned __int16 v3 = +[PTRowAction actionWithHandler:&__block_literal_global];
  v20 = +[PTButtonRow rowWithTitle:@"Validate min<=pref<=max OR min<=max, pref=unspecified" action:v3];

  v29 = +[PTRow rowWithTitle:@"Preset" valueKeyPath:@"preset"];
  v28 = [v29 possibleValues:&unk_1F19CFDA0 titles:&unk_1F19CFD88];
  v31[0] = v28;
  v27 = +[PTRow rowWithTitle:@"minimum" valueKeyPath:@"minimum"];
  v26 = [v27 possibleValues:&unk_1F19CFDD0 titles:&unk_1F19CFDB8];
  v25 = [v26 condition:v2];
  v31[1] = v25;
  v24 = +[PTRow rowWithTitle:@"maximum" valueKeyPath:@"maximum"];
  v23 = [v24 possibleValues:&unk_1F19CFDD0 titles:&unk_1F19CFDB8];
  v22 = [v23 condition:v2];
  v31[2] = v22;
  v19 = +[PTRow rowWithTitle:@"preferred" valueKeyPath:@"preferred"];
  char v4 = [v19 possibleValues:&unk_1F19CFDD0 titles:&unk_1F19CFDB8];
  uint64_t v5 = v2;
  v21 = (void *)v2;
  v6 = [v4 condition:v2];
  v31[3] = v6;
  unint64_t v7 = +[PTRow rowWithTitle:@"reason component" valueKeyPath:@"reasonComponent"];
  v8 = [v7 between:0.0 and:65535.0];
  v9 = [v8 precision:0];
  v31[4] = v9;
  v10 = +[PTRow rowWithTitle:@"reason" valueKeyPath:@"reason"];
  CAFrameRateRange v11 = [v10 between:0.0 and:65535.0];
  CAFrameRateRange v12 = [v11 precision:0];
  v31[5] = v12;
  CAFrameRateRange v13 = [v20 condition:v5];
  v31[6] = v13;
  CAFrameRateRange v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:7];

  v15 = +[PTModule sectionWithRows:v14];
  v30 = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
  v17 = +[PTModule moduleWithTitle:@"Frame Rate Range" contents:v16];

  return v17;
}

uint64_t __52__PTFrameRateRangeSettings_settingsControllerModule__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unsigned __int16 v3 = [a3 settings];
  [v3 validate];

  return 1;
}

- (void)setPreset:(unint64_t)a3
{
  [(PTFrameRateRangeSettings *)self willChangeValueForKey:@"preset"];
  self->_unint64_t preset = a3;
  [(PTFrameRateRangeSettings *)self didChangeValueForKey:@"preset"];
  if (a3 == 2)
  {
    float v8 = 80.0;
LABEL_7:
    *(CAFrameRateRange *)&double v5 = CAFrameRateRangeMake(80.0, 120.0, v8);
    goto LABEL_8;
  }
  if (a3 == 1)
  {
    float v8 = 120.0;
    goto LABEL_7;
  }
  if (a3) {
    return;
  }
  LODWORD(v5) = *MEMORY[0x1E4F39AF0];
  LODWORD(v6) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
  LODWORD(v7) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
LABEL_8:
  -[PTFrameRateRangeSettings setFrameRateRange:](self, "setFrameRateRange:", v5, v6, v7);
}

- (id)drillDownSummary
{
  if ([(PTFrameRateRangeSettings *)self preset])
  {
    unsigned __int16 v3 = [NSString stringWithFormat:@"(%d, %d, %d)", self->_minimum, self->_maximum, self->_preferred];
  }
  else
  {
    unsigned __int16 v3 = @"(CAFrameRateRangeDefault)";
  }
  return v3;
}

- (void)validate
{
  int minimum = self->_minimum;
  int preferred = self->_preferred;
  int maximum = self->_maximum;
  if (preferred) {
    BOOL v8 = 0;
  }
  else {
    BOOL v8 = minimum <= maximum;
  }
  char v9 = v8;
  BOOL v10 = preferred <= maximum && minimum <= preferred;
  if (!v10 && (v9 & 1) == 0)
  {
    LODWORD(v2) = *MEMORY[0x1E4F39AF0];
    LODWORD(v3) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 4);
    LODWORD(v4) = *(_DWORD *)(MEMORY[0x1E4F39AF0] + 8);
    -[PTFrameRateRangeSettings setFrameRateRange:](self, "setFrameRateRange:", v2, v3, v4);
  }
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 reasonComponent:(unsigned __int16)a4 reason:(unsigned __int16)a5
{
}

- (NSString)description
{
  return (NSString *)[(PTFrameRateRangeSettings *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  double v2 = [(PTFrameRateRangeSettings *)self succinctDescriptionBuilder];
  double v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(PTFrameRateRangeSettings *)self descriptionBuilderWithMultilinePrefix:a3];
  double v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  double v4 = [(PTFrameRateRangeSettings *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__PTFrameRateRangeSettings_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E63BC548;
  id v5 = v4;
  id v10 = v5;
  CAFrameRateRange v11 = self;
  id v6 = (id)[v5 modifyBody:v9];
  id v7 = v5;

  return v7;
}

id __66__PTFrameRateRangeSettings_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) drillDownSummary];
  id v4 = (id)[v2 appendObject:v3 withName:@"frameRateRange"];

  return (id)objc_msgSend(*(id *)(a1 + 32), "appendInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "highFrameRateReason"), @"highFrameRateReason");
}

- (int)minimum
{
  return self->_minimum;
}

- (int)maximum
{
  return self->_maximum;
}

- (int)preferred
{
  return self->_preferred;
}

- (unint64_t)preset
{
  return self->_preset;
}

- (unsigned)reasonComponent
{
  return self->_reasonComponent;
}

- (unsigned)reason
{
  return self->_reason;
}

@end