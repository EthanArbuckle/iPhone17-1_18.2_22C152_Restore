@interface TRIFBCloudKitTreatmentRecordAssetChanges
- (void)omitAssetIndex;
- (void)omitContainer;
- (void)omitHasCkIndex;
- (void)preserveAssetIndex;
- (void)preserveContainer;
- (void)preserveHasCkIndex;
- (void)preserveTreatmentId;
- (void)replaceAssetIndex:(unsigned int)a3;
- (void)replaceContainer:(unsigned __int8)a3;
- (void)replaceHasCkIndex:(BOOL)a3;
- (void)replaceTreatmentId:(id)a3;
@end

@implementation TRIFBCloudKitTreatmentRecordAssetChanges

- (void)replaceContainer:(unsigned __int8)a3
{
  self->_changeTypeContainer = 1;
  self->_replacementContainer = a3;
}

- (void)omitContainer
{
  self->_changeTypeContainer = 2;
}

- (void)preserveContainer
{
  self->_changeTypeContainer = 0;
}

- (void)replaceTreatmentId:(id)a3
{
  id v5 = a3;
  self->_changeTypeTreatmentId = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 776, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementTreatmentId = [v5 unsignedIntValue];
}

- (void)preserveTreatmentId
{
  self->_changeTypeTreatmentId = 0;
}

- (void)replaceAssetIndex:(unsigned int)a3
{
  self->_changeTypeAssetIndex = 1;
  self->_replacementAssetIndex = a3;
}

- (void)omitAssetIndex
{
  self->_changeTypeAssetIndex = 2;
}

- (void)preserveAssetIndex
{
  self->_changeTypeAssetIndex = 0;
}

- (void)replaceHasCkIndex:(BOOL)a3
{
  self->_changeTypeHasCkIndex = 1;
  self->_replacementHasCkIndex = a3;
}

- (void)omitHasCkIndex
{
  self->_changeTypeHasCkIndex = 2;
}

- (void)preserveHasCkIndex
{
  self->_changeTypeHasCkIndex = 0;
}

@end