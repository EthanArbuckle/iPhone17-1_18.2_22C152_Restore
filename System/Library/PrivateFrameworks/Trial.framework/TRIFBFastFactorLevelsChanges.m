@interface TRIFBFastFactorLevelsChanges
- (void)omitNcvs;
- (void)preserveLevels;
- (void)preserveNamespaceName;
- (void)preserveNcvs;
- (void)preserveSource;
- (void)replaceLevels:(id)a3;
- (void)replaceNamespaceName:(id)a3;
- (void)replaceNcvs:(id)a3;
- (void)replaceSourceWithFactorPackId:(id)a3;
- (void)replaceSourceWithTreatmentId:(id)a3;
@end

@implementation TRIFBFastFactorLevelsChanges

- (void)replaceLevels:(id)a3
{
  id v5 = a3;
  self->_changeTypeLevels = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4781, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementLevels = [v5 unsignedIntValue];
}

- (void)preserveLevels
{
  self->_changeTypeLevels = 0;
}

- (void)replaceSourceWithTreatmentId:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4803, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  *(_WORD *)&self->_replacementSourceType = 257;
  self->_replacementSource = [v5 unsignedIntValue];
}

- (void)replaceSourceWithFactorPackId:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4810, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  *(_WORD *)&self->_replacementSourceType = 258;
  self->_replacementSource = [v5 unsignedIntValue];
}

- (void)preserveSource
{
  self->_changeTypeSource = 0;
}

- (void)replaceNamespaceName:(id)a3
{
  id v5 = a3;
  self->_changeTypeNamespaceName = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4830, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementNamespaceName = [v5 unsignedIntValue];
}

- (void)preserveNamespaceName
{
  self->_changeTypeNamespaceName = 0;
}

- (void)replaceNcvs:(id)a3
{
  id v5 = a3;
  self->_changeTypeNcvs = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4849, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementNcvs = [v5 unsignedIntValue];
}

- (void)omitNcvs
{
  self->_changeTypeNcvs = 2;
}

- (void)preserveNcvs
{
  self->_changeTypeNcvs = 0;
}

@end