@interface SYLastModifiedDocumentAttributes
+ (BOOL)supportsSecureCoding;
- (NSDate)modifiedDate;
- (NSURL)fileURL;
- (SYLastModifiedDocumentAttributes)initWithCoder:(id)a3;
- (SYLastModifiedDocumentAttributes)initWithFileURL:(id)a3 modifiedDate:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SYLastModifiedDocumentAttributes

- (SYLastModifiedDocumentAttributes)initWithFileURL:(id)a3 modifiedDate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SYLastModifiedDocumentAttributes;
  v9 = [(SYLastModifiedDocumentAttributes *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileURL, a3);
    objc_storeStrong((id *)&v10->_modifiedDate, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SYLastModifiedDocumentAttributes *)self fileURL];
  [v4 encodeObject:v5 forKey:@"fileURL"];

  id v6 = [(SYLastModifiedDocumentAttributes *)self modifiedDate];
  [v4 encodeObject:v6 forKey:@"modifiedDate"];
}

- (SYLastModifiedDocumentAttributes)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileURL"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modifiedDate"];

  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    id v8 = 0;
  }
  else
  {
    self = [(SYLastModifiedDocumentAttributes *)self initWithFileURL:v5 modifiedDate:v6];
    id v8 = self;
  }

  return v8;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end