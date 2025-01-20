@interface ICEvernoteResource
+ (BOOL)supportsSecureCoding;
- (BOOL)isAttachment;
- (ICEvernoteResource)initWithCoder:(id)a3;
- (NSData)data;
- (NSString)fileName;
- (NSString)md5Hash;
- (NSString)mime;
- (double)duration;
- (double)imageHeight;
- (double)imageWidth;
- (void)encodeWithCoder:(id)a3;
- (void)setData:(id)a3;
- (void)setDuration:(double)a3;
- (void)setFileName:(id)a3;
- (void)setImageHeight:(double)a3;
- (void)setImageWidth:(double)a3;
- (void)setIsAttachment:(BOOL)a3;
- (void)setMd5Hash:(id)a3;
- (void)setMime:(id)a3;
@end

@implementation ICEvernoteResource

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ICEvernoteResource)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ICEvernoteResource;
  v5 = [(ICEvernoteResource *)&v18 init];
  if (v5)
  {
    v5->_isAttachment = [v4 decodeBoolForKey:@"isAttachment"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mime"];
    mime = v5->_mime;
    v5->_mime = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fileName"];
    fileName = v5->_fileName;
    v5->_fileName = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"data"];
    data = v5->_data;
    v5->_data = (NSData *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"md5Hash"];
    md5Hash = v5->_md5Hash;
    v5->_md5Hash = (NSString *)v12;

    [v4 decodeFloatForKey:@"imageWidth"];
    v5->_imageWidth = v14;
    [v4 decodeFloatForKey:@"imageHeight"];
    v5->_imageHeight = v15;
    [v4 decodeDoubleForKey:@"duration"];
    v5->_duration = v16;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v11 = a3;
  objc_msgSend(v11, "encodeBool:forKey:", -[ICEvernoteResource isAttachment](self, "isAttachment"), @"isAttachment");
  id v4 = [(ICEvernoteResource *)self mime];
  [v11 encodeObject:v4 forKey:@"mime"];

  v5 = [(ICEvernoteResource *)self fileName];
  [v11 encodeObject:v5 forKey:@"fileName"];

  uint64_t v6 = [(ICEvernoteResource *)self data];
  [v11 encodeObject:v6 forKey:@"data"];

  v7 = [(ICEvernoteResource *)self md5Hash];
  [v11 encodeObject:v7 forKey:@"md5Hash"];

  [(ICEvernoteResource *)self imageWidth];
  *(float *)&double v8 = v8;
  [v11 encodeFloat:@"imageWidth" forKey:v8];
  [(ICEvernoteResource *)self imageHeight];
  *(float *)&double v9 = v9;
  [v11 encodeFloat:@"imageHeight" forKey:v9];
  [(ICEvernoteResource *)self duration];
  *(float *)&double v10 = v10;
  [v11 encodeFloat:@"duration" forKey:v10];
}

- (BOOL)isAttachment
{
  return self->_isAttachment;
}

- (void)setIsAttachment:(BOOL)a3
{
  self->_isAttachment = a3;
}

- (NSString)mime
{
  return self->_mime;
}

- (void)setMime:(id)a3
{
}

- (NSString)fileName
{
  return self->_fileName;
}

- (void)setFileName:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)md5Hash
{
  return self->_md5Hash;
}

- (void)setMd5Hash:(id)a3
{
}

- (double)imageWidth
{
  return self->_imageWidth;
}

- (void)setImageWidth:(double)a3
{
  self->_imageWidth = a3;
}

- (double)imageHeight
{
  return self->_imageHeight;
}

- (void)setImageHeight:(double)a3
{
  self->_imageHeight = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_md5Hash, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_mime, 0);
}

@end