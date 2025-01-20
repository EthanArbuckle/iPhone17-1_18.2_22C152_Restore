@interface NSURL(WFTruncatedDisplay)
- (id)wf_displayStringWithCharacterLimit:()WFTruncatedDisplay;
@end

@implementation NSURL(WFTruncatedDisplay)

- (id)wf_displayStringWithCharacterLimit:()WFTruncatedDisplay
{
  v5 = [MEMORY[0x1E4F29088] componentsWithURL:a1 resolvingAgainstBaseURL:0];
  v6 = [v5 host];
  uint64_t v7 = [v5 scheme];
  v8 = (void *)v7;
  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0)
  {
    v11 = [a1 absoluteString];
  }
  else
  {
    if ([v6 hasPrefix:@"www."])
    {
      v12 = [v6 substringFromIndex:objc_msgSend(@"www.", "length")];
      [v5 setHost:v12];
    }
    v13 = [v5 string];
    v14 = objc_msgSend(v13, "substringFromIndex:", objc_msgSend(v8, "length") + 1);

    if ([v14 hasPrefix:@"//"])
    {
      uint64_t v15 = [v14 substringFromIndex:2];

      v14 = (void *)v15;
    }
    if ([v14 length] > a3)
    {
      v16 = [v14 substringToIndex:a3 - 2];
      uint64_t v17 = [v16 stringByAppendingString:@"…"];

      v14 = (void *)v17;
    }
    if (v14)
    {
      id v18 = v14;
    }
    else
    {
      id v18 = [a1 absoluteString];
    }
    v11 = v18;
  }
  return v11;
}

@end