@interface ICStoreRadioStreamAssetInfo
- (BOOL)isiTunesStoreStream;
- (ICStoreRadioStreamAssetInfo)initWithItemResponseDictionary:(id)a3;
- (NSURL)keyCertificateURL;
- (NSURL)keyServerURL;
- (NSURL)streamURL;
- (int64_t)ICStoreRadioStreamFlavorWithString:(id)a3;
- (int64_t)ICStoreRadioStreamProtocolWithString:(id)a3;
- (int64_t)flavor;
- (int64_t)streamProtocol;
@end

@implementation ICStoreRadioStreamAssetInfo

- (void).cxx_destruct
{
}

- (int64_t)ICStoreRadioStreamProtocolWithString:(id)a3
{
  id v3 = a3;
  if ([v3 caseInsensitiveCompare:@"HLS"]) {
    int64_t v4 = 2 * ([v3 caseInsensitiveCompare:@"SHOUTCAST"] == 0);
  }
  else {
    int64_t v4 = 1;
  }

  return v4;
}

- (int64_t)ICStoreRadioStreamFlavorWithString:(id)a3
{
  id v3 = a3;
  if ([v3 caseInsensitiveCompare:@"LWHQ"]) {
    int64_t v4 = [v3 caseInsensitiveCompare:@"SLW"] == 0;
  }
  else {
    int64_t v4 = 2;
  }

  return v4;
}

- (BOOL)isiTunesStoreStream
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"is-itunes-stream"];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 BOOLValue];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (NSURL)keyServerURL
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"stream-key-server-url"];
  if (_NSIsNSString() && [v2 length])
  {
    char v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    char v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)keyCertificateURL
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"stream-key-cert-url"];
  if (_NSIsNSString() && [v2 length])
  {
    char v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    char v3 = 0;
  }

  return (NSURL *)v3;
}

- (NSURL)streamURL
{
  v2 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"stream-url"];
  if (_NSIsNSString() && [v2 length])
  {
    char v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  }
  else
  {
    char v3 = 0;
  }

  return (NSURL *)v3;
}

- (int64_t)streamProtocol
{
  char v3 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"stream-protocol"];
  if (_NSIsNSString() && [v3 length]) {
    int64_t v4 = [(ICStoreRadioStreamAssetInfo *)self ICStoreRadioStreamProtocolWithString:v3];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)flavor
{
  char v3 = [(NSDictionary *)self->_itemResponseDictionary objectForKey:@"flavor"];
  if (_NSIsNSString() && [v3 length]) {
    int64_t v4 = [(ICStoreRadioStreamAssetInfo *)self ICStoreRadioStreamFlavorWithString:v3];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (ICStoreRadioStreamAssetInfo)initWithItemResponseDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICStoreRadioStreamAssetInfo;
  v5 = [(ICStoreRadioStreamAssetInfo *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    itemResponseDictionary = v5->_itemResponseDictionary;
    v5->_itemResponseDictionary = (NSDictionary *)v6;
  }
  return v5;
}

@end