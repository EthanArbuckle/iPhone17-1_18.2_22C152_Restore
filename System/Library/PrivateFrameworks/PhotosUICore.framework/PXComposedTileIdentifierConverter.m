@interface PXComposedTileIdentifierConverter
- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3;
- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4;
- (NSArray)converters;
- (PXComposedTileIdentifierConverter)init;
- (PXComposedTileIdentifierConverter)initWithTileIdentifierConverters:(id)a3;
@end

@implementation PXComposedTileIdentifierConverter

- (void).cxx_destruct
{
}

- (NSArray)converters
{
  return self->_converters;
}

- (BOOL)reverseTransformTileIdentifier:(PXTileIdentifier *)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(PXComposedTileIdentifierConverter *)self converters];
  v5 = [v4 reverseObjectEnumerator];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) reverseTransformTileIdentifier:a3])
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)transformTileIdentifier:(PXTileIdentifier *)a3 group:(unint64_t *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(PXComposedTileIdentifierConverter *)self converters];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v13 + 1) + 8 * i) transformTileIdentifier:a3 group:a4])
        {
          BOOL v11 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (PXComposedTileIdentifierConverter)initWithTileIdentifierConverters:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXComposedTileIdentifierConverter;
  v5 = [(PXComposedTileIdentifierConverter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    converters = v5->_converters;
    v5->_converters = (NSArray *)v6;
  }
  return v5;
}

- (PXComposedTileIdentifierConverter)init
{
  return [(PXComposedTileIdentifierConverter *)self initWithTileIdentifierConverters:MEMORY[0x1E4F1CBF0]];
}

@end