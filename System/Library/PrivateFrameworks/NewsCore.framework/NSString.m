@interface NSString
- (id)_FCCKPIdentifierWithType:(void *)a1;
@end

@implementation NSString

- (id)_FCCKPIdentifierWithType:(void *)a1
{
  if (a1)
  {
    uint64_t v4 = objc_opt_new();
    -[FCCKPIdentifier setName:](v4, a1);
    if (v4)
    {
      *(unsigned char *)(v4 + 20) |= 1u;
      *(_DWORD *)(v4 + 16) = a2;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  return (id)v4;
}

uint64_t __49__NSString_FCAdditions__fc_isValidColorHexString__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"^#?(([0-9A-F]{2}){3,4}|([0-9A-F]){3})$" options:1 error:0];
  uint64_t v1 = _MergedGlobals_229;
  _MergedGlobals_229 = v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

@end