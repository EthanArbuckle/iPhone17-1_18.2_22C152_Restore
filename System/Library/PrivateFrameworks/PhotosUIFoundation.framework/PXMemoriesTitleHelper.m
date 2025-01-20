@interface PXMemoriesTitleHelper
+ (PXMemoriesTitleHelper)defaultHelper;
- (BOOL)_isTextLongerThanPreferredLine:(id)a3 range:(_NSRange)a4 minimumScaleFactor:(double)a5;
- (NSString)softLineBreak;
- (NSString)truncationToken;
- (PXMemoriesTitleHelper)init;
- (double)minimumScaleFactor;
- (id)displayableTextForTitle:(id)a3 intent:(int64_t)a4;
- (id)titleForDisplayableText:(id)a3 titleCategory:(int64_t)a4 options:(unint64_t)a5;
- (int64_t)preferredLineLength;
- (void)setMinimumScaleFactor:(double)a3;
- (void)setPreferredLineLength:(int64_t)a3;
- (void)setSoftLineBreak:(id)a3;
- (void)setTruncationToken:(id)a3;
@end

@implementation PXMemoriesTitleHelper

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncationToken, 0);

  objc_storeStrong((id *)&self->_softLineBreak, 0);
}

- (void)setMinimumScaleFactor:(double)a3
{
  self->_minimumScaleFactor = a3;
}

- (double)minimumScaleFactor
{
  return self->_minimumScaleFactor;
}

- (void)setPreferredLineLength:(int64_t)a3
{
  self->_preferredLineLength = a3;
}

- (int64_t)preferredLineLength
{
  return self->_preferredLineLength;
}

- (void)setTruncationToken:(id)a3
{
}

- (NSString)truncationToken
{
  return self->_truncationToken;
}

- (void)setSoftLineBreak:(id)a3
{
}

- (NSString)softLineBreak
{
  return self->_softLineBreak;
}

- (BOOL)_isTextLongerThanPreferredLine:(id)a3 range:(_NSRange)a4 minimumScaleFactor:(double)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a3;
  v10 = [MEMORY[0x263F08708] whitespaceCharacterSet];
  if (length >= 2)
  {
    NSUInteger v11 = length;
    NSUInteger v12 = location;
    while (objc_msgSend(v10, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v12)))
    {
      ++v12;
      if (--v11 <= 1)
      {
        NSUInteger length = 1;
        goto LABEL_11;
      }
    }
    uint64_t v13 = 0;
    uint64_t v14 = length + location - 1;
    NSUInteger length = 1;
    while (objc_msgSend(v10, "characterIsMember:", objc_msgSend(v9, "characterAtIndex:", v14 + v13)))
    {
      if (--v13 + v11 <= 1) {
        goto LABEL_11;
      }
    }
    NSUInteger length = v11 + v13;
  }
LABEL_11:
  BOOL v15 = 1.0 / a5 * (double)[(PXMemoriesTitleHelper *)self preferredLineLength] < (double)length;

  return v15;
}

