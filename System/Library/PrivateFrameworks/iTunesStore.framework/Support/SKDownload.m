@interface SKDownload
+ (NSURL)contentURLForProductID:(NSString *)productID;
- (BOOL)isEqual:(id)a3;
- (NSError)error;
- (NSNumber)_downloadID;
- (NSString)contentIdentifier;
- (NSString)contentVersion;
- (NSTimeInterval)timeRemaining;
- (NSURL)contentURL;
- (SKDownload)init;
- (SKDownload)initWithXPCEncoding:(id)a3;
- (SKDownloadState)downloadState;
- (SKDownloadState)state;
- (SKPaymentTransaction)transaction;
- (float)progress;
- (id)copyXPCEncoding;
- (uint64_t)contentLength;
- (void)_applyChangeset:(id)a3;
- (void)_setContentIdentifier:(id)a3;
- (void)_setContentLength:(id)a3;
- (void)_setContentURL:(id)a3;
- (void)_setDownloadID:(id)a3;
- (void)_setDownloadState:(int64_t)a3;
- (void)_setError:(id)a3;
- (void)_setProgress:(float)a3;
- (void)_setTimeRemaining:(double)a3;
- (void)_setTransaction:(id)a3;
- (void)_setVersion:(id)a3;
@end

@implementation SKDownload

- (SKDownload)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKDownload;
  v2 = [(SKDownload *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKDownloadInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;

    *((NSTimeInterval *)v2->_internal + 7) = SKDownloadTimeRemainingUnknown;
  }
  return v2;
}

- (NSNumber)_downloadID
{
  return (NSNumber *)*((id *)self->_internal + 1);
}

- (NSString)contentIdentifier
{
  return (NSString *)*((id *)self->_internal + 2);
}

- (SKDownloadState)state
{
  return *((void *)self->_internal + 3);
}

- (SKDownloadState)downloadState
{
  return *((void *)self->_internal + 3);
}

- (NSURL)contentURL
{
  return (NSURL *)*((id *)self->_internal + 6);
}

- (float)progress
{
  return *((float *)self->_internal + 8);
}

- (uint64_t)contentLength
{
  return (uint64_t)[*((id *)self->_internal + 8) longLongValue];
}

- (NSString)contentVersion
{
  return (NSString *)*((id *)self->_internal + 9);
}

- (NSError)error
{
  return (NSError *)*((id *)self->_internal + 5);
}

- (NSTimeInterval)timeRemaining
{
  return *((double *)self->_internal + 7);
}

- (SKPaymentTransaction)transaction
{
  id WeakRetained = objc_loadWeakRetained((id *)self->_internal + 10);

  return (SKPaymentTransaction *)WeakRetained;
}

- (void)_applyChangeset:(id)a3
{
  id v10 = a3;
  v4 = [v10 contentLength];
  if (v4) {
    [(SKDownload *)self _setContentLength:v4];
  }
  v5 = [v10 contentURL];

  if (v5) {
    [(SKDownload *)self _setContentURL:v5];
  }
  objc_super v6 = [v10 downloadState];

  if (v6) {
    -[SKDownload _setDownloadState:](self, "_setDownloadState:", [v6 integerValue]);
  }
  v7 = [v10 error];

  if (v7) {
    [(SKDownload *)self _setError:v7];
  }
  v8 = [v10 progress];

  if (v8)
  {
    [v8 floatValue];
    -[SKDownload _setProgress:](self, "_setProgress:");
  }
  v9 = [v10 timeRemaining];

  if (v9)
  {
    [v9 doubleValue];
    -[SKDownload _setTimeRemaining:](self, "_setTimeRemaining:");
  }
}

- (void)_setDownloadID:(id)a3
{
  *((void *)self->_internal + 1) = [a3 copy];

  _objc_release_x1();
}

- (void)_setContentIdentifier:(id)a3
{
  *((void *)self->_internal + 2) = [a3 copy];

  _objc_release_x1();
}

- (void)_setContentLength:(id)a3
{
  objc_storeStrong((id *)self->_internal + 8, a3);
  id v4 = a3;
}

- (void)_setContentURL:(id)a3
{
  *((void *)self->_internal + 6) = [a3 copy];

  _objc_release_x1();
}

- (void)_setDownloadState:(int64_t)a3
{
  *((void *)self->_internal + 3) = a3;
}

