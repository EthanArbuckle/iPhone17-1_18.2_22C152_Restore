@interface NSString(TYTextDirectionAnnotations)
- (id)textDirectionAnnotations;
@end

@implementation NSString(TYTextDirectionAnnotations)

- (id)textDirectionAnnotations
{
  v2 = objc_opt_new();
  v3 = [MEMORY[0x263F08708] numberCombiningCharacterSet];
  v4 = (void *)[objc_alloc(MEMORY[0x263F14040]) initWithUnit:0];
  id v5 = objc_alloc_init(MEMORY[0x263F14018]);
  [v4 setString:a1];
  uint64_t v46 = 0;
  v47 = &v46;
  uint64_t v48 = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = 0;
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  uint64_t v6 = [a1 length];
  uint64_t v27 = MEMORY[0x263EF8330];
  uint64_t v28 = 3221225472;
  v29 = __64__NSString_TYTextDirectionAnnotations__textDirectionAnnotations__block_invoke;
  v30 = &unk_2655598B8;
  v31 = a1;
  v35 = &v42;
  id v7 = v5;
  id v32 = v7;
  v36 = &v46;
  v37 = &v38;
  id v8 = v3;
  id v33 = v8;
  id v9 = v2;
  id v34 = v9;
  objc_msgSend(v4, "enumerateTokensInRange:usingBlock:", 0, v6, &v27);
  unint64_t v10 = v43[3];
  if (v10 < objc_msgSend(a1, "length", v27, v28, v29, v30, v31))
  {
    uint64_t v11 = v43[3];
    uint64_t v12 = [a1 length];
    uint64_t v13 = v12 - v43[3];
    v14 = objc_msgSend(a1, "substringWithRange:", v11, v13);
    [v7 processString:v14];
    v15 = (void *)MEMORY[0x263EFF960];
    v16 = [v7 dominantLanguage];
    uint64_t v17 = [v15 characterDirectionForLanguage:v16];

    if (*((unsigned char *)v39 + 24)
      && (v17 != 2
       || ([MEMORY[0x263F08708] punctuationCharacterSet],
           v18 = objc_claimAutoreleasedReturnValue(),
           [MEMORY[0x263F08708] characterSetWithCharactersInString:v14],
           v19 = objc_claimAutoreleasedReturnValue(),
           int v20 = [v18 isSupersetOfSet:v19],
           v19,
           v18,
           v20)))
    {
      v21 = [v9 lastObject];
      uint64_t v22 = [v21 range];
      [v21 range];
      objc_msgSend(v21, "setRange:", v22, v23 + v13);
    }
    else
    {
      v21 = +[TYTextDirectionAnnotation initWithRange:textDirection:](TYTextDirectionAnnotation, "initWithRange:textDirection:", v11, v13, v47[3]);
      [v9 addObject:v21];
    }
  }
  v24 = v34;
  id v25 = v9;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v25;
}

@end