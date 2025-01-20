@interface NSString
@end

@implementation NSString

void __131__NSString_LPInternal___lp_highLevelDomainFromComponents_indexOfFirstHighLevelDomainComponent_indexOfFirstTopLevelDomainComponent___block_invoke(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v15 = a2;
  uint64_t v7 = [v15 copy];
  uint64_t v8 = *(void *)(a1[4] + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  v10 = (void *)a1[6];
  if (v10) {
    void *v10 = a1[7] + ~a3;
  }
  v11 = (void *)a1[8];
  if (v11) {
    void *v11 = a1[7] - a3;
  }
  v12 = [v15 lowercaseString];
  int IsDomainTopLevel = _CFHostIsDomainTopLevel();

  uint64_t v14 = *(void *)(a1[5] + 8);
  if (IsDomainTopLevel)
  {
    *(unsigned char *)(v14 + 24) = 1;
  }
  else if (*(unsigned char *)(v14 + 24))
  {
    *a4 = 1;
  }
}

@end