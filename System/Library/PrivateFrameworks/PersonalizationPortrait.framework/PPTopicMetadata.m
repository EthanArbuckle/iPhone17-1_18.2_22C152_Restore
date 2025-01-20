@interface PPTopicMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)exactMatchInSourceText;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToTopicMetadata:(id)a3;
- (NSSet)featureNames;
- (PPTopicMetadata)initWithCoder:(id)a3;
- (PPTopicMetadata)initWithImpressionCount:(unsigned __int16)a3 occurrencesInSource:(unsigned __int16)a4 algorithmResultPosition:(unsigned __int16)a5 algorithmResultCount:(unsigned __int16)a6 exactMatchInSourceText:(BOOL)a7;
- (id)description;
- (id)featureValueForName:(id)a3;
- (unint64_t)hash;
- (unsigned)algorithmResultCount;
- (unsigned)algorithmResultPosition;
- (unsigned)impressionCount;
- (unsigned)occurrencesInSource;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPTopicMetadata

- (BOOL)exactMatchInSourceText
{
  return self->_exactMatchInSourceText;
}

- (unsigned)algorithmResultCount
{
  return self->_algorithmResultCount;
}

- (unsigned)algorithmResultPosition
{
  return self->_algorithmResultPosition;
}

- (unsigned)occurrencesInSource
{
  return self->_occurrencesInSource;
}

- (unsigned)impressionCount
{
  return self->_impressionCount;
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"impressionCount"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t impressionCount = self->_impressionCount;
LABEL_11:
    v7 = [v5 featureValueWithInt64:impressionCount];
    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"occurrencesInSource"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t impressionCount = self->_occurrencesInSource;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"algorithmResultPosition"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t impressionCount = self->_algorithmResultPosition;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"algorithmResultCount"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t impressionCount = self->_algorithmResultCount;
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"exactMatchInSourceText"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t impressionCount = self->_exactMatchInSourceText;
    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

  return v7;
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken4_6671 != -1) {
    dispatch_once(&featureNames__pasOnceToken4_6671, &__block_literal_global_6672);
  }
  v2 = (void *)featureNames__pasExprOnceResult_6673;
  return (NSSet *)v2;
}

void __31__PPTopicMetadata_featureNames__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  v1 = (void *)MEMORY[0x192F97350]();
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"impressionCount", @"occurrencesInSource", @"algorithmResultPosition", @"algorithmResultCount", @"exactMatchInSourceText", 0);
  v3 = (void *)featureNames__pasExprOnceResult_6673;
  featureNames__pasExprOnceResult_6673 = v2;
}

- (id)description
{
  id v3 = [NSString alloc];
  if (self->_exactMatchInSourceText) {
    id v4 = @"true";
  }
  else {
    id v4 = @"false";
  }
  v5 = (void *)[v3 initWithFormat:@"<PPTopicMetadata i:%hu o:%hu arp:%hu arc:%hu em:%@>", self->_impressionCount, self->_occurrencesInSource, self->_algorithmResultPosition, self->_algorithmResultCount, v4];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPTopicMetadata *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PPTopicMetadata *)self isEqualToTopicMetadata:v4];
  }

  return v5;
}

- (BOOL)isEqualToTopicMetadata:(id)a3
{
  id v4 = (PPTopicMetadata *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else if (v4 {
         && (int impressionCount = self->_impressionCount,
  }
             impressionCount == [(PPTopicMetadata *)v4 impressionCount])
         && (int occurrencesInSource = self->_occurrencesInSource,
             occurrencesInSource == [(PPTopicMetadata *)v5 occurrencesInSource])
         && (int algorithmResultPosition = self->_algorithmResultPosition,
             algorithmResultPosition == [(PPTopicMetadata *)v5 algorithmResultPosition])
         && (int algorithmResultCount = self->_algorithmResultCount,
             algorithmResultCount == [(PPTopicMetadata *)v5 algorithmResultCount]))
  {
    BOOL exactMatchInSourceText = self->_exactMatchInSourceText;
    BOOL v11 = exactMatchInSourceText == [(PPTopicMetadata *)v5 exactMatchInSourceText];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_occurrencesInSource - (unint64_t)self->_impressionCount + 32 * self->_impressionCount;
  uint64_t v3 = self->_algorithmResultPosition - v2 + 32 * v2;
  uint64_t v4 = self->_algorithmResultCount - v3 + 32 * v3;
  return self->_exactMatchInSourceText - v4 + 32 * v4;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t impressionCount = self->_impressionCount;
  id v5 = a3;
  [v5 encodeInt32:impressionCount forKey:@"ict"];
  [v5 encodeInt32:self->_occurrencesInSource forKey:@"ois"];
  [v5 encodeInt32:self->_algorithmResultPosition forKey:@"arp"];
  [v5 encodeInt32:self->_algorithmResultCount forKey:@"arc"];
  [v5 encodeBool:self->_exactMatchInSourceText forKey:@"ext"];
}

- (PPTopicMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 decodeInt32ForKey:@"ict"];
  if (HIWORD(v5)
    || (unsigned __int16 v6 = v5, v7 = [v4 decodeInt32ForKey:@"ois"], HIWORD(v7))
    || (unsigned __int16 v8 = v7, v9 = [v4 decodeInt32ForKey:@"arp"], HIWORD(v9))
    || (v10 = v9, unsigned int v11 = [v4 decodeInt32ForKey:@"arc"], HIWORD(v11)))
  {
    v12 = 0;
  }
  else
  {
    self = -[PPTopicMetadata initWithImpressionCount:occurrencesInSource:algorithmResultPosition:algorithmResultCount:exactMatchInSourceText:](self, "initWithImpressionCount:occurrencesInSource:algorithmResultPosition:algorithmResultCount:exactMatchInSourceText:", v6, v8, v10, (unsigned __int16)v11, [v4 decodeBoolForKey:@"ext"]);
    v12 = self;
  }

  return v12;
}

- (PPTopicMetadata)initWithImpressionCount:(unsigned __int16)a3 occurrencesInSource:(unsigned __int16)a4 algorithmResultPosition:(unsigned __int16)a5 algorithmResultCount:(unsigned __int16)a6 exactMatchInSourceText:(BOOL)a7
{
  v13.receiver = self;
  v13.super_class = (Class)PPTopicMetadata;
  result = [(PPTopicMetadata *)&v13 init];
  if (result)
  {
    result->_uint64_t impressionCount = a3;
    result->_int occurrencesInSource = a4;
    result->_int algorithmResultPosition = a5;
    result->_int algorithmResultCount = a6;
    result->_BOOL exactMatchInSourceText = a7;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end