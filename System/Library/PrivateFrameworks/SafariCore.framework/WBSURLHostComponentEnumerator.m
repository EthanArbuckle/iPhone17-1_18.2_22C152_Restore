@interface WBSURLHostComponentEnumerator
- (BOOL)_checkIsIPAddress;
- (BOOL)containsEmptyComponents;
- (BOOL)isSpeculative;
- (NSString)host;
- (WBSURLHostComponentEnumerator)init;
- (WBSURLHostComponentEnumerator)initWithHost:(id)a3 options:(unint64_t)a4;
- (_NSRange)_nextPointRangeInRange:(_NSRange)a3 didFindPeriod:(BOOL *)a4;
- (id)nextObject;
- (in6_addr)ipv6Address;
- (int64_t)kind;
- (unint64_t)options;
- (unsigned)ipv4Address;
- (void)clearAccumulatedDomains;
@end

@implementation WBSURLHostComponentEnumerator

- (WBSURLHostComponentEnumerator)init
{
  return [(WBSURLHostComponentEnumerator *)self initWithHost:&stru_1F105D3F0 options:0];
}

- (WBSURLHostComponentEnumerator)initWithHost:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSURLHostComponentEnumerator;
  v7 = [(WBSURLHostComponentEnumerator *)&v14 init];
  v8 = v7;
  if (v7)
  {
    v7->_options = a4;
    v7->_kind = -1;
    uint64_t v9 = [v6 copy];
    host = v8->_host;
    v8->_host = (NSString *)v9;

    uint64_t v11 = [(NSString *)v8->_host length];
    v8->_length = v11;
    v8->_nextSearchRange.location = 0;
    v8->_nextSearchRange.length = v11;
    [(WBSURLHostComponentEnumerator *)v8 clearAccumulatedDomains];
    v12 = v8;
  }

  return v8;
}

- (void)clearAccumulatedDomains
{
  if ((self->_options & 1) == 0)
  {
    v3 = [MEMORY[0x1E4F28E78] string];
    accumulatorString = self->_accumulatorString;
    self->_accumulatorString = v3;
  }
}

- (id)nextObject
{
  p_nextSearchRange = &self->_nextSearchRange;
  if (!self->_nextSearchRange.length)
  {
    v2 = 0;
    int64_t v17 = -1;
    goto LABEL_58;
  }
  if (!self->_didCheckTopLevelDomain)
  {
    self->_didCheckTopLevelDomain = 1;
    v18 = [(NSString *)self->_host safari_effectiveTopLevelDomainForHost];
    if (!v18)
    {
      if ([(WBSURLHostComponentEnumerator *)self _checkIsIPAddress])
      {
        p_nextSearchRange->unint64_t length = 0;
        v2 = self->_host;
        goto LABEL_59;
      }
      goto LABEL_3;
    }
    v2 = v18;
    self->_didFindTopLevelDomain = 1;
    self->_didBeginConsumingCharacters = 1;
    self->_numberOfAccummulatedComponents = 1;
    unint64_t v19 = [(__CFString *)v18 length];
    if ((self->_options & 4) == 0 && [(__CFString *)v2 hasSuffix:@"."])
    {
      uint64_t v20 = [(__CFString *)v2 substringToIndex:v19 - 1];

      v2 = (__CFString *)v20;
    }
    if ((self->_options & 1) == 0)
    {
      v21 = (NSMutableString *)[(__CFString *)v2 mutableCopy];
      accumulatorString = self->_accumulatorString;
      self->_accumulatorString = v21;

      unint64_t length = self->_length;
      if (length > v19 && [(NSString *)self->_host characterAtIndex:length + ~v19] == 46) {
        [(NSMutableString *)self->_accumulatorString insertString:@"." atIndex:0];
      }
    }
    p_nextSearchRange->unint64_t length = self->_length - v19;
    int64_t v17 = 3;
LABEL_58:
    self->_kind = v17;
    goto LABEL_59;
  }
LABEL_3:
  v5 = 0;
  _NSRange v32 = (_NSRange)0;
  while (1)
  {
    NSUInteger v6 = p_nextSearchRange->length;
    if (!v6)
    {
      int64_t v24 = 2;
      if (!v5) {
        int64_t v24 = -1;
      }
      self->_kind = v24;
      v25 = v5;
      v5 = v25;
      goto LABEL_48;
    }
    NSUInteger v7 = v6 - self->_didBeginConsumingCharacters;
    NSUInteger location = p_nextSearchRange->location;
    char v31 = 0;
    uint64_t v9 = -[WBSURLHostComponentEnumerator _nextPointRangeInRange:didFindPeriod:](self, "_nextPointRangeInRange:didFindPeriod:", location, v7, &v31);
    self->_didBeginConsumingCharacters = 1;
    p_nextSearchRange->unint64_t length = v9 + v10;
    if (!v9
      && !self->_didFindTopLevelDomain
      && !self->_didGenerateFullHighLevelDomain
      && !self->_numberOfAccummulatedComponents)
    {
      break;
    }
    if (location + v7 != v9 + v10)
    {
      v13 = -[NSString substringWithRange:](self->_host, "substringWithRange:");
      objc_super v14 = v13;
      unint64_t v15 = self->_numberOfAccummulatedComponents + 1;
      self->_numberOfAccummulatedComponents = v15;
      if (self->_didGenerateFullHighLevelDomain)
      {
        self->_kind = 5;
        if (self->_options)
        {
          v2 = v13;
        }
        else
        {
          [(NSMutableString *)self->_accumulatorString insertString:v13 atIndex:0];
          v2 = (__CFString *)[(NSMutableString *)self->_accumulatorString copy];
          if (v31) {
            [(NSMutableString *)self->_accumulatorString insertString:@"." atIndex:0];
          }
        }
        int v12 = 1;
        v16 = v5;
      }
      else if (v15 == 2)
      {
        if (v5)
        {
          int v12 = 1;
          self->_isSpeculative = 1;
          self->_kind = 3;
          _NSRange *p_nextSearchRange = v32;
          self->_numberOfAccummulatedComponents = 1;
          v16 = v5;
          v2 = v16;
        }
        else
        {
          if (self->_containsEmptyComponents) {
            self->_isSpeculative = 1;
          }
          self->_kind = 4;
          self->_didGenerateFullHighLevelDomain = 1;
          if (self->_options)
          {
            v2 = v13;
          }
          else
          {
            [(NSMutableString *)self->_accumulatorString insertString:v13 atIndex:0];
            v2 = (__CFString *)[(NSMutableString *)self->_accumulatorString copy];
            if (v31) {
              [(NSMutableString *)self->_accumulatorString insertString:@"." atIndex:0];
            }
          }
          v16 = 0;
          int v12 = 1;
        }
      }
      else
      {
        _NSRange v32 = *p_nextSearchRange;
        if (self->_options)
        {
          v16 = v13;
        }
        else
        {
          self->_kind = 3;
          [(NSMutableString *)self->_accumulatorString insertString:v13 atIndex:0];
          v16 = (__CFString *)[(NSMutableString *)self->_accumulatorString copy];

          if (v31) {
            [(NSMutableString *)self->_accumulatorString insertString:@"." atIndex:0];
          }
        }
        int v12 = 2;
      }

      v5 = v16;
      goto LABEL_34;
    }
    self->_containsEmptyComponents = 1;
    self->_kind = 6;
    unint64_t options = self->_options;
    if ((options & 2) != 0)
    {
      if (options)
      {
        v2 = &stru_1F105D3F0;
        goto LABEL_49;
      }
      v26 = self->_accumulatorString;
      if (self->_numberOfAccummulatedComponents)
      {
        v2 = (__CFString *)[(NSMutableString *)v26 copy];
        if (v31)
        {
          v27 = self->_accumulatorString;
          goto LABEL_56;
        }
        goto LABEL_49;
      }
      [(NSMutableString *)v26 insertString:@"." atIndex:0];
      v25 = (__CFString *)[(NSMutableString *)self->_accumulatorString copy];
LABEL_48:
      v2 = v25;
      goto LABEL_49;
    }
    int v12 = 2;
LABEL_34:
    if (v12 != 2) {
      goto LABEL_49;
    }
  }
  self->_kind = 2;
  if (self->_options)
  {
    -[NSString substringWithRange:](self->_host, "substringWithRange:", location, v7);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }
  v29 = self->_accumulatorString;
  v30 = -[NSString substringWithRange:](self->_host, "substringWithRange:", location, v7);
  [(NSMutableString *)v29 insertString:v30 atIndex:0];

  v2 = (__CFString *)[(NSMutableString *)self->_accumulatorString copy];
  if (v31)
  {
    v27 = self->_accumulatorString;
LABEL_56:
    [(NSMutableString *)v27 insertString:@"." atIndex:0];
  }
LABEL_49:

LABEL_59:
  return v2;
}

