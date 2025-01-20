@interface MOOutlierMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)isSignificant;
- (MOOutlierMetadata)initWithCoder:(id)a3;
- (MOOutlierMetadata)initWithIdentifier:(id)a3 updateDate:(id)a4 isSignificant:(BOOL)a5 outlierScore:(double)a6 outlierScoreThreshold:(double)a7 bundleGoodnessScore:(double)a8 bundleGoodnessScoreThreshold:(double)a9;
- (NSDate)updatedDate;
- (NSUUID)identifier;
- (double)bundleGoodnessScore;
- (double)bundleGoodnessScoreThreshold;
- (double)outlierScore;
- (double)outlierScoreThreshold;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleGoodnessScore:(double)a3;
- (void)setBundleGoodnessScoreThreshold:(double)a3;
- (void)setIsSignificant:(BOOL)a3;
- (void)setOutlierScore:(double)a3;
- (void)setOutlierScoreThreshold:(double)a3;
- (void)setUpdatedDate:(id)a3;
@end

@implementation MOOutlierMetadata

- (MOOutlierMetadata)initWithIdentifier:(id)a3 updateDate:(id)a4 isSignificant:(BOOL)a5 outlierScore:(double)a6 outlierScoreThreshold:(double)a7 bundleGoodnessScore:(double)a8 bundleGoodnessScoreThreshold:(double)a9
{
  id v17 = a3;
  id v18 = a4;
  v22.receiver = self;
  v22.super_class = (Class)MOOutlierMetadata;
  v19 = [(MOOutlierMetadata *)&v22 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_identifier, a3);
    objc_storeStrong((id *)&v20->_updatedDate, a4);
    v20->_isSignificant = a5;
    v20->_outlierScore = a6;
    v20->_bundleGoodnessScore = a8;
    v20->_outlierScoreThreshold = a7;
    v20->_bundleGoodnessScoreThreshold = a9;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_updatedDate forKey:@"updatedDate"];
  [v5 encodeBool:self->_isSignificant forKey:@"isSignificant"];
  [v5 encodeDouble:@"outlierScore" forKey:self->_outlierScore];
  [v5 encodeDouble:@"outlierScoreThreshold" forKey:self->_outlierScoreThreshold];
  [v5 encodeDouble:@"bundleGoodnessScore" forKey:self->_bundleGoodnessScore];
  [v5 encodeDouble:@"bundleGoodnessScoreThreshold" forKey:self->_bundleGoodnessScoreThreshold];
}

- (MOOutlierMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updatedDate"];
  id v7 = [v4 decodeBoolForKey:@"isSignificant"];
  [v4 decodeDoubleForKey:@"outlierScore"];
  double v9 = v8;
  [v4 decodeDoubleForKey:@"outlierScoreThreshold"];
  double v11 = v10;
  [v4 decodeDoubleForKey:@"bundleGoodnessScore"];
  double v13 = v12;
  [v4 decodeDoubleForKey:@"bundleGoodnessScoreThreshold"];
  double v15 = v14;

  v16 = [(MOOutlierMetadata *)self initWithIdentifier:v5 updateDate:v6 isSignificant:v7 outlierScore:v9 outlierScoreThreshold:v11 bundleGoodnessScore:v13 bundleGoodnessScoreThreshold:v15];
  return v16;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSDate)updatedDate
{
  return self->_updatedDate;
}

- (void)setUpdatedDate:(id)a3
{
}

- (BOOL)isSignificant
{
  return self->_isSignificant;
}

- (void)setIsSignificant:(BOOL)a3
{
  self->_isSignificant = a3;
}

- (double)outlierScore
{
  return self->_outlierScore;
}

- (void)setOutlierScore:(double)a3
{
  self->_outlierScore = a3;
}

- (double)bundleGoodnessScore
{
  return self->_bundleGoodnessScore;
}

- (void)setBundleGoodnessScore:(double)a3
{
  self->_bundleGoodnessScore = a3;
}

- (double)outlierScoreThreshold
{
  return self->_outlierScoreThreshold;
}

- (void)setOutlierScoreThreshold:(double)a3
{
  self->_outlierScoreThreshold = a3;
}

- (double)bundleGoodnessScoreThreshold
{
  return self->_bundleGoodnessScoreThreshold;
}

- (void)setBundleGoodnessScoreThreshold:(double)a3
{
  self->_bundleGoodnessScoreThreshold = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedDate, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end