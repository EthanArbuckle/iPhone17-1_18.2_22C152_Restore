@interface BEProtocolCacheItem
- (BEProtocolCacheItem)init;
- (NSDictionary)documents;
- (NSDictionary)sinfInfo;
- (NSMutableDictionary)svgCache;
- (NSString)bookEpubId;
- (NSString)bookEpubIdWithUUIDScheme;
- (NSString)bookID;
- (NSString)rootPath;
- (id)cachedSVGForURL:(id)a3;
- (id)dataForSinfNumber:(id)a3;
- (id)infoForDocumentAtPath:(id)a3;
- (os_unfair_lock_s)svgCacheLock;
- (unint64_t)contentBlockingRule;
- (void)cacheSVG:(id)a3 url:(id)a4;
- (void)setBookEpubId:(id)a3;
- (void)setBookEpubIdWithUUIDScheme:(id)a3;
- (void)setBookID:(id)a3;
- (void)setDocuments:(id)a3;
- (void)setRootPath:(id)a3;
- (void)setSinfInfo:(id)a3;
- (void)setSvgCache:(id)a3;
- (void)setSvgCacheLock:(os_unfair_lock_s)a3;
@end

@implementation BEProtocolCacheItem

- (BEProtocolCacheItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)BEProtocolCacheItem;
  v2 = [(BEProtocolCacheItem *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    svgCache = v2->_svgCache;
    v2->_svgCache = v3;

    v2->_svgCacheLock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (id)infoForDocumentAtPath:(id)a3
{
  return [(NSDictionary *)self->_documents objectForKey:a3];
}

- (id)dataForSinfNumber:(id)a3
{
  return [(NSDictionary *)self->_sinfInfo objectForKey:a3];
}

- (id)cachedSVGForURL:(id)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = sub_BCB8;
  v18 = sub_BCC8;
  id v19 = 0;
  p_svgCacheLock = &self->_svgCacheLock;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v9 = sub_BCD0;
  v10 = &unk_3C0320;
  v13 = &v14;
  v11 = self;
  id v4 = a3;
  id v12 = v4;
  v5 = v8;
  os_unfair_lock_lock(p_svgCacheLock);
  v9(v5);
  os_unfair_lock_unlock(p_svgCacheLock);

  id v6 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v6;
}

- (void)cacheSVG:(id)a3 url:(id)a4
{
  id v6 = a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_BE00;
  v10[3] = &unk_3C0348;
  p_svgCacheLock = &self->_svgCacheLock;
  v10[4] = self;
  id v11 = a4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v11;
  os_unfair_lock_lock(p_svgCacheLock);
  sub_BE00((uint64_t)v10);
  os_unfair_lock_unlock(p_svgCacheLock);
}

- (unint64_t)contentBlockingRule
{
  v3 = +[BEDocumentExternalLoadApprovalCache sharedInstance];
  LODWORD(self) = [v3 didApproveLoadingExternalContentForBookID:self->_bookID];

  if (self) {
    return 2;
  }
  else {
    return 1;
  }
}

- (NSString)bookID
{
  return self->_bookID;
}

- (void)setBookID:(id)a3
{
}

- (NSString)bookEpubId
{
  return self->_bookEpubId;
}

- (void)setBookEpubId:(id)a3
{
}

- (NSString)bookEpubIdWithUUIDScheme
{
  return self->_bookEpubIdWithUUIDScheme;
}

- (void)setBookEpubIdWithUUIDScheme:(id)a3
{
}

- (NSString)rootPath
{
  return self->_rootPath;
}

- (void)setRootPath:(id)a3
{
}

- (NSDictionary)sinfInfo
{
  return self->_sinfInfo;
}

- (void)setSinfInfo:(id)a3
{
}

- (NSDictionary)documents
{
  return self->_documents;
}

- (void)setDocuments:(id)a3
{
}

- (NSMutableDictionary)svgCache
{
  return self->_svgCache;
}

- (void)setSvgCache:(id)a3
{
}

- (os_unfair_lock_s)svgCacheLock
{
  return self->_svgCacheLock;
}

- (void)setSvgCacheLock:(os_unfair_lock_s)a3
{
  self->_svgCacheLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_svgCache, 0);
  objc_storeStrong((id *)&self->_documents, 0);
  objc_storeStrong((id *)&self->_sinfInfo, 0);
  objc_storeStrong((id *)&self->_rootPath, 0);
  objc_storeStrong((id *)&self->_bookEpubIdWithUUIDScheme, 0);
  objc_storeStrong((id *)&self->_bookEpubId, 0);

  objc_storeStrong((id *)&self->_bookID, 0);
}

@end