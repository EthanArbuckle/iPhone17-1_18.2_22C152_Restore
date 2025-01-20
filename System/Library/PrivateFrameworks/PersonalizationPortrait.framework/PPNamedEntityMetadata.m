@interface PPNamedEntityMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToNamedEntityMetadata:(id)a3;
- (NSSet)featureNames;
- (PPNamedEntityMetadata)initWithCoder:(id)a3;
- (PPNamedEntityMetadata)initWithImpressionCount:(unsigned __int16)a3 occurrencesInSource:(unsigned __int16)a4;
- (id)featureValueForName:(id)a3;
- (unint64_t)hash;
- (unsigned)impressionCount;
- (unsigned)occurrencesInSource;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPNamedEntityMetadata

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
    uint64_t v5 = 8;
LABEL_5:
    v6 = [MEMORY[0x1E4F1E950] featureValueWithInt64:*(unsigned __int16 *)((char *)&self->super.isa + v5)];
    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"occurrencesInSource"])
  {
    uint64_t v5 = 10;
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (NSSet)featureNames
{
  if (featureNames__pasOnceToken4_1765 != -1) {
    dispatch_once(&featureNames__pasOnceToken4_1765, &__block_literal_global_1766);
  }
  v2 = (void *)featureNames__pasExprOnceResult_1767;
  return (NSSet *)v2;
}

void __37__PPNamedEntityMetadata_featureNames__block_invoke()
{
  v0 = (void *)MEMORY[0x192F97350]();
  v1 = (void *)MEMORY[0x192F97350]();
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", @"impressionCount", @"occurrencesInSource", 0);
  v3 = (void *)featureNames__pasExprOnceResult_1767;
  featureNames__pasExprOnceResult_1767 = v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPNamedEntityMetadata *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(PPNamedEntityMetadata *)self isEqualToNamedEntityMetadata:v4];
  }

  return v5;
}

- (BOOL)isEqualToNamedEntityMetadata:(id)a3
{
  id v4 = (PPNamedEntityMetadata *)a3;
  BOOL v5 = v4;
  if (v4 == self)
  {
    BOOL v8 = 1;
  }
  else if (v4 {
         && (int impressionCount = self->_impressionCount,
  }
             impressionCount == [(PPNamedEntityMetadata *)v4 impressionCount]))
  {
    int occurrencesInSource = self->_occurrencesInSource;
    BOOL v8 = occurrencesInSource == [(PPNamedEntityMetadata *)v5 occurrencesInSource];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_occurrencesInSource - (unint64_t)self->_impressionCount + 32 * self->_impressionCount;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t impressionCount = self->_impressionCount;
  id v5 = a3;
  [v5 encodeInt32:impressionCount forKey:@"ict"];
  [v5 encodeInt32:self->_occurrencesInSource forKey:@"ois"];
}

- (PPNamedEntityMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 decodeInt32ForKey:@"ict"];
  if (HIWORD(v5) || (unsigned __int16 v6 = v5, v7 = [v4 decodeInt32ForKey:@"ois"], HIWORD(v7)))
  {
    BOOL v8 = 0;
  }
  else
  {
    self = [(PPNamedEntityMetadata *)self initWithImpressionCount:v6 occurrencesInSource:(unsigned __int16)v7];
    BOOL v8 = self;
  }

  return v8;
}

- (PPNamedEntityMetadata)initWithImpressionCount:(unsigned __int16)a3 occurrencesInSource:(unsigned __int16)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PPNamedEntityMetadata;
  result = [(PPNamedEntityMetadata *)&v7 init];
  if (result)
  {
    result->_uint64_t impressionCount = a3;
    result->_int occurrencesInSource = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end