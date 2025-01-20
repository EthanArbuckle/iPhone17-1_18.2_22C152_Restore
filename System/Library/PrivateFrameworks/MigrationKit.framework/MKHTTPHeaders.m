@interface MKHTTPHeaders
- (BOOL)isClosed;
- (MKHTTPContentDate)contentDate;
- (MKHTTPContentDisposition)contentDisposition;
- (MKHTTPContentPayload)contentPayload;
- (MKHTTPContentRange)contentRange;
- (MKHTTPHeaders)init;
- (MKHTTPHeaders)initWithArray:(id)a3;
- (MKHTTPHeaders)initWithMultipartHeaderArray:(id)a3;
- (MKHTTPProxyAuthorization)proxyAuthorization;
- (MKHTTPRange)range;
- (MKHTTPServerTiming)serverTiming;
- (NSDictionary)query;
- (NSString)accept;
- (NSString)authorization;
- (NSString)boundary;
- (NSString)connection;
- (NSString)contentType;
- (NSString)host;
- (NSString)method;
- (NSString)path;
- (NSString)statusText;
- (NSString)userAgent;
- (NSString)version;
- (id)pairsFromArray:(id)a3 byKey:(id)a4 atIndex:(int64_t)a5;
- (id)responseHeadersData;
- (unint64_t)contentLength;
- (unint64_t)statusCode;
- (unint64_t)transferEncoding;
- (void)close:(BOOL)a3;
- (void)setAccept:(id)a3;
- (void)setAuthorization:(id)a3;
- (void)setBoundary:(id)a3;
- (void)setConnection:(id)a3;
- (void)setContentDate:(id)a3;
- (void)setContentDisposition:(id)a3;
- (void)setContentLength:(unint64_t)a3;
- (void)setContentPayload:(id)a3;
- (void)setContentRange:(id)a3;
- (void)setContentType:(id)a3;
- (void)setHost:(id)a3;
- (void)setIsClosed:(BOOL)a3;
- (void)setMethod:(id)a3;
- (void)setPath:(id)a3;
- (void)setProxyAuthorization:(id)a3;
- (void)setQuery:(id)a3;
- (void)setRange:(id)a3;
- (void)setServerTiming:(id)a3;
- (void)setStatusCode:(unint64_t)a3;
- (void)setStatusText:(id)a3;
- (void)setTransferEncoding:(unint64_t)a3;
- (void)setUserAgent:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation MKHTTPHeaders

- (MKHTTPHeaders)init
{
  v6.receiver = self;
  v6.super_class = (Class)MKHTTPHeaders;
  v2 = [(MKHTTPHeaders *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MKHTTPHeaders *)v2 setVersion:@"HTTP/1.1"];
    [(MKHTTPHeaders *)v3 setStatusCode:200];
    [(MKHTTPHeaders *)v3 setContentType:@"application/octet-stream"];
    [(MKHTTPHeaders *)v3 setConnection:@"close"];
    v4 = objc_alloc_init(MKHTTPServerTiming);
    [(MKHTTPHeaders *)v3 setServerTiming:v4];
  }
  return v3;
}

- (MKHTTPHeaders)initWithMultipartHeaderArray:(id)a3
{
  id v4 = a3;
  [v4 insertObject:&stru_26DF6A8B0 atIndex:0];
  v5 = [(MKHTTPHeaders *)self initWithArray:v4];

  return v5;
}

