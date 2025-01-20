@interface MicroPaymentDownload
+ (id)downloadEntityFromContext:(id)a3;
+ (id)propertiesForDownloadEntities;
- (id)copySKDownload;
- (void)awakeFromInsert;
- (void)setValuesWithAssetDictionary:(id)a3;
@end

@implementation MicroPaymentDownload

+ (id)downloadEntityFromContext:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName");

  return [v3 objectForKey:@"MicroPaymentDownload"];
}

+ (id)propertiesForDownloadEntities
{
  return +[NSArray arrayWithObjects:@"contentLength", @"downloadID", @"downloadKey", @"hashArrayData", @"hashChunkSize", @"remoteURL", @"sinfs", @"state", 0];
}

- (id)copySKDownload
{
  id v3 = objc_alloc_init((Class)sub_100174DDC());
  objc_msgSend(v3, "_setDownloadID:", -[MicroPaymentDownload downloadID](self, "downloadID"));
  v4 = (char *)objc_msgSend(-[MicroPaymentDownload state](self, "state"), "integerValue");
  if ((unint64_t)(v4 - 1) >= 5) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 6 - (void)v4;
  }
  [v3 _setDownloadState:v5];
  objc_msgSend(v3, "_setVersion:", -[MicroPaymentDownload version](self, "version"));
  objc_msgSend(v3, "_setContentLength:", -[MicroPaymentDownload contentLength](self, "contentLength"));
  v6 = (NSURL *)[(MicroPaymentDownload *)self localURL];
  if (v6) {
    v6 = +[NSURL URLWithString:v6];
  }
  [v3 _setContentURL:v6];
  id v7 = [(MicroPaymentDownload *)self error];
  if (v7) {
    id v8 = sub_100174DC4((uint64_t)v7);
  }
  else {
    id v8 = 0;
  }
  [v3 _setError:v8];
  return v3;
}

- (void)setValuesWithAssetDictionary:(id)a3
{
  id v5 = [a3 objectForKey:@"downloadKey"];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    [(MicroPaymentDownload *)self setDownloadKey:v5];
  }
  id v6 = [a3 objectForKey:@"file-size"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MicroPaymentDownload *)self setContentLength:v6];
  }
  id v7 = [a3 objectForKey:@"chunks"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v13 = [a3 objectForKey:@"md5"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = +[NSArray arrayWithObject:v13];
      id v8 = 0;
    }
    else
    {
      id v8 = 0;
      v9 = 0;
    }
LABEL_15:
    [(MicroPaymentDownload *)self setHashChunkSize:v8];
    if (v9) {
      goto LABEL_10;
    }
LABEL_16:
    v12 = self;
    v11 = 0;
    goto LABEL_17;
  }
  id v8 = [v7 objectForKey:@"chunkSize"];
  v9 = (NSArray *)[v7 objectForKey:@"hashes"];
  if (!v8) {
    goto LABEL_15;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_15;
  }
  if (!v9) {
    goto LABEL_16;
  }
LABEL_10:
  v10 = +[NSPropertyListSerialization dataWithPropertyList:v9 format:200 options:0 error:0];
  if (!v10) {
    goto LABEL_18;
  }
  v11 = v10;
  v12 = self;
LABEL_17:
  [(MicroPaymentDownload *)v12 setHashArrayData:v11];
LABEL_18:
  id v14 = [a3 objectForKey:@"sinfs"];
  if (!v14)
  {
    v18 = self;
    v17 = 0;
    goto LABEL_23;
  }
  id v15 = v14;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v16 = +[NSPropertyListSerialization dataWithPropertyList:v15 format:200 options:0 error:0];
    if (v16)
    {
      v17 = v16;
      v18 = self;
LABEL_23:
      [(MicroPaymentDownload *)v18 setSinfs:v17];
    }
  }
  id v19 = [a3 objectForKey:@"URL"];
  if (!v19 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    [(MicroPaymentDownload *)self setRemoteURL:v19];
  }
  id v20 = [a3 objectForKey:@"version"];
  if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [(MicroPaymentDownload *)self setVersion:v20];
  }
}

- (void)awakeFromInsert
{
  v5.receiver = self;
  v5.super_class = (Class)MicroPaymentDownload;
  [(MicroPaymentDownload *)&v5 awakeFromInsert];
  CFUUIDRef v3 = CFUUIDCreate(0);
  id v4 = [objc_alloc((Class)NSNumber) initWithLongLong:(unint64_t)*(_OWORD *)&CFUUIDGetUUIDBytes(v3)];
  [(MicroPaymentDownload *)self setDownloadID:v4];

  CFRelease(v3);
}

@end