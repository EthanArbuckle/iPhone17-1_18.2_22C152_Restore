@interface TRIFBFactorMetadataKeyValueChanges
- (void)preserveKey;
- (void)preserveVal;
- (void)replaceKey:(id)a3;
- (void)replaceVal:(id)a3;
@end

@implementation TRIFBFactorMetadataKeyValueChanges

- (void)replaceKey:(id)a3
{
  id v5 = a3;
  self->_changeTypeKey = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2954, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementKey = [v5 unsignedIntValue];
}

- (void)preserveKey
{
  self->_changeTypeKey = 0;
}

- (void)replaceVal:(id)a3
{
  id v5 = a3;
  self->_changeTypeVal = 1;
  id v7 = v5;
  if (!v5)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"TRIFBFastFactorLevels_generated.mm", 2973, @"Invalid parameter not satisfying: %@", @"ofs" object file lineNumber description];

    id v5 = 0;
  }
  self->_replacementVal = [v5 unsignedIntValue];
}

- (void)preserveVal
{
  self->_changeTypeVal = 0;
}

@end