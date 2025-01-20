@interface NSMutableString(TCStringAdditions)
- (BOOL)tc_replaceSubstr:()TCStringAdditions with:range:;
- (uint64_t)tc_replaceAllSubstr:()TCStringAdditions with:;
- (uint64_t)tc_replaceAllSubstr:()TCStringAdditions with:range:;
- (uint64_t)tc_replaceSubstr:()TCStringAdditions with:;
- (void)tc_replaceAllSubstr:()TCStringAdditions with:escStr:;
- (void)tc_replaceAllSubstr:()TCStringAdditions with:escStr:range:;
@end

@implementation NSMutableString(TCStringAdditions)

- (uint64_t)tc_replaceSubstr:()TCStringAdditions with:
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(a1, "tc_replaceSubstr:with:range:", v6, v7, 0, objc_msgSend(a1, "length"));

  return v8;
}

- (BOOL)tc_replaceSubstr:()TCStringAdditions with:range:
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = objc_msgSend(a1, "rangeOfString:options:range:", v10, 0, a5, a6);
  uint64_t v14 = v13;
  if (v13)
  {
    uint64_t v15 = v12;
    if (v11 && [v11 length]) {
      objc_msgSend(a1, "replaceCharactersInRange:withString:", v15, v14, v11);
    }
    else {
      objc_msgSend(a1, "deleteCharactersInRange:", v15, v14);
    }
  }

  return v14 != 0;
}

- (uint64_t)tc_replaceAllSubstr:()TCStringAdditions with:
{
  return objc_msgSend(a1, "tc_replaceAllSubstr:with:escStr:", a3, a4, 0);
}

- (void)tc_replaceAllSubstr:()TCStringAdditions with:escStr:
{
  id v10 = a3;
  id v8 = a4;
  id v9 = a5;
  objc_msgSend(a1, "tc_replaceAllSubstr:with:escStr:range:", v10, v8, v9, 0, objc_msgSend(a1, "length"));
}

- (uint64_t)tc_replaceAllSubstr:()TCStringAdditions with:range:
{
  return objc_msgSend(a1, "tc_replaceAllSubstr:with:escStr:range:", a3, a4, 0, a5, a6);
}

- (void)tc_replaceAllSubstr:()TCStringAdditions with:escStr:range:
{
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  unint64_t v14 = objc_msgSend(a1, "rangeOfString:options:range:", v18, 0, a6, a7);
  for (uint64_t i = v15; i; uint64_t i = v17)
  {
    if (v13
      && [v13 length] <= v14
      && !objc_msgSend(a1, "compare:options:range:", v13, 0, v14 - objc_msgSend(v13, "length"), objc_msgSend(v13, "length")))
    {
      if (!--i) {
        break;
      }
      ++v14;
      if (!v12) {
        goto LABEL_11;
      }
    }
    else if (!v12)
    {
      goto LABEL_11;
    }
    if ([v12 length])
    {
      objc_msgSend(a1, "replaceCharactersInRange:withString:", v14, i, v12);
      v14 += [v12 length];
      goto LABEL_12;
    }
LABEL_11:
    objc_msgSend(a1, "deleteCharactersInRange:", v14, i);
LABEL_12:
    unint64_t v14 = objc_msgSend(a1, "rangeOfString:options:range:", v18, 0, v14, objc_msgSend(a1, "length") - v14);
  }
}

@end