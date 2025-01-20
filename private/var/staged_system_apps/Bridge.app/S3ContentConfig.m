@interface S3ContentConfig
- (NSString)bucket;
- (NSString)filename;
- (S3ContentConfig)initWithFilename:(id)a3 bucket:(id)a4;
- (void)setBucket:(id)a3;
- (void)setFilename:(id)a3;
@end

@implementation S3ContentConfig

- (S3ContentConfig)initWithFilename:(id)a3 bucket:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)S3ContentConfig;
  v9 = [(S3ContentConfig *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_filename, a3);
    objc_storeStrong((id *)&v10->_bucket, a4);
  }

  return v10;
}

- (NSString)filename
{
  return self->_filename;
}

- (void)setFilename:(id)a3
{
}

- (NSString)bucket
{
  return self->_bucket;
}

- (void)setBucket:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucket, 0);

  objc_storeStrong((id *)&self->_filename, 0);
}

@end