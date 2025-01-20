@interface NSString(FormatFlowedSupport)
- (__CFString)mf_convertFromFlowedText:()FormatFlowedSupport visuallyEmpty:;
@end

@implementation NSString(FormatFlowedSupport)

- (__CFString)mf_convertFromFlowedText:()FormatFlowedSupport visuallyEmpty:
{
  unint64_t v33 = [a1 length];
  unint64_t v37 = 0;
  if (a4)
  {
    v7 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
    uint64_t v8 = [a1 rangeOfCharacterFromSet:v7];
    uint64_t v10 = v9;

    if ([a1 length])
    {
      if (v8) {
        BOOL v11 = 0;
      }
      else {
        BOOL v11 = v10 == [a1 length];
      }
    }
    else
    {
      BOOL v11 = 1;
    }
    *a4 = v11;
  }
  CFAllocatorRef v12 = (const __CFAllocator *)MFGetMappedAllocator();
  CFMutableStringRef Mutable = CFStringCreateMutable(v12, 0);
  if ((a3 & 8) != 0) {
    [(__CFString *)Mutable appendString:@"<HTML><BODY>"];
  }
  if (v37 >= v33)
  {
    v18 = 0;
    uint64_t v21 = 0;
    id v13 = 0;
    goto LABEL_68;
  }
  id v13 = 0;
  uint64_t v14 = 0;
  v15 = 0;
  do
  {
    unint64_t v35 = 0xAAAAAAAAAAAAAAAALL;
    unint64_t v36 = 0xAAAAAAAAAAAAAAAALL;
    v16 = (void *)MEMORY[0x1AD0E3E00]();
    objc_msgSend(a1, "getLineStart:end:contentsEnd:forRange:", &v37, &v35, &v36, v37, 0);
    v17 = @"\n";
    if (v36 >= v35) {
      v17 = 0;
    }
    v18 = v17;

    unint64_t v19 = v36;
    unint64_t v20 = v37;
    if (v37 >= v36)
    {
      uint64_t v21 = 0;
      goto LABEL_24;
    }
    uint64_t v21 = 0;
    while (1)
    {
      int v22 = [a1 characterAtIndex:v20];
      if (v22 != 62) {
        break;
      }
      ++v21;
LABEL_20:
      ++v20;
      unint64_t v19 = v36;
      if (v20 >= v36) {
        goto LABEL_24;
      }
    }
    if ((a3 & 1) == 0 && v22 == 32) {
      goto LABEL_20;
    }
    unint64_t v19 = v36;
LABEL_24:
    if (v20 >= v19) {
      goto LABEL_36;
    }
    if (a3)
    {
      if ([a1 characterAtIndex:v20] == 32) {
        ++v20;
      }
LABEL_36:
      if (!v13) {
        goto LABEL_40;
      }
LABEL_37:
      if (v14 != v21 && [v13 length])
      {
        _appendParagraphToOutput(Mutable, v13, v14, v18, (a3 >> 3) & 1);
        [v13 setString:&stru_1EFF11268];
      }
      goto LABEL_40;
    }
    if (v20 <= v37) {
      goto LABEL_36;
    }
    if (!v21)
    {
      unint64_t v20 = v37;
      if (!v13) {
        goto LABEL_40;
      }
      goto LABEL_37;
    }
    uint64_t v23 = objc_msgSend(a1, "rangeOfString:options:range:", @">", 4, v37, v20 - v37);
    uint64_t v24 = v23 + 2;
    if (v20 < v23 + 2) {
      uint64_t v24 = v20;
    }
    if (v23 != 0x7FFFFFFFFFFFFFFFLL) {
      unint64_t v20 = v24;
    }
    if (v13) {
      goto LABEL_37;
    }
LABEL_40:
    v25 = objc_msgSend(a1, "substringWithRange:", v20, v36 - v20);
    v26 = v25;
    if ((a3 & 1) == 0)
    {
      v27 = v25;
      _appendParagraphToOutput(Mutable, v25, v21, v18, (a3 >> 3) & 1);
      goto LABEL_63;
    }
    if (v37 >= v36 || [a1 characterAtIndex:v36 - 1] != 32) {
      goto LABEL_77;
    }
    if (v36 - v20 == 3 && [a1 characterAtIndex:v20] == 45)
    {
      BOOL v28 = [a1 characterAtIndex:v20 + 1] != 45;
      if ((a3 & 2) == 0) {
        goto LABEL_53;
      }
    }
    else
    {
      BOOL v28 = 1;
      if ((a3 & 2) == 0) {
        goto LABEL_53;
      }
    }
    if (v28 && [v26 length])
    {
      uint64_t v29 = objc_msgSend(v26, "substringToIndex:", objc_msgSend(v26, "length") - 1);

      char v30 = 1;
      v26 = (void *)v29;
      if (!v13) {
        goto LABEL_58;
      }
      goto LABEL_59;
    }
LABEL_53:
    if (v28)
    {
      char v30 = 1;
      if (!v13) {
LABEL_58:
      }
        id v13 = objc_alloc_init(MEMORY[0x1E4F28E78]);
LABEL_59:
      [v13 appendString:v26];
      if ((v30 & 1) == 0)
      {
        _appendParagraphToOutput(Mutable, v13, v21, v18, (a3 >> 3) & 1);
        [v13 setString:&stru_1EFF11268];
      }
      v27 = v26;
    }
    else
    {
LABEL_77:
      if ([v13 length])
      {
        char v30 = 0;
        if (!v13) {
          goto LABEL_58;
        }
        goto LABEL_59;
      }
      _appendParagraphToOutput(Mutable, v26, v21, v18, (a3 >> 3) & 1);
      v27 = v26;
    }
LABEL_63:
    unint64_t v37 = v35;

    uint64_t v14 = v21;
    v15 = v18;
  }
  while (v37 < v33);
LABEL_68:
  if ([v13 length]) {
    _appendParagraphToOutput(Mutable, v13, v21, v18, (a3 >> 3) & 1);
  }
  if ((a3 & 8) != 0) {
    [(__CFString *)Mutable appendString:@"</BODY></HTML>"];
  }
  v31 = Mutable;

  return v31;
}

@end