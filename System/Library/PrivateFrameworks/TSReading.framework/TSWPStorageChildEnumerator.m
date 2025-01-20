@interface TSWPStorageChildEnumerator
- (TSWPStorageChildEnumerator)initWithStorage:(id)a3 range:(_NSRange)a4;
- (id)nextObject;
- (void)dealloc;
@end

@implementation TSWPStorageChildEnumerator

- (TSWPStorageChildEnumerator)initWithStorage:(id)a3 range:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  v9.receiver = self;
  v9.super_class = (Class)TSWPStorageChildEnumerator;
  v7 = [(TSWPStorageChildEnumerator *)&v9 init];
  if (v7)
  {
    v7->_storage = (TSWPStorage *)a3;
    v7->_charRange.NSUInteger location = location;
    v7->_charRange.NSUInteger length = length;
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSWPStorageChildEnumerator;
  [(TSWPStorageChildEnumerator *)&v3 dealloc];
}

- (id)nextObject
{
  if (!self->_charOffsetArray)
  {
    objc_super v3 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_charOffsetArray = v3;
    NSUInteger length = self->_charRange.length;
    NSUInteger location = self->_charRange.location;
    uint64_t v4 = -[TSWPStorage attachmentIndexRangeForTextRange:](self->_storage, "attachmentIndexRangeForTextRange:");
    if (v5)
    {
      uint64_t v6 = v4;
      unint64_t v7 = v5;
      uint64_t v8 = 0;
      unsigned int v9 = 1;
      do
      {
        v44[0] = 0x7FFFFFFFFFFFFFFFLL;
        id v10 = [(TSWPStorage *)self->_storage attachmentAtAttachmentIndex:v8 + v6 outCharIndex:v44];
        if (v10)
        {
          id v11 = v10;
          id v12 = objc_alloc(NSNumber);
          v13 = (void *)[v12 initWithUnsignedInteger:v44[0]];
          v14 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v11, v13, 0);
          [(NSArray *)v3 addObject:v14];
        }
        uint64_t v8 = v9;
        BOOL v15 = v7 > v9++;
      }
      while (v15);
    }
    uint64_t v16 = -[TSWPStorage footnoteRangeForTextRange:](self->_storage, "footnoteRangeForTextRange:", location, length);
    if (v17)
    {
      uint64_t v18 = v16;
      unint64_t v19 = v17;
      uint64_t v20 = 0;
      unsigned int v21 = 1;
      do
      {
        v44[0] = 0x7FFFFFFFFFFFFFFFLL;
        id v22 = [(TSWPStorage *)self->_storage footnoteAtFootnoteIndex:v20 + v18 outCharIndex:v44];
        if (v22)
        {
          id v23 = v22;
          id v24 = objc_alloc(NSNumber);
          v25 = (void *)[v24 initWithUnsignedInteger:v44[0]];
          v26 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v23, v25, 0);
          [(NSArray *)v3 addObject:v26];
        }
        uint64_t v20 = v21;
        BOOL v15 = v19 > v21++;
      }
      while (v15);
    }
    unint64_t v27 = [(TSWPStorage *)self->_storage sectionCount];
    if (v27)
    {
      unint64_t v28 = v27;
      uint64_t v29 = 0;
      unsigned int v30 = 1;
      do
      {
        id v31 = [(TSWPStorage *)self->_storage sectionAtSectionIndex:v29 effectiveRange:v44];
        if (v31)
        {
          id v32 = v31;
          id v33 = objc_alloc(NSNumber);
          v34 = (void *)[v33 initWithUnsignedInteger:v44[0]];
          v35 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v32, v34, 0);
          [(NSArray *)v3 addObject:v35];
        }
        uint64_t v29 = v30;
        BOOL v15 = v28 > v30++;
      }
      while (v15);
    }
    [(NSArray *)v3 sortUsingFunction:comparePairs context:0];
  }
  if (!self->_storage) {
    return 0;
  }
  while (1)
  {
    NSUInteger v36 = [(NSArray *)self->_charOffsetArray count];
    NSUInteger index = self->_index;
    if (v36 <= index)
    {

      v39 = 0;
      self->_storage = 0;
      return v39;
    }
    charOffsetArray = self->_charOffsetArray;
    self->_NSUInteger index = index + 1;
    v39 = objc_msgSend(-[NSArray objectAtIndexedSubscript:](charOffsetArray, "objectAtIndexedSubscript:"), "objectAtIndexedSubscript:", 0);
    if ([v39 conformsToProtocol:&unk_26D7C04B8]) {
      return v39;
    }
    if ([v39 isDrawable]) {
      return (id)[v39 drawable];
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      break;
    }
    if (!self->_storage) {
      return 0;
    }
  }
  return (id)[v39 containedStorage];
}

@end