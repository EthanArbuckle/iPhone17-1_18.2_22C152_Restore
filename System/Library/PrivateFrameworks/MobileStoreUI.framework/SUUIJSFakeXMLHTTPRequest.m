@interface SUUIJSFakeXMLHTTPRequest
- (IKJSXMLDocument)responseXML;
- (NSDictionary)metrics;
- (NSString)responseText;
- (NSString)statusText;
- (SUUIJSFakeXMLHTTPRequest)initWithAppContext:(id)a3 data:(id)a4 URLResponse:(id)a5 performanceMetrics:(id)a6;
- (id)getAllResponseHeaders;
- (id)getResponseHeader:(id)a3;
- (unsigned)readyState;
- (unsigned)responseType;
- (unsigned)status;
@end

@implementation SUUIJSFakeXMLHTTPRequest

- (SUUIJSFakeXMLHTTPRequest)initWithAppContext:(id)a3 data:(id)a4 URLResponse:(id)a5 performanceMetrics:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SUUIJSFakeXMLHTTPRequest;
  v14 = [(IKJSObject *)&v17 initWithAppContext:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_data, a4);
    objc_storeStrong((id *)&v15->_performanceMetrics, a6);
    objc_storeStrong((id *)&v15->_response, a5);
  }

  return v15;
}

- (id)getAllResponseHeaders
{
  v3 = [MEMORY[0x263F089D8] string];
  v4 = [(NSHTTPURLResponse *)self->_response allHeaderFields];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SUUIJSFakeXMLHTTPRequest_getAllResponseHeaders__block_invoke;
  v7[3] = &unk_265406D60;
  id v5 = v3;
  id v8 = v5;
  [v4 enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

uint64_t __49__SUUIJSFakeXMLHTTPRequest_getAllResponseHeaders__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"%@: %@\r\n", a2, a3];
}

- (id)getResponseHeader:(id)a3
{
  if (a3)
  {
    response = self->_response;
    id v4 = a3;
    id v5 = [(NSHTTPURLResponse *)response allHeaderFields];
    v6 = [v5 objectForKey:v4];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (NSDictionary)metrics
{
  return self->_performanceMetrics;
}

- (unsigned)readyState
{
  return 4;
}

- (NSString)responseText
{
  v2 = (void *)[[NSString alloc] initWithData:self->_data encoding:4];
  return (NSString *)v2;
}

- (IKJSXMLDocument)responseXML
{
  id v3 = objc_alloc(NSClassFromString(&cfstr_Ikjsxmldomimpl.isa));
  id v4 = [(IKJSObject *)self appContext];
  id v5 = (void *)[v3 initWithAppContext:v4];

  v6 = [v5 createLSInput];
  [v6 setByteStream:self->_data];
  v7 = [v5 createLSParser:1 :0];
  id v8 = [v7 parse:v6];

  return (IKJSXMLDocument *)v8;
}

- (unsigned)responseType
{
  return 3;
}

- (unsigned)status
{
  return [(NSHTTPURLResponse *)self->_response statusCode];
}

- (NSString)statusText
{
  v2 = (void *)MEMORY[0x263EFC5E0];
  NSInteger v3 = [(NSHTTPURLResponse *)self->_response statusCode];
  return (NSString *)[v2 localizedStringForStatusCode:v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_performanceMetrics, 0);
  objc_storeStrong((id *)&self->_data, 0);
}

@end