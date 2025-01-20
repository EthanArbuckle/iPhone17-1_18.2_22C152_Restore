@interface TLToneStoreDownload
- (BOOL)isEqual:(id)a3;
- (BOOL)isRingtone;
- (NSString)albumTitle;
- (NSString)artistName;
- (NSString)genreName;
- (NSString)identifier;
- (NSString)name;
- (NSString)toneIdentifier;
- (TLToneStoreDownload)init;
- (double)duration;
- (float)downloadProgress;
- (id)description;
- (unint64_t)hash;
- (unint64_t)storeItemIdentifier;
- (void)_setAlbumTitle:(id)a3;
- (void)_setArtistName:(id)a3;
- (void)_setDownloadProgress:(float)a3;
- (void)_setDuration:(double)a3;
- (void)_setGenreName:(id)a3;
- (void)_setName:(id)a3;
- (void)_setRingtone:(BOOL)a3;
- (void)_setStoreItemIdentifier:(unint64_t)a3;
- (void)_setToneIdentifier:(id)a3;
- (void)dealloc;
@end

@implementation TLToneStoreDownload

- (TLToneStoreDownload)init
{
  v19.receiver = self;
  v19.super_class = (Class)TLToneStoreDownload;
  v2 = [(TLToneStoreDownload *)&v19 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    v4 = NSString;
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:v3];
    v6 = [v5 bundleIdentifier];
    v7 = NSStringFromClass(v3);
    v8 = [MEMORY[0x1E4F29128] UUID];
    v9 = [v8 UUIDString];
    uint64_t v10 = [v4 stringWithFormat:@"%@.%@-%@-%@", v6, v7, @"AccessQueue", v9];
    accessQueueLabel = v2->_accessQueueLabel;
    v2->_accessQueueLabel = (NSString *)v10;

    dispatch_queue_t v12 = dispatch_queue_create([(NSString *)v2->_accessQueueLabel UTF8String], 0);
    accessQueue = v2->_accessQueue;
    v2->_accessQueue = (OS_dispatch_queue *)v12;

    v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v14 UUIDString];
    uint64_t v16 = [@"toneStoreDownload:" stringByAppendingString:v15];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v16;
  }
  return v2;
}

- (void)dealloc
{
  accessQueue = self->_accessQueue;
  self->_accessQueue = 0;
  v4 = accessQueue;

  dispatch_sync(v4, &__block_literal_global_5);
  v5.receiver = self;
  v5.super_class = (Class)TLToneStoreDownload;
  [(TLToneStoreDownload *)&v5 dealloc];
}

- (NSString)name
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__TLToneStoreDownload_name__block_invoke;
  v5[3] = &unk_1E6C20D10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __27__TLToneStoreDownload_name__block_invoke(uint64_t a1)
{
}

- (void)_setName:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__TLToneStoreDownload__setName___block_invoke;
  v7[3] = &unk_1E6C20CC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

void __32__TLToneStoreDownload__setName___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  unint64_t v7 = (unint64_t)*(id *)(*(void *)(a1 + 32) + 24);
  unint64_t v3 = v2;
  id v4 = (void *)v3;
  if (v7 | v3)
  {
    if (v7) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {

LABEL_12:
      *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) copy];
      goto LABEL_13;
    }
    if (v7 != v3)
    {
      char v6 = [(id)v7 isEqualToString:v3];

      if (v6) {
        return;
      }
      goto LABEL_12;
    }
  }

LABEL_13:

  MEMORY[0x1F41817F8]();
}

- (NSString)albumTitle
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__TLToneStoreDownload_albumTitle__block_invoke;
  v5[3] = &unk_1E6C20D10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __33__TLToneStoreDownload_albumTitle__block_invoke(uint64_t a1)
{
}

- (void)_setAlbumTitle:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__TLToneStoreDownload__setAlbumTitle___block_invoke;
  v7[3] = &unk_1E6C20CC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

void __38__TLToneStoreDownload__setAlbumTitle___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  unint64_t v7 = (unint64_t)*(id *)(*(void *)(a1 + 32) + 32);
  unint64_t v3 = v2;
  id v4 = (void *)v3;
  if (v7 | v3)
  {
    if (v7) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {

LABEL_12:
      *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) copy];
      goto LABEL_13;
    }
    if (v7 != v3)
    {
      char v6 = [(id)v7 isEqualToString:v3];

      if (v6) {
        return;
      }
      goto LABEL_12;
    }
  }

