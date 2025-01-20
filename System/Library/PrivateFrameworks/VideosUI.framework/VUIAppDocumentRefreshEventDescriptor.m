@interface VUIAppDocumentRefreshEventDescriptor
- (BOOL)isEqual:(id)a3;
- (NSString)name;
- (VUIAppDocumentRefreshEventDescriptor)initWithEventType:(unint64_t)a3;
- (VUIAppDocumentRefreshEventDescriptor)initWithEventType:(unint64_t)a3 delayInSeconds:(unint64_t)a4 name:(id)a5;
- (id)description;
- (unint64_t)delayInSeconds;
- (unint64_t)hash;
- (void)setDelayInSeconds:(unint64_t)a3;
- (void)setName:(id)a3;
@end

@implementation VUIAppDocumentRefreshEventDescriptor

- (void).cxx_destruct
{
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v15.receiver = self;
  v15.super_class = (Class)VUIAppDocumentRefreshEventDescriptor;
  v4 = [(VUIAppDocumentUpdateEventDescriptor *)&v15 description];
  [v3 addObject:v4];

  v5 = NSString;
  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIAppDocumentRefreshEventDescriptor delayInSeconds](self, "delayInSeconds"));
  v7 = [v5 stringWithFormat:@"%@=%@", @"delayInSeconds", v6];
  [v3 addObject:v7];

  v8 = NSString;
  v9 = [(VUIAppDocumentRefreshEventDescriptor *)self name];
  v10 = [v8 stringWithFormat:@"%@=%@", @"name", v9];
  [v3 addObject:v10];

  v11 = NSString;
  v12 = [v3 componentsJoinedByString:@", "];
  v13 = [v11 stringWithFormat:@"<%@>", v12];

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (VUIAppDocumentRefreshEventDescriptor *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v14 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    unint64_t v7 = [(VUIAppDocumentUpdateEventDescriptor *)self type];
    if (v7 == [(VUIAppDocumentUpdateEventDescriptor *)v6 type]
      && (unint64_t v8 = [(VUIAppDocumentRefreshEventDescriptor *)self delayInSeconds],
          v8 == [(VUIAppDocumentRefreshEventDescriptor *)v6 delayInSeconds]))
    {
      v9 = [(VUIAppDocumentRefreshEventDescriptor *)self name];
      v10 = [(VUIAppDocumentRefreshEventDescriptor *)v6 name];
      id v11 = v9;
      id v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {
        char v14 = 1;
      }
      else
      {
        char v14 = 0;
        if (v11 && v12) {
          char v14 = [v11 isEqual:v12];
        }
      }
    }
    else
    {
      char v14 = 0;
    }
  }
  else
  {
    char v14 = 0;
  }

  return v14;
}

- (unint64_t)hash
{
  unint64_t v3 = [(VUIAppDocumentUpdateEventDescriptor *)self type];
  unint64_t v4 = v3 ^ (2 * [(VUIAppDocumentRefreshEventDescriptor *)self delayInSeconds]);
  v5 = [(VUIAppDocumentRefreshEventDescriptor *)self name];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (unint64_t)delayInSeconds
{
  return self->_delayInSeconds;
}

- (NSString)name
{
  return self->_name;
}

- (VUIAppDocumentRefreshEventDescriptor)initWithEventType:(unint64_t)a3 delayInSeconds:(unint64_t)a4 name:(id)a5
{
  id v8 = a5;
  if (!a4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The delayInSeconds parameter must be greater than 0"];
  }
  if (a3 >= 3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The eventType for refresh must be either foregroundTTL, refreshTTL or activeTTL" format];
  }
  v14.receiver = self;
  v14.super_class = (Class)VUIAppDocumentRefreshEventDescriptor;
  v9 = [(VUIAppDocumentUpdateEventDescriptor *)&v14 initWithEventType:a3];
  v10 = v9;
  if (v9)
  {
    v9->_delayInSeconds = a4;
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;
  }
  return v10;
}

- (VUIAppDocumentRefreshEventDescriptor)initWithEventType:(unint64_t)a3
{
  unint64_t v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  unint64_t v6 = NSStringFromSelector(a2);
  [v4 raise:v5, @"The %@ initializer is not available.", v6 format];

  return 0;
}

- (void)setDelayInSeconds:(unint64_t)a3
{
  self->_delayInSeconds = a3;
}

- (void)setName:(id)a3
{
}

@end