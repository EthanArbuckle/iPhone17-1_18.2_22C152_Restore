@interface _TSF_TSDgPTPLocalClockPort
+ (id)diagnosticInfoForService:(id)a3;
+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3;
- (BOOL)_hasLocalFrequencyStabilityLower;
- (BOOL)_hasLocalFrequencyStabilityUpper;
- (BOOL)_hasLocalFrequencyToleranceLower;
- (BOOL)_hasLocalFrequencyToleranceUpper;
- (BOOL)hasLocalFrequencyStabilityLower;
- (BOOL)hasLocalFrequencyStabilityUpper;
- (BOOL)hasLocalFrequencyToleranceLower;
- (BOOL)hasLocalFrequencyToleranceUpper;
- (_TSF_TSDgPTPLocalClockPort)initWithService:(id)a3 pid:(int)a4;
- (int)_localFrequencyStabilityLower;
- (int)_localFrequencyStabilityUpper;
- (int)_localFrequencyToleranceLower;
- (int)_localFrequencyToleranceUpper;
- (int)localFrequencyStabilityLower;
- (int)localFrequencyStabilityUpper;
- (int)localFrequencyToleranceLower;
- (int)localFrequencyToleranceUpper;
- (int)portType;
- (unsigned)_localOscillatorType;
- (unsigned)localOscillatorType;
- (void)setHasLocalFrequencyStabilityLower:(BOOL)a3;
- (void)setHasLocalFrequencyStabilityUpper:(BOOL)a3;
- (void)setHasLocalFrequencyToleranceLower:(BOOL)a3;
- (void)setHasLocalFrequencyToleranceUpper:(BOOL)a3;
- (void)setLocalFrequencyStabilityLower:(int)a3;
- (void)setLocalFrequencyStabilityUpper:(int)a3;
- (void)setLocalFrequencyToleranceLower:(int)a3;
- (void)setLocalFrequencyToleranceUpper:(int)a3;
- (void)setLocalOscillatorType:(unsigned __int8)a3;
@end

@implementation _TSF_TSDgPTPLocalClockPort

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v13[0] = @"IOTimeSyncLocalClockPort";
  v12[0] = @"IOProviderClass";
  v12[1] = @"IOParentMatch";
  v10[0] = @"IOProviderClass";
  v10[1] = @"IOPropertyMatch";
  v11[0] = @"IOTimeSyncDomain";
  v8 = @"ClockIdentifier";
  v3 = [NSNumber numberWithUnsignedLongLong:a3];
  v9 = v3;
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  v11[1] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  v13[1] = v5;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

  return v6;
}

- (_TSF_TSDgPTPLocalClockPort)initWithService:(id)a3 pid:(int)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_TSF_TSDgPTPLocalClockPort;
  v4 = [(_TSF_TSDgPTPPort *)&v7 initWithService:a3 pid:*(void *)&a4];
  v5 = v4;
  if (v4)
  {
    v4->_localOscillatorType = [(_TSF_TSDgPTPLocalClockPort *)v4 _localOscillatorType];
    v5->_hasLocalFrequencyToleranceLower = [(_TSF_TSDgPTPLocalClockPort *)v5 _hasLocalFrequencyToleranceLower];
    v5->_localFrequencyToleranceLower = [(_TSF_TSDgPTPLocalClockPort *)v5 _localFrequencyToleranceLower];
    v5->_hasLocalFrequencyToleranceUpper = [(_TSF_TSDgPTPLocalClockPort *)v5 _hasLocalFrequencyToleranceUpper];
    v5->_localFrequencyToleranceUpper = [(_TSF_TSDgPTPLocalClockPort *)v5 _localFrequencyToleranceUpper];
    v5->_hasLocalFrequencyStabilityLower = [(_TSF_TSDgPTPLocalClockPort *)v5 _hasLocalFrequencyStabilityLower];
    v5->_localFrequencyStabilityLower = [(_TSF_TSDgPTPLocalClockPort *)v5 _localFrequencyStabilityLower];
    v5->_hasLocalFrequencyStabilityUpper = [(_TSF_TSDgPTPLocalClockPort *)v5 _hasLocalFrequencyStabilityUpper];
    v5->_localFrequencyStabilityUpper = [(_TSF_TSDgPTPLocalClockPort *)v5 _localFrequencyStabilityUpper];
  }
  return v5;
}

