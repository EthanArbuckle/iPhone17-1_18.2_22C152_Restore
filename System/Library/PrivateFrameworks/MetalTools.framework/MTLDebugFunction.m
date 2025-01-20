@interface MTLDebugFunction
- (MTLFunctionConstantValues)constantValues;
- (id)bitcodeData;
- (id)formattedDescription:(unint64_t)a3;
- (id)importedLibraries;
- (id)importedSymbols;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5;
- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5;
- (void)dealloc;
- (void)setConstantValues:(id)a3;
@end

@implementation MTLDebugFunction

- (id)formattedDescription:(unint64_t)a3
{
  return &stru_26EF29A78;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDebugFunction;
  [(MTLToolsFunction *)&v3 dealloc];
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3
{
  return (id)newArgumentEncoder(self, a3, 0, 0, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 pipelineLibrary:(id)a4
{
  return (id)newArgumentEncoder(self, a3, 0, a4, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4
{
  return (id)newArgumentEncoder(self, a3, a4, 0, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 pipelineLibrary:(id)a5
{
  return (id)newArgumentEncoder(self, a3, a4, a5, 0);
}

- (id)newArgumentEncoderWithBufferIndex:(unint64_t)a3 reflection:(id *)a4 binaryArchives:(id)a5
{
  return (id)newArgumentEncoder(self, a3, a4, 0, a5);
}

- (id)importedSymbols
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 importedSymbols];
}

- (id)importedLibraries
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 importedLibraries];
}

- (id)bitcodeData
{
  id v2 = [(MTLToolsObject *)self baseObject];

  return (id)[v2 bitcodeData];
}

- (MTLFunctionConstantValues)constantValues
{
  return (MTLFunctionConstantValues *)objc_getProperty(self, a2, 48, 1);
}

- (void)setConstantValues:(id)a3
{
}

@end