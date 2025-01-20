@interface SXDateParser
- (id)dateFromString:(id)a3;
@end

@implementation SXDateParser

- (id)dateFromString:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"([0-9]{4})-([01][0-9])-([0-3][0-9])(T([0-2][0-9]):([0-5][0-9]):([0-5][0-9])(Z|([+-])([0-2][0-9]):([0-9][0-9]))?)?" options:1 error:0];
    id v5 = objc_alloc_init(MEMORY[0x263EFF918]);
    id v6 = objc_alloc(MEMORY[0x263EFF8F0]);
    v7 = (void *)[v6 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
    [v5 setCalendar:v7];

    uint64_t v30 = 0;
    v31 = &v30;
    uint64_t v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__2;
    v34 = __Block_byref_object_dispose__2;
    id v35 = [MEMORY[0x263EFFA18] systemTimeZone];
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    uint64_t v20 = 0;
    v21 = &v20;
    uint64_t v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__2;
    v24 = __Block_byref_object_dispose__2;
    id v25 = 0;
    uint64_t v8 = [v3 length];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __31__SXDateParser_dateFromString___block_invoke;
    v14[3] = &unk_264653E70;
    id v15 = v3;
    v17 = &v30;
    v18 = &v20;
    v19 = &v26;
    id v9 = v5;
    id v16 = v9;
    objc_msgSend(v4, "enumerateMatchesInString:options:range:usingBlock:", v15, 2, 0, v8, v14);
    if ([v9 day] == 0x7FFFFFFFFFFFFFFFLL
      || [v9 month] == 0x7FFFFFFFFFFFFFFFLL
      || [v9 year] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
    }
    else
    {
      [v9 setTimeZone:v31[5]];
      v12 = [SXParsedDate alloc];
      v13 = [v9 date];
      v10 = [(SXParsedDate *)v12 initWithDate:v13 containedTime:*((unsigned __int8 *)v27 + 24) timeZone:v21[5]];
    }
    _Block_object_dispose(&v20, 8);

    _Block_object_dispose(&v26, 8);
    _Block_object_dispose(&v30, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __31__SXDateParser_dateFromString___block_invoke(uint64_t a1, void *a2)
{
  id v29 = a2;
  if ((unint64_t)[v29 numberOfRanges] >= 2)
  {
    uint64_t v3 = 1;
    while (1)
    {
      uint64_t v4 = [v29 rangeAtIndex:v3];
      if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_38;
      }
      uint64_t v6 = v5;
      if (!v5) {
        goto LABEL_38;
      }
      uint64_t v7 = v4;
      if (v4 + v5 > (unint64_t)[*(id *)(a1 + 32) length]) {
        goto LABEL_38;
      }
      uint64_t v8 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v7, v6);
      id v9 = v8;
      if (v3 == 9) {
        break;
      }
      if (v3 == 8)
      {
        v10 = [v8 uppercaseString];
        int v11 = [v10 isEqualToString:@"Z"];

        if (!v11) {
          goto LABEL_22;
        }
        v12 = (void *)MEMORY[0x263EFFA18];
        uint64_t v13 = 0;
LABEL_18:
        uint64_t v25 = [v12 timeZoneForSecondsFromGMT:v13];
        uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
        v27 = *(void **)(v26 + 40);
        *(void *)(v26 + 40) = v25;

        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
        goto LABEL_37;
      }
      if (v3 != 4 || !v8)
      {
LABEL_22:
        uint64_t v28 = [v9 integerValue];
        if (v3 == 1 && v28)
        {
          [*(id *)(a1 + 40) setYear:v28];
        }
        else if (v3 == 2 && v28)
        {
          [*(id *)(a1 + 40) setMonth:v28];
        }
        else if (v3 == 3 && v28)
        {
          [*(id *)(a1 + 40) setDay:v28];
        }
        else
        {
          switch(v3)
          {
            case 7:
              [*(id *)(a1 + 40) setSecond:v28];
              break;
            case 6:
              [*(id *)(a1 + 40) setMinute:v28];
              break;
            case 5:
              [*(id *)(a1 + 40) setHour:v28];
              break;
          }
        }
        goto LABEL_37;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
LABEL_37:

LABEL_38:
      if (++v3 >= (unint64_t)[v29 numberOfRanges]) {
        goto LABEL_39;
      }
    }
    uint64_t v14 = [v29 rangeAtIndex:10];
    uint64_t v16 = v15;
    uint64_t v17 = [v29 rangeAtIndex:11];
    if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_37;
    }
    if (!v16) {
      goto LABEL_37;
    }
    uint64_t v19 = v17;
    if (v17 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_37;
    }
    uint64_t v20 = v18;
    if (!v18) {
      goto LABEL_37;
    }
    v21 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v14, v16);
    uint64_t v22 = [v21 integerValue];

    v23 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", v19, v20);
    uint64_t v24 = [v23 integerValue];

    if ([v9 isEqualToString:@"-"]) {
      uint64_t v13 = -60 * (v24 + 60 * v22);
    }
    else {
      uint64_t v13 = 60 * (v24 + 60 * v22);
    }
    v12 = (void *)MEMORY[0x263EFFA18];
    goto LABEL_18;
  }
LABEL_39:
}

@end