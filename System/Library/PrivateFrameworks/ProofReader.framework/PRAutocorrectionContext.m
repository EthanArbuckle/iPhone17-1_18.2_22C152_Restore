@interface PRAutocorrectionContext
+ (id)autocorrectionContextOfType:(unint64_t)a3;
+ (void)clearCaches;
- (double)validSequenceCorrectionThreshold;
- (id)addedModifications;
- (id)completions;
- (id)correction;
- (id)currentModifications;
- (id)guesses;
- (id)prefixes;
- (id)removedModifications;
- (unint64_t)modificationMask;
- (void)addInputCharacter:(unsigned __int16)a3 geometryData:(id)a4;
- (void)setModificationMask:(unint64_t)a3;
@end

@implementation PRAutocorrectionContext

+ (id)autocorrectionContextOfType:(unint64_t)a3
{
  if (a3 - 2 > 2) {
    return 0;
  }
  id v4 = objc_alloc_init(*off_2640F9610[a3 - 2]);
  return v4;
}

+ (void)clearCaches
{
}

- (void)addInputCharacter:(unsigned __int16)a3 geometryData:(id)a4
{
}

- (void)setModificationMask:(unint64_t)a3
{
  self->_modificationMask = a3;
}

- (unint64_t)modificationMask
{
  return self->_modificationMask;
}

- (id)currentModifications
{
  return 0;
}

- (id)addedModifications
{
  return 0;
}

- (id)removedModifications
{
  return 0;
}

- (id)prefixes
{
  return 0;
}

- (id)guesses
{
  return 0;
}

- (id)completions
{
  return 0;
}

- (id)correction
{
  return 0;
}

- (double)validSequenceCorrectionThreshold
{
  return 0.0;
}

@end