@interface TUCallGroup
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToCallGroup:(id)a3;
- (NSArray)calls;
- (NSString)displayName;
- (TUCallGroup)initWithCall:(id)a3;
- (TUCallGroup)initWithCalls:(id)a3;
- (id)description;
- (id)methodSignatureForSelector:(SEL)a3;
- (int)status;
- (unint64_t)hash;
- (void)forwardInvocation:(id)a3;
@end

@implementation TUCallGroup

- (TUCallGroup)initWithCalls:(id)a3
{
  id v5 = a3;
  if (![v5 count])
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"TUCallGroup.m", 18, @"Invalid parameter not satisfying: %@", @"calls.count > 0" object file lineNumber description];
  }
  v11.receiver = self;
  v11.super_class = (Class)TUCallGroup;
  v6 = [(TUCallGroup *)&v11 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    calls = v6->_calls;
    v6->_calls = (NSArray *)v7;
  }
  return v6;
}

- (TUCallGroup)initWithCall:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (!v5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"TUCallGroup.m", 28, @"Invalid parameter not satisfying: %@", @"call != nil" object file lineNumber description];
  }
  v10[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v7 = [(TUCallGroup *)self initWithCalls:v6];

  return v7;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  id v5 = [(TUCallGroup *)self calls];
  v6 = [v3 stringWithFormat:@"<%@ %p calls=%@>", v4, self, v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(TUCallGroup *)self isEqualToCallGroup:v4];

  return v5;
}

- (BOOL)isEqualToCallGroup:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUCallGroup *)self calls];
  v6 = [v4 calls];

  LOBYTE(v4) = [v5 isEqualToArray:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(TUCallGroup *)self calls];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)displayName
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = [(TUCallGroup *)self calls];
  uint64_t v5 = [v4 count];

  v6 = [(TUCallGroup *)self calls];
  uint64_t v7 = v6;
  if (v5 == 1)
  {
    v8 = [v6 firstObject];
    id v9 = [v8 displayName];
  }
  else
  {
    unint64_t v10 = [v6 count];

    if (v10 < 2)
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, self, @"TUCallGroup.m", 68, @"Could not determine display name for TUCallGroup with an empty list of calls: %@", self object file lineNumber description];

      id v9 = 0;
    }
    else
    {
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      objc_super v11 = [(TUCallGroup *)self calls];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        id v9 = 0;
        uint64_t v14 = *(void *)v25;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = [*(id *)(*((void *)&v24 + 1) + 8 * i) displayFirstName];
            v17 = v16;
            if (v9)
            {
              v18 = NSString;
              v19 = TUBundle();
              v20 = [v19 localizedStringForKey:@"%@_AND_%@" value:&stru_1EECEA668 table:@"TelephonyUtilities"];
              uint64_t v21 = objc_msgSend(v18, "stringWithFormat:", v20, v9, v17);

              id v9 = (id)v21;
            }
            else
            {
              id v9 = v16;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
        }
        while (v13);
      }
      else
      {
        id v9 = 0;
      }
    }
  }

  return (NSString *)v9;
}

- (int)status
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(TUCallGroup *)self calls];
  id v4 = [v3 firstObject];
  int v5 = [v4 status];

  v6 = [(TUCallGroup *)self calls];
  unint64_t v7 = [v6 count];

  if (v7 >= 2)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v8 = [(TUCallGroup *)self calls];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          if ([*(id *)(*((void *)&v14 + 1) + 8 * i) status] == 1)
          {
            int v5 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TUCallGroup;
  int v5 = -[TUCallGroup methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_);
  if (!v5)
  {
    v6 = [(TUCallGroup *)self calls];
    unint64_t v7 = [v6 firstObject];
    int v5 = [v7 methodSignatureForSelector:a3];
  }

  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v9 = a3;
  [v9 selector];
  id v4 = [(TUCallGroup *)self calls];
  int v5 = [v4 firstObject];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    unint64_t v7 = [(TUCallGroup *)self calls];
    v8 = [v7 firstObject];
    [v9 invokeWithTarget:v8];
  }
}

- (NSArray)calls
{
  return self->_calls;
}

- (void).cxx_destruct
{
}

@end