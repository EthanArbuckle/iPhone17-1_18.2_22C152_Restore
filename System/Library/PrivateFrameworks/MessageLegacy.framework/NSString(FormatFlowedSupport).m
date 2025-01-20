@interface NSString(FormatFlowedSupport)
- (__CFString)mf_convertFromFlowedText:()FormatFlowedSupport visuallyEmpty:;
@end

@implementation NSString(FormatFlowedSupport)

- (__CFString)mf_convertFromFlowedText:()FormatFlowedSupport visuallyEmpty:
{
  unint64_t v28 = [a1 length];
  unint64_t v31 = 0;
  if (a4)
  {
    uint64_t v7 = objc_msgSend(a1, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x1E4F28B88], "whitespaceAndNewlineCharacterSet"));
    uint64_t v9 = v8;
    if ([a1 length])
    {
      if (v7) {
        BOOL v10 = 0;
      }
      else {
        BOOL v10 = v9 == [a1 length];
      }
    }
    else
    {
      BOOL v10 = 1;
    }
    *a4 = v10;
  }
  CFAllocatorRef v11 = (const __CFAllocator *)MFGetMappedAllocator();
  CFMutableStringRef Mutable = CFStringCreateMutable(v11, 0);
  v13 = Mutable;
  if ((a3 & 8) != 0) {
    [(__CFString *)Mutable appendString:@"<HTML><BODY>"];
  }
  if (!v28)
  {
    v19 = 0;
    uint64_t v15 = 0;
    id v14 = 0;
    goto LABEL_66;
  }
  id v14 = 0;
  uint64_t v15 = 0;
  do
  {
    uint64_t v16 = v15;
    unint64_t v29 = 0;
    unint64_t v30 = 0;
    id v17 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    objc_msgSend(a1, "getLineStart:end:contentsEnd:forRange:", &v31, &v29, &v30, v31, 0);
    unint64_t v18 = v30;
    if (v30 >= v29) {
      v19 = 0;
    }
    else {
      v19 = @"\n";
    }
    unint64_t v20 = v31;
    if (v31 >= v30)
    {
      uint64_t v15 = 0;
      goto LABEL_25;
    }
    uint64_t v15 = 0;
    while (1)
    {
      int v21 = objc_msgSend(a1, "characterAtIndex:", v20, v28);
      if (v21 != 62) {
        break;
      }
      ++v15;
LABEL_21:
      ++v20;
      unint64_t v18 = v30;
      if (v20 >= v30) {
        goto LABEL_25;
      }
    }
    if ((a3 & 1) == 0 && v21 == 32) {
      goto LABEL_21;
    }
    unint64_t v18 = v30;
LABEL_25:
    if (v20 >= v18) {
      goto LABEL_37;
    }
    if (a3)
    {
      if ([a1 characterAtIndex:v20] == 32) {
        ++v20;
      }
LABEL_37:
      if (!v14) {
        goto LABEL_41;
      }
LABEL_38:
      if (v16 != v15 && [v14 length])
      {
        _appendParagraphToOutput(v13, v14, v16, (uint64_t)v19, (a3 >> 3) & 1);
        [v14 setString:&stru_1F265CF90];
      }
      goto LABEL_41;
    }
    if (v20 <= v31) {
      goto LABEL_37;
    }
    if (!v15)
    {
      unint64_t v20 = v31;
      if (!v14) {
        goto LABEL_41;
      }
      goto LABEL_38;
    }
    uint64_t v22 = objc_msgSend(a1, "rangeOfString:options:range:", @">", 4, v31, v20 - v31);
    uint64_t v23 = v22 + 2;
    if (v20 < v22 + 2) {
      uint64_t v23 = v20;
    }
    if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v20 = v23;
    }
    if (v14) {
      goto LABEL_38;
    }
LABEL_41:
    v24 = objc_msgSend(a1, "substringWithRange:", v20, v30 - v20, v28);
    if ((a3 & 1) == 0) {
      goto LABEL_60;
    }
    if (v31 >= v30 || [a1 characterAtIndex:v30 - 1] != 32) {
      goto LABEL_73;
    }
    if (v30 - v20 == 3 && [a1 characterAtIndex:v20] == 45)
    {
      BOOL v25 = [a1 characterAtIndex:v20 + 1] != 45;
      if ((a3 & 2) == 0) {
        goto LABEL_52;
      }
    }
    else
    {
      BOOL v25 = 1;
      if ((a3 & 2) == 0) {
        goto LABEL_52;
      }
    }
    if (v25 && [v24 length])
    {
      v24 = objc_msgSend(v24, "substringToIndex:", objc_msgSend(v24, "length") - 1);
      goto LABEL_53;
    }
LABEL_52:
    if (!v25)
    {
LABEL_73:
      if ([v14 length])
      {
        char v26 = 0;
        if (!v14) {
          goto LABEL_57;
        }
        goto LABEL_58;
      }
LABEL_60:
      _appendParagraphToOutput(v13, v24, v15, (uint64_t)v19, (a3 >> 3) & 1);
      goto LABEL_61;
    }
LABEL_53:
    char v26 = 1;
    if (!v14) {
LABEL_57:
    }
      id v14 = objc_alloc_init(MEMORY[0x1E4F28E78]);
LABEL_58:
    [v14 appendString:v24];
    if ((v26 & 1) == 0)
    {
      _appendParagraphToOutput(v13, v14, v15, (uint64_t)v19, (a3 >> 3) & 1);
      [v14 setString:&stru_1F265CF90];
    }
LABEL_61:
    unint64_t v31 = v29;
    [v17 drain];
  }
  while (v31 < v28);
LABEL_66:
  if (objc_msgSend(v14, "length", v28)) {
    _appendParagraphToOutput(v13, v14, v15, (uint64_t)v19, (a3 >> 3) & 1);
  }

  if ((a3 & 8) != 0) {
    [(__CFString *)v13 appendString:@"</BODY></HTML>"];
  }
  return v13;
}

@end