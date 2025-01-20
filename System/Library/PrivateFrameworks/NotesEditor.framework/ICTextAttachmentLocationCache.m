@interface ICTextAttachmentLocationCache
- (BOOL)validateLocation:(unint64_t)a3 againstViewIdentifier:(id)a4;
- (Class)cachedTextAttachmentType;
- (ICLayoutManager)layoutManager;
- (ICTextAttachmentLocationCache)initWithLayoutManager:(id)a3 cachedTextAttachmentType:(Class)a4;
- (NSMutableDictionary)locationByTextAttachmentIdentifier;
- (unint64_t)locationForTextAttachmentOfViewIdentifier:(id)a3;
- (unint64_t)locationForTextAttachmentOfViewIdentifier:(id)a3 keyExistsBeforeEnumeration:(BOOL *)a4 validationSuccessful:(BOOL *)a5 stepsOfEnumeration:(unint64_t *)a6;
- (unint64_t)nextLocationForRange:(_NSRange)a3;
- (unint64_t)previousScanHaltLocation;
- (void)clear;
- (void)enumerateTextAttachmentsInRangeUsingBlock:(id)a3;
- (void)enumerateTextAttachmentsInRangeWithFirstEnumerateRangeResult:(_NSRange *)a3 secondEnumerateRangeResult:(_NSRange *)a4 usingBlock:(id)a5;
- (void)forgetLocationForViewIdentifier:(id)a3;
- (void)setCachedTextAttachmentType:(Class)a3;
- (void)setLayoutManager:(id)a3;
- (void)setLocation:(unint64_t)a3 forTextAttachmentOfViewIdentifier:(id)a4;
- (void)setPreviousScanHaltLocation:(unint64_t)a3;
@end

@implementation ICTextAttachmentLocationCache

- (NSMutableDictionary)locationByTextAttachmentIdentifier
{
  locationByTextAttachmentIdentifier = self->_locationByTextAttachmentIdentifier;
  if (!locationByTextAttachmentIdentifier)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v5 = self->_locationByTextAttachmentIdentifier;
    self->_locationByTextAttachmentIdentifier = v4;

    locationByTextAttachmentIdentifier = self->_locationByTextAttachmentIdentifier;
  }

  return locationByTextAttachmentIdentifier;
}

- (ICTextAttachmentLocationCache)initWithLayoutManager:(id)a3 cachedTextAttachmentType:(Class)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICTextAttachmentLocationCache;
  v7 = [(ICTextAttachmentLocationCache *)&v10 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_layoutManager, v6);
    v8->_previousScanHaltLocation = 0;
    objc_storeStrong((id *)&v8->_cachedTextAttachmentType, a4);
  }

  return v8;
}

- (unint64_t)locationForTextAttachmentOfViewIdentifier:(id)a3
{
  return [(ICTextAttachmentLocationCache *)self locationForTextAttachmentOfViewIdentifier:a3 keyExistsBeforeEnumeration:0 validationSuccessful:0 stepsOfEnumeration:0];
}

