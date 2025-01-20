@interface SCMLTextSanitizerRequest
- (BOOL)isChildPresent;
- (BOOL)isPersonalized;
- (BOOL)keepGoing;
- (NSString)text;
- (SCMLTextSanitizerRequest)init;
- (void)setIsChildPresent:(BOOL)a3;
- (void)setIsPersonalized:(BOOL)a3;
- (void)setKeepGoing:(BOOL)a3;
- (void)setText:(id)a3;
@end

@implementation SCMLTextSanitizerRequest

- (SCMLTextSanitizerRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)SCMLTextSanitizerRequest;
  v2 = [(SCMLTextSanitizerRequest *)&v6 init];
  v3 = v2;
  if (v2)
  {
    text = v2->_text;
    v2->_text = (NSString *)&stru_2709753D8;

    *(_WORD *)&v3->_keepGoing = 0;
    v3->_isChildPresent = 0;
  }
  return v3;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
}

- (BOOL)keepGoing
{
  return self->_keepGoing;
}

- (void)setKeepGoing:(BOOL)a3
{
  self->_keepGoing = a3;
}

- (BOOL)isPersonalized
{
  return self->_isPersonalized;
}

- (void)setIsPersonalized:(BOOL)a3
{
  self->_isPersonalized = a3;
}

- (BOOL)isChildPresent
{
  return self->_isChildPresent;
}

- (void)setIsChildPresent:(BOOL)a3
{
  self->_isChildPresent = a3;
}

- (void).cxx_destruct
{
}

@end