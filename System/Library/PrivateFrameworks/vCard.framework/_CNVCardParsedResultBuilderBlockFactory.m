@interface _CNVCardParsedResultBuilderBlockFactory
- (_CNVCardParsedResultBuilderBlockFactory)initWithBlock:(id)a3;
- (id)makeBuilder;
@end

@implementation _CNVCardParsedResultBuilderBlockFactory

- (_CNVCardParsedResultBuilderBlockFactory)initWithBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNVCardParsedResultBuilderBlockFactory;
  v5 = [(_CNVCardParsedResultBuilderBlockFactory *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id block = v5->_block;
    v5->_id block = (id)v6;

    v8 = v5;
  }

  return v5;
}

- (id)makeBuilder
{
  return (id)(*((uint64_t (**)(void))self->_block + 2))();
}

- (void).cxx_destruct
{
}

@end