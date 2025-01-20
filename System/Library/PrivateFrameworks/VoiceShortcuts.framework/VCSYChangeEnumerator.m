@interface VCSYChangeEnumerator
- (VCSYChangeEnumerator)initWithLazyArray:(id)a3;
- (id)nextObject;
@end

@implementation VCSYChangeEnumerator

- (void).cxx_destruct
{
}

- (id)nextObject
{
  unint64_t index = self->_index;
  self->_unint64_t index = index + 1;
  if (index >= self->_count)
  {
LABEL_5:
    v4 = 0;
  }
  else
  {
    while (1)
    {
      v4 = [(NSEnumerator *)self->_enumerator nextObject];
      if (v4)
      {
        if (![MEMORY[0x1E4F59E90] isDegenerate:v4]) {
          break;
        }
      }

      unint64_t v5 = self->_index;
      self->_unint64_t index = v5 + 1;
      if (v5 >= self->_count) {
        goto LABEL_5;
      }
    }
  }
  return v4;
}

- (VCSYChangeEnumerator)initWithLazyArray:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"VCSYChangeEnumerator.m", 21, @"Invalid parameter not satisfying: %@", @"array" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)VCSYChangeEnumerator;
  v6 = [(VCSYChangeEnumerator *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 objectEnumerator];
    enumerator = v6->_enumerator;
    v6->_enumerator = (NSEnumerator *)v7;

    v6->_count = [v5 count];
    v6->_unint64_t index = 0;
    v9 = v6;
  }

  return v6;
}

@end