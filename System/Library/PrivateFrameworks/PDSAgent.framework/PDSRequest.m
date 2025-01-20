@interface PDSRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToRequest:(id)a3;
- (NSSet)entries;
- (PDSRequest)initWithEntries:(id)a3 requestInfo:(id)a4;
- (PDSRequestInfo)requestInfo;
- (id)description;
- (unint64_t)hash;
- (void)setRequestInfo:(id)a3;
@end

@implementation PDSRequest

- (PDSRequest)initWithEntries:(id)a3 requestInfo:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PDSRequest.m", 15, @"Invalid parameter not satisfying: %@", @"entries" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x263F08690] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PDSRequest.m", 16, @"Invalid parameter not satisfying: %@", @"requestInfo" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PDSRequest;
  v11 = [(PDSRequest *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_entries, a3);
    objc_storeStrong((id *)&v12->_requestInfo, a4);
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(PDSRequest *)self isEqualToRequest:v4];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = [(PDSRequest *)self entries];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 ^= [*(id *)(*((void *)&v9 + 1) + 8 * i) hash];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)isEqualToRequest:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  unint64_t v5 = [(PDSRequest *)self entries];
  uint64_t v6 = [v4 entries];

  LOBYTE(v4) = [v5 isEqualToSet:v6];
  return (char)v4;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  unint64_t v5 = [(PDSRequest *)self entries];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p entries = \"%@\">", v4, self, v5];;

  return v6;
}

- (NSSet)entries
{
  return self->_entries;
}

- (PDSRequestInfo)requestInfo
{
  return self->_requestInfo;
}

- (void)setRequestInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestInfo, 0);
  objc_storeStrong((id *)&self->_entries, 0);
}

@end