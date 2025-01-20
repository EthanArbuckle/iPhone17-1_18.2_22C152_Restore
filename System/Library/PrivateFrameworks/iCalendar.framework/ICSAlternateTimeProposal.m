@interface ICSAlternateTimeProposal
+ (id)ICSStringFromAlternateTimeProposalStatus:(int)a3;
+ (id)_parseICSString:(id)a3;
+ (id)alternateTimeProposalFromICSCString:(id)a3;
+ (int)statusFromICSString:(id)a3;
- (ICSDateTimeValue)startDate;
- (int)status;
- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4;
- (void)setStartDate:(id)a3;
- (void)setStatus:(int)a3;
@end

@implementation ICSAlternateTimeProposal

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  id v6 = a4;
  id v11 = v6;
  if ((a3 & 0x10) != 0)
  {
    if ([(ICSProperty *)self shouldObscureValue]) {
      a3 |= 0x20uLL;
    }
    v7 = v11;
  }
  else
  {
    v7 = v6;
  }
  [v7 appendString:@"\""];
  v8 = [(ICSAlternateTimeProposal *)self startDate];

  if (v8)
  {
    [v11 appendString:@"DTSTART"];
    [v11 appendString:@":"];
    v9 = [(ICSAlternateTimeProposal *)self startDate];
    [v9 _ICSStringWithOptions:a3 appendingToString:v11];

    [v11 appendString:@";"];
    [v11 appendString:@"STATUS"];
    [v11 appendString:@":"];
    v10 = +[ICSAlternateTimeProposalStatusParameter statusParameterFromCode:[(ICSAlternateTimeProposal *)self status]];
    [v10 _ICSStringWithOptions:a3 appendingToString:v11];
    [v11 appendString:@";"];
  }
  [v11 appendString:@"\""];
}

- (void)setStartDate:(id)a3
{
}

- (ICSDateTimeValue)startDate
{
  return (ICSDateTimeValue *)[(ICSProperty *)self parameterValueForName:@"DTSTART"];
}

+ (id)ICSStringFromAlternateTimeProposalStatus:(int)a3
{
  if ((a3 - 1) > 2) {
    return 0;
  }
  else {
    return off_1E6C25A98[a3 - 1];
  }
}

+ (int)statusFromICSString:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"NEEDS-ACTION"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"ACCEPTED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"DECLINED"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)setStatus:(int)a3
{
  if (a3)
  {
    +[ICSAlternateTimeProposalStatusParameter statusParameterFromCode:](ICSAlternateTimeProposalStatusParameter, "statusParameterFromCode:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(ICSProperty *)self setParameterValue:v4 forName:@"STATUS"];
  }
  else
  {
    [(ICSProperty *)self removeParameterValueForName:@"STATUS"];
  }
}

- (int)status
{
  id v3 = [(ICSProperty *)self parameterValueForName:@"STATUS"];

  if (!v3) {
    return 0;
  }
  id v4 = [(ICSProperty *)self parameterValueForName:@"STATUS"];
  int v5 = [v4 longValue];

  return v5;
}

+ (id)alternateTimeProposalFromICSCString:(id)a3
{
  if (a3)
  {
    id v3 = +[ICSAlternateTimeProposal _parseICSString:](ICSAlternateTimeProposal, "_parseICSString:");
    id v4 = [v3 objectForKey:@"DTSTART"];
    int v5 = [v3 objectForKey:@"STATUS"];
    if (v4)
    {
      id v6 = objc_opt_new();
      v7 = +[ICSDateValue dateFromICSString:v4];
      [v6 setStartDate:v7];
      if (v5) {
        objc_msgSend(v6, "setStatus:", +[ICSAlternateTimeProposal statusFromICSString:](ICSAlternateTimeProposal, "statusFromICSString:", v5));
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

+ (id)_parseICSString:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = [a3 componentsSeparatedByString:@";"];
    id v4 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "componentsSeparatedByString:", @":", (void)v15);
          if ([v10 count] == 2)
          {
            id v11 = [v10 objectAtIndexedSubscript:1];
            v12 = [v10 objectAtIndexedSubscript:0];
            [v4 setObject:v11 forKeyedSubscript:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v7);
    }

    v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithDictionary:v4];
  }
  else
  {
    v13 = 0;
  }
  return v13;
}

@end