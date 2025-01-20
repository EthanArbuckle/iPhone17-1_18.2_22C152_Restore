@interface SEMIndexSite
- (BOOL)isUnavailableSoon;
- (NSString)personaIdentifier;
- (NSURL)ftsDatabaseURL;
- (NSURL)ftsDirectoryURL;
- (NSURL)indexSiteURL;
- (NSURL)skitDirectoryURL;
- (SEMIndexSite)init;
- (SEMIndexSite)initWithType:(unsigned __int8)a3 indexSiteURL:(id)a4 dataProtectionClass:(int)a5 personaIdentifier:(id)a6;
- (UVTransaction)uvTransaction;
- (id)cachedObjectForKey:(id)a3 initBlock:(id)a4;
- (id)description;
- (int)dataProtectionClass;
- (unsigned)type;
- (void)setIsUnavailableSoon:(BOOL)a3;
- (void)setUvTransaction:(id)a3;
@end

@implementation SEMIndexSite

- (SEMIndexSite)initWithType:(unsigned __int8)a3 indexSiteURL:(id)a4 dataProtectionClass:(int)a5 personaIdentifier:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v38.receiver = self;
  v38.super_class = (Class)SEMIndexSite;
  v13 = [(SEMIndexSite *)&v38 init];
  v14 = v13;
  if (v13)
  {
    v13->_type = a3;
    objc_storeStrong((id *)&v13->_indexSiteURL, a4);
    v14->_dataProtectionClass = a5;
    objc_storeStrong((id *)&v14->_personaIdentifier, a6);
    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    objectCache = v14->_objectCache;
    v14->_objectCache = v15;

    objc_msgSend_description(v14, v17, v18, v19);
    id v20 = objc_claimAutoreleasedReturnValue();
    v24 = (const char *)objc_msgSend_UTF8String(v20, v21, v22, v23);
    v25 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v26 = dispatch_queue_create(v24, v25);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v26;

    uint64_t v29 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(NSURL, v28, @"SKIT", 1, v14->_indexSiteURL);
    skitDirectoryURL = v14->_skitDirectoryURL;
    v14->_skitDirectoryURL = (NSURL *)v29;

    uint64_t v32 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(NSURL, v31, @"FTS", 1, v14->_indexSiteURL);
    ftsDirectoryURL = v14->_ftsDirectoryURL;
    v14->_ftsDirectoryURL = (NSURL *)v32;

    uint64_t v35 = objc_msgSend_fileURLWithPath_isDirectory_relativeToURL_(NSURL, v34, @"SEM_FTS", 1, v14->_indexSiteURL);
    ftsDatabaseURL = v14->_ftsDatabaseURL;
    v14->_ftsDatabaseURL = (NSURL *)v35;
  }
  return v14;
}

- (SEMIndexSite)init
{
  objc_msgSend_exceptionWithName_reason_userInfo_(MEMORY[0x263EFF940], a2, *MEMORY[0x263EFF498], @"init unsupported", MEMORY[0x263EFFA78]);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (id)description
{
  v5 = sub_25C7FBC68(self->_type, a2, v2, v3);
  v8 = v5;
  if (self->_type == 2)
  {
    objc_msgSend_stringWithFormat_(NSString, v6, @"%@:%@", v7, v5, self->_personaIdentifier);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v9 = v5;
  }
  v10 = v9;

  return v10;
}

- (id)cachedObjectForKey:(id)a3 initBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_25C7F55D4;
  v21 = sub_25C7F55E4;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_25C7F55EC;
  v13[3] = &unk_2654DE348;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (unsigned)type
{
  return self->_type;
}

- (NSURL)indexSiteURL
{
  return self->_indexSiteURL;
}

- (int)dataProtectionClass
{
  return self->_dataProtectionClass;
}

- (NSURL)skitDirectoryURL
{
  return self->_skitDirectoryURL;
}

- (NSURL)ftsDirectoryURL
{
  return self->_ftsDirectoryURL;
}

- (NSURL)ftsDatabaseURL
{
  return self->_ftsDatabaseURL;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (BOOL)isUnavailableSoon
{
  return self->_isUnavailableSoon;
}

- (void)setIsUnavailableSoon:(BOOL)a3
{
  self->_isUnavailableSoon = a3;
}

- (UVTransaction)uvTransaction
{
  return self->_uvTransaction;
}

- (void)setUvTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uvTransaction, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_ftsDatabaseURL, 0);
  objc_storeStrong((id *)&self->_ftsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_skitDirectoryURL, 0);
  objc_storeStrong((id *)&self->_indexSiteURL, 0);
  objc_storeStrong((id *)&self->_objectCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end