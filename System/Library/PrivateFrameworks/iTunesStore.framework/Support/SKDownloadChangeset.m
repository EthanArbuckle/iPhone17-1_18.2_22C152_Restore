@interface SKDownloadChangeset
+ (id)changesetWithDownloadID:(id)a3 state:(int64_t)a4;
- (NSError)error;
- (NSNumber)contentLength;
- (NSNumber)downloadID;
- (NSNumber)downloadState;
- (NSNumber)progress;
- (NSNumber)timeRemaining;
- (NSURL)contentURL;
- (SKDownloadChangeset)initWithXPCEncoding:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)copyXPCEncoding;
- (void)setContentLength:(id)a3;
- (void)setContentURL:(id)a3;
- (void)setDownloadID:(id)a3;
- (void)setDownloadState:(id)a3;
- (void)setError:(id)a3;
- (void)setProgress:(id)a3;
- (void)setTimeRemaining:(id)a3;
@end

@implementation SKDownloadChangeset

+ (id)changesetWithDownloadID:(id)a3 state:(int64_t)a4
{
  id v5 = a3;
  v6 = objc_alloc_init(SKDownloadChangeset);
  [(SKDownloadChangeset *)v6 setDownloadID:v5];

  v7 = +[NSNumber numberWithInteger:a4];
  [(SKDownloadChangeset *)v6 setDownloadState:v7];

  return v6;
}

- (SKDownloadChangeset)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v25.receiver = self;
    v25.super_class = (Class)SKDownloadChangeset;
    v6 = [(SKDownloadChangeset *)&v25 init];
    if (v6)
    {
      objc_opt_class();
      CFDictionaryRef v8 = sub_10010B0C0(v5, "1");
      if (v8)
      {
        v9 = (NSURL *)[objc_alloc((Class)NSURL) initWithString:v8];
        contentURL = v6->_contentURL;
        v6->_contentURL = v9;
      }
      else
      {
        contentURL = v6->_contentURL;
        v6->_contentURL = 0;
      }

      objc_opt_class();
      CFDictionaryRef v11 = sub_10010B0C0(v5, "4");
      CFDictionaryRef v12 = v11;
      if (v11)
      {
        uint64_t v13 = sub_10010A78C((uint64_t)v11);
        error = v6->_error;
        v6->_error = (NSError *)v13;
      }
      objc_opt_class();
      CFDictionaryRef v15 = sub_10010B0C0(v5, "0");
      contentLength = v6->_contentLength;
      v6->_contentLength = (NSNumber *)v15;

      objc_opt_class();
      CFDictionaryRef v17 = sub_10010B0C0(v5, "2");
      downloadID = v6->_downloadID;
      v6->_downloadID = (NSNumber *)v17;

      objc_opt_class();
      CFDictionaryRef v19 = sub_10010B0C0(v5, "3");
      downloadState = v6->_downloadState;
      v6->_downloadState = (NSNumber *)v19;

      objc_opt_class();
      CFDictionaryRef v21 = sub_10010B0C0(v5, "5");
      progress = v6->_progress;
      v6->_progress = (NSNumber *)v21;

      objc_opt_class();
      CFDictionaryRef v23 = sub_10010B0C0(v5, "6");
      timeRemaining = v6->_timeRemaining;
      v6->_timeRemaining = (NSNumber *)v23;
    }
  }
  else
  {

    v6 = 0;
  }

  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  sub_10010B10C(v3, "0", (__CFString *)self->_contentLength);
  sub_10010B10C(v3, "1", (__CFString *)[(NSURL *)self->_contentURL absoluteString]);
  sub_10010B10C(v3, "2", (__CFString *)self->_downloadID);
  sub_10010B10C(v3, "3", (__CFString *)self->_downloadState);
  id v4 = (__CFString *)sub_10010A20C((uint64_t)self->_error);
  sub_10010B10C(v3, "4", v4);
  sub_10010B10C(v3, "5", (__CFString *)self->_progress);
  sub_10010B10C(v3, "6", (__CFString *)self->_timeRemaining);
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSNumber *)self->_contentLength copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSURL *)self->_contentURL copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSNumber *)self->_downloadID copyWithZone:a3];
  CFDictionaryRef v11 = (void *)v5[3];
  v5[3] = v10;

  id v12 = [(NSNumber *)self->_downloadState copyWithZone:a3];
  uint64_t v13 = (void *)v5[4];
  v5[4] = v12;

  id v14 = [(NSError *)self->_error copyWithZone:a3];
  CFDictionaryRef v15 = (void *)v5[5];
  v5[5] = v14;

  id v16 = [(NSNumber *)self->_progress copyWithZone:a3];
  CFDictionaryRef v17 = (void *)v5[6];
  v5[6] = v16;

  id v18 = [(NSNumber *)self->_timeRemaining copyWithZone:a3];
  CFDictionaryRef v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (NSNumber)contentLength
{
  return self->_contentLength;
}

- (void)setContentLength:(id)a3
{
}

- (NSURL)contentURL
{
  return self->_contentURL;
}

- (void)setContentURL:(id)a3
{
}

- (NSNumber)downloadID
{
  return self->_downloadID;
}

- (void)setDownloadID:(id)a3
{
}

- (NSNumber)downloadState
{
  return self->_downloadState;
}

- (void)setDownloadState:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSNumber)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
}

- (NSNumber)timeRemaining
{
  return self->_timeRemaining;
}

- (void)setTimeRemaining:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeRemaining, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_downloadState, 0);
  objc_storeStrong((id *)&self->_downloadID, 0);
  objc_storeStrong((id *)&self->_contentURL, 0);

  objc_storeStrong((id *)&self->_contentLength, 0);
}

@end