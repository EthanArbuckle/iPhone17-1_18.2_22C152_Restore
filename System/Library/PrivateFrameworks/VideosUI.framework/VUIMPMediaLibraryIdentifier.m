@interface VUIMPMediaLibraryIdentifier
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)identifier;
- (VUIMPMediaLibraryIdentifier)init;
- (VUIMPMediaLibraryIdentifier)initWithIdentifier:(id)a3;
- (unint64_t)hash;
- (void)setIdentifier:(id)a3;
@end

@implementation VUIMPMediaLibraryIdentifier

- (VUIMPMediaLibraryIdentifier)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIMPMediaLibraryIdentifier;
  v5 = [(VUIMPMediaLibraryIdentifier *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;
  }
  return v5;
}

- (VUIMPMediaLibraryIdentifier)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (unint64_t)hash
{
  v2 = [(VUIMPMediaLibraryIdentifier *)self identifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIMPMediaLibraryIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    char v12 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v6 = v5;
    v7 = [(VUIMPMediaLibraryIdentifier *)self identifier];
    v8 = [(VUIMPMediaLibraryIdentifier *)v6 identifier];
    id v9 = v7;
    id v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {
      char v12 = 1;
    }
    else
    {
      char v12 = 0;
      if (v9 && v10) {
        char v12 = [v9 isEqual:v10];
      }
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12.receiver = self;
  v12.super_class = (Class)VUIMPMediaLibraryIdentifier;
  uint64_t v4 = [(VUIMPMediaLibraryIdentifier *)&v12 description];
  [v3 addObject:v4];

  v5 = NSString;
  uint64_t v6 = [(VUIMPMediaLibraryIdentifier *)self identifier];
  v7 = [v5 stringWithFormat:@"%@=%@", @"identifier", v6];
  [v3 addObject:v7];

  v8 = NSString;
  id v9 = [v3 componentsJoinedByString:@", "];
  id v10 = [v8 stringWithFormat:@"<%@>", v9];

  return (NSString *)v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end