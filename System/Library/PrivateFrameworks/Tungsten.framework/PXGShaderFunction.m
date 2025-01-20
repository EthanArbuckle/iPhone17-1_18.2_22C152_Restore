@interface PXGShaderFunction
+ (NSArray)shaderFunctions;
+ (NSDictionary)shaderFunctionByName;
- (BOOL)isOpaque;
- (NSString)assignmentVariable;
- (NSString)name;
- (PXGShaderFunction)initWithName:(id)a3 assignmentVariable:(id)a4 isOpaque:(BOOL)a5;
- (id)description;
- (unint64_t)hash;
@end

@implementation PXGShaderFunction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assignmentVariable, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (BOOL)isOpaque
{
  return self->_isOpaque;
}

- (NSString)assignmentVariable
{
  return self->_assignmentVariable;
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)hash
{
  v2 = [(PXGShaderFunction *)self name];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(PXGShaderFunction *)self name];
  v7 = [(PXGShaderFunction *)self assignmentVariable];
  BOOL v8 = [(PXGShaderFunction *)self isOpaque];
  v9 = @"NO";
  if (v8) {
    v9 = @"YES";
  }
  v10 = v9;
  objc_msgSend(v3, "stringWithFormat:", @"<%@:%p; name:%@ assignmentVariable:%@ isOpaque:%@>",
    v5,
    self,
    v6,
    v7,
  v11 = v10);

  return v11;
}

- (PXGShaderFunction)initWithName:(id)a3 assignmentVariable:(id)a4 isOpaque:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PXGShaderFunction;
  v10 = [(PXGShaderFunction *)&v16 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    name = v10->_name;
    v10->_name = (NSString *)v11;

    uint64_t v13 = [v9 copy];
    assignmentVariable = v10->_assignmentVariable;
    v10->_assignmentVariable = (NSString *)v13;

    v10->_isOpaque = a5;
  }

  return v10;
}

+ (NSDictionary)shaderFunctionByName
{
  if (shaderFunctionByName_onceToken != -1) {
    dispatch_once(&shaderFunctionByName_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)shaderFunctionByName_shaderFunctionByName;

  return (NSDictionary *)v2;
}

void __41__PXGShaderFunction_shaderFunctionByName__block_invoke()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v0 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v1 = +[PXGShaderFunction shaderFunctions];
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        v7 = [v6 name];
        [v0 setObject:v6 forKeyedSubscript:v7];
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v3);
  }

  id v8 = (void *)shaderFunctionByName_shaderFunctionByName;
  shaderFunctionByName_shaderFunctionByName = (uint64_t)v0;
}

+ (NSArray)shaderFunctions
{
  if (shaderFunctions_onceToken != -1) {
    dispatch_once(&shaderFunctions_onceToken, &__block_literal_global_415);
  }
  uint64_t v2 = (void *)shaderFunctions_shaderFunctions;

  return (NSArray *)v2;
}

void __36__PXGShaderFunction_shaderFunctions__block_invoke()
{
  v5[3] = *MEMORY[0x263EF8340];
  id v0 = [[PXGShaderFunction alloc] initWithName:@"fragmentTextureCoordinates" assignmentVariable:@"textureCoordinates" isOpaque:1];
  v1 = [[PXGShaderFunction alloc] initWithName:@"fragmentColor", @"color.rgb", 1, v0 assignmentVariable isOpaque];
  v5[1] = v1;
  uint64_t v2 = [[PXGShaderFunction alloc] initWithName:@"fragmentAlpha" assignmentVariable:@"maskAlpha" isOpaque:0];
  v5[2] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:3];
  uint64_t v4 = (void *)shaderFunctions_shaderFunctions;
  shaderFunctions_shaderFunctions = v3;
}

@end