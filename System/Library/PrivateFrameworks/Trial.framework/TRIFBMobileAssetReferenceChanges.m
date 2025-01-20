@interface TRIFBMobileAssetReferenceChanges
- (void)omitAssetName;
- (void)omitDownloadSize;
- (void)omitFileType;
- (void)omitIsOnDemand;
- (void)preserveAssetName;
- (void)preserveDownloadSize;
- (void)preserveFileType;
- (void)preserveIsOnDemand;
- (void)preserveSpecifier;
- (void)preserveType;
- (void)preserveVersion;
- (void)replaceAssetName:(id)a3;
- (void)replaceDownloadSize:(unint64_t)a3;
- (void)replaceFileType:(unsigned __int8)a3;
- (void)replaceIsOnDemand:(BOOL)a3;
- (void)replaceSpecifier:(id)a3;
- (void)replaceType:(id)a3;
- (void)replaceVersion:(id)a3;
@end

@implementation TRIFBMobileAssetReferenceChanges

- (void)replaceType:(id)a3
{
  id v5 = a3;
  self->_changeTypeType = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2449, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementType = [v5 unsignedIntValue];
}

- (void)preserveType
{
  self->_changeTypeType = 0;
}

- (void)replaceSpecifier:(id)a3
{
  id v5 = a3;
  self->_changeTypeSpecifier = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2468, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementSpecifier = [v5 unsignedIntValue];
}

- (void)preserveSpecifier
{
  self->_changeTypeSpecifier = 0;
}

- (void)replaceVersion:(id)a3
{
  id v5 = a3;
  self->_changeTypeVersion = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2487, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementVersion = [v5 unsignedIntValue];
}

- (void)preserveVersion
{
  self->_changeTypeVersion = 0;
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
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2569, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

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

@end