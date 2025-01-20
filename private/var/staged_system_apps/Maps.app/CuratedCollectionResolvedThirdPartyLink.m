@interface CuratedCollectionResolvedThirdPartyLink
- (CuratedCollectionResolvedThirdPartyLink)initWithAdamID:(id)a3 appName:(id)a4 appIconURL:(id)a5 url:(id)a6;
- (NSString)adamID;
- (NSString)appName;
- (NSURL)appIconURL;
- (NSURL)url;
@end

@implementation CuratedCollectionResolvedThirdPartyLink

- (CuratedCollectionResolvedThirdPartyLink)initWithAdamID:(id)a3 appName:(id)a4 appIconURL:(id)a5 url:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)CuratedCollectionResolvedThirdPartyLink;
  v14 = [(CuratedCollectionResolvedThirdPartyLink *)&v20 init];
  if (v14)
  {
    v15 = (NSString *)[v10 copy];
    adamID = v14->_adamID;
    v14->_adamID = v15;

    v17 = (NSString *)[v11 copy];
    appName = v14->_appName;
    v14->_appName = v17;

    objc_storeStrong((id *)&v14->_appIconURL, a5);
    objc_storeStrong((id *)&v14->_url, a6);
  }

  return v14;
}

- (NSString)adamID
{
  return self->_adamID;
}

- (NSString)appName
{
  return self->_appName;
}

- (NSURL)appIconURL
{
  return self->_appIconURL;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_appIconURL, 0);
  objc_storeStrong((id *)&self->_appName, 0);

  objc_storeStrong((id *)&self->_adamID, 0);
}

@end