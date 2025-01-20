@interface PLDescriptionBuilder
+ (id)descriptionBuilderWithObject:(id)a3;
+ (id)plainDescriptionBuilder;
+ (id)plainMultiLineDescriptionBuilder;
+ (id)prettyMultiLineDescriptionBuilderWithObject:(id)a3 indent:(int64_t)a4;
- (NSString)separator;
- (PLDescriptionBuilder)initWithObject:(id)a3 style:(int64_t)a4 indent:(int64_t)a5;
- (id)build;
- (int64_t)indent;
- (int64_t)style;
- (void)appendName:(id)a3 BOOLValue:(BOOL)a4;
- (void)appendName:(id)a3 cgSize:(CGSize)a4;
- (void)appendName:(id)a3 doubleValue:(double)a4;
- (void)appendName:(id)a3 floatValue:(float)a4;
- (void)appendName:(id)a3 integerValue:(int64_t)a4;
- (void)appendName:(id)a3 object:(id)a4;
- (void)appendName:(id)a3 typeCode:(const char *)a4 value:(const void *)a5;
- (void)appendName:(id)a3 unsignedIntegerValue:(unint64_t)a4;
- (void)setSeparator:(id)a3;
@end

@implementation PLDescriptionBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_indentString, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

- (void)setSeparator:(id)a3
{
}

- (NSString)separator
{
  return self->_separator;
}

- (id)build
{
  if ([(_PLDescriptionStyle *)self->_style prettyPrint]) {
    [(NSMutableString *)self->_description appendString:@"\n"];
  }
  description = self->_description;
  v4 = PLIndentToString();
  [(NSMutableString *)description appendString:v4];

  v5 = self->_description;
  v6 = [(_PLDescriptionStyle *)self->_style suffix];
  [(NSMutableString *)v5 appendString:v6];

  v7 = (void *)[(NSMutableString *)self->_description copy];
  return v7;
}

- (void)appendName:(id)a3 typeCode:(const char *)a4 value:(const void *)a5
{
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__PLDescriptionBuilder_appendName_typeCode_value___block_invoke;
  v10[3] = &unk_1E58686C0;
  v10[4] = self;
  id v8 = a3;
  v9 = _PLToStringFromTypeAndValueWithDescriptionBlock(a4, (NSRect *)a5, v10);
  [(PLDescriptionBuilder *)self appendName:v8 object:v9];
}

uint64_t __50__PLDescriptionBuilder_appendName_typeCode_value___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) descriptionForObject:a2 withIndent:*(void *)(*(void *)(a1 + 32) + 32) + 1];
}

- (void)appendName:(id)a3 cgSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v7 = a3;
  v10.CGFloat width = width;
  v10.CGFloat height = height;
  NSStringFromSize(v10);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PLDescriptionBuilder *)self appendName:v7 object:v8];
}

- (void)appendName:(id)a3 doubleValue:(double)a4
{
  v6 = NSString;
  id v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", @"%lf", *(void *)&a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PLDescriptionBuilder *)self appendName:v7 object:v8];
}

- (void)appendName:(id)a3 floatValue:(float)a4
{
  v5 = NSString;
  double v6 = a4;
  id v7 = a3;
  objc_msgSend(v5, "stringWithFormat:", @"%f", *(void *)&v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PLDescriptionBuilder *)self appendName:v7 object:v8];
}

- (void)appendName:(id)a3 unsignedIntegerValue:(unint64_t)a4
{
  double v6 = NSString;
  id v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", @"%lu", a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PLDescriptionBuilder *)self appendName:v7 object:v8];
}

- (void)appendName:(id)a3 integerValue:(int64_t)a4
{
  double v6 = NSString;
  id v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", @"%ld", a4);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [(PLDescriptionBuilder *)self appendName:v7 object:v8];
}

- (void)appendName:(id)a3 BOOLValue:(BOOL)a4
{
  if (a4) {
    v4 = @"YES";
  }
  else {
    v4 = @"NO";
  }
  [(PLDescriptionBuilder *)self appendName:a3 object:v4];
}

- (void)appendName:(id)a3 object:(id)a4
{
  description = self->_description;
  separator = self->_separator;
  indentString = self->_indentString;
  style = self->_style;
  id v10 = a4;
  id v11 = a3;
  v12 = [(_PLDescriptionStyle *)style nameValueSeparator];
  v13 = [(_PLDescriptionStyle *)self->_style descriptionForObject:v10 withIndent:self->_indent + 1];

  [(NSMutableString *)description appendFormat:@"%@%@%@%@%@", separator, indentString, v11, v12, v13];
  id v14 = [(_PLDescriptionStyle *)self->_style fieldSeparator];
  [(PLDescriptionBuilder *)self setSeparator:v14];
}

- (int64_t)indent
{
  return self->_indent;
}

- (int64_t)style
{
  return self->_descriptionStyle;
}

- (PLDescriptionBuilder)initWithObject:(id)a3 style:(int64_t)a4 indent:(int64_t)a5
{
  id v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PLDescriptionBuilder;
  id v10 = [(PLDescriptionBuilder *)&v24 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_object, a3);
    v12 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    description = v11->_description;
    v11->_description = v12;

    uint64_t v14 = +[_PLDescriptionStyle styleForEnum:a4];
    style = v11->_style;
    v11->_style = (_PLDescriptionStyle *)v14;

    v11->_descriptionStyle = a4;
    v11->_indent = a5;
    [(_PLDescriptionStyle *)v11->_style extraIndent];
    v16 = PLIndentToString();
    uint64_t v17 = [v16 copy];
    indentString = v11->_indentString;
    v11->_indentString = (NSString *)v17;

    if (a4 == 3 || !a4) {
      [(NSMutableString *)v11->_description appendFormat:@"<%@: %p", objc_opt_class(), v11->_object];
    }
    v19 = [(_PLDescriptionStyle *)v11->_style initialFieldSeparator];
    uint64_t v20 = [v19 copy];
    separator = v11->_separator;
    v11->_separator = (NSString *)v20;

    v22 = v11;
  }

  return v11;
}

+ (id)prettyMultiLineDescriptionBuilderWithObject:(id)a3 indent:(int64_t)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithObject:v6 style:3 indent:a4];

  return v7;
}

+ (id)plainMultiLineDescriptionBuilder
{
  v2 = (void *)[objc_alloc((Class)a1) initWithObject:0 style:2 indent:0];
  return v2;
}

+ (id)plainDescriptionBuilder
{
  v2 = (void *)[objc_alloc((Class)a1) initWithObject:0 style:1 indent:0];
  return v2;
}

+ (id)descriptionBuilderWithObject:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithObject:v4 style:0 indent:0];

  return v5;
}

@end