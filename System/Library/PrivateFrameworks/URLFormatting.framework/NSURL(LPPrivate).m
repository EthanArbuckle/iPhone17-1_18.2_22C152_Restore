@interface NSURL(LPPrivate)
+ (CFURLRef)_lp_URLWithData:()LPPrivate baseURL:;
- (id)_lp_URLByDeletingCommonIndexPageNames;
- (id)_lp_URLBySortingQueryItems;
- (id)_lp_originalData;
- (id)_lp_simplifiedStringForDisplayOnly:()LPPrivate;
@end

@implementation NSURL(LPPrivate)

- (id)_lp_originalData
{
  v2 = (UInt8 *)malloc_type_malloc(0x800uLL, 0xCEFEA29FuLL);
  CFIndex v3 = CFURLGetBytes(a1, v2, 2048);
  if (v3 != -1)
  {
LABEL_4:
    v6 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v2 length:v3 freeWhenDone:1];
    v7 = CFURLGetBaseURL(a1);
    if (v7)
    {
      v8 = objc_msgSend(NSURL, "_lp_URLWithData:baseURL:", v6, v7);
      objc_msgSend(v8, "_lp_originalData");
      id v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = v6;
    }

    goto LABEL_8;
  }
  size_t v4 = CFURLGetBytes(a1, 0, 0);
  if (v4 != -1)
  {
    CFIndex v5 = v4;
    v2 = (UInt8 *)malloc_type_realloc(v2, v4, 0x223B1CBCuLL);
    CFIndex v3 = CFURLGetBytes(a1, v2, v5);
    goto LABEL_4;
  }
  free(v2);
  id v9 = [MEMORY[0x263EFF8F8] data];
LABEL_8:
  return v9;
}

+ (CFURLRef)_lp_URLWithData:()LPPrivate baseURL:
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  CFURLRef v6 = a4;
  if (!v5) {
    goto LABEL_22;
  }
  CFIndex v7 = [v5 length];
  if (!v7)
  {
    uint64_t v12 = [NSURL URLWithString:&stru_26C3C6F50];
LABEL_25:
    CFURLRef v19 = (CFURLRef)v12;
    goto LABEL_26;
  }
  CFURLRef v8 = v6;
  CFURLRef v9 = v8;
  if (!v8)
  {
    CFURLRef v6 = 0;
    goto LABEL_20;
  }
  CFIndex location = CFURLGetByteRangeForComponent(v8, kCFURLComponentResourceSpecifier, 0).location;
  if (location == -1) {
    goto LABEL_19;
  }
  if (CFURLGetBytes(v9, buffer, 2048) == -1)
  {
    size_t v13 = CFURLGetBytes(v9, 0, 0);
    CFIndex v14 = v13;
    if (v13 != -1)
    {
      v11 = (UInt8 *)malloc_type_malloc(v13, 0x4C7AD526uLL);
      CFURLGetBytes(v9, v11, v14);
      goto LABEL_11;
    }
LABEL_19:
    CFURLRef v6 = v9;
    goto LABEL_20;
  }
  v11 = buffer;
LABEL_11:
  CFIndex v15 = location - 1;
  CFURLRef v16 = CFURLCreateWithBytes(0, v11, v15, 0x8000100u, 0);
  if (!v16) {
    CFURLRef v16 = CFURLCreateWithBytes(0, v11, v15, 0x201u, 0);
  }
  if (v11 != buffer) {
    free(v11);
  }
  if (v16) {
    CFURLRef v17 = v16;
  }
  else {
    CFURLRef v17 = v9;
  }
  CFURLRef v6 = v17;

LABEL_20:
  v18 = (const UInt8 *)[v5 bytes];
  if (*v18 == 47 && !v6)
  {
LABEL_22:
    CFURLRef v19 = 0;
    goto LABEL_26;
  }
  CFURLRef v19 = CFURLCreateAbsoluteURLWithBytes(0, v18, v7, 0x8000100u, v6, 1u);
  if (!v19)
  {
    uint64_t v12 = (uint64_t)CFURLCreateAbsoluteURLWithBytes(0, v18, v7, 0x201u, v6, 1u);
    goto LABEL_25;
  }
LABEL_26:

  return v19;
}

- (id)_lp_simplifiedStringForDisplayOnly:()LPPrivate
{
  size_t v4 = objc_msgSend(a1, "_lp_userVisibleString");
  id v5 = objc_msgSend(v4, "_lp_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:", 1023, a3);

  return v5;
}

- (id)_lp_URLByDeletingCommonIndexPageNames
{
  if (-[NSURL(LPPrivate) _lp_URLByDeletingCommonIndexPageNames]::onceToken != -1) {
    dispatch_once(&-[NSURL(LPPrivate) _lp_URLByDeletingCommonIndexPageNames]::onceToken, &__block_literal_global);
  }
  v2 = (void *)-[NSURL(LPPrivate) _lp_URLByDeletingCommonIndexPageNames]::commonIndexPageNames;
  CFIndex v3 = [a1 lastPathComponent];
  size_t v4 = [v3 lowercaseString];
  LODWORD(v2) = [v2 containsObject:v4];

  if (v2)
  {
    id v5 = [a1 URLByDeletingLastPathComponent];
  }
  else
  {
    id v5 = a1;
  }
  return v5;
}

- (id)_lp_URLBySortingQueryItems
{
  v8[1] = *MEMORY[0x263EF8340];
  v1 = (void *)[objc_alloc(MEMORY[0x263F08BA0]) initWithURL:a1 resolvingAgainstBaseURL:0];
  v2 = (void *)[objc_alloc(MEMORY[0x263F08B30]) initWithKey:@"name" ascending:1 selector:sel_compare_];
  CFIndex v3 = [v1 percentEncodedQueryItems];
  v8[0] = v2;
  size_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  id v5 = [v3 sortedArrayUsingDescriptors:v4];
  [v1 setPercentEncodedQueryItems:v5];

  CFURLRef v6 = [v1 URL];

  return v6;
}

@end