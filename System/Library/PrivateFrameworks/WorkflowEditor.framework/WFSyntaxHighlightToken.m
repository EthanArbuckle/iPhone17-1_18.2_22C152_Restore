@interface WFSyntaxHighlightToken
+ (id)constructToken;
- (BOOL)overflows;
- (NSString)string;
- (_NSRange)range;
- (int)length;
- (int)start;
- (void)setLength:(int)a3;
- (void)setOverflows:(BOOL)a3;
- (void)setStart:(int)a3;
- (void)setString:(id)a3;
@end

@implementation WFSyntaxHighlightToken

- (void).cxx_destruct
{
}

- (void)setString:(id)a3
{
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLength:(int)a3
{
  self->_length = a3;
}

- (int)length
{
  return self->_length;
}

- (void)setStart:(int)a3
{
  self->_start = a3;
}

- (int)start
{
  return self->_start;
}

- (void)setOverflows:(BOOL)a3
{
  self->_overflows = a3;
}

- (BOOL)overflows
{
  return self->_overflows;
}

- (_NSRange)range
{
  NSUInteger v3 = [(WFSyntaxHighlightToken *)self start];
  NSUInteger v4 = [(WFSyntaxHighlightToken *)self length];
  NSUInteger v5 = v3;
  result.length = v4;
  result.location = v5;
  return result;
}

+ (id)constructToken
{
  v2 = objc_alloc_init(WFSyntaxHighlightToken);
  return v2;
}

@end