- (unint64_t)locationForTextAttachmentOfViewIdentifier:(id)a3 keyExistsBeforeEnumeration:(BOOL *)a4 validationSuccessful:(BOOL *)a5 stepsOfEnumeration:(unint64_t *)a6
{
  id v10 = a3;
  v11 = v10;
  if (v10)
  {
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__16;
    v33 = __Block_byref_object_dispose__16;
    id v12 = v10;
    id v34 = v12;
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__16;
    v27 = __Block_byref_object_dispose__16;
    v13 = [(ICTextAttachmentLocationCache *)self locationByTextAttachmentIdentifier];
    id v28 = [v13 objectForKeyedSubscript:v30[5]];

    v14 = v24;
    if (a4) {
      *a4 = v24[5] != 0;
    }
    v15 = (void *)v14[5];
    if (v15)
    {
      uint64_t v16 = [v15 unsignedIntegerValue];
      if (![(ICTextAttachmentLocationCache *)self validateLocation:v16 againstViewIdentifier:v30[5]])
      {
        v17 = [(ICTextAttachmentLocationCache *)self locationByTextAttachmentIdentifier];
        [v17 removeObjectForKey:v12];

        v18 = (void *)v24[5];
        v24[5] = 0;
      }
    }
    if (a5) {
      *a5 = v24[5] != 0;
    }
    if (a6) {
      *a6 = 0;
    }
    v19 = (void *)v24[5];
    if (v19) {
      goto LABEL_13;
    }
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __142__ICTextAttachmentLocationCache_locationForTextAttachmentOfViewIdentifier_keyExistsBeforeEnumeration_validationSuccessful_stepsOfEnumeration___block_invoke;
    v22[3] = &unk_2640BAF98;
    v22[4] = self;
    v22[5] = &v23;
    v22[6] = &v29;
    v22[7] = a6;
    [(ICTextAttachmentLocationCache *)self enumerateTextAttachmentsInRangeUsingBlock:v22];
    v19 = (void *)v24[5];
    if (v19) {
LABEL_13:
    }
      unint64_t v20 = [v19 unsignedIntegerValue];
    else {
      unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    }
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v20;
}

void __142__ICTextAttachmentLocationCache_locationForTextAttachmentOfViewIdentifier_keyExistsBeforeEnumeration_validationSuccessful_stepsOfEnumeration___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v17 = a2;
  v8 = *(void **)(a1 + 56);
  if (v8) {
    ++*v8;
  }
  [*(id *)(a1 + 32) cachedTextAttachmentType];
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    v9 = ICCheckedDynamicCast();
    id v10 = [v9 viewIdentifier];
    if (v10)
    {
      v11 = [NSNumber numberWithUnsignedInteger:a3];
      id v12 = [*(id *)(a1 + 32) locationByTextAttachmentIdentifier];
      [v12 setObject:v11 forKeyedSubscript:v10];
    }
    v13 = [*(id *)(a1 + 32) locationByTextAttachmentIdentifier];
    uint64_t v14 = [v13 objectForKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    uint64_t v15 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      *a5 = 1;
    }
  }
}

- (BOOL)validateLocation:(unint64_t)a3 againstViewIdentifier:(id)a4
{
  id v6 = a4;
  v7 = v6;
  char v8 = 0;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && v6)
  {
    v9 = [(ICTextAttachmentLocationCache *)self layoutManager];
    id v10 = [v9 textStorage];
    unint64_t v11 = [v10 length];

    if (v11 <= a3)
    {
      char v8 = 0;
    }
    else
    {
      id v12 = [(ICTextAttachmentLocationCache *)self layoutManager];
      v13 = [v12 textStorage];
      uint64_t v14 = [v13 attribute:*MEMORY[0x263F814A0] atIndex:a3 effectiveRange:0];

      [(ICTextAttachmentLocationCache *)self cachedTextAttachmentType];
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        uint64_t v15 = ICCheckedDynamicCast();
        uint64_t v16 = [v15 viewIdentifier];
        char v8 = [v7 isEqualToString:v16];
      }
      else
      {
        char v8 = 0;
      }
    }
  }

  return v8;
}

- (void)setLocation:(unint64_t)a3 forTextAttachmentOfViewIdentifier:(id)a4
{
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0)
  {
    char v8 = NSNumber;
    id v9 = a4;
    id v11 = [v8 numberWithUnsignedInteger:a3];
    id v10 = [(ICTextAttachmentLocationCache *)self locationByTextAttachmentIdentifier];
    [v10 setObject:v11 forKeyedSubscript:v9];
  }
}

- (void)forgetLocationForViewIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v13 = v4;
    id v6 = [(ICTextAttachmentLocationCache *)self locationByTextAttachmentIdentifier];
    v7 = [v6 objectForKeyedSubscript:v13];

    if (v7)
    {
      unint64_t v8 = [v7 unsignedIntegerValue];
      id v9 = [(ICTextAttachmentLocationCache *)self layoutManager];
      id v10 = [v9 textStorage];
      if (v8 >= [v10 length]) {
        uint64_t v11 = 0;
      }
      else {
        uint64_t v11 = [v7 unsignedIntegerValue];
      }
      [(ICTextAttachmentLocationCache *)self setPreviousScanHaltLocation:v11];

      id v12 = [(ICTextAttachmentLocationCache *)self locationByTextAttachmentIdentifier];
      [v12 removeObjectForKey:v13];
    }
    id v5 = v13;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)clear
{
  [(ICTextAttachmentLocationCache *)self setPreviousScanHaltLocation:0];
  id v3 = [(ICTextAttachmentLocationCache *)self locationByTextAttachmentIdentifier];
  [v3 removeAllObjects];
}