- (id)titleForDisplayableText:(id)a3 titleCategory:(int64_t)a4 options:(unint64_t)a5
{
  char v5 = a5;
  id v8 = a3;
  id v9 = v8;
  if (-[PXMemoriesTitleHelper _isTextLongerThanPreferredLine:range:minimumScaleFactor:](self, "_isTextLongerThanPreferredLine:range:minimumScaleFactor:", v8, 0, [v8 length], 1.0))
  {
    if (v5)
    {
      v18 = [MEMORY[0x263F08708] punctuationCharacterSet];
      v19 = (void *)[v18 mutableCopy];

      v20 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      [v19 formUnionWithCharacterSet:v20];

      [v19 removeCharactersInString:@"]}"]);
      v48[0] = 0;
      v48[1] = v48;
      v48[2] = 0x2020000000;
      v48[3] = 0;
      uint64_t v42 = 0;
      v43 = &v42;
      uint64_t v44 = 0x3032000000;
      unint64_t v45 = (unint64_t)__Block_byref_object_copy_;
      v46 = __Block_byref_object_dispose_;
      id v47 = 0;
      uint64_t v38 = 0;
      v39 = &v38;
      uint64_t v40 = 0x2020000000;
      char v41 = 0;
      uint64_t v21 = [v8 length];
      uint64_t v27 = MEMORY[0x263EF8330];
      uint64_t v28 = 3221225472;
      v29 = __71__PXMemoriesTitleHelper_titleForDisplayableText_titleCategory_options___block_invoke_19;
      v30 = &unk_26545A598;
      v34 = v48;
      id v22 = v19;
      id v31 = v22;
      id v9 = v8;
      id v32 = v9;
      v33 = self;
      v36 = &v38;
      int64_t v37 = a4;
      v35 = &v42;
      objc_msgSend(v9, "enumerateSubstringsInRange:options:usingBlock:", 0, v21, 3, &v27);
      v23 = (void *)v43[5];
      if (v23)
      {
        id v24 = v23;

        if (*((unsigned char *)v39 + 24))
        {
          v25 = [(PXMemoriesTitleHelper *)self truncationToken];
          id v9 = [v24 stringByAppendingString:v25];
        }
        else
        {
          id v9 = v24;
        }
      }

      _Block_object_dispose(&v38, 8);
      _Block_object_dispose(&v42, 8);

      _Block_object_dispose(v48, 8);
    }
    else
    {
      uint64_t v42 = 0;
      v43 = &v42;
      uint64_t v44 = 0x2020000000;
      unint64_t v45 = 0;
      unint64_t v45 = (unint64_t)[v8 length] >> 1;
      uint64_t v10 = [v8 length];
      v49[0] = MEMORY[0x263EF8330];
      v49[1] = 3221225472;
      v49[2] = __71__PXMemoriesTitleHelper_titleForDisplayableText_titleCategory_options___block_invoke;
      v49[3] = &unk_26545A758;
      v49[4] = &v42;
      objc_msgSend(v8, "enumerateSubstringsInRange:options:usingBlock:", 0, v10, 3, v49);
      unint64_t v11 = v43[3];
      if (v11 < [v8 length])
      {
        NSUInteger v12 = objc_msgSend(MEMORY[0x263F08708], "characterSetWithCharactersInString:", @"([{");
        uint64_t v13 = v43[3];
        if (v13 >= 2)
        {
          do
          {
            if (!objc_msgSend(v12, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", v13 - 1))) {
              break;
            }
            uint64_t v14 = v43[3];
            uint64_t v13 = v14 - 1;
            v43[3] = v14 - 1;
          }
          while (v14 > 2);
        }
      }
      uint64_t v15 = v43[3];
      id v9 = v8;
      if (v15 >= 1)
      {
        id v9 = v8;
        if (v15 < (unint64_t)[v8 length])
        {
          uint64_t v16 = v43[3];
          v17 = [(PXMemoriesTitleHelper *)self softLineBreak];
          objc_msgSend(v8, "stringByReplacingCharactersInRange:withString:", v16, 0, v17);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
        }
      }
      _Block_object_dispose(&v42, 8);
    }
  }

  return v9;
}

uint64_t __71__PXMemoriesTitleHelper_titleForDisplayableText_titleCategory_options___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unsigned char *a7)
{
  uint64_t v7 = *(void *)(*(void *)(result + 32) + 8);
  unint64_t v8 = *(void *)(v7 + 24);
  if (v8 >= a5 && v8 - a5 < a6)
  {
    if (v8 >= a3 + (a4 >> 1)) {
      unint64_t v10 = a6;
    }
    else {
      unint64_t v10 = 0;
    }
    *(void *)(v7 + 24) = a5 + v10;
    *a7 = 1;
  }
  return result;
}

