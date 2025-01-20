@interface CACSpokenCommandNounSpecifier
- (CACSpokenCommandNounSpecifier)initWithType:(unsigned int)a3 item:(id)a4;
- (CACSpokenCommandNounSpecifier)initWithType:(unsigned int)a3 items:(id)a4;
- (NSArray)items;
- (id)description;
- (unsigned)type;
@end

@implementation CACSpokenCommandNounSpecifier

- (CACSpokenCommandNounSpecifier)initWithType:(unsigned int)a3 items:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CACSpokenCommandNounSpecifier;
  v8 = [(CACSpokenCommandNounSpecifier *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_items, a4);
  }

  return v9;
}

- (CACSpokenCommandNounSpecifier)initWithType:(unsigned int)a3 item:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObject:a4];
  id v7 = [(CACSpokenCommandNounSpecifier *)self initWithType:v4 items:v6];

  return v7;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"Type: %d, Items: %@", self->_type, self->_items];
}

- (unsigned)type
{
  return self->_type;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
}

@end