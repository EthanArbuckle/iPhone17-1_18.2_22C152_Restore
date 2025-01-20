@interface SSEnvironmentElementMetadata
+ (BOOL)supportsBSXPCSecureCoding;
- (NSArray)rectsInElement;
- (NSString)loggableDescription;
- (NSString)userActivityTitle;
- (SSEnvironmentElementMetadata)initWithBSXPCCoder:(id)a3;
- (id)_decodedRectsForEncodedRects:(id)a3;
- (id)_encodableRects;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setRectsInElement:(id)a3;
- (void)setUserActivityTitle:(id)a3;
@end

@implementation SSEnvironmentElementMetadata

- (NSString)loggableDescription
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F089D8] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = [(SSEnvironmentElementMetadata *)self rectsInElement];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * i) CGRectValue];
        v9 = NSString;
        v10 = NSStringFromCGRect(v21);
        v11 = [v9 stringWithFormat:@" %@ ", v10];
        [v3 appendString:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  v12 = [(SSEnvironmentElementMetadata *)self userActivityTitle];
  [v3 appendString:v12];

  return (NSString *)v3;
}

- (id)_encodableRects
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(SSEnvironmentElementMetadata *)self rectsInElement];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        v10 = objc_alloc_init(SSXPCEncodableRectWrapper);
        [v9 CGRectValue];
        -[SSXPCEncodableRectWrapper setRect:](v10, "setRect:");
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)_decodedRectsForEncodedRects:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = (void *)MEMORY[0x263F08D40];
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "rect", (void)v13);
        v11 = objc_msgSend(v10, "valueWithCGRect:");
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SSEnvironmentElementMetadata *)self userActivityTitle];
  [v4 encodeObject:v5 forKey:@"SSEnvironmentElementMetadataUserActivityTitleKey"];

  id v6 = [(SSEnvironmentElementMetadata *)self _encodableRects];
  [v4 encodeCollection:v6 forKey:@"SSEnvironmentElementMetadataRectKey"];
}

- (SSEnvironmentElementMetadata)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(SSEnvironmentElementMetadata *)self init];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SSEnvironmentElementMetadataUserActivityTitleKey"];
  userActivityTitle = v5->_userActivityTitle;
  v5->_userActivityTitle = (NSString *)v6;

  uint64_t v8 = objc_opt_class();
  v9 = [v4 decodeCollectionOfClass:v8 containingClass:objc_opt_class() forKey:@"SSEnvironmentElementMetadataRectKey"];

  uint64_t v10 = [(SSEnvironmentElementMetadata *)v5 _decodedRectsForEncodedRects:v9];
  rectsInElement = v5->_rectsInElement;
  v5->_rectsInElement = (NSArray *)v10;

  return v5;
}

- (NSString)userActivityTitle
{
  return self->_userActivityTitle;
}

- (void)setUserActivityTitle:(id)a3
{
}

- (NSArray)rectsInElement
{
  return self->_rectsInElement;
}

- (void)setRectsInElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rectsInElement, 0);
  objc_storeStrong((id *)&self->_userActivityTitle, 0);
}

@end