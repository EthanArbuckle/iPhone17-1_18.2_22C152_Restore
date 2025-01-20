@interface WFOnScreenContent
+ (BOOL)supportsSecureCoding;
- (INFile)file;
- (NSURL)URL;
- (WFOnScreenContent)initWithCoder:(id)a3;
- (WFOnScreenContent)initWithURL:(id)a3 file:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFOnScreenContent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_file, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

- (INFile)file
{
  return self->_file;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(WFOnScreenContent *)self URL];
  [v4 encodeObject:v5 forKey:@"URL"];

  id v6 = [(WFOnScreenContent *)self file];
  [v4 encodeObject:v6 forKey:@"file"];
}

- (WFOnScreenContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WFOnScreenContent;
  v5 = [(WFOnScreenContent *)&v12 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"URL"];
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"file"];
    file = v5->_file;
    v5->_file = (INFile *)v8;

    v10 = v5;
  }

  return v5;
}

- (WFOnScreenContent)initWithURL:(id)a3 file:(id)a4
{
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  if (!(v8 | v9))
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"WFOnScreenContent.m" lineNumber:17 description:@"WFOnScreenContent must be initialized with a URL or a file"];
  }
  v15.receiver = self;
  v15.super_class = (Class)WFOnScreenContent;
  v10 = [(WFOnScreenContent *)&v15 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_URL, a3);
    objc_storeStrong((id *)&v11->_file, a4);
    objc_super v12 = v11;
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end