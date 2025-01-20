@interface _SMTSiriIntendedInfoMutation
- (BOOL)getGazeSignal;
- (BOOL)isDirty;
- (_SMTSiriIntendedInfoMutation)initWithBase:(id)a3;
- (float)getAftmScore;
- (float)getCheckerScore;
- (float)getConversationalOdldScore;
- (float)getLrnnOffset;
- (float)getLrnnScale;
- (float)getLrnnScore;
- (float)getLrnnThreshold;
- (float)getOdldScore;
- (float)getSpkrIdScore;
- (id)getInvocationType;
- (void)setAftmScore:(float)a3;
- (void)setCheckerScore:(float)a3;
- (void)setConversationalOdldScore:(float)a3;
- (void)setGazeSignal:(BOOL)a3;
- (void)setInvocationType:(id)a3;
- (void)setLrnnOffset:(float)a3;
- (void)setLrnnScale:(float)a3;
- (void)setLrnnScore:(float)a3;
- (void)setLrnnThreshold:(float)a3;
- (void)setOdldScore:(float)a3;
- (void)setSpkrIdScore:(float)a3;
@end

@implementation _SMTSiriIntendedInfoMutation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationType, 0);
  objc_storeStrong((id *)&self->_base, 0);
}

- (void)setConversationalOdldScore:(float)a3
{
  self->_conversationalOdldScore = a3;
  *(_WORD *)&self->_mutationFlags |= 0x801u;
}

- (float)getConversationalOdldScore
{
  if ((*(_WORD *)&self->_mutationFlags & 0x800) != 0) {
    return self->_conversationalOdldScore;
  }
  [(SMTSiriIntendedInfo *)self->_base conversationalOdldScore];
  return result;
}

- (void)setGazeSignal:(BOOL)a3
{
  self->_isGazeSignalPresent = a3;
  *(_WORD *)&self->_mutationFlags |= 0x401u;
}

- (BOOL)getGazeSignal
{
  if ((*(_WORD *)&self->_mutationFlags & 0x400) != 0) {
    return self->_isGazeSignalPresent;
  }
  else {
    return [(SMTSiriIntendedInfo *)self->_base isGazeSignalPresent];
  }
}

- (void)setLrnnOffset:(float)a3
{
  self->_lrnnOffset = a3;
  *(_WORD *)&self->_mutationFlags |= 0x201u;
}

- (float)getLrnnOffset
{
  if ((*(_WORD *)&self->_mutationFlags & 0x200) != 0) {
    return self->_lrnnOffset;
  }
  [(SMTSiriIntendedInfo *)self->_base lrnnOffset];
  return result;
}

- (void)setLrnnScale:(float)a3
{
  self->_lrnnScale = a3;
  *(_WORD *)&self->_mutationFlags |= 0x101u;
}

- (float)getLrnnScale
{
  if ((*(_WORD *)&self->_mutationFlags & 0x100) != 0) {
    return self->_lrnnScale;
  }
  [(SMTSiriIntendedInfo *)self->_base lrnnScale];
  return result;
}

- (void)setLrnnThreshold:(float)a3
{
  self->_lrnnThreshold = a3;
  *(_WORD *)&self->_mutationFlags |= 0x81u;
}

- (float)getLrnnThreshold
{
  if ((*(_WORD *)&self->_mutationFlags & 0x80) != 0) {
    return self->_lrnnThreshold;
  }
  [(SMTSiriIntendedInfo *)self->_base lrnnThreshold];
  return result;
}

- (void)setInvocationType:(id)a3
{
  *(_WORD *)&self->_mutationFlags |= 0x41u;
}

- (id)getInvocationType
{
  if ((*(_WORD *)&self->_mutationFlags & 0x40) != 0)
  {
    v2 = self->_invocationType;
  }
  else
  {
    v2 = [(SMTSiriIntendedInfo *)self->_base invocationType];
  }
  return v2;
}

- (void)setCheckerScore:(float)a3
{
  self->_checkerScore = a3;
  *(_WORD *)&self->_mutationFlags |= 0x21u;
}

- (float)getCheckerScore
{
  if ((*(_WORD *)&self->_mutationFlags & 0x20) != 0) {
    return self->_checkerScore;
  }
  [(SMTSiriIntendedInfo *)self->_base checkerScore];
  return result;
}

- (void)setLrnnScore:(float)a3
{
  self->_lrnnScore = a3;
  *(_WORD *)&self->_mutationFlags |= 0x11u;
}

- (float)getLrnnScore
{
  if ((*(_WORD *)&self->_mutationFlags & 0x10) != 0) {
    return self->_lrnnScore;
  }
  [(SMTSiriIntendedInfo *)self->_base lrnnScore];
  return result;
}

- (void)setSpkrIdScore:(float)a3
{
  self->_spkrIdScore = a3;
  *(_WORD *)&self->_mutationFlags |= 9u;
}

- (float)getSpkrIdScore
{
  if ((*(_WORD *)&self->_mutationFlags & 8) != 0) {
    return self->_spkrIdScore;
  }
  [(SMTSiriIntendedInfo *)self->_base spkrIdScore];
  return result;
}

- (void)setAftmScore:(float)a3
{
  self->_aftmScore = a3;
  *(_WORD *)&self->_mutationFlags |= 5u;
}

- (float)getAftmScore
{
  if ((*(_WORD *)&self->_mutationFlags & 4) != 0) {
    return self->_aftmScore;
  }
  [(SMTSiriIntendedInfo *)self->_base aftmScore];
  return result;
}

- (void)setOdldScore:(float)a3
{
  self->_odldScore = a3;
  *(_WORD *)&self->_mutationFlags |= 3u;
}

- (float)getOdldScore
{
  if ((*(_WORD *)&self->_mutationFlags & 2) != 0) {
    return self->_odldScore;
  }
  [(SMTSiriIntendedInfo *)self->_base odldScore];
  return result;
}

- (BOOL)isDirty
{
  return *(_WORD *)&self->_mutationFlags & 1;
}

- (_SMTSiriIntendedInfoMutation)initWithBase:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SMTSiriIntendedInfoMutation;
  v6 = [(_SMTSiriIntendedInfoMutation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_base, a3);
  }

  return v7;
}

@end