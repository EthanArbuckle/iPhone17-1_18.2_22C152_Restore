@interface OAVStyle
- (OAVStyle)init;
- (id)styleAttributeValue;
- (void)addPropertyWithName:(id)a3 value:(id)a4;
@end

@implementation OAVStyle

- (OAVStyle)init
{
  v6.receiver = self;
  v6.super_class = (Class)OAVStyle;
  v2 = [(OAVStyle *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    string = v2->_string;
    v2->_string = (NSMutableString *)v3;
  }
  return v2;
}

- (void)addPropertyWithName:(id)a3 value:(id)a4
{
}

- (id)styleAttributeValue
{
  return self->_string;
}

- (void).cxx_destruct
{
}

@end