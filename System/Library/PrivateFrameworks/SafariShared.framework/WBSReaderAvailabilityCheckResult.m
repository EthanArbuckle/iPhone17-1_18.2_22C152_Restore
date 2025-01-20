@interface WBSReaderAvailabilityCheckResult
+ (BOOL)supportsSecureCoding;
- (BOOL)doesPageUseSearchEngineOptimizationMetadata;
- (BOOL)isReaderAvailable;
- (BOOL)isSameDocumentNavigation;
- (NSArray)textSamples;
- (NSDictionary)combinedMetadataForTests;
- (NSURL)canonicalURL;
- (WBSReaderAvailabilityCheckResult)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setCanonicalURL:(id)a3;
- (void)setDoesPageUseSearchEngineOptimizationMetadata:(BOOL)a3;
- (void)setIsSameDocumentNavigation:(BOOL)a3;
- (void)setReaderAvailable:(BOOL)a3;
- (void)setTextSamples:(id)a3;
@end

@implementation WBSReaderAvailabilityCheckResult

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  if (self->_readerAvailable) {
    v6 = @"YES";
  }
  else {
    v6 = @"NO";
  }
  if (self->_isSameDocumentNavigation) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  v8 = v6;
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; isReaderAvailable = %@; isSameDocumentNavigation: %@",
    v5,
    self,
    v8,
  v9 = v7);

  if ([(NSArray *)self->_textSamples count]) {
    objc_msgSend(v9, "appendFormat:", @"; textSamples = %lu sample(s)",
  }
      [(NSArray *)self->_textSamples count]);
  if (self->_canonicalURL) {
    [v9 appendFormat:@"; canonicalURL = %@", self->_canonicalURL];
  }
  [v9 appendString:@">"];
  return v9;
}

- (NSDictionary)combinedMetadataForTests
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  textSamples = self->_textSamples;
  if (textSamples) {
    [v3 setObject:textSamples forKeyedSubscript:@"textSamples"];
  }
  return (NSDictionary *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(unsigned char *)(v5 + 8) = self->_readerAvailable;
  *(unsigned char *)(v5 + 9) = self->_isSameDocumentNavigation;
  uint64_t v6 = [(NSArray *)self->_textSamples copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(unsigned char *)(v5 + 10) = self->_doesPageUseSearchEngineOptimizationMetadata;
  uint64_t v8 = [(NSURL *)self->_canonicalURL copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  return (id)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeBool:self->_readerAvailable forKey:@"isReaderAvailable"];
  [v6 encodeBool:self->_isSameDocumentNavigation forKey:@"isSameDocumentNavigation"];
  textSamples = self->_textSamples;
  if (textSamples) {
    [v6 encodeObject:textSamples forKey:@"textSamples"];
  }
  [v6 encodeBool:self->_doesPageUseSearchEngineOptimizationMetadata forKey:@"doesPageUseSearchEngineOptimizationMetadata"];
  canonicalURL = self->_canonicalURL;
  if (canonicalURL) {
    [v6 encodeObject:canonicalURL forKey:@"canonicalURL"];
  }
}

- (WBSReaderAvailabilityCheckResult)initWithCoder:(id)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WBSReaderAvailabilityCheckResult;
  uint64_t v5 = [(WBSReaderAvailabilityCheckResult *)&v15 init];
  if (v5)
  {
    v5->_readerAvailable = [v4 decodeBoolForKey:@"isReaderAvailable"];
    v5->_isSameDocumentNavigation = [v4 decodeBoolForKey:@"isSameDocumentNavigation"];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    v16[0] = objc_opt_class();
    v16[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
    uint64_t v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"textSamples"];
    textSamples = v5->_textSamples;
    v5->_textSamples = (NSArray *)v9;

    v5->_doesPageUseSearchEngineOptimizationMetadata = [v4 decodeBoolForKey:@"doesPageUseSearchEngineOptimizationMetadata"];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"canonicalURL"];
    canonicalURL = v5->_canonicalURL;
    v5->_canonicalURL = (NSURL *)v11;

    v13 = v5;
  }

  return v5;
}

- (BOOL)isReaderAvailable
{
  return self->_readerAvailable;
}

- (void)setReaderAvailable:(BOOL)a3
{
  self->_readerAvailable = a3;
}

- (BOOL)isSameDocumentNavigation
{
  return self->_isSameDocumentNavigation;
}

- (void)setIsSameDocumentNavigation:(BOOL)a3
{
  self->_isSameDocumentNavigation = a3;
}

- (NSArray)textSamples
{
  return self->_textSamples;
}

- (void)setTextSamples:(id)a3
{
}

- (BOOL)doesPageUseSearchEngineOptimizationMetadata
{
  return self->_doesPageUseSearchEngineOptimizationMetadata;
}

- (void)setDoesPageUseSearchEngineOptimizationMetadata:(BOOL)a3
{
  self->_doesPageUseSearchEngineOptimizationMetadata = a3;
}

- (NSURL)canonicalURL
{
  return self->_canonicalURL;
}

- (void)setCanonicalURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_canonicalURL, 0);
  objc_storeStrong((id *)&self->_textSamples, 0);
}

@end