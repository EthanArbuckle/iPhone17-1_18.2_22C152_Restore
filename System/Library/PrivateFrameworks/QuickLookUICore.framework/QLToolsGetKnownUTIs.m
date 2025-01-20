@interface QLToolsGetKnownUTIs
@end

@implementation QLToolsGetKnownUTIs

void ___QLToolsGetKnownUTIs_block_invoke()
{
  v0 = QLFrameworkBundle();
  id v3 = [v0 pathForResource:@"KnownUTIs" ofType:@"plist"];

  uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v3];
  v2 = (void *)_QLToolsGetKnownUTIs__knownUTIs;
  _QLToolsGetKnownUTIs__knownUTIs = v1;

  if (!_QLToolsGetKnownUTIs__knownUTIs)
  {
    _QLToolsGetKnownUTIs__knownUTIs = MEMORY[0x1E4F1CC08];
  }
}

@end