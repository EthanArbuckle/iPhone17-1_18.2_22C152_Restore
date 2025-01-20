@interface MNNanoFormattedStringFormatter
+ (id)sharedFormatter;
- (id)listInstructionForStep:(id)a3;
- (id)signInstructionsForStep:(id)a3;
@end

@implementation MNNanoFormattedStringFormatter

+ (id)sharedFormatter
{
  if (qword_1EB59C330 != -1) {
    dispatch_once(&qword_1EB59C330, &__block_literal_global_54);
  }
  v2 = (void *)_MergedGlobals_53;
  return v2;
}

uint64_t __49__MNNanoFormattedStringFormatter_sharedFormatter__block_invoke()
{
  v0 = objc_alloc_init(MNNanoFormattedStringFormatter);
  uint64_t v1 = _MergedGlobals_53;
  _MergedGlobals_53 = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

- (id)listInstructionForStep:(id)a3
{
  id v3 = a3;
  if ([v3 transportType] == 6 || objc_msgSend(v3, "transportType") == 1)
  {
    v4 = 0;
  }
  else
  {
    v5 = [v3 geoStep];
    int v6 = [v5 hasInstructions];

    if (v6)
    {
      v7 = [v3 geoStep];
      v4 = [v7 instructions];
    }
    else
    {
      v7 = [v3 contentsForContext:2];
      [v7 setSuppressNames:1];
      v8 = [v7 instructionWithShorterAlternatives];
      v4 = [v8 lastObject];
    }
  }

  return v4;
}

- (id)signInstructionsForStep:(id)a3
{
  id v3 = a3;
  if ([v3 transportType] == 6 || objc_msgSend(v3, "transportType") == 1)
  {
    v4 = 0;
  }
  else
  {
    v5 = [v3 contentsForContext:1];
    v4 = [v5 instructionWithShorterAlternatives];
  }
  return v4;
}

@end