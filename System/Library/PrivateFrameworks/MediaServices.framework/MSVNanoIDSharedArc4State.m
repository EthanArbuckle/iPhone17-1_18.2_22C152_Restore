@interface MSVNanoIDSharedArc4State
@end

@implementation MSVNanoIDSharedArc4State

void ___MSVNanoIDSharedArc4State_block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v0 = malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
  _MSVNanoIDSharedArc4State__state = (uint64_t)v0;
  if (v0)
  {
    v1 = v0;
    void *v0 = 0;
    v2 = malloc_type_malloc(0x100uLL, 0xE14FBD05uLL);
    uint64_t v3 = 0;
    v1[1] = v2;
    do
    {
      *(unsigned char *)(v1[1] + v3) = v3;
      ++v3;
    }
    while (v3 != 256);
  }
  if (SecRandomCopyBytes(0, 0x10uLL, bytes))
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    v15 = [NSString stringWithUTF8String:"struct MSVArc4State *_MSVNanoIDSharedArc4State(void)_block_invoke"];
    [v14 handleFailureInFunction:v15 file:@"MSVNanoID.m" lineNumber:43 description:@"Unable to obtain system random bytes."];
  }
  uint64_t v4 = 0;
  int v5 = 0;
  uint64_t v6 = _MSVNanoIDSharedArc4State__state;
  uint64_t v7 = *(void *)(_MSVNanoIDSharedArc4State__state + 8);
  do
  {
    int v8 = *(unsigned __int8 *)(v7 + v4);
    v5 += v8 + bytes[v4 & 0xF];
    *(unsigned char *)(v7 + v4) = *(unsigned char *)(v7 + v5);
    *(unsigned char *)(v7 + v5) = v8;
    ++v4;
  }
  while (v4 != 255);
  uint64_t v9 = *(void *)(v6 + 8);
  int v10 = 768;
  LODWORD(v12) = *(_DWORD *)v6;
  int v11 = *(_DWORD *)(v6 + 4);
  do
  {
    uint64_t v12 = (v12 + 1);
    char v13 = *(unsigned char *)(v9 + v12);
    LOBYTE(v11) = v13 + v11;
    *(unsigned char *)(v9 + v12) = *(unsigned char *)(v9 + v11);
    *(unsigned char *)(v9 + v11) = v13;
    --v10;
  }
  while (v10);
  *(_DWORD *)uint64_t v6 = v12;
  *(_DWORD *)(v6 + 4) = v11;
}

@end