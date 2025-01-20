@interface NSString(NanoPassKit)
- (BOOL)npkIsPhoneNumber;
- (id)matchesInStringWithType:()NanoPassKit;
- (id)npkBaseAddress;
- (id)npkFirstCharacter;
- (uint64_t)npkIsEmailAddress;
@end

@implementation NSString(NanoPassKit)

- (BOOL)npkIsPhoneNumber
{
  v1 = [a1 matchesInStringWithType:2048];
  if ([v1 count] == 1)
  {
    v2 = [v1 firstObject];
    BOOL v3 = [v2 resultType] == 2048;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (uint64_t)npkIsEmailAddress
{
  v2 = [a1 matchesInStringWithType:32];
  if ([v2 count] == 1)
  {
    BOOL v3 = [v2 firstObject];
    uint64_t v4 = [v3 resultType];
    v5 = [v3 URL];
    v6 = [v5 absoluteString];
    v7 = [NSString stringWithFormat:@"mailto:%@", a1];
    unsigned int v8 = [v6 isEqualToString:v7];

    if (v4 == 32) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)npkBaseAddress
{
  int v2 = [a1 hasPrefix:@"mailto:"];
  int v3 = [a1 hasPrefix:@"tel:"];
  if (v2)
  {
    uint64_t v4 = @"mailto:";
LABEL_5:
    objc_msgSend(a1, "substringFromIndex:", -[__CFString length](v4, "length"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (v3)
  {
    uint64_t v4 = @"tel:";
    goto LABEL_5;
  }
  id v5 = a1;
LABEL_7:
  return v5;
}

- (id)matchesInStringWithType:()NanoPassKit
{
  uint64_t v4 = [MEMORY[0x263F08770] dataDetectorWithTypes:a3 error:0];
  if (v4)
  {
    id v5 = objc_msgSend(v4, "matchesInString:options:range:", a1, 4, 0, objc_msgSend(a1, "length"));
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)npkFirstCharacter
{
  if ([a1 length])
  {
    objc_msgSend(a1, "substringWithRange:", 0, 1);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v2 = a1;
  }
  return v2;
}

@end