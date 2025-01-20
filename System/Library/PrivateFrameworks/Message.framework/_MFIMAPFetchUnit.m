@interface _MFIMAPFetchUnit
- (BOOL)matchesFetchResponse:(id)a3;
- (MFDataConsumer)bodyDataConsumer;
- (NSString)consumerSection;
- (NSString)fetchItem;
- (id)copyFailedFetchResponse;
- (unsigned)uid;
- (void)_setupExpectedFetchResult;
- (void)setBodyDataConsumer:(id)a3;
- (void)setConsumerSection:(id)a3;
- (void)setFetchItem:(id)a3;
- (void)setUid:(unsigned int)a3;
@end

@implementation _MFIMAPFetchUnit

- (void)_setupExpectedFetchResult
{
  if (![@"BODYSTRUCTURE" caseInsensitiveCompare:self->_fetchItem])
  {
    v13 = [[MFIMAPFetchResult alloc] initWithType:6];
    expectedFetchResult = self->_expectedFetchResult;
    self->_expectedFetchResult = v13;
LABEL_13:

    return;
  }
  if ([@"X-APPLE-REMOTE-LINKS" caseInsensitiveCompare:self->_fetchItem])
  {
    NSUInteger v3 = [(NSString *)self->_fetchItem length];
    uint64_t v4 = [(NSString *)self->_fetchItem rangeOfString:@"BODY" options:9];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v6 = [(NSString *)self->_fetchItem rangeOfString:@".PEEK", 9, v4 + v5, v3 - (v4 + v5) options range];
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v8 = [(NSString *)self->_fetchItem rangeOfString:@"[", 8, v6 + v7, v3 - (v6 + v7) options range];
        if (v8 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v10 = v8 + v9;
          uint64_t v11 = [(NSString *)self->_fetchItem rangeOfString:@"]", 4, v8 + v9, v3 - (v8 + v9) options range];
          if (v11 != 0x7FFFFFFFFFFFFFFFLL && v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v15 = v11;
            -[NSString substringWithRange:](self->_fetchItem, "substringWithRange:", v10, v11 - v10);
            v27 = (MFIMAPFetchResult *)objc_claimAutoreleasedReturnValue();
            if ([(MFIMAPFetchResult *)v27 rangeOfString:@"HEADER" options:9] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v16 = [[MFIMAPFetchResult alloc] initWithType:7];
              v17 = self->_expectedFetchResult;
              self->_expectedFetchResult = v16;

              [(MFIMAPFetchResult *)self->_expectedFetchResult setSection:v27];
            }
            else
            {
              v18 = [[MFIMAPFetchResult alloc] initWithType:4];
              v19 = self->_expectedFetchResult;
              self->_expectedFetchResult = v18;
            }
            uint64_t v21 = [(NSString *)self->_fetchItem rangeOfString:@"<", 0, v15, v3 - v15 options range];
            if (v21 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v22 = v20;
              if ([(NSString *)self->_fetchItem hasSuffix:@">"])
              {
                uint64_t v23 = v21 + v22;
                uint64_t v24 = [(NSString *)self->_fetchItem rangeOfString:@".", 0, v23, v3 - v23 options range];
                if (v24 != 0x7FFFFFFFFFFFFFFFLL)
                {
                  v25 = -[NSString substringWithRange:](self->_fetchItem, "substringWithRange:", v23, v24 - v23);
                  unsigned int v26 = [v25 intValue];

                  [(MFIMAPFetchResult *)self->_expectedFetchResult setStartOffset:v26];
                }
              }
            }
            expectedFetchResult = v27;
            goto LABEL_13;
          }
        }
      }
    }
  }
}

- (BOOL)matchesFetchResponse:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_expectedFetchResult
    || self->_fetchItem
    && ([(_MFIMAPFetchUnit *)self _setupExpectedFetchResult], self->_expectedFetchResult))
  {
    id v18 = v4;
    [v4 fetchResults];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v6 = 0;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v20;
LABEL_4:
      uint64_t v9 = 0;
      while (2)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
        switch([v10 type])
        {
          case 4:
          case 5:
          case 7:
            unint64_t v11 = [(MFIMAPFetchResult *)self->_expectedFetchResult type];
            if (v11 <= 7 && ((1 << v11) & 0xB0) != 0)
            {
              v13 = [v10 section];
              v14 = [(MFIMAPFetchResult *)self->_expectedFetchResult section];
              BOOL v6 = [v13 caseInsensitiveCompare:v14] == 0;
            }
            goto LABEL_13;
          case 6:
            BOOL v15 = [(MFIMAPFetchResult *)self->_expectedFetchResult type] == 6;
            goto LABEL_17;
          case 12:
            BOOL v15 = [(MFIMAPFetchResult *)self->_expectedFetchResult type] == 12;
LABEL_17:
            BOOL v6 = v15;
            if (!v6) {
              goto LABEL_21;
            }
            break;
          default:
LABEL_13:
            if (v6) {
              break;
            }
LABEL_21:
            if (v7 != ++v9) {
              continue;
            }
            uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (!v7) {
              goto LABEL_23;
            }
            goto LABEL_4;
        }
        break;
      }
    }
LABEL_23:

    BOOL v16 = v6;
    id v4 = v18;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)copyFailedFetchResponse
{
  v8[1] = *(id *)MEMORY[0x1E4F143B8];
  if (!self->_uid) {
    return 0;
  }
  if (!self->_expectedFetchResult)
  {
    [(_MFIMAPFetchUnit *)self _setupExpectedFetchResult];
    if (!self->_expectedFetchResult) {
      return 0;
    }
  }
  NSUInteger v3 = objc_alloc_init(MFIMAPResponse);
  [(MFIMAPResponse *)v3 setResponseType:17];
  [(MFIMAPResponse *)v3 setNumber:0];
  v8[0] = 0;
  uint64_t v7 = [[MFIMAPFetchResult alloc] initWithType:8];

  [(MFIMAPFetchResult *)v7 setUid:self->_uid];
  objc_storeStrong(v8, self->_expectedFetchResult);
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithObjects:&v7 count:2];
  [(MFIMAPResponse *)v3 setFetchResults:v4];

  for (uint64_t i = 1; i != -1; --i)
  return v3;
}

- (MFDataConsumer)bodyDataConsumer
{
  return self->_bodyDataConsumer;
}

- (void)setBodyDataConsumer:(id)a3
{
}

- (NSString)consumerSection
{
  return self->_consumerSection;
}

- (void)setConsumerSection:(id)a3
{
}

- (NSString)fetchItem
{
  return self->_fetchItem;
}

- (void)setFetchItem:(id)a3
{
}

- (unsigned)uid
{
  return self->_uid;
}

- (void)setUid:(unsigned int)a3
{
  self->_uid = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchItem, 0);
  objc_storeStrong((id *)&self->_consumerSection, 0);
  objc_storeStrong((id *)&self->_bodyDataConsumer, 0);
  objc_storeStrong((id *)&self->_expectedFetchResult, 0);
}

@end