@interface _WTTextChunk
- (NSString)identifier;
- (_WTTextChunk)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initChunkWithIdentifier:(id)a3;
@end

@implementation _WTTextChunk

- (id)initChunkWithIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_WTTextChunk;
  v6 = [(_WTTextChunk *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v8 = v7;
  }

  return v7;
}

- (_WTTextChunk)init
{
  v3 = [MEMORY[0x263F08C38] UUID];
  v4 = [v3 UUIDString];
  id v5 = [(_WTTextChunk *)self initChunkWithIdentifier:v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [_WTTextChunk alloc];
  id v5 = [(_WTTextChunk *)self identifier];
  id v6 = [(_WTTextChunk *)v4 initChunkWithIdentifier:v5];

  return v6;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end