@interface AttributionPayload
- (AttributionPayload)initWithURL:(id)a3 bundleID:(id)a4 header:(id)a5 body:(id)a6;
- (NSDictionary)body;
- (NSDictionary)header;
- (NSString)bundleID;
- (NSURL)url;
- (void)setBody:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setHeader:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation AttributionPayload

- (AttributionPayload)initWithURL:(id)a3 bundleID:(id)a4 header:(id)a5 body:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)AttributionPayload;
  v15 = [(AttributionPayload *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_url, a3);
    objc_storeStrong((id *)&v16->_bundleID, a4);
    objc_storeStrong((id *)&v16->_header, a5);
    objc_storeStrong((id *)&v16->_body, a6);
  }

  return v16;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSDictionary)header
{
  return self->_header;
}

- (void)setHeader:(id)a3
{
}

- (NSDictionary)body
{
  return self->_body;
}

- (void)setBody:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_header, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

@end