@interface OISFURegularExpression
+ (id)regularExpressionWithString:(id)a3;
+ (void)initialize;
- (BOOL)isEqual:(id)a3;
- (OISFURegularExpression)init;
- (OISFURegularExpression)initWithCoder:(id)a3;
- (OISFURegularExpression)initWithExpressionString:(id)a3;
- (OISFURegularExpression)initWithExpressionString:(id)a3 options:(unsigned int)a4;
- (_NSRange)matchedRangeForCString:(const char *)a3 range:(_NSRange)a4 subexpressionRanges:(_NSRange *)a5 count:(unsigned int)a6;
- (_NSRange)matchedRangeForString:(id)a3 range:(_NSRange)a4 subexpressionRanges:(_NSRange *)a5 count:(unsigned int)a6;
- (const)getBytesForString:(id)a3 lossByte:(unsigned __int8)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)expressionString;
- (unint64_t)hash;
- (unint64_t)numberOfSubexpressions;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation OISFURegularExpression

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    [a1 setVersion:1];
  }
}

+ (id)regularExpressionWithString:(id)a3
{
  v3 = (void *)[objc_alloc((Class)a1) initWithExpressionString:a3];
  return v3;
}

- (void)dealloc
{
  if (self->_reserved)
  {
    MEMORY[0x23EC9A770]();
    NSZoneFree((NSZone *)[(OISFURegularExpression *)self zone], self->_reserved);
  }
  v3.receiver = self;
  v3.super_class = (Class)OISFURegularExpression;
  [(OISFURegularExpression *)&v3 dealloc];
}

- (OISFURegularExpression)initWithExpressionString:(id)a3
{
  return [(OISFURegularExpression *)self initWithExpressionString:a3 options:0];
}

- (OISFURegularExpression)initWithExpressionString:(id)a3 options:(unsigned int)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v14.receiver = self;
  v14.super_class = (Class)OISFURegularExpression;
  id v6 = [(OISFURegularExpression *)&v14 init];
  if (v6)
  {
    size_t v7 = [a3 length];
    CFIndex v8 = v7;
    v9 = buffer;
    if (v7 >= 0x40) {
      v9 = (UInt8 *)malloc_type_malloc(v7, 0xA605BE25uLL);
    }
    v17.location = 0;
    v17.length = v8;
    CFStringGetBytes((CFStringRef)a3, v17, 0x600u, 0x20u, 0, v9, v8, 0);
    v10 = NSZoneMalloc((NSZone *)[v6 zone], 0x20uLL);
    *((void *)v6 + 2) = v10;
    v10[2] = &v9[v8];
    if (a4) {
      int v11 = 34;
    }
    else {
      int v11 = 32;
    }
    uint64_t v12 = regcomp(*((regex_t **)v6 + 2), (const char *)v9, ((4 * a4) & 8 | (a4 >> 2) & 1 | v11) ^ 9);
    if (v9 != buffer) {
      free(v9);
    }
    if (v12)
    {
      NSLog((NSString *)@"*** %s: error %d", "-[OISFURegularExpression initWithExpressionString:options:]", v12);
      NSZoneFree((NSZone *)[v6 zone], *((void **)v6 + 2));
      *((void *)v6 + 2) = 0;

      return 0;
    }
    else
    {
      *((void *)v6 + 1) = objc_msgSend(a3, "copyWithZone:", objc_msgSend(v6, "zone"));
    }
  }
  return (OISFURegularExpression *)v6;
}

- (unint64_t)numberOfSubexpressions
{
  return *((void *)self->_reserved + 1);
}

- (OISFURegularExpression)init
{
  return [(OISFURegularExpression *)self initWithExpressionString:&stru_26EBF24D8];
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ((_NSZone *)[(OISFURegularExpression *)self zone] == a3)
  {
    return self;
  }
  else
  {
    v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
    expressionString = self->_expressionString;
    return (id)[v4 initWithExpressionString:expressionString];
  }
}

- (BOOL)isEqual:(id)a3
{
  if (!a3) {
    return 0;
  }
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  expressionString = self->_expressionString;
  uint64_t v6 = [a3 expressionString];
  return [(NSString *)expressionString isEqualToString:v6];
}

- (unint64_t)hash
{
  return [(NSString *)self->_expressionString hash];
}

- (id)expressionString
{
  return self->_expressionString;
}

