@interface NTKPhotoAnalysisCacheEntry
+ (BOOL)supportsSecureCoding;
- (NTKPhotoAnalysis)analysis;
- (NTKPhotoAnalysisCacheEntry)initWithCoder:(id)a3;
- (int)sequenceNumber;
- (void)encodeWithCoder:(id)a3;
- (void)setAnalysis:(id)a3;
- (void)setSequenceNumber:(int)a3;
@end

@implementation NTKPhotoAnalysisCacheEntry

- (NTKPhotoAnalysisCacheEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NTKPhotoAnalysisCacheEntry;
  v5 = [(NTKPhotoAnalysisCacheEntry *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"analysis"];
    analysis = v5->_analysis;
    v5->_analysis = (NTKPhotoAnalysis *)v6;

    v5->_sequenceNumber = [v4 decodeInt32ForKey:@"sequenceNumber"];
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  analysis = self->_analysis;
  id v5 = a3;
  [v5 encodeObject:analysis forKey:@"analysis"];
  [v5 encodeInt32:self->_sequenceNumber forKey:@"sequenceNumber"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKPhotoAnalysis)analysis
{
  return self->_analysis;
}

- (void)setAnalysis:(id)a3
{
}

- (int)sequenceNumber
{
  return self->_sequenceNumber;
}

- (void)setSequenceNumber:(int)a3
{
  self->_sequenceNumber = a3;
}

- (void).cxx_destruct
{
}

@end