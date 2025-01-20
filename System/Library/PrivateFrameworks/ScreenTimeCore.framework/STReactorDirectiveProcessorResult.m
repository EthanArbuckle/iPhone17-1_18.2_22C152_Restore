@interface STReactorDirectiveProcessorResult
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToReactorDirectiveProcessorResult:(id)a3;
- (NSCopying)output;
- (STReactorDirective)processedDirective;
- (STReactorDirectiveProcessorResult)initWithOutput:(id)a3 processedDirective:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
@end

@implementation STReactorDirectiveProcessorResult

- (STReactorDirectiveProcessorResult)initWithOutput:(id)a3 processedDirective:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)STReactorDirectiveProcessorResult;
  id v5 = a4;
  id v6 = a3;
  v7 = [(STReactorDirectiveProcessorResult *)&v13 init];
  v8 = (NSCopying *)objc_msgSend(v6, "copy", v13.receiver, v13.super_class);

  output = v7->_output;
  v7->_output = v8;

  v10 = (STReactorDirective *)[v5 copy];
  processedDirective = v7->_processedDirective;
  v7->_processedDirective = v10;

  return v7;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  id v5 = [(STReactorDirectiveProcessorResult *)self processedDirective];
  id v6 = (char *)[v5 type] - 1;
  if ((unint64_t)v6 > 0x10) {
    CFStringRef v7 = @"DoNothing";
  }
  else {
    CFStringRef v7 = *(&off_1002FDDB0 + (void)v6);
  }
  v8 = [(STReactorDirectiveProcessorResult *)self output];
  v9 = +[NSString stringWithFormat:@"<%p:%@ { Directive: %@, Output: %@ }>", self, v4, v7, v8];

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  processedDirective = self->_processedDirective;
  output = self->_output;
  return [v4 initWithOutput:output processedDirective:processedDirective];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STReactorDirectiveProcessorResult *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STReactorDirectiveProcessorResult *)self isEqualToReactorDirectiveProcessorResult:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToReactorDirectiveProcessorResult:(id)a3
{
  CFStringRef v7 = (STReactorDirectiveProcessorResult *)a3;
  if (self == v7)
  {
    unsigned __int8 v10 = 1;
    goto LABEL_14;
  }
  v8 = [(STReactorDirectiveProcessorResult *)self output];
  if (v8
    || ([(STReactorDirectiveProcessorResult *)v7 output],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = [(STReactorDirectiveProcessorResult *)self output];
    BOOL v5 = [(STReactorDirectiveProcessorResult *)v7 output];
    if (![v4 isEqual:v5])
    {
      unsigned __int8 v10 = 0;
LABEL_10:

      goto LABEL_11;
    }
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  v11 = [(STReactorDirectiveProcessorResult *)self processedDirective];
  v12 = [(STReactorDirectiveProcessorResult *)v7 processedDirective];
  unsigned __int8 v10 = [v11 isEqualToReactorDirective:v12];

  if (v9) {
    goto LABEL_10;
  }
LABEL_11:
  if (!v8) {

  }
LABEL_14:
  return v10;
}

- (unint64_t)hash
{
  v3 = [(STReactorDirectiveProcessorResult *)self output];
  unint64_t v4 = (unint64_t)[v3 hash];
  BOOL v5 = [(STReactorDirectiveProcessorResult *)self processedDirective];
  unint64_t v6 = (unint64_t)[v5 hash] ^ v4;

  return v6;
}

- (STReactorDirective)processedDirective
{
  return (STReactorDirective *)objc_getProperty(self, a2, 8, 1);
}

- (NSCopying)output
{
  return (NSCopying *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_output, 0);
  objc_storeStrong((id *)&self->_processedDirective, 0);
}

@end