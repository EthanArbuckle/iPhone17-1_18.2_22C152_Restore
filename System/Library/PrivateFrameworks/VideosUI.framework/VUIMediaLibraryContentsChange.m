@interface VUIMediaLibraryContentsChange
- (BOOL)isEqual:(id)a3;
- (VUIMediaLibraryContentsChange)init;
- (VUIMediaLibraryContentsChange)initWithRevision:(unint64_t)a3;
- (id)description;
- (unint64_t)revision;
- (void)setRevision:(unint64_t)a3;
@end

@implementation VUIMediaLibraryContentsChange

- (VUIMediaLibraryContentsChange)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIMediaLibraryContentsChange)initWithRevision:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VUIMediaLibraryContentsChange;
  result = [(VUIMediaLibraryContentsChange *)&v5 init];
  if (result) {
    result->_revision = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (VUIMediaLibraryContentsChange *)a3;
  objc_super v5 = v4;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    unint64_t v7 = [(VUIMediaLibraryContentsChange *)self revision];
    uint64_t v8 = [(VUIMediaLibraryContentsChange *)v6 revision];

    BOOL v9 = v7 == v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12.receiver = self;
  v12.super_class = (Class)VUIMediaLibraryContentsChange;
  uint64_t v4 = [(VUIMediaLibraryContentsChange *)&v12 description];
  [v3 addObject:v4];

  objc_super v5 = NSString;
  v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[VUIMediaLibraryContentsChange revision](self, "revision"));
  unint64_t v7 = [v5 stringWithFormat:@"%@=%@", @"revision", v6];
  [v3 addObject:v7];

  uint64_t v8 = NSString;
  BOOL v9 = [v3 componentsJoinedByString:@", "];
  v10 = [v8 stringWithFormat:@"<%@>", v9];

  return v10;
}

- (unint64_t)revision
{
  return self->_revision;
}

- (void)setRevision:(unint64_t)a3
{
  self->_revision = a3;
}

@end