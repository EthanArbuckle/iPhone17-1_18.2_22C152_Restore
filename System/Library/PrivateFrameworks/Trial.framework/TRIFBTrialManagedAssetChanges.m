@interface TRIFBTrialManagedAssetChanges
- (void)omitAssetName;
- (void)omitDownloadSize;
- (void)omitFileType;
- (void)omitHasOnDemandFlag;
- (void)omitIsOnDemand;
- (void)omitPath;
- (void)preserveAssetId;
- (void)preserveAssetName;
- (void)preserveCloudKitMetadata;
- (void)preserveDownloadSize;
- (void)preserveFileType;
- (void)preserveHasOnDemandFlag;
- (void)preserveIsOnDemand;
- (void)preservePath;
- (void)replaceAssetId:(id)a3;
- (void)replaceAssetName:(id)a3;
- (void)replaceCloudKitMetadataWithAsset:(id)a3;
- (void)replaceCloudKitMetadataWithTreatment:(id)a3;
- (void)replaceDownloadSize:(unint64_t)a3;
- (void)replaceFileType:(unsigned __int8)a3;
- (void)replaceHasOnDemandFlag:(BOOL)a3;
- (void)replaceIsOnDemand:(BOOL)a3;
- (void)replacePath:(id)a3;
@end

@implementation TRIFBTrialManagedAssetChanges

- (void)replacePath:(id)a3
{
  id v5 = a3;
  self->_changeTypePath = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1712, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementPath = [v5 unsignedIntValue];
}

- (void)omitPath
{
  self->_changeTypePath = 2;
}

- (void)preservePath
{
  self->_changeTypePath = 0;
}

- (void)replaceFileType:(unsigned __int8)a3
{
  self->_changeTypeFileType = 1;
  self->_replacementFileType = a3;
}

- (void)omitFileType
{
  self->_changeTypeFileType = 2;
}

- (void)preserveFileType
{
  self->_changeTypeFileType = 0;
}

- (void)replaceAssetId:(id)a3
{
  id v5 = a3;
  self->_changeTypeAssetId = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1756, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementAssetId = [v5 unsignedIntValue];
}

- (void)preserveAssetId
{
  self->_changeTypeAssetId = 0;
}

- (void)replaceCloudKitMetadataWithTreatment:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1778, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  *(_WORD *)&self->_replacementCloudKitMetadataType = 257;
  self->_replacementCloudKitMetadata = [v5 unsignedIntValue];
}

- (void)replaceCloudKitMetadataWithAsset:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1785, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  *(_WORD *)&self->_replacementCloudKitMetadataType = 258;
  self->_replacementCloudKitMetadata = [v5 unsignedIntValue];
}

- (void)preserveCloudKitMetadata
{
  self->_changeTypeCloudKitMetadata = 0;
}

- (void)replaceIsOnDemand:(BOOL)a3
{
  self->_changeTypeIsOnDemand = 1;
  self->_replacementIsOnDemand = a3;
}

- (void)omitIsOnDemand
{
  self->_changeTypeIsOnDemand = 2;
}

- (void)preserveIsOnDemand
{
  self->_changeTypeIsOnDemand = 0;
}

- (void)replaceDownloadSize:(unint64_t)a3
{
  self->_changeTypeDownloadSize = 1;
  self->_replacementDownloadSize = a3;
}

- (void)omitDownloadSize
{
  self->_changeTypeDownloadSize = 2;
}

- (void)preserveDownloadSize
{
  self->_changeTypeDownloadSize = 0;
}

- (void)replaceAssetName:(id)a3
{
  id v5 = a3;
  self->_changeTypeAssetName = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 1847, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementAssetName = [v5 unsignedIntValue];
}

- (void)omitAssetName
{
  self->_changeTypeAssetName = 2;
}

- (void)preserveAssetName
{
  self->_changeTypeAssetName = 0;
}

- (void)replaceHasOnDemandFlag:(BOOL)a3
{
  self->_changeTypeHasOnDemandFlag = 1;
  self->_replacementHasOnDemandFlag = a3;
}

- (void)omitHasOnDemandFlag
{
  self->_changeTypeHasOnDemandFlag = 2;
}

- (void)preserveHasOnDemandFlag
{
  self->_changeTypeHasOnDemandFlag = 0;
}

@end