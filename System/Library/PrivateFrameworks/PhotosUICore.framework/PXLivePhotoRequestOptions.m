@interface PXLivePhotoRequestOptions
- (BOOL)isNetworkAccessAllowed;
- (BOOL)preferHDR;
- (id)copyWithZone:(_NSZone *)a3;
- (id)photoKitRequestOptions;
- (id)progressHandler;
- (int64_t)deliveryMode;
- (int64_t)downloadIntent;
- (int64_t)downloadPriority;
- (void)setDeliveryMode:(int64_t)a3;
- (void)setDownloadIntent:(int64_t)a3;
- (void)setDownloadPriority:(int64_t)a3;
- (void)setNetworkAccessAllowed:(BOOL)a3;
- (void)setPreferHDR:(BOOL)a3;
- (void)setProgressHandler:(id)a3;
@end

@implementation PXLivePhotoRequestOptions

- (id)photoKitRequestOptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F39148]);
  objc_msgSend(v3, "setDeliveryMode:", -[PXLivePhotoRequestOptions deliveryMode](self, "deliveryMode"));
  objc_msgSend(v3, "setNetworkAccessAllowed:", -[PXLivePhotoRequestOptions isNetworkAccessAllowed](self, "isNetworkAccessAllowed"));
  objc_msgSend(v3, "setDownloadPriority:", -[PXLivePhotoRequestOptions downloadPriority](self, "downloadPriority"));
  objc_msgSend(v3, "setDownloadIntent:", -[PXLivePhotoRequestOptions downloadIntent](self, "downloadIntent"));
  objc_msgSend(v3, "setPreferHDR:", -[PXLivePhotoRequestOptions preferHDR](self, "preferHDR"));
  v4 = [(PXLivePhotoRequestOptions *)self progressHandler];
  [v3 setProgressHandler:v4];

  return v3;
}

- (void).cxx_destruct
{
}

- (void)setProgressHandler:(id)a3
{
}

- (id)progressHandler
{
  return self->_progressHandler;
}

- (void)setPreferHDR:(BOOL)a3
{
  self->_preferHDR = a3;
}

- (BOOL)preferHDR
{
  return self->_preferHDR;
}

- (void)setDownloadIntent:(int64_t)a3
{
  self->_downloadIntent = a3;
}

- (int64_t)downloadIntent
{
  return self->_downloadIntent;
}

- (void)setDownloadPriority:(int64_t)a3
{
  self->_downloadPriority = a3;
}

- (int64_t)downloadPriority
{
  return self->_downloadPriority;
}

- (void)setNetworkAccessAllowed:(BOOL)a3
{
  self->_networkAccessAllowed = a3;
}

- (BOOL)isNetworkAccessAllowed
{
  return self->_networkAccessAllowed;
}

- (void)setDeliveryMode:(int64_t)a3
{
  self->_deliveryMode = a3;
}

- (int64_t)deliveryMode
{
  return self->_deliveryMode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  [v4 setDeliveryMode:self->_deliveryMode];
  [v4 setNetworkAccessAllowed:self->_networkAccessAllowed];
  [v4 setDownloadPriority:self->_downloadPriority];
  [v4 setDownloadIntent:self->_downloadIntent];
  objc_msgSend(v4, "setPreferHDR:", -[PXLivePhotoRequestOptions preferHDR](self, "preferHDR"));
  [v4 setProgressHandler:self->_progressHandler];
  return v4;
}

@end