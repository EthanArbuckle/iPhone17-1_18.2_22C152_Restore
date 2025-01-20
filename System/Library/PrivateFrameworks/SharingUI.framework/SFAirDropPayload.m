@interface SFAirDropPayload
+ (id)newPayloadWithData:(id)a3 ofType:(id)a4 description:(id)a5 previewImage:(id)a6 identifier:(int64_t)a7;
+ (id)newPayloadWithURL:(id)a3 description:(id)a4 previewImage:(id)a5 identifier:(int64_t)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasString;
- (NSData)data;
- (NSString)payloadDescription;
- (NSString)type;
- (NSURL)URL;
- (UIImage)previewImage;
- (id)description;
- (int64_t)identifer;
- (unint64_t)hash;
- (void)setData:(id)a3;
- (void)setIdentifer:(int64_t)a3;
- (void)setPayloadDescription:(id)a3;
- (void)setPreviewImage:(id)a3;
- (void)setType:(id)a3;
- (void)setURL:(id)a3;
- (void)setWasString:(BOOL)a3;
@end

@implementation SFAirDropPayload

- (id)description
{
  URL = self->_URL;
  if (URL) {
    [NSString stringWithFormat:@"<SFAirDropPayload: %p, URL:%@, description:%@, previewImage:%@, identifier:%d>", self, URL, self->_payloadDescription, self->_previewImage, self->_identifer];
  }
  else {
  v3 = [NSString stringWithFormat:@"<SFAirDropPayload: %p, data-type:%@, description:%@, previewImage:%@, identifier:%d>", self, self->_type, self->_payloadDescription, self->_previewImage, self->_identifer];
  }
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSURL *)self->_URL hash];
  uint64_t v4 = [(NSData *)self->_data hash] + v3;
  NSUInteger v5 = [(NSString *)self->_type hash];
  NSUInteger v6 = v4 + v5 + [(UIImage *)self->_previewImage hash];
  return v6 + [(NSString *)self->_payloadDescription hash] + self->_identifer;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    NSUInteger v5 = [v4 URL];
    if ([v5 isEqual:self->_URL])
    {
      NSUInteger v6 = [v4 data];
      if ([v6 isEqual:self->_data])
      {
        v7 = [v4 type];
        if ([v7 isEqual:self->_type])
        {
          v8 = [v4 previewImage];
          if ([v8 isEqual:self->_previewImage])
          {
            v9 = [v4 payloadDescription];
            if ([v9 isEqual:self->_payloadDescription]) {
              BOOL v10 = [v4 identifer] == self->_identifer;
            }
            else {
              BOOL v10 = 0;
            }
          }
          else
          {
            BOOL v10 = 0;
          }
        }
        else
        {
          BOOL v10 = 0;
        }
      }
      else
      {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

+ (id)newPayloadWithData:(id)a3 ofType:(id)a4 description:(id)a5 previewImage:(id)a6 identifier:(int64_t)a7
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = objc_alloc_init(SFAirDropPayload);
  [(SFAirDropPayload *)v15 setData:v14];

  [(SFAirDropPayload *)v15 setType:v13];
  [(SFAirDropPayload *)v15 setPreviewImage:v11];

  [(SFAirDropPayload *)v15 setPayloadDescription:v12];
  [(SFAirDropPayload *)v15 setIdentifer:a7];
  return v15;
}

+ (id)newPayloadWithURL:(id)a3 description:(id)a4 previewImage:(id)a5 identifier:(int64_t)a6
{
  id v9 = a3;
  id v10 = +[SFAirDropPayload newPayloadWithData:0 ofType:0 description:a4 previewImage:a5 identifier:a6];
  [v10 setURL:v9];

  return v10;
}

- (BOOL)wasString
{
  return self->_wasString;
}

- (void)setWasString:(BOOL)a3
{
  self->_wasString = a3;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (UIImage)previewImage
{
  return self->_previewImage;
}

- (void)setPreviewImage:(id)a3
{
}

- (NSString)payloadDescription
{
  return self->_payloadDescription;
}

- (void)setPayloadDescription:(id)a3
{
}

- (int64_t)identifer
{
  return self->_identifer;
}

- (void)setIdentifer:(int64_t)a3
{
  self->_identifer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadDescription, 0);
  objc_storeStrong((id *)&self->_previewImage, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end