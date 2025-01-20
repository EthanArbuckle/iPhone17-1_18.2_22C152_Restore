@interface OZShaderController
- (MTLDevice)device;
- (MTLLibrary)library;
- (NSMutableArray)parameters;
- (NSRegularExpression)functionRegex;
- (NSRegularExpression)paramRegex;
- (NSString)fragmentFunctionName;
- (NSString)shader;
- (NSString)vertexFunctionName;
- (NSURL)url;
- (OZShaderController)initWithURL:(id)a3;
- (id)functionNameFromLine:(id)a3;
- (id)preprocess:(id)a3;
- (id)process:(id)a3;
- (void)dealloc;
- (void)initRegex;
- (void)loadShaderWithURL:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFunctionRegex:(id)a3;
- (void)setParamRegex:(id)a3;
- (void)setShader:(id)a3;
@end

@implementation OZShaderController

- (OZShaderController)initWithURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)OZShaderController;
  v4 = [(OZShaderController *)&v6 init];
  if (v4)
  {
    v4->_parameters = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(OZShaderController *)v4 initRegex];
    [(OZShaderController *)v4 loadShaderWithURL:a3];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OZShaderController;
  [(OZShaderController *)&v3 dealloc];
}

- (void)initRegex
{
  self->_paramRegex = (NSRegularExpression *)(id)[MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\s*EXPORT\\s+(CHANNEL_(?:FLOAT|PERCENT|ANGLE|COLOR|POSITION|PADDING|TEXTURE_2D|TRANSFORM))\\s+(float[1-4]?|texture2d<float>|float4x4)\\s+([a-zA-Z_][a-zA-Z_0-9]*)(.*)" options:0 error:0];
  self->_functionRegex = (NSRegularExpression *)(id)[MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"\\s*(?:vertex|fragment)\\s+(?:[a-zA-Z_][a-zA-Z_0-9]*)\\s+([a-zA-Z_][a-zA-Z_0-9]*)" options:0 error:0];
}

- (void)loadShaderWithURL:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_url = (NSURL *)[a3 copy];
  v5 = (NSString *)[NSString stringWithContentsOfURL:a3 encoding:134217984 error:0];
  self->_shader = v5;
  if (v5)
  {
    objc_super v6 = [(OZShaderController *)self preprocess:v5];
    self->_shader = v6;
    v7 = v6;
    if (self->_shader)
    {
      v8 = (MTLDevice *)MTLCreateSystemDefaultDevice();
      self->_device = v8;
      v11 = 0;
      self->_library = (MTLLibrary *)[(MTLDevice *)v8 newLibraryWithSource:self->_shader options:0 error:&v11];
      v9 = v11;
      if (v11)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v9 localizedDescription];
          *(_DWORD *)buf = 138412290;
          uint64_t v13 = v10;
          _os_log_impl(&dword_1B73F3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[Shader] Error while processing script file: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (id)preprocess:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = objc_msgSend(a3, "componentsSeparatedByCharactersInSet:", objc_msgSend(MEMORY[0x1E4F28B88], "newlineCharacterSet"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (!v5) {
    return &stru_1F119C770;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v12;
  v8 = &stru_1F119C770;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v12 != v7) {
        objc_enumerationMutation(v4);
      }
      v8 = (__CFString *)[(__CFString *)v8 stringByAppendingFormat:@"%@\n", [(OZShaderController *)self process:*(void *)(*((void *)&v11 + 1) + 8 * i)]];
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  }
  while (v6);
  return v8;
}

- (id)process:(id)a3
{
  id v3 = a3;
  if (![a3 containsString:@"EXPORT"])
  {
    if ([v3 hasPrefix:@"vertex"])
    {
      self->_vertexFunctionName = (NSString *)[(OZShaderController *)self functionNameFromLine:v3];
    }
    else if ([v3 hasPrefix:@"fragment"])
    {
      self->_fragmentFunctionName = (NSString *)[(OZShaderController *)self functionNameFromLine:v3];
    }
    return v3;
  }
  uint64_t v5 = -[NSRegularExpression firstMatchInString:options:range:](self->_paramRegex, "firstMatchInString:options:range:", v3, 0, 0, [v3 length]);
  if (!v5)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B73F3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[Shader] Error parsing published parameter", buf, 2u);
    }
    return &stru_1F119C770;
  }
  uint64_t v6 = v5;
  uint64_t v7 = [(NSTextCheckingResult *)v5 rangeAtIndex:1];
  v9 = objc_msgSend(v3, "substringWithRange:", v7, v8);
  uint64_t v10 = [(NSTextCheckingResult *)v6 rangeAtIndex:2];
  uint64_t v12 = objc_msgSend(v3, "substringWithRange:", v10, v11);
  uint64_t v13 = [(NSTextCheckingResult *)v6 rangeAtIndex:3];
  uint64_t v15 = objc_msgSend(v3, "substringWithRange:", v13, v14);
  uint64_t v16 = [(NSTextCheckingResult *)v6 rangeAtIndex:4];
  uint64_t v18 = objc_msgSend(v3, "substringWithRange:", v16, v17);
  if ([v9 isEqualToString:@"CHANNEL_FLOAT"])
  {
    uint64_t v19 = 0;
  }
  else if ([v9 isEqualToString:@"CHANNEL_PERCENT"])
  {
    uint64_t v19 = 1;
  }
  else if ([v9 isEqualToString:@"CHANNEL_ANGLE"])
  {
    uint64_t v19 = 4;
  }
  else if ([v9 isEqualToString:@"CHANNEL_COLOR"])
  {
    uint64_t v19 = 2;
  }
  else if ([v9 isEqualToString:@"CHANNEL_POSITION"])
  {
    uint64_t v19 = 3;
  }
  else if ([v9 isEqualToString:@"CHANNEL_PADDING"])
  {
    uint64_t v19 = 5;
  }
  else if ([v9 isEqualToString:@"CHANNEL_TEXTURE_2D"])
  {
    uint64_t v19 = 6;
  }
  else if ([v9 isEqualToString:@"CHANNEL_TRANSFORM"])
  {
    uint64_t v19 = 7;
  }
  else
  {
    uint64_t v19 = 0;
  }
  v21 = [[OZShaderParameter alloc] initWithName:v15 type:v19];
  [(NSMutableArray *)self->_parameters addObject:v21];

  return (id)[NSString stringWithFormat:@"%@ %@%@", v12, v15, v18];
}

- (id)functionNameFromLine:(id)a3
{
  id result = -[NSRegularExpression firstMatchInString:options:range:](self->_functionRegex, "firstMatchInString:options:range:", a3, 0, 0, [a3 length]);
  if (result)
  {
    uint64_t v6 = [result rangeAtIndex:1];
    return (id)objc_msgSend(a3, "substringWithRange:", v6, v5);
  }
  return result;
}

- (NSURL)url
{
  return self->_url;
}

- (MTLLibrary)library
{
  return self->_library;
}

- (NSMutableArray)parameters
{
  return self->_parameters;
}

- (NSString)vertexFunctionName
{
  return self->_vertexFunctionName;
}

- (NSString)fragmentFunctionName
{
  return self->_fragmentFunctionName;
}

- (NSString)shader
{
  return self->_shader;
}

- (void)setShader:(id)a3
{
}

- (MTLDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (NSRegularExpression)paramRegex
{
  return self->_paramRegex;
}

- (void)setParamRegex:(id)a3
{
}

- (NSRegularExpression)functionRegex
{
  return self->_functionRegex;
}

- (void)setFunctionRegex:(id)a3
{
}

@end