- (int)portType
{
  return 8;
}

- (unsigned)_localOscillatorType
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"LocalOscillatorType"];

  if (v3) {
    unsigned __int8 v4 = [v3 unsignedCharValue];
  }
  else {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceLower
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceLower"];

  return v3 != 0;
}

- (int)_localFrequencyToleranceLower
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceLower"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceUpper
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceUpper"];

  return v3 != 0;
}

- (int)_localFrequencyToleranceUpper
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"LocalFrequencyToleranceUpper"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyStabilityLower
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityLower"];

  return v3 != 0;
}

- (int)_localFrequencyStabilityLower
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityLower"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)_hasLocalFrequencyStabilityUpper
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityUpper"];

  return v3 != 0;
}

- (int)_localFrequencyStabilityUpper
{
  v2 = [(_TSF_TSDgPTPPort *)self service];
  v3 = [v2 iodPropertyForKey:@"LocalFrequencyStabilityUpper"];

  if (v3) {
    int v4 = [v3 intValue];
  }
  else {
    int v4 = 0;
  }

  return v4;
}

+ (id)diagnosticInfoForService:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____TSF_TSDgPTPLocalClockPort;
  v3 = objc_msgSendSuper2(&v6, sel_diagnosticInfoForService_, a3);
  int v4 = [NSNumber numberWithInt:8];
  [v3 setObject:v4 forKeyedSubscript:@"PortType"];

  return v3;
}

- (unsigned)localOscillatorType
{
  return self->_localOscillatorType;
}

- (void)setLocalOscillatorType:(unsigned __int8)a3
{
  self->_localOscillatorType = a3;
}

- (BOOL)hasLocalFrequencyToleranceLower
{
  return self->_hasLocalFrequencyToleranceLower;
}

- (void)setHasLocalFrequencyToleranceLower:(BOOL)a3
{
  self->_hasLocalFrequencyToleranceLower = a3;
}

- (int)localFrequencyToleranceLower
{
  return self->_localFrequencyToleranceLower;
}

- (void)setLocalFrequencyToleranceLower:(int)a3
{
  self->_localFrequencyToleranceLower = a3;
}

- (BOOL)hasLocalFrequencyToleranceUpper
{
  return self->_hasLocalFrequencyToleranceUpper;
}

- (void)setHasLocalFrequencyToleranceUpper:(BOOL)a3
{
  self->_hasLocalFrequencyToleranceUpper = a3;
}

- (int)localFrequencyToleranceUpper
{
  return self->_localFrequencyToleranceUpper;
}

- (void)setLocalFrequencyToleranceUpper:(int)a3
{
  self->_localFrequencyToleranceUpper = a3;
}

- (BOOL)hasLocalFrequencyStabilityLower
{
  return self->_hasLocalFrequencyStabilityLower;
}

- (void)setHasLocalFrequencyStabilityLower:(BOOL)a3
{
  self->_hasLocalFrequencyStabilityLower = a3;
}

- (int)localFrequencyStabilityLower
{
  return self->_localFrequencyStabilityLower;
}

- (void)setLocalFrequencyStabilityLower:(int)a3
{
  self->_localFrequencyStabilityLower = a3;
}

- (BOOL)hasLocalFrequencyStabilityUpper
{
  return self->_hasLocalFrequencyStabilityUpper;
}

- (void)setHasLocalFrequencyStabilityUpper:(BOOL)a3
{
  self->_hasLocalFrequencyStabilityUpper = a3;
}

- (int)localFrequencyStabilityUpper
{
  return self->_localFrequencyStabilityUpper;
}

- (void)setLocalFrequencyStabilityUpper:(int)a3
{
  self->_localFrequencyStabilityUpper = a3;
}

@end