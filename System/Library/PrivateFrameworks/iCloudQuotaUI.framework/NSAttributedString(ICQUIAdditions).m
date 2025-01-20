@interface NSAttributedString(ICQUIAdditions)
+ (id)attributedStringWithFormat:()ICQUIAdditions attributes:links:;
+ (id)attributesForIndex:()ICQUIAdditions baseAttributes:;
+ (id)spaceArrowAttributedStringWithBaseAttributes:()ICQUIAdditions;
@end

@implementation NSAttributedString(ICQUIAdditions)

+ (id)spaceArrowAttributedStringWithBaseAttributes:()ICQUIAdditions
{
  v3 = (objc_class *)MEMORY[0x263F089B8];
  id v4 = a3;
  id v5 = [v3 alloc];
  v6 = objc_msgSend(NSString, "stringWithFormat:", @"%C", 8197);
  v7 = (void *)[v5 initWithString:v6];

  uint64_t v8 = [v7 length];
  v9 = (void *)[objc_alloc(MEMORY[0x263F81678]) initWithData:0 ofType:0];
  v10 = [MEMORY[0x263F827E8] icqBundleImageNamed:@"PresentationRightArrowBlue"];
  [v9 setImage:v10];

  v11 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v9];
  [v7 appendAttributedString:v11];

  objc_msgSend(v7, "addAttributes:range:", v4, 0, objc_msgSend(v7, "length"));
  objc_msgSend(v7, "addAttribute:value:range:", *MEMORY[0x263F814B8], &unk_26E01EE78, v8, objc_msgSend(v7, "length") - v8);
  v12 = (void *)[v7 copy];

  return v12;
}

+ (id)attributesForIndex:()ICQUIAdditions baseAttributes:
{
  id v5 = (void *)[a4 mutableCopy];
  v6 = [NSURL icqURLForIndex:a3];
  [v5 setObject:v6 forKey:*MEMORY[0x263F81520]];

  v7 = (void *)[v5 copy];
  return v7;
}

+ (id)attributedStringWithFormat:()ICQUIAdditions attributes:links:
{
  id v7 = a3;
  id v41 = a4;
  id v8 = a5;
  uint64_t v9 = [v7 length];
  v43 = objc_opt_new();
  uint64_t v40 = v9;
  uint64_t v10 = [v7 rangeOfString:@"%@", 2, 0, v9 options range];
  uint64_t v12 = v11;
  uint64_t v13 = [v8 count];
  if (v13) {
    uint64_t v14 = v12;
  }
  else {
    uint64_t v14 = 0;
  }
  if (v13) {
    uint64_t v15 = v10;
  }
  else {
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v16 = 0;
  if (v14)
  {
    unint64_t v17 = 0;
    v38 = v7;
    v39 = v8;
    do
    {
      [v8 objectAtIndexedSubscript:v17];
      v19 = v18 = v7;
      v20 = [a1 attributesForIndex:v17 baseAttributes:v41];
      id v21 = objc_alloc(MEMORY[0x263F086A0]);
      v22 = objc_msgSend(v18, "substringWithRange:", v16, v15 - v16);
      v23 = (void *)[v21 initWithString:v22 attributes:v41];
      [v43 appendAttributedString:v23];

      v24 = NSString;
      v25 = [v19 text];
      v26 = [v24 stringWithFormat:@"%@", v25];

      v27 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v26 attributes:v20];
      [v43 appendAttributedString:v27];

      if ([v19 options])
      {
        v28 = [a1 spaceArrowAttributedStringWithBaseAttributes:v20];
        [v43 appendAttributedString:v28];
      }
      uint64_t v16 = v15 + v14;
      ++v17;

      id v7 = v38;
      uint64_t v29 = [v38 rangeOfString:@"%@", 2, v15 + v14, v40 - (v15 + v14) options range];
      uint64_t v31 = v30;
      id v8 = v39;
      unint64_t v32 = [v39 count];
      if (v17 >= v32) {
        uint64_t v14 = 0;
      }
      else {
        uint64_t v14 = v31;
      }
      if (v17 >= v32) {
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        uint64_t v15 = v29;
      }
    }
    while (v14);
  }
  id v33 = objc_alloc(MEMORY[0x263F086A0]);
  v34 = [v7 substringFromIndex:v16];
  v35 = (void *)[v33 initWithString:v34 attributes:v41];
  [v43 appendAttributedString:v35];

  v36 = (void *)[v43 copy];
  return v36;
}

@end