@interface IMDocumentFragmentFilter
+ (BOOL)supportsSecureCoding;
- (BOOL)mightContainFragment:(id)a3;
- (IMDocumentFragmentFilter)initWithCoder:(id)a3;
- (IMDocumentFragmentFilter)initWithDocument:(id)a3 filterSpecification:(id *)a4;
- (NSString)usageDescription;
- (int64_t)indexSize;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation IMDocumentFragmentFilter

- (IMDocumentFragmentFilter)initWithDocument:(id)a3 filterSpecification:(id *)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)IMDocumentFragmentFilter;
  v7 = [(IMDocumentFragmentFilter *)&v19 init];
  v8 = v7;
  if (v7)
  {
    long long v9 = *(_OWORD *)&a4->var0.var2;
    *(_OWORD *)&v7->_specification.bloomFilterSpecification.expectedNumberOfInsertions = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&v7->_specification.bloomFilterSpecification.int64_t numberOfHashFunctions = v9;
    v10 = [IMBloomFilter alloc];
    v11 = IMBloomFilterCharacterHashProvider();
    long long v17 = *(_OWORD *)&v8->_specification.bloomFilterSpecification.expectedNumberOfInsertions;
    int64_t numberOfHashFunctions = v8->_specification.bloomFilterSpecification.numberOfHashFunctions;
    v12 = [(IMBloomFilter *)v10 initWithSpecification:&v17 hashProvider:v11];
    filter = v8->_filter;
    v8->_filter = v12;

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_11D0E8;
    v15[3] = &unk_2C9470;
    v16 = v8;
    IMWithAccessToCharacters(v6, v15);
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  p_specification = &self->_specification;
  id v5 = a3;
  [v5 encodeBytes:p_specification length:32 forKey:@"specification"];
  [v5 encodeObject:self->_filter forKey:@"filter"];
}

- (IMDocumentFragmentFilter)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)IMDocumentFragmentFilter;
  id v5 = [(IMDocumentFragmentFilter *)&v13 init];
  if (v5)
  {
    uint64_t v12 = 0;
    id v6 = v4;
    v7 = [v6 decodeBytesForKey:@"specification" returnedLength:&v12];
    long long v8 = v7[1];
    *(_OWORD *)&v5->_specification.bloomFilterSpecification.expectedNumberOfInsertions = *v7;
    *(_OWORD *)&v5->_specification.bloomFilterSpecification.int64_t numberOfHashFunctions = v8;
    uint64_t v9 = [v6 decodeObjectOfClass:objc_opt_class() forKey:@"filter"];
    filter = v5->_filter;
    v5->_filter = (IMBloomFilter *)v9;
  }
  return v5;
}

- (BOOL)mightContainFragment:(id)a3
{
  id v4 = a3;
  char v5 = 1;
  if ((uint64_t)[v4 length] >= self->_specification.windowWidth)
  {
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 1;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_11D380;
    v7[3] = &unk_2C9498;
    v7[4] = self;
    v7[5] = &v8;
    IMWithAccessToCharacters(v4, v7);
    char v5 = *((unsigned char *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }

  return v5;
}

- (int64_t)indexSize
{
  return [(IMBloomFilter *)self->_filter indexSize];
}

- (NSString)usageDescription
{
  return [(IMBloomFilter *)self->_filter usageDescription];
}

- (void)dealloc
{
  filter = self->_filter;
  self->_filter = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMDocumentFragmentFilter;
  [(IMDocumentFragmentFilter *)&v4 dealloc];
}

- (void).cxx_destruct
{
}

@end