LABEL_13:

  MEMORY[0x1F41817F8]();
}

- (NSString)artistName
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__TLToneStoreDownload_artistName__block_invoke;
  v5[3] = &unk_1E6C20D10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __33__TLToneStoreDownload_artistName__block_invoke(uint64_t a1)
{
}

- (void)_setArtistName:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__TLToneStoreDownload__setArtistName___block_invoke;
  v7[3] = &unk_1E6C20CC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

void __38__TLToneStoreDownload__setArtistName___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 40);
  unint64_t v7 = (unint64_t)*(id *)(*(void *)(a1 + 32) + 40);
  unint64_t v3 = v2;
  id v4 = (void *)v3;
  if (v7 | v3)
  {
    if (v7) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {

LABEL_12:
      *(void *)(*(void *)(a1 + 32) + 40) = [*(id *)(a1 + 40) copy];
      goto LABEL_13;
    }
    if (v7 != v3)
    {
      char v6 = [(id)v7 isEqualToString:v3];

      if (v6) {
        return;
      }
      goto LABEL_12;
    }
  }

LABEL_13:

  MEMORY[0x1F41817F8]();
}

- (double)duration
{
  uint64_t v6 = 0;
  unint64_t v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __31__TLToneStoreDownload_duration__block_invoke;
  v5[3] = &unk_1E6C20D10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __31__TLToneStoreDownload_duration__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 48);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setDuration:(double)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__TLToneStoreDownload__setDuration___block_invoke;
  v4[3] = &unk_1E6C21058;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __36__TLToneStoreDownload__setDuration___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  double v2 = *(double *)(result + 40);
  if (llround(*(double *)(v1 + 48) * 8388608.0) != llround(v2 * 8388608.0)) {
    *(double *)(v1 + 48) = v2;
  }
  return result;
}

- (NSString)genreName
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __32__TLToneStoreDownload_genreName__block_invoke;
  v5[3] = &unk_1E6C20D10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __32__TLToneStoreDownload_genreName__block_invoke(uint64_t a1)
{
}

- (void)_setGenreName:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__TLToneStoreDownload__setGenreName___block_invoke;
  v7[3] = &unk_1E6C20CC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

void __37__TLToneStoreDownload__setGenreName___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 40);
  unint64_t v7 = (unint64_t)*(id *)(*(void *)(a1 + 32) + 56);
  unint64_t v3 = v2;
  id v4 = (void *)v3;
  if (v7 | v3)
  {
    if (v7) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {

LABEL_12:
      *(void *)(*(void *)(a1 + 32) + 56) = [*(id *)(a1 + 40) copy];
      goto LABEL_13;
    }
    if (v7 != v3)
    {
      char v6 = [(id)v7 isEqualToString:v3];

      if (v6) {
        return;
      }
      goto LABEL_12;
    }
  }

LABEL_13:

  MEMORY[0x1F41817F8]();
}

- (BOOL)isRingtone
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__TLToneStoreDownload_isRingtone__block_invoke;
  v5[3] = &unk_1E6C20D10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__TLToneStoreDownload_isRingtone__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 64);
  return result;
}

- (void)_setRingtone:(BOOL)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__TLToneStoreDownload__setRingtone___block_invoke;
  v4[3] = &unk_1E6C210A0;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __36__TLToneStoreDownload__setRingtone___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if ((*(unsigned char *)(v1 + 64) == 0) == (*(unsigned char *)(result + 40) != 0)) {
    *(unsigned char *)(v1 + 64) = *(unsigned char *)(result + 40);
  }
  return result;
}

- (unint64_t)storeItemIdentifier
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__TLToneStoreDownload_storeItemIdentifier__block_invoke;
  v5[3] = &unk_1E6C20D10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __42__TLToneStoreDownload_storeItemIdentifier__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 72);
  return result;
}