- (BOOL)_checkIsIPAddress
{
  unsigned int v3 = [(NSString *)self->_host characterAtIndex:0];
  if (v3 == 58 || v3 <= 0xFF && (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v3 + 60) & 0x10000) != 0)
  {
    v4 = [(NSString *)self->_host cStringUsingEncoding:1];
    if (v4)
    {
      v5 = v4;
      unsigned int v8 = 0;
      LODWORD(v4) = inet_pton(2, v4, &v8);
      if (v4 == 1)
      {
        self->_kind = 0;
        self->_ipv4Address = bswap32(v8);
      }
      else
      {
        in6_addr v7 = (in6_addr)0;
        LOBYTE(v4) = inet_pton(30, v5, &v7) == 1;
        if ((_BYTE)v4)
        {
          self->_kind = 1;
          self->_ipv6Address = v7;
        }
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (_NSRange)_nextPointRangeInRange:(_NSRange)a3 didFindPeriod:(BOOL *)a4
{
  NSUInteger v5 = [(NSString *)self->_host rangeOfString:@".", 4, a3.location, a3.length options range];
  BOOL v7 = v5 != 0x7FFFFFFFFFFFFFFFLL;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v5 = 0;
    NSUInteger v6 = 0;
  }
  *a4 = v7;
  result.unint64_t length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (NSString)host
{
  return self->_host;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)kind
{
  return self->_kind;
}

- (BOOL)containsEmptyComponents
{
  return self->_containsEmptyComponents;
}

- (BOOL)isSpeculative
{
  return self->_isSpeculative;
}

- (unsigned)ipv4Address
{
  return self->_ipv4Address;
}

- (in6_addr)ipv6Address
{
  p_ipv6Address = &self->_ipv6Address;
  uint64_t v3 = *(void *)self->_ipv6Address.__u6_addr8;
  uint64_t v4 = *(void *)&p_ipv6Address->__u6_addr32[2];
  *(void *)&result.__u6_addr32[2] = v4;
  *(void *)result.__u6_addr8 = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_topLevelDomainSubstring, 0);
  objc_storeStrong((id *)&self->_accumulatorString, 0);
}

@end