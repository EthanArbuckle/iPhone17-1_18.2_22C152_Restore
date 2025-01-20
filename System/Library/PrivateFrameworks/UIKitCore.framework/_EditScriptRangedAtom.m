@interface _EditScriptRangedAtom
+ (_EditScriptRangedAtom)atomWithEditRange:(_NSRange)a3 replacementText:(id)a4;
- (NSString)replacementText;
- (_EditScriptRangedAtom)initWithEditRange:(_NSRange)a3 replacementText:(id)a4;
- (_NSRange)editRange;
- (id)description;
- (void)setEditRange:(_NSRange)a3;
- (void)setReplacementText:(id)a3;
@end

@implementation _EditScriptRangedAtom

- (_EditScriptRangedAtom)initWithEditRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_EditScriptRangedAtom;
  v8 = [(_EditScriptRangedAtom *)&v11 init];
  v9 = v8;
  if (v8)
  {
    -[_EditScriptRangedAtom setEditRange:](v8, "setEditRange:", location, length);
    [(_EditScriptRangedAtom *)v9 setReplacementText:v7];
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

+ (_EditScriptRangedAtom)atomWithEditRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v6 = a4;
  id v7 = -[_EditScriptRangedAtom initWithEditRange:replacementText:]([_EditScriptRangedAtom alloc], "initWithEditRange:replacementText:", location, length, v6);

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