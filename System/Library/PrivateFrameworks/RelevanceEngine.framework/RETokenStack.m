@interface RETokenStack
- (BOOL)isEmpty;
- (REScriptToken)currentToken;
- (RETokenStack)initWithTokenBuffer:(id)a3;
- (void)consume;
- (void)next;
- (void)pop;
- (void)push;
@end

@implementation RETokenStack

- (RETokenStack)initWithTokenBuffer:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RETokenStack;
  v6 = [(RETokenStack *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_buffer, a3);
    v7->_position = 0;
    uint64_t v8 = [MEMORY[0x263EFF980] array];
    tokenStack = v7->_tokenStack;
    v7->_tokenStack = (NSMutableArray *)v8;

    uint64_t v10 = [MEMORY[0x263EFF980] array];
    positionStack = v7->_positionStack;
    v7->_positionStack = (NSMutableArray *)v10;

    if (([(RETokenBuffer *)v7->_buffer isEmpty] & 1) == 0)
    {
      v12 = v7->_tokenStack;
      v13 = [(RETokenBuffer *)v7->_buffer currentToken];
      [(NSMutableArray *)v12 addObject:v13];
    }
  }

  return v7;
}

- (REScriptToken)currentToken
{
  return (REScriptToken *)[(NSMutableArray *)self->_tokenStack objectAtIndexedSubscript:self->_position];
}

- (BOOL)isEmpty
{
  if ([(NSMutableArray *)self->_tokenStack count] - 1 > self->_position) {
    return 0;
  }
  buffer = self->_buffer;
  return [(RETokenBuffer *)buffer isEmpty];
}

- (void)next
{
  if (![(RETokenStack *)self isEmpty])
  {
    unint64_t position = self->_position;
    if (position >= [(NSMutableArray *)self->_tokenStack count] - 1)
    {
      [(RETokenBuffer *)self->_buffer next];
      tokenStack = self->_tokenStack;
      id v5 = [(RETokenBuffer *)self->_buffer currentToken];
      [(NSMutableArray *)tokenStack addObject:v5];
    }
    ++self->_position;
  }
}

- (void)consume
{
  if ([(NSMutableArray *)self->_positionStack count])
  {
    positionStack = self->_positionStack;
    [(NSMutableArray *)positionStack removeLastObject];
  }
}

- (void)pop
{
  if ([(NSMutableArray *)self->_positionStack count])
  {
    v3 = [(NSMutableArray *)self->_positionStack lastObject];
    self->_unint64_t position = [v3 unsignedIntegerValue];

    positionStack = self->_positionStack;
    [(NSMutableArray *)positionStack removeLastObject];
  }
}

- (void)push
{
  positionStack = self->_positionStack;
  id v3 = [NSNumber numberWithUnsignedInteger:self->_position];
  [(NSMutableArray *)positionStack addObject:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_positionStack, 0);
  objc_storeStrong((id *)&self->_tokenStack, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end