- (unint64_t)nextLocationForRange:(_NSRange)a3
{
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a3.length == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  unint64_t v5 = a3.location + a3.length;
  id v6 = [(ICTextAttachmentLocationCache *)self layoutManager];
  v7 = [v6 textStorage];
  unint64_t v8 = [v7 length];

  if (v5 >= v8) {
    return 0;
  }
  else {
    return v5;
  }
}

- (void)enumerateTextAttachmentsInRangeUsingBlock:(id)a3
{
}

- (void)enumerateTextAttachmentsInRangeWithFirstEnumerateRangeResult:(_NSRange *)a3 secondEnumerateRangeResult:(_NSRange *)a4 usingBlock:(id)a5
{
  id v8 = a5;
  if (v8)
  {
    id v9 = [(ICTextAttachmentLocationCache *)self layoutManager];
    id v10 = [v9 textStorage];
    NSUInteger v11 = [v10 length];

    uint64_t v32 = 0;
    v33 = &v32;
    uint64_t v34 = 0x2020000000;
    char v35 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    unint64_t v31 = 0;
    unint64_t v31 = [(ICTextAttachmentLocationCache *)self previousScanHaltLocation];
    uint64_t v20 = MEMORY[0x263EF8330];
    uint64_t v21 = 3221225472;
    v22 = __132__ICTextAttachmentLocationCache_enumerateTextAttachmentsInRangeWithFirstEnumerateRangeResult_secondEnumerateRangeResult_usingBlock___block_invoke;
    uint64_t v23 = &unk_2640BAFC0;
    v26 = &v32;
    v27 = &v28;
    v24 = self;
    id v25 = v8;
    id v12 = _Block_copy(&v20);
    if ([(ICTextAttachmentLocationCache *)self previousScanHaltLocation] < v11)
    {
      NSUInteger v13 = [(ICTextAttachmentLocationCache *)self previousScanHaltLocation];
      NSUInteger v14 = v11 - [(ICTextAttachmentLocationCache *)self previousScanHaltLocation];
      if (a3)
      {
        a3->location = v13;
        a3->length = v14;
      }
      uint64_t v15 = [(ICTextAttachmentLocationCache *)self layoutManager];
      uint64_t v16 = [v15 textStorage];
      objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", *MEMORY[0x263F814A0], v13, v14, 0, v12);
    }
    if (!*((unsigned char *)v33 + 24))
    {
      unint64_t v17 = [(ICTextAttachmentLocationCache *)self previousScanHaltLocation];
      if (v17 < v11) {
        NSUInteger v11 = v17;
      }
      if (v11 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (a4)
        {
          a4->location = 0;
          a4->length = v11;
        }
        v18 = [(ICTextAttachmentLocationCache *)self layoutManager];
        v19 = [v18 textStorage];
        objc_msgSend(v19, "enumerateAttribute:inRange:options:usingBlock:", *MEMORY[0x263F814A0], 0, v11, 0, v12);
      }
    }
    [(ICTextAttachmentLocationCache *)self setPreviousScanHaltLocation:v29[3]];

    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
}

uint64_t __132__ICTextAttachmentLocationCache_enumerateTextAttachmentsInRangeWithFirstEnumerateRangeResult_secondEnumerateRangeResult_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v9 = a2;
  uint64_t v10 = *(void *)(a1 + 40);
  id v12 = v9;
  if (v10)
  {
    uint64_t v10 = (*(uint64_t (**)(uint64_t, id, uint64_t, uint64_t, unsigned char *))(v10 + 16))(v10, v9, a3, a4, a5);
    id v9 = v12;
  }
  if (*a5)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "nextLocationForRange:", a3, a4);
    id v9 = v12;
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
  }

  return MEMORY[0x270F9A758](v10, v9);
}

- (unint64_t)previousScanHaltLocation
{
  return self->_previousScanHaltLocation;
}

- (void)setPreviousScanHaltLocation:(unint64_t)a3
{
  self->_previousScanHaltLocation = a3;
}

- (ICLayoutManager)layoutManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutManager);

  return (ICLayoutManager *)WeakRetained;
}

- (void)setLayoutManager:(id)a3
{
}

- (Class)cachedTextAttachmentType
{
  return self->_cachedTextAttachmentType;
}

- (void)setCachedTextAttachmentType:(Class)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedTextAttachmentType, 0);
  objc_destroyWeak((id *)&self->_layoutManager);

  objc_storeStrong((id *)&self->_locationByTextAttachmentIdentifier, 0);
}

@end