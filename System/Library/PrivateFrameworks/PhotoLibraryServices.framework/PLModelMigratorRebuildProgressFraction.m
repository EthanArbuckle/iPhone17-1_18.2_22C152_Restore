@interface PLModelMigratorRebuildProgressFraction
- (BOOL)isLegacyRecoveryEnabled;
- (BOOL)isRebuildEnabled;
- (PLModelMigratorRebuildProgressFraction)initWithLegacyRecoveryEnabled:(BOOL)a3;
- (float)progressFractionForType:(unsigned __int8)a3;
- (void)setRebuildEnabled:(BOOL)a3;
@end

@implementation PLModelMigratorRebuildProgressFraction

- (void)setRebuildEnabled:(BOOL)a3
{
  self->_rebuildEnabled = a3;
}

- (BOOL)isRebuildEnabled
{
  return self->_rebuildEnabled;
}

- (float)progressFractionForType:(unsigned __int8)a3
{
  if (a3 == 2)
  {
    float v4 = 0.25;
    if ([(PLModelMigratorRebuildProgressFraction *)self isRebuildEnabled]) {
      return v4;
    }
    BOOL v5 = ![(PLModelMigratorRebuildProgressFraction *)self isLegacyRecoveryEnabled];
    float v6 = 1.0;
    goto LABEL_8;
  }
  float v4 = 0.0;
  if (a3 == 1)
  {
    if (![(PLModelMigratorRebuildProgressFraction *)self isLegacyRecoveryEnabled]) {
      return v4;
    }
    BOOL v5 = ![(PLModelMigratorRebuildProgressFraction *)self isRebuildEnabled];
    float v6 = 0.5;
    float v7 = 0.25;
    goto LABEL_11;
  }
  if (!a3 && [(PLModelMigratorRebuildProgressFraction *)self isRebuildEnabled])
  {
    BOOL v5 = ![(PLModelMigratorRebuildProgressFraction *)self isLegacyRecoveryEnabled];
    float v6 = 0.75;
LABEL_8:
    float v7 = 0.5;
LABEL_11:
    if (v5) {
      return v6;
    }
    else {
      return v7;
    }
  }
  return v4;
}

- (BOOL)isLegacyRecoveryEnabled
{
  return self->_legacyRecoveryEnabled;
}

- (PLModelMigratorRebuildProgressFraction)initWithLegacyRecoveryEnabled:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PLModelMigratorRebuildProgressFraction;
  result = [(PLModelMigratorRebuildProgressFraction *)&v5 init];
  if (result) {
    result->_legacyRecoveryEnabled = a3;
  }
  return result;
}

@end