- (void)_setError:(id)a3
{
  *((void *)self->_internal + 5) = [a3 copy];

  _objc_release_x1();
}

- (void)_setProgress:(float)a3
{
  *((float *)self->_internal + 8) = a3;
}

- (void)_setTimeRemaining:(double)a3
{
  *((double *)self->_internal + 7) = a3;
}

- (void)_setTransaction:(id)a3
{
  id v4 = (id *)((char *)self->_internal + 80);
  id v5 = a3;
  objc_storeWeak(v4, v5);
  id v7 = [v5 payment];

  objc_super v6 = [v7 productIdentifier];
  [(SKDownload *)self _setContentIdentifier:v6];
}

- (void)_setVersion:(id)a3
{
  *((void *)self->_internal + 9) = [a3 copy];

  _objc_release_x1();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    objc_super v6 = [(SKDownload *)self _downloadID];
    id v7 = [v5 _downloadID];
    if ([v6 isEqual:v7])
    {
      v8 = [(SKDownload *)self contentIdentifier];
      v9 = [v5 contentIdentifier];
      unsigned __int8 v10 = [v8 isEqual:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

+ (NSURL)contentURLForProductID:(NSString *)productID
{
  return 0;
}

- (SKDownload)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    objc_super v6 = [(SKDownload *)self init];
    if (!v6) {
      goto LABEL_5;
    }
    uint64_t v8 = +[NSNumber numberWithLongLong:xpc_dictionary_get_int64(v5, "0")];
    id internal = v6->_internal;
    unsigned __int8 v10 = (void *)internal[8];
    internal[8] = v8;

    objc_opt_class();
    CFDictionaryRef v11 = sub_10010B0C0(v5, "2");
    v12 = v6->_internal;
    v13 = (void *)v12[1];
    v12[1] = v11;

    *((void *)v6->_internal + 3) = xpc_dictionary_get_int64(v5, "3");
    float v14 = xpc_dictionary_get_double(v5, "5");
    *((float *)v6->_internal + 8) = v14;
    objc_opt_class();
    CFDictionaryRef v15 = sub_10010B0C0(v5, "7");
    v16 = v6->_internal;
    v17 = (void *)v16[9];
    v16[9] = v15;

    xpc_dictionary_get_value(v5, "6");
    v18 = (SKDownload *)objc_claimAutoreleasedReturnValue();
    self = v18;
    if (v18 && xpc_get_type(v18) == (xpc_type_t)&_xpc_type_double) {
      double value = xpc_double_get_value(self);
    }
    else {
      double value = SKDownloadTimeRemainingUnknown;
    }
    *((double *)v6->_internal + 7) = value;
    objc_opt_class();
    CFDictionaryRef v20 = sub_10010B0C0(v5, "1");
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      id v22 = [objc_alloc((Class)NSURL) initWithString:v20];
    }
    else {
      id v22 = 0;
    }
    objc_storeStrong((id *)v6->_internal + 6, v22);
    if (isKindOfClass) {

    }
    objc_opt_class();
    CFDictionaryRef v23 = sub_10010B0C0(v5, "4");

    if (v23)
    {
      uint64_t v24 = sub_10010A78C((uint64_t)v23);
      v25 = v6->_internal;
      v26 = (void *)v25[5];
      v25[5] = v24;
    }
  }
  else
  {
    objc_super v6 = 0;
  }

LABEL_5:
  return v6;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v3, "0", (int64_t)[*((id *)self->_internal + 8) longLongValue]);
  sub_10010B10C(v3, "1", (__CFString *)[*((id *)self->_internal + 6) absoluteString]);
  sub_10010B10C(v3, "2", *((__CFString **)self->_internal + 1));
  xpc_dictionary_set_int64(v3, "3", *((void *)self->_internal + 3));
  id v4 = (__CFString *)sub_10010A20C(*((void *)self->_internal + 5));
  sub_10010B10C(v3, "4", v4);
  xpc_dictionary_set_double(v3, "5", *((float *)self->_internal + 8));
  xpc_dictionary_set_double(v3, "6", *((double *)self->_internal + 7));
  sub_10010B10C(v3, "7", *((__CFString **)self->_internal + 9));
  return v3;
}

- (void).cxx_destruct
{
}

@end