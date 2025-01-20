@interface SSXPCEncodableRectWrapper
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
+ (id)encodedRectsInDictionary:(id)a3 forKey:(id)a4;
+ (void)encodeRects:(id)a3 inDictionary:(id)a4 forKey:(id)a5;
- (CGRect)rect;
- (SSXPCEncodableRectWrapper)initWithBSXPCCoder:(id)a3;
- (SSXPCEncodableRectWrapper)initWithCoder:(id)a3;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setRect:(CGRect)a3;
@end

@implementation SSXPCEncodableRectWrapper

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  [(SSXPCEncodableRectWrapper *)self rect];
  objc_msgSend(v4, "encodeCGRect:forKey:", @"SSXPCEncodableRectWrapperRectKey");
}

- (SSXPCEncodableRectWrapper)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSXPCEncodableRectWrapper *)self init];
  [v4 decodeCGRectForKey:@"SSXPCEncodableRectWrapperRectKey"];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[SSXPCEncodableRectWrapper setRect:](v5, "setRect:", v7, v9, v11, v13);
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(SSXPCEncodableRectWrapper *)self rect];
  objc_msgSend(v4, "encodeCGRect:forKey:", @"SSXPCEncodableRectWrapperRectKey");
}

- (SSXPCEncodableRectWrapper)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SSXPCEncodableRectWrapper *)self init];
  [v4 decodeCGRectForKey:@"SSXPCEncodableRectWrapperRectKey"];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  -[SSXPCEncodableRectWrapper setRect:](v5, "setRect:", v7, v9, v11, v13);
  return v5;
}

+ (id)encodedRectsInDictionary:(id)a3 forKey:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  double v7 = [MEMORY[0x263EFF980] array];
  id v8 = v6;
  [v8 cStringUsingEncoding:4];
  double v9 = BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (void *)MEMORY[0x263F08D40];
        [*(id *)(*((void *)&v17 + 1) + 8 * i) rect];
        v15 = objc_msgSend(v14, "valueWithCGRect:");
        [v7 addObject:v15];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }

  return v7;
}

+ (void)encodeRects:(id)a3 inDictionary:(id)a4 forKey:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v19 + 1) + 8 * v15);
        long long v17 = objc_alloc_init(SSXPCEncodableRectWrapper);
        objc_msgSend(v16, "CGRectValue", (void)v19);
        -[SSXPCEncodableRectWrapper setRect:](v17, "setRect:");
        [v10 addObject:v17];

        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  id v18 = v9;
  [v18 cStringUsingEncoding:4];
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();
}

- (CGRect)rect
{
  double x = self->_rect.origin.x;
  double y = self->_rect.origin.y;
  double width = self->_rect.size.width;
  double height = self->_rect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setRect:(CGRect)a3
{
  self->_rect = a3;
}

@end