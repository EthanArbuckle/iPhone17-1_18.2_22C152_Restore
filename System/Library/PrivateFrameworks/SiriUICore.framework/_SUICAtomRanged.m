@interface _SUICAtomRanged
+ (id)atomWithEditRange:(_NSRange)a3 replacementText:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEditScriptAtomRanged:(id)a3;
- (NSString)replacementText;
- (_NSRange)editRange;
- (_SUICAtomRanged)initWithEditRange:(_NSRange)a3 replacementText:(id)a4;
- (id)description;
- (void)setEditRange:(_NSRange)a3;
- (void)setReplacementText:(id)a3;
@end

@implementation _SUICAtomRanged

- (_SUICAtomRanged)initWithEditRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SUICAtomRanged;
  v8 = [(_SUICAtomRanged *)&v11 init];
  v9 = v8;
  if (v8)
  {
    -[_SUICAtomRanged setEditRange:](v8, "setEditRange:", location, length);
    [(_SUICAtomRanged *)v9 setReplacementText:v7];
  }

  return v9;
}

- (id)description
{
  p_isa = self->_replacementText;
  if ([(NSString *)self->_replacementText length])
  {
    if (![(NSString *)self->_replacementText isEqualToString:@" "]) {
      goto LABEL_6;
    }
    v4 = @"[space]";
  }
  else
  {
    v4 = @"[blank]";
  }

  p_isa = &v4->isa;
LABEL_6:
  v5 = [NSString stringWithFormat:@"(%lu, %lu):%@\n", self->_editRange.location, self->_editRange.length, p_isa];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SUICAtomRanged *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(_SUICAtomRanged *)self isEqualToEditScriptAtomRanged:v5];

  return v6;
}

- (BOOL)isEqualToEditScriptAtomRanged:(id)a3
{
  v4 = (_SUICAtomRanged *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v15 = 1;
  }
  else if (v4 {
         && (uint64_t v6 = [(_SUICAtomRanged *)self editRange], v6 == [(_SUICAtomRanged *)v5 editRange])
  }
         && ([(_SUICAtomRanged *)self editRange],
             uint64_t v8 = v7,
             [(_SUICAtomRanged *)v5 editRange],
             v8 == v9))
  {
    v10 = [(_SUICAtomRanged *)self replacementText];
    uint64_t v11 = [(_SUICAtomRanged *)v5 replacementText];
    if (v10 == (void *)v11)
    {
      char v15 = 1;
      v12 = v10;
    }
    else
    {
      v12 = (void *)v11;
      v13 = [(_SUICAtomRanged *)self replacementText];
      v14 = [(_SUICAtomRanged *)v5 replacementText];
      char v15 = [v13 isEqualToString:v14];
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

+ (id)atomWithEditRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  uint64_t v7 = -[_SUICAtomRanged initWithEditRange:replacementText:]([_SUICAtomRanged alloc], "initWithEditRange:replacementText:", location, length, v6);

  return v7;
}

- (_NSRange)editRange
{
  NSUInteger length = self->_editRange.length;
  NSUInteger location = self->_editRange.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setEditRange:(_NSRange)a3
{
  self->_editRange = a3;
}

- (NSString)replacementText
{
  return self->_replacementText;
}

- (void)setReplacementText:(id)a3
{
}

- (void).cxx_destruct
{
}

@end