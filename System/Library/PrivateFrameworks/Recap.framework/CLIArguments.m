@interface CLIArguments
- (NSArray)arguments;
- (id)consumeUpToIndex:(int64_t)a3;
- (id)objectAtIndexedSubscript:(unint64_t)a3;
- (void)setArguments:(id)a3;
@end

@implementation CLIArguments

- (id)objectAtIndexedSubscript:(unint64_t)a3
{
  if ([(NSArray *)self->_arguments count] <= a3)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(NSArray *)self->_arguments objectAtIndexedSubscript:a3];
  }
  return v5;
}

- (id)consumeUpToIndex:(int64_t)a3
{
  int64_t v5 = [(NSArray *)self->_arguments count];
  if (v5 <= a3)
  {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v6 = -[NSArray subarrayWithRange:](self->_arguments, "subarrayWithRange:", a3, v5 - a3);
  }
  return v6;
}

- (NSArray)arguments
{
  return self->_arguments;
}

- (void)setArguments:(id)a3
{
}

- (void).cxx_destruct
{
}

@end