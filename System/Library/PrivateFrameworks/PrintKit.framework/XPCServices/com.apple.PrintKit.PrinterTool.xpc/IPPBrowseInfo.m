@interface IPPBrowseInfo
- (IPPBrowseInfo)initWithSession:(id)a3 browseInfo:(id)a4;
- (IPPSession)session;
- (IPPURL)printerSessionURL;
- (PKPrinterBrowseInfo)info;
- (void)withPrinterSessionURL:(id)a3;
@end

@implementation IPPBrowseInfo

- (IPPBrowseInfo)initWithSession:(id)a3 browseInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)IPPBrowseInfo;
  v9 = [(IPPBrowseInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_session, a3);
    objc_storeStrong((id *)&v10->_info, a4);
  }

  return v10;
}

- (IPPURL)printerSessionURL
{
  v2 = self;
  if (object_isClass(v2)) {
    +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[IPPBrowseInfo printerSessionURL]");
  }
  else {
  v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@<%p>: %s", objc_opt_class(), v2, "-[IPPBrowseInfo printerSessionURL]");
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000909C;
  v6[3] = &unk_100095288;
  v6[4] = v2;
  v4 = sub_100008F58(v3, v6, 10.0);

  return (IPPURL *)v4;
}

- (void)withPrinterSessionURL:(id)a3
{
  id v4 = a3;
  v5 = [(PKPrinterBrowseInfo *)self->_info bonjourName];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009180;
  v7[3] = &unk_1000952B0;
  id v6 = v4;
  v7[4] = self;
  id v8 = v6;
  [v5 withResolvedURL:v7];
}

- (IPPSession)session
{
  return (IPPSession *)objc_getProperty(self, a2, 8, 1);
}

- (PKPrinterBrowseInfo)info
{
  return (PKPrinterBrowseInfo *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_info, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end