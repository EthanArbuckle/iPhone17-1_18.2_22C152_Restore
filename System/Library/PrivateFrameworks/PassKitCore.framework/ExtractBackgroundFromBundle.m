@interface ExtractBackgroundFromBundle
@end

@implementation ExtractBackgroundFromBundle

BOOL ___ExtractBackgroundFromBundle_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    BOOL v4 = 1;
  }
  else
  {
    CFURLRef v5 = [*(id *)(a1 + 32) URLForResource:v3 withExtension:@"pdf"];
    CFURLRef v6 = v5;
    if (v5) {
      *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = CGPDFDocumentCreateWithURL(v5);
    }
       || (+[PKImage imageNamed:v3 inBundle:*(void *)(a1 + 32) screenScale:*(void *)(a1 + 40) suffix:*(double *)(a1 + 72)], uint64_t v7 = v10 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v10;

    BOOL v4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) != 0;
  }

  return v4;
}

@end