- (void)_setStoreItemIdentifier:(unint64_t)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__TLToneStoreDownload__setStoreItemIdentifier___block_invoke;
  v4[3] = &unk_1E6C21058;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __47__TLToneStoreDownload__setStoreItemIdentifier___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  uint64_t v2 = *(void *)(result + 40);
  if (*(void *)(v1 + 72) != v2) {
    *(void *)(v1 + 72) = v2;
  }
  return result;
}

- (float)downloadProgress
{
  uint64_t v6 = 0;
  unint64_t v7 = (float *)&v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__TLToneStoreDownload_downloadProgress__block_invoke;
  v5[3] = &unk_1E6C20D10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  float v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __39__TLToneStoreDownload_downloadProgress__block_invoke(uint64_t a1)
{
  float result = *(float *)(*(void *)(a1 + 32) + 80);
  *(float *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_setDownloadProgress:(float)a3
{
  accessQueue = self->_accessQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__TLToneStoreDownload__setDownloadProgress___block_invoke;
  v4[3] = &unk_1E6C21B98;
  v4[4] = self;
  float v5 = a3;
  dispatch_sync(accessQueue, v4);
}

uint64_t __44__TLToneStoreDownload__setDownloadProgress___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  float v2 = *(float *)(result + 40);
  if (llroundf(*(float *)(v1 + 80) * 8388600.0) != llroundf(v2 * 8388600.0)) {
    *(float *)(v1 + 80) = v2;
  }
  return result;
}

- (NSString)toneIdentifier
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  int v9 = __Block_byref_object_copy__4;
  uint64_t v10 = __Block_byref_object_dispose__4;
  id v11 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__TLToneStoreDownload_toneIdentifier__block_invoke;
  v5[3] = &unk_1E6C20D10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __37__TLToneStoreDownload_toneIdentifier__block_invoke(uint64_t a1)
{
}

- (void)_setToneIdentifier:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__TLToneStoreDownload__setToneIdentifier___block_invoke;
  v7[3] = &unk_1E6C20CC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

void __42__TLToneStoreDownload__setToneIdentifier___block_invoke(uint64_t a1)
{
  float v2 = *(void **)(a1 + 40);
  unint64_t v7 = (unint64_t)*(id *)(*(void *)(a1 + 32) + 88);
  unint64_t v3 = v2;
  id v4 = (void *)v3;
  if (v7 | v3)
  {
    if (v7) {
      BOOL v5 = v3 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {

LABEL_12:
      *(void *)(*(void *)(a1 + 32) + 88) = [*(id *)(a1 + 40) copy];
      goto LABEL_13;
    }
    if (v7 != v3)
    {
      char v6 = [(id)v7 isEqualToString:v3];

      if (v6) {
        return;
      }
      goto LABEL_12;
    }
  }

LABEL_13:

  MEMORY[0x1F41817F8]();
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  char v6 = (void *)[v3 initWithFormat:@"<%@: %p", v5, self];

  accessQueue = self->_accessQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__TLToneStoreDownload_description__block_invoke;
  block[3] = &unk_1E6C20CC0;
  id v8 = v6;
  id v12 = v8;
  v13 = self;
  dispatch_sync(accessQueue, block);
  [v8 appendString:@">"];
  id v9 = v8;

  return v9;
}

uint64_t __34__TLToneStoreDownload_description__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"; storeItemIdentifier = %llu",
    *(void *)(*(void *)(a1 + 40) + 72));
  uint64_t v2 = *(void *)(a1 + 40);
  if (*(void *)(v2 + 24))
  {
    [*(id *)(a1 + 32) appendFormat:@"; name = \"%@\"", *(void *)(v2 + 24)];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (*(void *)(v2 + 32))
  {
    [*(id *)(a1 + 32) appendFormat:@"; albumTitle = \"%@\"", *(void *)(v2 + 32)];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (*(void *)(v2 + 40))
  {
    [*(id *)(a1 + 32) appendFormat:@"; artistName = \"%@\"", *(void *)(v2 + 40)];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (*(void *)(v2 + 56))
  {
    [*(id *)(a1 + 32) appendFormat:@"; genreName = \"%@\"", *(void *)(v2 + 56)];
    uint64_t v2 = *(void *)(a1 + 40);
  }
  if (*(unsigned char *)(v2 + 64)) {
    id v3 = kToneMediaKindRingtone;
  }
  else {
    id v3 = kToneMediaKindAlertTone;
  }
  [*(id *)(a1 + 32) appendFormat:@"; mediaKind = %@", *v3];
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"; downloadProgress = %f",
             *(float *)(*(void *)(a1 + 40) + 80));
  if (*(void *)(*(void *)(a1 + 40) + 88)) {
    return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"; toneIdentifier = \"%@\"",
  }
             *(void *)(*(void *)(a1 + 40) + 88));
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (TLToneStoreDownload *)a3;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  BOOL v16 = self == v4;
  if (self != v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = v4;
      *((unsigned char *)v14 + 24) = 1;
      accessQueue = self->_accessQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__TLToneStoreDownload_isEqual___block_invoke;
      block[3] = &unk_1E6C21920;
      id v11 = self;
      id v12 = &v13;
      uint64_t v10 = v5;
      dispatch_sync(accessQueue, block);
    }
  }
  char v7 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __31__TLToneStoreDownload_isEqual___block_invoke(int8x16_t *a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  uint64_t v1 = a1[3].i64[0];
  int8x16_t v4 = a1[2];
  uint64_t v2 = *(NSObject **)(v4.i64[0] + 8);
  block[1] = 3221225472;
  block[2] = __31__TLToneStoreDownload_isEqual___block_invoke_2;
  block[3] = &unk_1E6C20D88;
  uint64_t v7 = v1;
  id v3 = (id)v4.i64[0];
  int8x16_t v6 = vextq_s8(v4, v4, 8uLL);
  dispatch_sync(v2, block);
}

void __31__TLToneStoreDownload_isEqual___block_invoke_2(void *a1)
{
  uint64_t v2 = *(void *)(a1[6] + 8);
  char v3 = *(unsigned char *)(v2 + 24);
  if (v3) {
    char v3 = *(void *)(a1[4] + 72) == *(void *)(a1[5] + 72);
  }
  *(unsigned char *)(v2 + 24) = v3;
  uint64_t v4 = *(void *)(a1[6] + 8);
  if (!*(unsigned char *)(v4 + 24))
  {
    char v10 = 0;
    goto LABEL_16;
  }
  BOOL v5 = *(void **)(a1[5] + 24);
  unint64_t v6 = (unint64_t)*(id *)(a1[4] + 24);
  unint64_t v7 = v5;
  id v8 = (void *)v7;
  if (!(v6 | v7)) {
    goto LABEL_14;
  }
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    if (v6 != v7)
    {
      char v10 = [(id)v6 isEqualToString:v7];
      goto LABEL_15;
    }
LABEL_14:
    char v10 = 1;
    goto LABEL_15;
  }
  char v10 = 0;
LABEL_15:

  uint64_t v4 = *(void *)(a1[6] + 8);
LABEL_16:
  *(unsigned char *)(v4 + 24) = v10;
  uint64_t v11 = *(void *)(a1[6] + 8);
  if (!*(unsigned char *)(v11 + 24))
  {
    char v17 = 0;
    goto LABEL_29;
  }
  id v12 = *(void **)(a1[5] + 32);
  unint64_t v13 = (unint64_t)*(id *)(a1[4] + 32);
  unint64_t v14 = v12;
  uint64_t v15 = (void *)v14;
  if (!(v13 | v14)) {
    goto LABEL_27;
  }
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    if (v13 != v14)
    {
      char v17 = [(id)v13 isEqualToString:v14];
      goto LABEL_28;
    }
LABEL_27:
    char v17 = 1;
    goto LABEL_28;
  }
  char v17 = 0;
LABEL_28:

  uint64_t v11 = *(void *)(a1[6] + 8);
LABEL_29:
  *(unsigned char *)(v11 + 24) = v17;
  uint64_t v18 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v18 + 24))
  {
    objc_super v19 = *(void **)(a1[5] + 40);
    unint64_t v20 = (unint64_t)*(id *)(a1[4] + 40);
    unint64_t v21 = v19;
    v22 = (void *)v21;
    if (!(v20 | v21)) {
      goto LABEL_36;
    }
    char v23 = 0;
    if (!v20 || !v21) {
      goto LABEL_37;
    }
    if (v20 == v21) {
LABEL_36:
    }
      char v23 = 1;
    else {
      char v23 = [(id)v20 isEqualToString:v21];
    }
LABEL_37:

    uint64_t v18 = *(void *)(a1[6] + 8);
    goto LABEL_38;
  }
  char v23 = 0;
