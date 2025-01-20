@interface PPPasteboardLocationItem
- (NSDate)createdAt;
- (NSDictionary)addressComponents;
- (NSString)bundleIdentifier;
- (NSString)text;
- (unint64_t)memoryFootprintEstimate;
- (void)setAddressComponents:(id)a3;
- (void)setBundleIdentifier:(id)a3;
- (void)setCreatedAt:(id)a3;
- (void)setText:(id)a3;
@end

@implementation PPPasteboardLocationItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressComponents, 0);
  objc_storeStrong((id *)&self->_createdAt, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

- (void)setAddressComponents:(id)a3
{
}

- (NSDictionary)addressComponents
{
  return self->_addressComponents;
}

- (void)setCreatedAt:(id)a3
{
}

- (NSDate)createdAt
{
  return self->_createdAt;
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setText:(id)a3
{
}

- (NSString)text
{
  return self->_text;
}

- (unint64_t)memoryFootprintEstimate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = __51__PPPasteboardLocationItem_memoryFootprintEstimate__block_invoke(self->_text);
  unint64_t v4 = __51__PPPasteboardLocationItem_memoryFootprintEstimate__block_invoke(self->_bundleIdentifier) + v3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [(NSDictionary *)self->_addressComponents objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v4 += __51__PPPasteboardLocationItem_memoryFootprintEstimate__block_invoke(*(void **)(*((void *)&v11 + 1)
                                                                                            + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

uint64_t __51__PPPasteboardLocationItem_memoryFootprintEstimate__block_invoke(void *a1)
{
  id v1 = a1;
  if (malloc_size(v1))
  {
    uint64_t v4 = 0;
    if (objc_msgSend(v1, "_pas_fastUTF8StringPtrWithOptions:encodedLength:", 0, &v4)) {
      uint64_t v2 = v4;
    }
    else {
      uint64_t v2 = [v1 lengthOfBytesUsingEncoding:10];
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

@end