- (MKHTTPHeaders)initWithArray:(id)a3
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v68.receiver = self;
  v68.super_class = (Class)MKHTTPHeaders;
  v5 = [(MKHTTPHeaders *)&v68 init];
  if (v5)
  {
    objc_super v6 = [v4 firstObject];
    v7 = [v6 componentsSeparatedByString:@" "];

    if ([v7 count] == 3)
    {
      id v63 = v4;
      v8 = [v7 objectAtIndexedSubscript:0];
      [(MKHTTPHeaders *)v5 setMethod:v8];

      id v9 = objc_alloc(MEMORY[0x263F08BA0]);
      v10 = [v7 objectAtIndexedSubscript:1];
      v11 = (void *)[v9 initWithString:v10];

      v12 = [v11 path];
      [(MKHTTPHeaders *)v5 setPath:v12];

      if (![(NSString *)v5->_path length]) {
        [(MKHTTPHeaders *)v5 setPath:@"/"];
      }
      v13 = [(NSString *)v5->_path stringByReplacingOccurrencesOfString:@"+" withString:@" "];
      v14 = [v13 stringByRemovingPercentEncoding];
      [(MKHTTPHeaders *)v5 setPath:v14];

      id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      v16 = [v11 queryItems];
      uint64_t v17 = [v16 countByEnumeratingWithState:&v64 objects:v69 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v65;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v65 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v64 + 1) + 8 * i);
            v22 = [v21 name];
            uint64_t v23 = [v21 value];
            if (v23) {
              v24 = (__CFString *)v23;
            }
            else {
              v24 = &stru_26DF6A8B0;
            }
            [v15 setObject:v24 forKey:v22];
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v64 objects:v69 count:16];
        }
        while (v18);
      }

      [(MKHTTPHeaders *)v5 setQuery:v15];
      v25 = [v7 objectAtIndexedSubscript:2];
      [(MKHTTPHeaders *)v5 setVersion:v25];

      id v4 = v63;
    }
    v26 = [(MKHTTPHeaders *)v5 pairsFromArray:v4 byKey:@": " atIndex:1];
    v27 = [v26 objectForKey:@"content-length"];
    -[MKHTTPHeaders setContentLength:](v5, "setContentLength:", [v27 longLongValue]);

    v28 = [v26 objectForKey:@"content-type"];
    if ([v28 hasPrefix:@"multipart/"])
    {
      v29 = [v28 componentsSeparatedByString:@"; "];
      if ((unint64_t)[v29 count] >= 2)
      {
        v30 = [v29 objectAtIndexedSubscript:0];
        [(MKHTTPHeaders *)v5 setContentType:v30];

        v31 = [(MKHTTPHeaders *)v5 pairsFromArray:v29 byKey:@"=" atIndex:1];
        v32 = [v31 objectForKey:@"boundary"];
        [(MKHTTPHeaders *)v5 setBoundary:v32];
      }
    }
    else
    {
      [(MKHTTPHeaders *)v5 setContentType:v28];
    }
    v33 = [v26 objectForKey:@"host"];
    [(MKHTTPHeaders *)v5 setHost:v33];

    v34 = [v26 objectForKey:@"accept"];
    [(MKHTTPHeaders *)v5 setAccept:v34];

    v35 = [v26 objectForKey:@"userAgent"];
    [(MKHTTPHeaders *)v5 setUserAgent:v35];

    v36 = [v26 objectForKey:@"authorization"];
    [(MKHTTPHeaders *)v5 setAuthorization:v36];

    v37 = [v26 objectForKey:@"connection"];
    [(MKHTTPHeaders *)v5 setConnection:v37];

    v38 = [(NSString *)v5->_connection lowercaseString];
    -[MKHTTPHeaders setIsClosed:](v5, "setIsClosed:", [v38 isEqualToString:@"keep-alive"] ^ 1);

    v39 = [MKHTTPRange alloc];
    v40 = [v26 objectForKeyedSubscript:@"range"];
    v41 = [(MKHTTPRange *)v39 initWithHeaderValue:v40];
    [(MKHTTPHeaders *)v5 setRange:v41];

    v42 = [MKHTTPContentRange alloc];
    v43 = [v26 objectForKey:@"content-range"];
    v44 = [(MKHTTPContentRange *)v42 initWithHeaderValue:v43];
    [(MKHTTPHeaders *)v5 setContentRange:v44];

    v45 = [MKHTTPContentDisposition alloc];
    v46 = [v26 objectForKey:@"content-disposition"];
    v47 = [(MKHTTPContentDisposition *)v45 initWithHeaderValue:v46];
    [(MKHTTPHeaders *)v5 setContentDisposition:v47];

    v48 = [MKHTTPProxyAuthorization alloc];
    v49 = [v26 objectForKey:@"proxy-authorization"];
    v50 = [(MKHTTPProxyAuthorization *)v48 initWithHeaderValue:v49];
    [(MKHTTPHeaders *)v5 setProxyAuthorization:v50];

    v51 = [MKHTTPContentPayload alloc];
    v52 = [v26 objectForKey:@"migrationkit-content-payload"];
    v53 = [(MKHTTPContentPayload *)v51 initWithHeaderValue:v52];
    [(MKHTTPHeaders *)v5 setContentPayload:v53];

    v54 = [MKHTTPContentDate alloc];
    v55 = [v26 objectForKey:@"migrationkit-content-date"];
    v56 = [(MKHTTPContentDate *)v54 initWithHeaderValue:v55];
    [(MKHTTPHeaders *)v5 setContentDate:v56];

    v57 = [v26 objectForKey:@"transfer-encoding"];
    v58 = [v57 lowercaseString];

    [(MKHTTPHeaders *)v5 setTransferEncoding:0];
    if ([v58 containsString:@"chunked"]) {
      [(MKHTTPHeaders *)v5 setTransferEncoding:[(MKHTTPHeaders *)v5 transferEncoding] | 1];
    }
    if (!v5->_path)
    {
      v59 = [v26 objectForKey:@"migrationkit-path"];
      [(MKHTTPHeaders *)v5 setPath:v59];

      v60 = [(NSString *)v5->_path stringByReplacingOccurrencesOfString:@"+" withString:@" "];
      v61 = [v60 stringByRemovingPercentEncoding];
      [(MKHTTPHeaders *)v5 setPath:v61];
    }
  }

  return v5;
}