- (_NSRange)matchedRangeForCString:(const char *)a3 range:(_NSRange)a4 subexpressionRanges:(_NSRange *)a5 count:(unsigned int)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v31 = *MEMORY[0x263EF8340];
  unint64_t v12 = [(OISFURegularExpression *)self numberOfSubexpressions];
  unint64_t v13 = a6;
  if (v12 >= a6) {
    unint64_t v14 = a6;
  }
  else {
    unint64_t v14 = v12;
  }
  unint64_t v15 = v14 + 1;
  if (v14 >= 5) {
    p_pmatch = (regmatch_t *)malloc_type_malloc(16 * v15, 0x1000040451B5BE8uLL);
  }
  else {
    p_pmatch = &__pmatch;
  }
  uint64_t v17 = location + length;
  uint64_t rm_so = 0x7FFFFFFFFFFFFFFFLL;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v17 = -1;
    uint64_t v19 = -1;
  }
  else
  {
    uint64_t v19 = location;
  }
  p_pmatch->uint64_t rm_so = v19;
  p_pmatch->rm_eo = v17;
  if (regexec((const regex_t *)self->_reserved, a3, v14 + 1, p_pmatch, 4))
  {
    uint64_t v20 = 0;
  }
  else
  {
    uint64_t v20 = (p_pmatch->rm_eo - p_pmatch->rm_so) & ~(p_pmatch->rm_so >> 63);
    if (p_pmatch->rm_so >= 0) {
      uint64_t rm_so = p_pmatch->rm_so;
    }
    if (v14)
    {
      p_rm_eo = &p_pmatch[1].rm_eo;
      p_NSUInteger length = &a5->length;
      unint64_t v23 = v14;
      do
      {
        uint64_t v24 = *(p_rm_eo - 1);
        uint64_t v25 = (*p_rm_eo - v24) & ~(v24 >> 63);
        if (v24 < 0) {
          uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
        }
        *(p_length - 1) = v24;
        *p_NSUInteger length = v25;
        p_rm_eo += 2;
        p_length += 2;
        --v23;
      }
      while (v23);
    }
    if (v15 < v13)
    {
      uint64_t v26 = ~v14 + v13;
      v27 = &a5[v14 + 1];
      do
      {
        *v27++ = (_NSRange)xmmword_238EDB050;
        --v26;
      }
      while (v26);
    }
  }
  if (p_pmatch != &__pmatch) {
    free(p_pmatch);
  }
  NSUInteger v28 = rm_so;
  NSUInteger v29 = v20;
  result.NSUInteger length = v29;
  result.NSUInteger location = v28;
  return result;
}

- (_NSRange)matchedRangeForString:(id)a3 range:(_NSRange)a4 subexpressionRanges:(_NSRange *)a5 count:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  CFDataRef ASCIIData = _createASCIIData((const __CFString *)a3, 0x3Fu, a4.location, a4.length);
  uint64_t v12 = -[OISFURegularExpression matchedRangeForCString:range:subexpressionRanges:count:](self, "matchedRangeForCString:range:subexpressionRanges:count:", [(__CFData *)ASCIIData bytes], location, length, a5, v6);
  NSUInteger v14 = v13;

  NSUInteger v15 = v12;
  NSUInteger v16 = v14;
  result.NSUInteger length = v16;
  result.NSUInteger location = v15;
  return result;
}

- (OISFURegularExpression)initWithCoder:(id)a3
{
  uint64_t v6 = [a3 versionForClassName:@"SFURegularExpression"];
  uint64_t v7 = v6;
  if (v6 >= 2)
  {
    uint64_t v8 = MOFullMethodName((uint64_t)self, a2);
    NSLog((NSString *)@"%@: class version %lu cannot read instances archived with version %lu", v8, 1, v7);
    [(OISFURegularExpression *)self dealloc];
    return 0;
  }
  if (v6 != 1) {
    return self;
  }
  uint64_t v9 = [a3 decodeObject];
  return [(OISFURegularExpression *)self initWithExpressionString:v9];
}

- (const)getBytesForString:(id)a3 lossByte:(unsigned __int8)a4
{
  CFDataRef ASCIIData = _createASCIIData((const __CFString *)a3, a4, 0, [a3 length]);
  CFDataRef v5 = ASCIIData;
  return (const char *)[(__CFData *)ASCIIData bytes];
}

- (void)encodeWithCoder:(id)a3
{
}

@end