LABEL_38:
  *(unsigned char *)(v18 + 24) = v23;
  uint64_t v24 = *(void *)(a1[6] + 8);
  char v25 = *(unsigned char *)(v24 + 24);
  if (v25) {
    char v25 = llround(*(double *)(a1[4] + 48)) == llround(*(double *)(a1[5] + 48));
  }
  *(unsigned char *)(v24 + 24) = v25;
  uint64_t v26 = *(void *)(a1[6] + 8);
  if (!*(unsigned char *)(v26 + 24))
  {
    char v31 = 0;
    goto LABEL_49;
  }
  v27 = *(void **)(a1[5] + 56);
  unint64_t v28 = (unint64_t)*(id *)(a1[4] + 56);
  unint64_t v29 = v27;
  v30 = (void *)v29;
  if (!(v28 | v29)) {
    goto LABEL_47;
  }
  char v31 = 0;
  if (!v28 || !v29) {
    goto LABEL_48;
  }
  if (v28 == v29) {
LABEL_47:
  }
    char v31 = 1;
  else {
    char v31 = [(id)v28 isEqualToString:v29];
  }
LABEL_48:

  uint64_t v26 = *(void *)(a1[6] + 8);
LABEL_49:
  *(unsigned char *)(v26 + 24) = v31;
  uint64_t v32 = *(void *)(a1[6] + 8);
  char v33 = *(unsigned char *)(v32 + 24);
  if (v33) {
    char v33 = (*(unsigned char *)(a1[4] + 64) == 0) ^ (*(unsigned char *)(a1[5] + 64) != 0);
  }
  *(unsigned char *)(v32 + 24) = v33;
  uint64_t v34 = *(void *)(a1[6] + 8);
  char v35 = *(unsigned char *)(v34 + 24);
  if (v35) {
    char v35 = llroundf(*(float *)(a1[4] + 80) / 0.01) == llroundf(*(float *)(a1[5] + 80) / 0.01);
  }
  *(unsigned char *)(v34 + 24) = v35;
  uint64_t v36 = *(void *)(a1[6] + 8);
  if (*(unsigned char *)(v36 + 24))
  {
    v37 = *(void **)(a1[5] + 88);
    unint64_t v38 = (unint64_t)*(id *)(a1[4] + 88);
    unint64_t v39 = v37;
    v40 = (void *)v39;
    if (!(v38 | v39)) {
      goto LABEL_60;
    }
    char v41 = 0;
    if (!v38 || !v39) {
      goto LABEL_61;
    }
    if (v38 == v39) {
LABEL_60:
    }
      char v41 = 1;
    else {
      char v41 = [(id)v38 isEqualToString:v39];
    }
LABEL_61:

    uint64_t v36 = *(void *)(a1[6] + 8);
    goto LABEL_62;
  }
  char v41 = 0;
LABEL_62:
  *(unsigned char *)(v36 + 24) = v41;
}

- (unint64_t)hash
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  accessQueue = self->_accessQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__TLToneStoreDownload_hash__block_invoke;
  v5[3] = &unk_1E6C20D10;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(accessQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __27__TLToneStoreDownload_hash__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^= *(void *)(*(void *)(a1 + 32) + 72);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^= [*(id *)(*(void *)(a1 + 32) + 24) hash];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^= [*(id *)(*(void *)(a1 + 32) + 32) hash];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^= [*(id *)(*(void *)(a1 + 32) + 40) hash];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^= llround(*(double *)(*(void *)(a1 + 32) + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^= [*(id *)(*(void *)(a1 + 32) + 56) hash];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^= *(unsigned __int8 *)(*(void *)(a1 + 32) + 64);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^= llroundf(*(float *)(*(void *)(a1 + 32) + 80) / 0.01);
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 88) hash];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) ^= result;
  return result;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_toneIdentifier, 0);
  objc_storeStrong((id *)&self->_genreName, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_albumTitle, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_accessQueueLabel, 0);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end