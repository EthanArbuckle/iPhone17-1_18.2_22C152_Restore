@interface SKUIItemState
- (BOOL)activeStateIsPreview;
- (NSArray)downloadIdentifiers;
- (NSNumber)itemIdentifier;
- (NSString)downloadPhase;
- (NSString)variantIdentifier;
- (SKUIStoreIdentifier)storeIdentifier;
- (float)downloadProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)mediaCategory;
- (unint64_t)allContentFlags;
- (unint64_t)downloadContentFlags;
- (unint64_t)libraryContentFlags;
- (unint64_t)state;
- (void)activeStateIsPreview;
- (void)setDownloadContentFlags:(unint64_t)a3;
- (void)setDownloadIdentifiers:(id)a3;
- (void)setDownloadPhase:(id)a3;
- (void)setDownloadProgress:(float)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setLibraryContentFlags:(unint64_t)a3;
- (void)setMediaCategory:(int64_t)a3;
- (void)setState:(unint64_t)a3;
- (void)setStoreIdentifier:(id)a3;
- (void)setVariantIdentifier:(id)a3;
@end

@implementation SKUIItemState

- (BOOL)activeStateIsPreview
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIItemState activeStateIsPreview]();
  }
  if (([(SKUIItemState *)self state] & 3) != 0)
  {
    char v3 = [(SKUIItemState *)self downloadContentFlags];
  }
  else
  {
    if (([(SKUIItemState *)self state] & 0x40) == 0) {
      return 0;
    }
    char v3 = [(SKUIItemState *)self libraryContentFlags];
  }
  return v3 & 1;
}

- (unint64_t)allContentFlags
{
  unint64_t v3 = [(SKUIItemState *)self downloadContentFlags];
  return [(SKUIItemState *)self libraryContentFlags] | v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUIItemState;
  v4 = [(SKUIItemState *)&v7 description];
  v5 = [v3 stringWithFormat:@"%@: ID: [%@ / %@], State: %ld, Download: [%@, %.2f, %ld], Library: [%ld, %ld]", v4, self->_itemIdentifier, self->_variantIdentifier, self->_state, self->_downloadPhase, self->_downloadProgress, self->_downloadContentFlags, self->_mediaCategory, self->_libraryContentFlags];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(void *)(v5 + 16) = self->_downloadContentFlags;
  uint64_t v6 = [(NSString *)self->_downloadPhase copyWithZone:a3];
  objc_super v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  *(float *)(v5 + 8) = self->_downloadProgress;
  uint64_t v8 = [(NSNumber *)self->_itemIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(SKUIStoreIdentifier *)self->_storeIdentifier copyWithZone:a3];
  v11 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v10;

  *(void *)(v5 + 56) = self->_libraryContentFlags;
  *(void *)(v5 + 64) = self->_mediaCategory;
  *(void *)(v5 + 72) = self->_state;
  uint64_t v12 = [(NSString *)self->_variantIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v12;

  uint64_t v14 = [(NSArray *)self->_downloadIdentifiers copyWithZone:a3];
  v15 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v14;

  return (id)v5;
}

- (unint64_t)downloadContentFlags
{
  return self->_downloadContentFlags;
}

- (void)setDownloadContentFlags:(unint64_t)a3
{
  self->_downloadContentFlags = a3;
}

- (NSString)downloadPhase
{
  return self->_downloadPhase;
}

- (void)setDownloadPhase:(id)a3
{
}

- (float)downloadProgress
{
  return self->_downloadProgress;
}

- (void)setDownloadProgress:(float)a3
{
  self->_downloadProgress = a3;
}

- (NSNumber)itemIdentifier
{
  return self->_itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (NSArray)downloadIdentifiers
{
  return self->_downloadIdentifiers;
}

- (void)setDownloadIdentifiers:(id)a3
{
}

- (SKUIStoreIdentifier)storeIdentifier
{
  return self->_storeIdentifier;
}

- (void)setStoreIdentifier:(id)a3
{
}

- (unint64_t)libraryContentFlags
{
  return self->_libraryContentFlags;
}

- (void)setLibraryContentFlags:(unint64_t)a3
{
  self->_libraryContentFlags = a3;
}

- (int64_t)mediaCategory
{
  return self->_mediaCategory;
}

- (void)setMediaCategory:(int64_t)a3
{
  self->_mediaCategory = a3;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)variantIdentifier
{
  return self->_variantIdentifier;
}

- (void)setVariantIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variantIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_downloadIdentifiers, 0);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);

  objc_storeStrong((id *)&self->_downloadPhase, 0);
}

- (void)activeStateIsPreview
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIItemState activeStateIsPreview]";
}

@end