@interface NSURL(WBSUINSURLExtras)
- (id)safari_attributedStringWithSimplificationOptions:()WBSUINSURLExtras attributes:attributesForDeemphasizedText:attributesForHTTPSProtocol:;
- (uint64_t)_safari_rangeOfUserInfoInUserVisibleString;
@end

@implementation NSURL(WBSUINSURLExtras)

- (uint64_t)_safari_rangeOfUserInfoInUserVisibleString
{
  CFRange v2 = CFURLGetByteRangeForComponent(a1, kCFURLComponentUserInfo, 0);
  if (v2.location == -1) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  CFIndex v3 = CFURLGetBytes(a1, 0, 0);
  id v4 = [MEMORY[0x1E4F1CA58] dataWithCapacity:v3];
  if ((unint64_t)CFURLGetBytes(a1, (UInt8 *)[v4 mutableBytes], v3) >= v2.location + v2.length
    && (v5 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(v4, "bytes") + v2.location, v2.length, 134217984)) != 0)
  {
    v6 = v5;
    v7 = [v5 stringByRemovingPercentEncoding];
    v8 = v7;
    if (v7)
    {
      id v9 = v7;

      v6 = v9;
    }
    v10 = [v6 stringByAppendingString:@"@"];

    v11 = [(__CFURL *)a1 safari_userVisibleString];
    uint64_t v12 = [v11 rangeOfString:v10];
  }
  else
  {
    uint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (id)safari_attributedStringWithSimplificationOptions:()WBSUINSURLExtras attributes:attributesForDeemphasizedText:attributesForHTTPSProtocol:
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  v13 = objc_msgSend(a1, "safari_userVisibleString");
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CB10], "safari_hostAndPortRangeFromUserTypedString:", v13);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13 attributes:v12];
  }
  else
  {
    uint64_t v17 = v14;
    uint64_t v18 = v15;
    uint64_t v19 = objc_msgSend(a1, "_safari_rangeOfUserInfoInUserVisibleString");
    if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = v20;
    }
    uint64_t v22 = v21 + v18;
    if (v19 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v23 = v17;
    }
    else {
      uint64_t v23 = v19;
    }
    uint64_t v30 = 0;
    v24 = objc_msgSend(v13, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", a3, 0, &v30);
    uint64_t v25 = v30;
    uint64_t v26 = v23 - v30;
    v16 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v24 attributes:v12];

    uint64_t v31 = *MEMORY[0x1E4F425E0];
    v32[0] = &unk_1F03420E0;
    v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v32 forKeys:&v31 count:1];
    objc_msgSend(v16, "addAttributes:range:", v27, v26, v22);

    uint64_t v28 = [v24 length];
    if (v10 && v28 != v26 + v22) {
      objc_msgSend(v16, "addAttributes:range:", v10, v26 + v22, v28 - (v26 + v22));
    }
    if (v11 && v23 != v25) {
      objc_msgSend(v16, "addAttributes:range:", v11, 0, v26);
    }
  }
  return v16;
}

@end