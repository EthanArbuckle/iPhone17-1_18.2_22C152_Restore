@interface OCXContentType
- (BOOL)isOverride;
- (NSString)contentType;
- (NSString)path;
- (OCXContentType)initWithContentType:(id)a3 extension:(id)a4;
- (OCXContentType)initWithContentType:(id)a3 path:(id)a4;
- (void)writeToStreamWriter:(id)a3;
@end

@implementation OCXContentType

- (OCXContentType)initWithContentType:(id)a3 extension:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OCXContentType;
  v9 = [(OCXContentType *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mContentType, a3);
    objc_storeStrong((id *)&v10->mExtension, a4);
  }

  return v10;
}

- (OCXContentType)initWithContentType:(id)a3 path:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OCXContentType;
  v9 = [(OCXContentType *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->mContentType, a3);
    objc_storeStrong((id *)&v10->mPath, a4);
  }

  return v10;
}

- (BOOL)isOverride
{
  return [(NSString *)self->mPath length] != 0;
}

- (void)writeToStreamWriter:(id)a3
{
  id v5 = a3;
  if ([(OCXContentType *)self isOverride])
  {
    [v5 startPlainElement:@"Override"];
    v4 = [@"/" stringByAppendingString:self->mPath];
    [v5 writePlainAttribute:@"PartName" content:v4];
  }
  else
  {
    [v5 startPlainElement:@"Default"];
    [v5 writePlainAttribute:@"Extension" content:self->mExtension];
  }
  [v5 writePlainAttribute:@"ContentType" content:self->mContentType];
  [v5 endElement];
}

- (NSString)contentType
{
  return self->mContentType;
}

- (NSString)path
{
  return self->mPath;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mExtension, 0);
  objc_storeStrong((id *)&self->mPath, 0);
  objc_storeStrong((id *)&self->mContentType, 0);
}

@end