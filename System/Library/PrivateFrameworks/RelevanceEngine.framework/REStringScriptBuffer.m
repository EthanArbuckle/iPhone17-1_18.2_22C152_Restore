@interface REStringScriptBuffer
- (BOOL)isEmpty;
- (REStringScriptBuffer)initWithString:(id)a3;
- (id)contentForLine:(unint64_t)a3;
- (unsigned)current;
- (void)next;
@end

@implementation REStringScriptBuffer

- (REStringScriptBuffer)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REStringScriptBuffer;
  v5 = [(REStringScriptBuffer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    string = v5->_string;
    v5->_string = (NSString *)v6;

    v5->_index = 0;
  }

  return v5;
}

- (BOOL)isEmpty
{
  unint64_t index = self->_index;
  return index >= [(NSString *)self->_string length];
}

- (unsigned)current
{
  unint64_t index = self->_index;
  if (index >= [(NSString *)self->_string length]) {
    return 0;
  }
  string = self->_string;
  unint64_t v5 = self->_index;
  return [(NSString *)string characterAtIndex:v5];
}

- (void)next
{
  unint64_t index = self->_index;
  if (index < [(NSString *)self->_string length]) {
    ++self->_index;
  }
}

- (id)contentForLine:(unint64_t)a3
{
  string = self->_string;
  unint64_t v5 = [MEMORY[0x263F08708] newlineCharacterSet];
  uint64_t v6 = [(NSString *)string componentsSeparatedByCharactersInSet:v5];

  if ([v6 count] <= a3)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v6 objectAtIndexedSubscript:a3];
  }

  return v7;
}

- (void).cxx_destruct
{
}

@end