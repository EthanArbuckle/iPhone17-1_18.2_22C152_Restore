@interface SSDownloadManagerOptions
- (BOOL)ignoreDivertedDownloads;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldFilterExternalOriginatedDownloads;
- (NSArray)downloadKinds;
- (NSArray)prefetchedDownloadExternalProperties;
- (NSArray)prefetchedDownloadProperties;
- (NSString)persistenceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setDownloadKinds:(id)a3;
- (void)setIgnoreDivertedDownloads:(BOOL)a3;
- (void)setPersistenceIdentifier:(id)a3;
- (void)setPrefetchedDownloadExternalProperties:(id)a3;
- (void)setPrefetchedDownloadProperties:(id)a3;
- (void)setShouldFilterExternalOriginatedDownloads:(BOOL)a3;
@end

@implementation SSDownloadManagerOptions

- (NSArray)downloadKinds
{
  return self->_downloadKinds;
}

- (BOOL)shouldFilterExternalOriginatedDownloads
{
  return self->_filterExternalOriginatedDownloads;
}

- (NSArray)prefetchedDownloadProperties
{
  return self->_prefetchedDownloadProperties;
}

- (NSArray)prefetchedDownloadExternalProperties
{
  return self->_prefetchedDownloadExternalProperties;
}

- (NSString)persistenceIdentifier
{
  return self->_persistenceIdentifier;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSArray *)self->_downloadKinds copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(unsigned char *)(v5 + 16) = self->_filterExternalOriginatedDownloads;
  *(unsigned char *)(v5 + 48) = self->_ignoreDivertedDownloads;
  uint64_t v8 = [(NSString *)self->_persistenceIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSArray *)self->_prefetchedDownloadExternalProperties copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSArray *)self->_prefetchedDownloadProperties copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  return (id)v5;
}

- (void)setPrefetchedDownloadProperties:(id)a3
{
}

- (void)setPrefetchedDownloadExternalProperties:(id)a3
{
}

- (void)setDownloadKinds:(id)a3
{
}

- (void)setShouldFilterExternalOriginatedDownloads:(BOOL)a3
{
  self->_filterExternalOriginatedDownloads = a3;
}

- (void)setPersistenceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedDownloadProperties, 0);
  objc_storeStrong((id *)&self->_prefetchedDownloadExternalProperties, 0);
  objc_storeStrong((id *)&self->_persistenceIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadKinds, 0);
}

- (unint64_t)hash
{
  return [(NSArray *)self->_downloadKinds hash];
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  uint64_t v7 = objc_opt_class();
  if (v7 == objc_opt_class())
  {
    int v8 = [(SSDownloadManagerOptions *)self shouldFilterExternalOriginatedDownloads];
    if (v8 == [v6 shouldFilterExternalOriginatedDownloads])
    {
      int v9 = [(SSDownloadManagerOptions *)self ignoreDivertedDownloads];
      if (v9 == [v6 ignoreDivertedDownloads])
      {
        uint64_t v12 = [(SSDownloadManagerOptions *)self persistenceIdentifier];
        v13 = [v6 persistenceIdentifier];
        if (v12 != v13)
        {
          v14 = [(SSDownloadManagerOptions *)self persistenceIdentifier];
          v3 = [v6 persistenceIdentifier];
          v37 = v14;
          if (![v14 isEqual:v3])
          {
            char v10 = 0;
            goto LABEL_26;
          }
        }
        v15 = [(SSDownloadManagerOptions *)self downloadKinds];
        v16 = [v6 downloadKinds];
        if (v15 != v16)
        {
          v17 = [(SSDownloadManagerOptions *)self downloadKinds];
          v4 = [v6 downloadKinds];
          if (![v17 isEqualToArray:v4])
          {
            char v10 = 0;
LABEL_24:

LABEL_25:
            if (v12 == v13)
            {
LABEL_27:

              goto LABEL_5;
            }
LABEL_26:

            goto LABEL_27;
          }
          v35 = v17;
        }
        uint64_t v18 = [(SSDownloadManagerOptions *)self prefetchedDownloadExternalProperties];
        v19 = [v6 prefetchedDownloadExternalProperties];
        v36 = (void *)v18;
        if ((void *)v18 == v19)
        {
          v31 = v4;
          v32 = v16;
        }
        else
        {
          v20 = [(SSDownloadManagerOptions *)self prefetchedDownloadExternalProperties];
          v33 = [v6 prefetchedDownloadExternalProperties];
          v34 = v20;
          if (!objc_msgSend(v20, "isEqualToArray:"))
          {
            char v10 = 0;
            v29 = v36;
            goto LABEL_22;
          }
          v31 = v4;
          v32 = v16;
        }
        v21 = [(SSDownloadManagerOptions *)self prefetchedDownloadProperties];
        uint64_t v22 = [v6 prefetchedDownloadProperties];
        if (v21 == (void *)v22)
        {

          char v10 = 1;
        }
        else
        {
          v23 = (void *)v22;
          v24 = [(SSDownloadManagerOptions *)self prefetchedDownloadProperties];
          [v6 prefetchedDownloadProperties];
          v30 = v13;
          v25 = v12;
          v26 = v15;
          v28 = v27 = v3;
          char v10 = [v24 isEqualToArray:v28];

          v3 = v27;
          v15 = v26;
          uint64_t v12 = v25;
          v13 = v30;
        }
        v29 = v36;
        v4 = v31;
        v16 = v32;
        if (v36 == v19)
        {
LABEL_23:

          v17 = v35;
          if (v15 == v16) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
LABEL_22:

        goto LABEL_23;
      }
    }
  }
  char v10 = 0;
LABEL_5:

  return v10;
}

- (BOOL)ignoreDivertedDownloads
{
  return self->_ignoreDivertedDownloads;
}

- (void)setIgnoreDivertedDownloads:(BOOL)a3
{
  self->_ignoreDivertedDownloads = a3;
}

@end