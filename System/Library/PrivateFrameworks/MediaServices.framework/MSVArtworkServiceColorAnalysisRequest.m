@interface MSVArtworkServiceColorAnalysisRequest
+ (BOOL)supportsSecureCoding;
- (Class)operationClass;
- (MSVArtworkServiceColorAnalysisRequest)initWithCoder:(id)a3;
- (MSVArtworkServiceColorAnalysisRequest)initWithSourceURL:(id)a3 preferredImageSize:(CGSize)a4;
- (NSURL)sourceURL;
- (float)preferredImageHeight;
- (float)preferredImageWidth;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSVArtworkServiceColorAnalysisRequest

- (void).cxx_destruct
{
}

- (float)preferredImageHeight
{
  return self->_preferredImageHeight;
}

- (float)preferredImageWidth
{
  return self->_preferredImageWidth;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (Class)operationClass
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v2 = NSString;
  v3 = [(MSVArtworkServiceColorAnalysisRequest *)self sourceURL];
  v4 = [v3 absoluteString];
  v5 = [v2 stringWithFormat:@"<algorithm=MSVArtworkColorAnalyzerAlgorithmiTunes -- %@>", v4];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  sourceURL = self->_sourceURL;
  id v7 = a3;
  [v7 encodeObject:sourceURL forKey:@"MSVArtworkServiceColorAnalysisRequestSourceURL"];
  *(float *)&double v5 = self->_preferredImageWidth;
  [v7 encodeFloat:@"MSVArtworkServiceColorAnalysisRequestPreferredImageWidth" forKey:v5];
  *(float *)&double v6 = self->_preferredImageHeight;
  [v7 encodeFloat:@"MSVArtworkServiceColorAnalysisRequestPreferredImageHeight" forKey:v6];
}

- (MSVArtworkServiceColorAnalysisRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSVArtworkServiceColorAnalysisRequest;
  double v5 = [(MSVArtworkServiceRequest *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MSVArtworkServiceColorAnalysisRequestSourceURL"];
    sourceURL = v5->_sourceURL;
    v5->_sourceURL = (NSURL *)v6;

    [v4 decodeFloatForKey:@"MSVArtworkServiceColorAnalysisRequestPreferredImageWidth"];
    v5->_preferredImageWidth = v8;
    [v4 decodeFloatForKey:@"MSVArtworkServiceColorAnalysisRequestPreferredImageHeight"];
    v5->_preferredImageHeight = v9;
  }

  return v5;
}

- (MSVArtworkServiceColorAnalysisRequest)initWithSourceURL:(id)a3 preferredImageSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v8 = a3;
  v14.receiver = self;
  v14.super_class = (Class)MSVArtworkServiceColorAnalysisRequest;
  float v9 = [(MSVArtworkServiceRequest *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sourceURL, a3);
    float v11 = width;
    v10->_preferredImageWidth = v11;
    float v12 = height;
    v10->_preferredImageHeight = v12;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end