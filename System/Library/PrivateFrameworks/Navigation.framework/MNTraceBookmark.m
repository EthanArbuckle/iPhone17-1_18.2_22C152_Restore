@interface MNTraceBookmark
+ (BOOL)supportsSecureCoding;
- (MNTraceBookmark)initWithCoder:(id)a3;
- (NSData)imageData;
- (double)timestamp;
- (void)encodeWithCoder:(id)a3;
- (void)setImageData:(id)a3;
- (void)setTimestamp:(double)a3;
@end

@implementation MNTraceBookmark

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNTraceBookmark)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(MNTraceBookmark *)self init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"_timestamp"];
    v5->_timestamp = v6;
    uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"_timestamp" forKey:timestamp];
  [v5 encodeObject:self->_imageData forKey:@"_imageData"];
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end