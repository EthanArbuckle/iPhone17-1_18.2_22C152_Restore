@interface ICSStringWriter
- (ICSStringWriter)init;
- (ICSStringWriter)initWithString:(id)a3;
- (NSString)description;
- (id)mutableResult;
- (id)result;
- (void)appendFormat:(id)a3;
- (void)appendString:(id)a3;
@end

@implementation ICSStringWriter

- (ICSStringWriter)init
{
  v6.receiver = self;
  v6.super_class = (Class)ICSStringWriter;
  v2 = [(ICSStringWriter *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    v4 = v2->_result;
    v2->_result = v3;
  }
  return v2;
}

- (ICSStringWriter)initWithString:(id)a3
{
  id v4 = a3;
  v5 = [(ICSStringWriter *)self init];
  objc_super v6 = v5;
  if (v5) {
    [(ICSStringWriter *)v5 appendString:v4];
  }

  return v6;
}

- (void)appendString:(id)a3
{
}

- (void)appendFormat:(id)a3
{
  id v4 = (objc_class *)NSString;
  id v5 = a3;
  objc_super v6 = (void *)[[v4 alloc] initWithFormat:v5 locale:0 arguments:&v7];

  [(NSMutableString *)self->_result appendString:v6];
}

- (id)result
{
  return (id)[NSString stringWithString:self->_result];
}

- (id)mutableResult
{
  return self->_result;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_super v6 = [(ICSStringWriter *)self result];
  uint64_t v7 = [v3 stringWithFormat:@"<%@:%p \"%@\">", v5, self, v6];

  return (NSString *)v7;
}

- (void).cxx_destruct
{
}

@end