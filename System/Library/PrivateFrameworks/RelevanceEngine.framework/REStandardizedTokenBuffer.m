@interface REStandardizedTokenBuffer
- (BOOL)isEmpty;
- (REScriptToken)currentToken;
- (REStandardizedTokenBuffer)initWithTokenBuffer:(id)a3;
- (void)_cleanTokens;
- (void)next;
@end

@implementation REStandardizedTokenBuffer

- (REStandardizedTokenBuffer)initWithTokenBuffer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REStandardizedTokenBuffer;
  v6 = [(REStandardizedTokenBuffer *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_buffer, a3);
    [(REStandardizedTokenBuffer *)v7 _cleanTokens];
  }

  return v7;
}

- (void)_cleanTokens
{
  if (([(RETokenBuffer *)self->_buffer isEmpty] & 1) == 0)
  {
    while (1)
    {
      id v5 = [(RETokenBuffer *)self->_buffer currentToken];
      unint64_t v3 = [v5 type];
      if (v3 > 8 || ((1 << v3) & 0x182) == 0) {
        break;
      }
      [(RETokenBuffer *)self->_buffer next];

      if ([(RETokenBuffer *)self->_buffer isEmpty]) {
        return;
      }
    }
  }
}

- (BOOL)isEmpty
{
  return [(RETokenBuffer *)self->_buffer isEmpty];
}

- (REScriptToken)currentToken
{
  return (REScriptToken *)[(RETokenBuffer *)self->_buffer currentToken];
}

- (void)next
{
  [(RETokenBuffer *)self->_buffer next];
  [(REStandardizedTokenBuffer *)self _cleanTokens];
}

- (void).cxx_destruct
{
}

@end