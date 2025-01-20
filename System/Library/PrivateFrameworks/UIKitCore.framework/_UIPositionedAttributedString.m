@interface _UIPositionedAttributedString
+ (id)attributedString:(id)a3 atPosition:(id)a4;
- (NSAttributedString)string;
- (UITextPosition)position;
- (id)description;
@end

@implementation _UIPositionedAttributedString

+ (id)attributedString:(id)a3 atPosition:(id)a4
{
  id v6 = a4;
  v7 = v6;
  uint64_t v8 = 0;
  if (a3 && v6)
  {
    id v9 = a3;
    uint64_t v8 = objc_opt_new();
    uint64_t v10 = [v9 copy];

    v11 = *(void **)(v8 + 8);
    *(void *)(v8 + 8) = v10;

    objc_storeStrong((id *)(v8 + 16), a4);
  }

  return (id)v8;
}

- (id)description
{
  v3 = [(_UIPositionedAttributedString *)self string];
  v4 = [v3 string];

  if ((unint64_t)[(__CFString *)v4 length] >= 0x33)
  {
    v5 = [(__CFString *)v4 substringToIndex:47];
    uint64_t v6 = [v5 stringByAppendingString:@"..."];

    v4 = (__CFString *)v6;
  }
  v7 = [(_UIPositionedAttributedString *)self position];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = [v7 description];
  }
  else
  {
    id v9 = @"nil";
  }
  uint64_t v10 = NSString;
  v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = NSStringFromClass(v11);
  v13 = (void *)v12;
  v14 = @"(nil)";
  if (v4) {
    v14 = v4;
  }
  v15 = [v10 stringWithFormat:@"<%@:%p %@ @%@>", v12, self, v14, v9];

  return v15;
}

- (NSAttributedString)string
{
  return self->_string;
}

- (UITextPosition)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end