void __71__PXMemoriesTitleHelper_titleForDisplayableText_titleCategory_options___block_invoke_19(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v11 = a2;
  if ((uint64_t)++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) >= 2)
  {
    id v30 = v11;
    unint64_t v12 = a5 + a6;
    do
    {
      unint64_t v13 = v12;
      if (v12 < 2) {
        break;
      }
      --v12;
    }
    while ((objc_msgSend(*(id *)(a1 + 32), "characterIsMember:", objc_msgSend(*(id *)(a1 + 40), "characterAtIndex:", v13 - 1)) & 1) != 0);
    if (v13 == [*(id *)(a1 + 40) length] - 1) {
      unint64_t v14 = v13 + 1;
    }
    else {
      unint64_t v14 = v13;
    }
    uint64_t v15 = *(void **)(a1 + 48);
    uint64_t v16 = [*(id *)(a1 + 40) substringToIndex:v14];
    v17 = [v15 titleForDisplayableText:v16 titleCategory:*(void *)(a1 + 80) options:0];

    BOOL v18 = v14 < [*(id *)(a1 + 40) length];
    uint64_t v19 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v21 = *(void *)(v19 + 40);
    v20 = (id *)(v19 + 40);
    if (v21)
    {
      id v22 = [*(id *)(a1 + 48) softLineBreak];
      uint64_t v23 = [v17 rangeOfString:v22 options:4];
      uint64_t v25 = v24;

      uint64_t v26 = [v17 length];
      if (v23 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v27 = v23 + v25;
        uint64_t v28 = v26 - v27;
        v29 = *(void **)(a1 + 48);
        [v29 minimumScaleFactor];
        if ([v29 _isTextLongerThanPreferredLine:v17 range:v27 minimumScaleFactor:v28])
        {
          *a7 = 1;
LABEL_14:

          id v11 = v30;
          goto LABEL_15;
        }
      }
      v20 = (id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    }
    objc_storeStrong(v20, v17);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = v18;
    goto LABEL_14;
  }
LABEL_15:
}

- (id)displayableTextForTitle:(id)a3 intent:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = v6;
  if ((unint64_t)a4 <= 2)
  {
    unint64_t v8 = off_26545A5B8[a4];
    id v9 = [(PXMemoriesTitleHelper *)self softLineBreak];
    unint64_t v10 = [v6 stringByReplacingOccurrencesOfString:v9 withString:v8];

    id v11 = [v10 stringByReplacingOccurrencesOfString:@"\n" withString:v8];

    uint64_t v7 = [v11 stringByReplacingOccurrencesOfString:@"\u2028" withString:v8];
  }

  return v7;
}

- (PXMemoriesTitleHelper)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXMemoriesTitleHelper;
  v2 = [(PXMemoriesTitleHelper *)&v7 init];
  v3 = v2;
  if (v2)
  {
    softLineBreak = v2->_softLineBreak;
    v2->_softLineBreak = (NSString *)@"\n";

    truncationToken = v3->_truncationToken;
    v3->_truncationToken = (NSString *)@"…";

    v3->_preferredLineLength = 11;
    v3->_minimumScaleFactor = 0.600000024;
  }
  return v3;
}

+ (PXMemoriesTitleHelper)defaultHelper
{
  if (defaultHelper_onceToken != -1) {
    dispatch_once(&defaultHelper_onceToken, &__block_literal_global_2778);
  }
  v2 = (void *)defaultHelper_defaultHelper;

  return (PXMemoriesTitleHelper *)v2;
}

uint64_t __38__PXMemoriesTitleHelper_defaultHelper__block_invoke()
{
  v0 = objc_alloc_init(PXMemoriesTitleHelper);
  uint64_t v1 = defaultHelper_defaultHelper;
  defaultHelper_defaultHelper = (uint64_t)v0;

  return MEMORY[0x270F9A758](v0, v1);
}

@end