- (id)pairsFromArray:(id)a3 byKey:(id)a4 atIndex:(int64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  for (id i = objc_alloc_init(MEMORY[0x263EFF9A0]); a5 < (unint64_t)[v7 count]; ++a5)
  {
    v10 = [v7 objectAtIndexedSubscript:a5];
    v11 = [v10 componentsSeparatedByString:v8];
    if ([v11 count] == 2)
    {
      v12 = [v11 objectAtIndexedSubscript:0];
      v13 = [v11 objectAtIndexedSubscript:1];
      v14 = [v12 lowercaseString];

      [i setObject:v13 forKey:v14];
    }
  }
  return i;
}

- (void)setStatusCode:(unint64_t)a3
{
  self->_statusCode = a3;
  +[MKHTTPStatusText statusText:](MKHTTPStatusText, "statusText:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(MKHTTPHeaders *)self setStatusText:v4];
}

- (id)responseHeadersData
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v5 = [NSNumber numberWithUnsignedLongLong:self->_contentLength];
  objc_super v6 = [v5 stringValue];
  [v4 setObject:v6 forKeyedSubscript:@"Content-Length"];

  contentType = self->_contentType;
  if (contentType) {
    [v4 setObject:contentType forKeyedSubscript:@"Content-Type"];
  }
  id v8 = [(MKHTTPHeaders *)self connection];
  [v4 setObject:v8 forKeyedSubscript:@"Connection"];

  id v9 = [(MKHTTPServerTiming *)self->_serverTiming value];
  if ([v9 length]) {
    [v4 setObject:v9 forKeyedSubscript:@"Server-Timing"];
  }
  v21 = v9;
  version = self->_version;
  v11 = [NSNumber numberWithUnsignedInteger:self->_statusCode];
  [v3 appendFormat:@"%@ %@ %@%@", version, v11, self->_statusText, @"\r\n"];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v12 = [v4 allKeys];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v18 = [v4 objectForKeyedSubscript:v17];
        [v3 appendFormat:@"%@: %@%@", v17, v18, @"\r\n"];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  [v3 appendString:@"\r\n"];
  uint64_t v19 = [v3 dataUsingEncoding:4];

  return v19;
}

- (void)close:(BOOL)a3
{
  if (a3) {
    id v3 = @"close";
  }
  else {
    id v3 = @"keep-alive";
  }
  [(MKHTTPHeaders *)self setConnection:v3];
}

- (BOOL)isClosed
{
  return self->_isClosed;
}

- (void)setIsClosed:(BOOL)a3
{
  self->_isClosed = a3;
}

- (unint64_t)statusCode
{
  return self->_statusCode;
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
}

- (NSString)method
{
  return self->_method;
}

- (void)setMethod:(id)a3
{
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (unint64_t)transferEncoding
{
  return self->_transferEncoding;
}

- (void)setTransferEncoding:(unint64_t)a3
{
  self->_transferEncoding = a3;
}

- (unint64_t)contentLength
{
  return self->_contentLength;
}

- (void)setContentLength:(unint64_t)a3
{
  self->_contentLength = a3;
}

- (NSString)accept
{
  return self->_accept;
}

- (void)setAccept:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
}

- (NSString)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (NSString)boundary
{
  return self->_boundary;
}

- (void)setBoundary:(id)a3
{
}

- (NSDictionary)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
}

- (MKHTTPRange)range
{
  return self->_range;
}

- (void)setRange:(id)a3
{
}

- (MKHTTPContentRange)contentRange
{
  return self->_contentRange;
}

- (void)setContentRange:(id)a3
{
}

- (MKHTTPContentDisposition)contentDisposition
{
  return self->_contentDisposition;
}

- (void)setContentDisposition:(id)a3
{
}

- (MKHTTPProxyAuthorization)proxyAuthorization
{
  return self->_proxyAuthorization;
}

- (void)setProxyAuthorization:(id)a3
{
}

- (MKHTTPContentPayload)contentPayload
{
  return self->_contentPayload;
}

- (void)setContentPayload:(id)a3
{
}

- (MKHTTPContentDate)contentDate
{
  return self->_contentDate;
}

- (void)setContentDate:(id)a3
{
}

- (MKHTTPServerTiming)serverTiming
{
  return self->_serverTiming;
}

- (void)setServerTiming:(id)a3
{
}

- (NSString)statusText
{
  return self->_statusText;
}

- (void)setStatusText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusText, 0);
  objc_storeStrong((id *)&self->_serverTiming, 0);
  objc_storeStrong((id *)&self->_contentDate, 0);
  objc_storeStrong((id *)&self->_contentPayload, 0);
  objc_storeStrong((id *)&self->_proxyAuthorization, 0);
  objc_storeStrong((id *)&self->_contentDisposition, 0);
  objc_storeStrong((id *)&self->_contentRange, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_query, 0);
  objc_storeStrong((id *)&self->_boundary, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_accept, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_method, 0);
  objc_storeStrong((id *)&self->_version, 0);
}

@end