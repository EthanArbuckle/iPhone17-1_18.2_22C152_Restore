@interface TRIFBFactorLevelChanges
- (void)omitAlias;
- (void)omitCacheKey;
- (void)omitFactorId;
- (void)omitFactorNamespaceName;
- (void)omitNamespaceId;
- (void)preserveAlias;
- (void)preserveCacheKey;
- (void)preserveFactorId;
- (void)preserveFactorNamespaceName;
- (void)preserveLevel;
- (void)preserveMetadata;
- (void)preserveName;
- (void)preserveNamespaceId;
- (void)replaceAlias:(id)a3;
- (void)replaceCacheKey:(unsigned int)a3;
- (void)replaceFactorId:(id)a3;
- (void)replaceFactorNamespaceName:(id)a3;
- (void)replaceLevelWithBoolVal:(id)a3;
- (void)replaceLevelWithDoubleVal:(id)a3;
- (void)replaceLevelWithInt64Val:(id)a3;
- (void)replaceLevelWithMaRefVal:(id)a3;
- (void)replaceLevelWithStringVal:(id)a3;
- (void)replaceLevelWithTrialAssetVal:(id)a3;
- (void)replaceMetadata:(id)a3;
- (void)replaceName:(id)a3;
- (void)replaceNamespaceId:(unsigned int)a3;
@end

@implementation TRIFBFactorLevelChanges

- (void)replaceName:(id)a3
{
  id v5 = a3;
  self->_changeTypeName = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3919, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementName = [v5 unsignedIntValue];
}

- (void)preserveName
{
  self->_changeTypeName = 0;
}

- (void)replaceLevelWithBoolVal:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3941, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 257;
  self->_replacementLevel = [v5 unsignedIntValue];
}

- (void)replaceLevelWithStringVal:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3948, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 258;
  self->_replacementLevel = [v5 unsignedIntValue];
}

- (void)replaceLevelWithInt64Val:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3955, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 259;
  self->_replacementLevel = [v5 unsignedIntValue];
}

- (void)replaceLevelWithDoubleVal:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3962, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 260;
  self->_replacementLevel = [v5 unsignedIntValue];
}

- (void)replaceLevelWithTrialAssetVal:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3969, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 261;
  self->_replacementLevel = [v5 unsignedIntValue];
}

- (void)replaceLevelWithMaRefVal:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3976, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  *(_WORD *)&self->_replacementLevelType = 262;
  self->_replacementLevel = [v5 unsignedIntValue];
}

- (void)preserveLevel
{
  self->_changeTypeLevel = 0;
}

- (void)replaceMetadata:(id)a3
{
  id v5 = a3;
  self->_changeTypeMetadata = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 3996, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementMetadata = [v5 unsignedIntValue];
}

- (void)preserveMetadata
{
  self->_changeTypeMetadata = 0;
}

- (void)replaceCacheKey:(unsigned int)a3
{
  self->_changeTypeCacheKey = 1;
  self->_replacementCacheKey = a3;
}

- (void)omitCacheKey
{
  self->_changeTypeCacheKey = 2;
}

- (void)preserveCacheKey
{
  self->_changeTypeCacheKey = 0;
}

- (void)replaceAlias:(id)a3
{
  id v5 = a3;
  self->_changeTypeAlias = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4036, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementAlias = [v5 unsignedIntValue];
}

- (void)omitAlias
{
  self->_changeTypeAlias = 2;
}

- (void)preserveAlias
{
  self->_changeTypeAlias = 0;
}

- (void)replaceFactorNamespaceName:(id)a3
{
  id v5 = a3;
  self->_changeTypeFactorNamespaceName = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4059, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementFactorNamespaceName = [v5 unsignedIntValue];
}

- (void)omitFactorNamespaceName
{
  self->_changeTypeFactorNamespaceName = 2;
}

- (void)preserveFactorNamespaceName
{
  self->_changeTypeFactorNamespaceName = 0;
}

- (void)replaceFactorId:(id)a3
{
  id v5 = a3;
  self->_changeTypeFactorId = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 4082, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementFactorId = [v5 unsignedIntValue];
}

- (void)omitFactorId
{
  self->_changeTypeFactorId = 2;
}

- (void)preserveFactorId
{
  self->_changeTypeFactorId = 0;
}

- (void)replaceNamespaceId:(unsigned int)a3
{
  self->_changeTypeNamespaceId = 1;
  self->_replacementNamespaceId = a3;
}

- (void)omitNamespaceId
{
  self->_changeTypeNamespaceId = 2;
}

- (void)preserveNamespaceId
{
  self->_changeTypeNamespaceId = 0;
}

@end