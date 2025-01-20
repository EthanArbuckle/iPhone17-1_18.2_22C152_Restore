@interface PKServicePaymentTransactionImageGenerator
- (PKServicePaymentTransactionImageGenerator)init;
- (PKServicePaymentTransactionImageGenerator)initWithPassKitServicesXPCService:(id)a3;
- (id)cachedImageDataForKey:(id)a3;
- (unint64_t)_nextIndexToUseAndEvictIfNeeded;
- (void)_cleanMappedFile:(id)a3;
- (void)_updateNextKeyToEvict;
- (void)dealloc;
- (void)imageDataForTransaction:(id)a3 size:(CGSize)a4 completion:(id)a5;
- (void)setCachedImageData:(id)a3 forKey:(id)a4;
@end

@implementation PKServicePaymentTransactionImageGenerator

- (PKServicePaymentTransactionImageGenerator)initWithPassKitServicesXPCService:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKServicePaymentTransactionImageGenerator;
  v6 = [(PKServicePaymentTransactionImageGenerator *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_xpcService, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mappedFilesIndices = v7->_mappedFilesIndices;
    v7->_mappedFilesIndices = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    keysHitCounts = v7->_keysHitCounts;
    v7->_keysHitCounts = v10;
  }
  return v7;
}

- (PKServicePaymentTransactionImageGenerator)init
{
  return 0;
}

- (void)dealloc
{
  mappedFilesIndices = self->_mappedFilesIndices;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__PKServicePaymentTransactionImageGenerator_dealloc__block_invoke;
  v5[3] = &unk_264770440;
  v5[4] = self;
  [(NSMutableDictionary *)mappedFilesIndices enumerateKeysAndObjectsUsingBlock:v5];
  v4.receiver = self;
  v4.super_class = (Class)PKServicePaymentTransactionImageGenerator;
  [(PKServicePaymentTransactionImageGenerator *)&v4 dealloc];
}

uint64_t __52__PKServicePaymentTransactionImageGenerator_dealloc__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 unsignedIntegerValue];
  if (result != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = *(void *)(a1 + 32) + 16 * result;
    uint64_t v6 = *(void *)(v5 + 32);
    uint64_t v7 = *(void *)(v5 + 40);
    v8 = *(void **)(a1 + 32);
    return objc_msgSend(v8, "_cleanMappedFile:", v6, v7);
  }
  return result;
}

- (id)cachedImageDataForKey:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = [(NSMutableDictionary *)self->_mappedFilesIndices objectForKey:v4];
  uint64_t v7 = v6;
  if (!v6)
  {
    v9 = 0;
    goto LABEL_14;
  }
  uint64_t v8 = [v6 unsignedIntegerValue];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0;
  }
  else
  {
    v10 = (char *)self + 16 * v8;
    v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:*((void *)v10 + 4) length:*((void *)v10 + 5)];
    v11 = self->_nextKeyToEvict;
    v12 = (NSString *)v4;
    objc_super v13 = v12;
    if (v11 == v12)
    {
    }
    else
    {
      if (!v12 || !v11)
      {

        goto LABEL_13;
      }
      BOOL v14 = [(NSString *)v11 isEqualToString:v12];

      if (!v14) {
        goto LABEL_13;
      }
    }
    [(PKServicePaymentTransactionImageGenerator *)self _updateNextKeyToEvict];
  }
LABEL_13:
  v15 = [(NSMutableDictionary *)self->_keysHitCounts objectForKey:v4];
  keysHitCounts = self->_keysHitCounts;
  v17 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v15, "unsignedIntegerValue") + 1);
  [(NSMutableDictionary *)keysHitCounts setObject:v17 forKey:v4];

LABEL_14:
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)setCachedImageData:(id)a3 forKey:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  if (v6)
  {
    size_t v9 = v8;
    if (v8)
    {
      p_lock = &self->_lock;
      os_unfair_lock_lock(&self->_lock);
      v11 = PKTemporaryItemURLWithExtension();
      v12 = [v11 URLByStandardizingPath];

      if (!self->_hasSetupTempDir)
      {
        PKTemporaryItemPrepareDirectory();
        self->_hasSetupTempDir = 1;
      }
      [v6 writeToURL:v12 atomically:1];
      id v13 = v12;
      BOOL v14 = (const char *)[v13 fileSystemRepresentation];
      int v15 = open(v14, 6, 384);
      if (v15 < 0)
      {
        v24 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v7;
          _os_log_impl(&dword_225C6C000, v24, OS_LOG_TYPE_DEFAULT, "Failed to open file for %@", buf, 0xCu);
        }
      }
      else
      {
        int v16 = v15;
        v17 = mmap(0, v9, 1, 2, v15, 0);
        if (v17 == (void *)-1)
        {
          v25 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v27 = v7;
            _os_log_impl(&dword_225C6C000, v25, OS_LOG_TYPE_DEFAULT, "Failed to mmap %@", buf, 0xCu);
          }
        }
        else
        {
          v18 = v17;
          unint64_t v19 = [(PKServicePaymentTransactionImageGenerator *)self _nextIndexToUseAndEvictIfNeeded];
          v20 = (char *)self + 16 * v19;
          *((void *)v20 + 4) = v18;
          *((void *)v20 + 5) = v9;
          v21 = [(NSMutableDictionary *)self->_keysHitCounts objectForKey:v7];
          if (!v21) {
            [(NSMutableDictionary *)self->_keysHitCounts setObject:&unk_26D968540 forKey:v7];
          }
          mappedFilesIndices = self->_mappedFilesIndices;
          v23 = [NSNumber numberWithUnsignedInteger:v19];
          [(NSMutableDictionary *)mappedFilesIndices setObject:v23 forKey:v7];

          if (!self->_nextKeyToEvict || self->_evictionHitCount)
          {
            self->_evictionHitCount = 0;
            objc_storeStrong((id *)&self->_nextKeyToEvict, a4);
          }

          p_lock = &self->_lock;
        }
        close(v16);
      }
      unlink(v14);
      os_unfair_lock_unlock(p_lock);
    }
  }
}

- (unint64_t)_nextIndexToUseAndEvictIfNeeded
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if ((unint64_t)[(NSMutableDictionary *)self->_mappedFilesIndices count] < 0x32)
  {
    mappedFilesIndices = self->_mappedFilesIndices;
    return [(NSMutableDictionary *)mappedFilesIndices count];
  }
  else
  {
    if (!self->_nextKeyToEvict) {
      return 0;
    }
    v3 = -[NSMutableDictionary objectForKey:](self->_mappedFilesIndices, "objectForKey:");
    unint64_t v4 = [v3 unsignedIntegerValue];

    uint64_t v5 = [(NSMutableDictionary *)self->_keysHitCounts objectForKey:self->_nextKeyToEvict];
    id v6 = (char *)self + 16 * v4;
    uint64_t v7 = *((void *)v6 + 4);
    uint64_t v8 = *((void *)v6 + 5);
    size_t v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      nextKeyToEvict = self->_nextKeyToEvict;
      int v13 = 138412546;
      BOOL v14 = nextKeyToEvict;
      __int16 v15 = 2048;
      uint64_t v16 = [v5 unsignedIntegerValue];
      _os_log_impl(&dword_225C6C000, v9, OS_LOG_TYPE_DEFAULT, "Evicting %@ from cache with hit count %lu", (uint8_t *)&v13, 0x16u);
    }

    -[PKServicePaymentTransactionImageGenerator _cleanMappedFile:](self, "_cleanMappedFile:", v7, v8);
    [(NSMutableDictionary *)self->_mappedFilesIndices setObject:&unk_26D968558 forKey:self->_nextKeyToEvict];
    [(PKServicePaymentTransactionImageGenerator *)self _updateNextKeyToEvict];

    return v4;
  }
}

- (void)_updateNextKeyToEvict
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy_;
  size_t v9 = __Block_byref_object_dispose_;
  id v10 = 0;
  mappedFilesIndices = self->_mappedFilesIndices;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__PKServicePaymentTransactionImageGenerator__updateNextKeyToEvict__block_invoke;
  v4[3] = &unk_264770468;
  v4[4] = self;
  v4[5] = &v11;
  v4[6] = &v5;
  [(NSMutableDictionary *)mappedFilesIndices enumerateKeysAndObjectsUsingBlock:v4];
  objc_storeStrong((id *)&self->_nextKeyToEvict, (id)v6[5]);
  self->_evictionHitCount = v12[3];
  _Block_object_dispose(&v5, 8);

  _Block_object_dispose(&v11, 8);
}

void __66__PKServicePaymentTransactionImageGenerator__updateNextKeyToEvict__block_invoke(void *a1, void *a2, void *a3, unsigned char *a4)
{
  id v11 = a2;
  if ([a3 unsignedIntegerValue] != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [*(id *)(a1[4] + 24) objectForKey:v11];
    unint64_t v9 = [v8 unsignedIntegerValue];

    uint64_t v10 = *(void *)(a1[5] + 8);
    if (v9 <= *(void *)(a1[4] + 840))
    {
      *(void *)(v10 + 24) = v9;
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
      *a4 = 1;
    }
    else if (*(void *)(v10 + 24) - 1 >= v9)
    {
      *(void *)(v10 + 24) = v9;
      objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
    }
  }
}

- (void)_cleanMappedFile:(id)a3
{
}

- (void)imageDataForTransaction:(id)a3 size:(CGSize)a4 completion:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v9 = a3;
  id v10 = a5;
  if (v10)
  {
    id v11 = [v9 merchant];
    v12 = [v11 logoImageURL];
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x3032000000;
    v45[3] = __Block_byref_object_copy_;
    v45[4] = __Block_byref_object_dispose_;
    id v46 = 0;
    v43[0] = 0;
    v43[1] = v43;
    v43[2] = 0x3032000000;
    v43[3] = __Block_byref_object_copy_;
    v43[4] = __Block_byref_object_dispose_;
    id v44 = 0;
    id v13 = objc_alloc_init(MEMORY[0x263F5BD90]);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke;
    v36[3] = &unk_2647704E0;
    id v14 = v12;
    CGFloat v41 = width;
    CGFloat v42 = height;
    id v37 = v14;
    v38 = self;
    v39 = v43;
    v40 = v45;
    [v13 addOperation:v36];
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_4;
    v28[3] = &unk_264770508;
    id v15 = v9;
    id v29 = v15;
    v32 = v43;
    id v16 = v11;
    CGFloat v34 = width;
    CGFloat v35 = height;
    v33 = v45;
    id v30 = v16;
    v31 = self;
    [v13 addOperation:v28];
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_5;
    v22[3] = &unk_264770558;
    v22[4] = self;
    CGFloat v26 = width;
    CGFloat v27 = height;
    id v23 = v15;
    v24 = v43;
    v25 = v45;
    [v13 addOperation:v22];
    uint64_t v17 = [MEMORY[0x263EFF9D0] null];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_7;
    v19[3] = &unk_264770580;
    id v20 = v10;
    v21 = v45;
    id v18 = (id)[v13 evaluateWithInput:v17 completion:v19];

    _Block_object_dispose(v43, 8);
    _Block_object_dispose(v45, 8);
  }
}

void __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  uint64_t v7 = a4;
  uint64_t v8 = *(void **)(a1 + 32);
  if (v8)
  {
    id v9 = [v8 absoluteString];
    id v10 = NSString;
    id v11 = [NSString stringWithFormat:@"%.2f-%.2f", *(void *)(a1 + 64), *(void *)(a1 + 72)];
    uint64_t v12 = [v10 stringWithFormat:@"%@-%@", v9, v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    id v15 = [*(id *)(a1 + 40) cachedImageDataForKey:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    if (v15)
    {
      id v16 = v15;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), v15);
      v7[2](v7, v6, 1);
    }
    else
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_2;
      v29[3] = &unk_264770490;
      long long v17 = *(_OWORD *)(a1 + 64);
      long long v30 = *(_OWORD *)(a1 + 40);
      long long v31 = v17;
      id v18 = (void (**)(void, void))MEMORY[0x22A63D180](v29);
      unint64_t v19 = [MEMORY[0x263F5BF40] sharedImageAssetDownloader];
      id v16 = [v19 cachedDataForURL:*(void *)(a1 + 32)];
      if (v16)
      {
        uint64_t v20 = ((void (**)(void, void *))v18)[2](v18, v16);
        uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
        v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;

        v7[2](v7, v6, 1);
      }
      else
      {
        uint64_t v23 = *(void *)(a1 + 32);
        v24[0] = MEMORY[0x263EF8330];
        v24[1] = 3221225472;
        v24[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_3;
        v24[3] = &unk_2647704B8;
        uint64_t v28 = *(void *)(a1 + 56);
        CGFloat v26 = v18;
        CGFloat v27 = v7;
        id v25 = v6;
        [v19 downloadFromUrl:v23 completionHandler:v24];
      }
    }
  }
  else
  {
    v7[2](v7, v6, 0);
  }
}

id __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  unint64_t v4 = (void *)MEMORY[0x22A63D030]();
  id v5 = objc_alloc(MEMORY[0x263F5BED8]);
  PKScreenScale();
  id v6 = objc_msgSend(v5, "initWithData:scale:", v3);
  uint64_t v7 = objc_msgSend(MEMORY[0x263F5BEE0], "constraintsWithMaxSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  uint64_t v8 = [v6 resizedImageWithConstraints:v7];

  id v9 = [v8 imageData];
  if (v9) {
    [*(id *)(a1 + 32) setCachedImageData:v3 forKey:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }

  return v9;
}

uint64_t __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a2 || a4)
  {
    uint64_t v8 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  else
  {
    uint64_t v5 = (*(void (**)(void))(a1[5] + 16))();
    uint64_t v6 = *(void *)(a1[7] + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(uint64_t (**)(void))(a1[6] + 16);
  }
  return v8();
}

void __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v20 = a3;
  uint64_t v6 = a4;
  uint64_t v7 = [MEMORY[0x263F5C108] iconTypeForTransaction:*(void *)(a1 + 32) ignoreLogoURL:1];
  if (v7)
  {
    if (v7 == 1)
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(*(id *)(a1 + 32), "transitType"));
    }
    else
    {
      if (v7 != 2) {
        goto LABEL_8;
      }
      uint64_t v8 = [MEMORY[0x263F5C108] staticIconNameForTransaction:*(void *)(a1 + 32)];
    }
  }
  else
  {
    uint64_t v8 = [*(id *)(a1 + 40) uniqueIdentifier];
  }
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

LABEL_8:
  id v11 = NSString;
  uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v13 = [NSString stringWithFormat:@"%.2f-%.2f", *(void *)(a1 + 72), *(void *)(a1 + 80)];
  uint64_t v14 = [v11 stringWithFormat:@"%@-%@", v12, v13];
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v17 = objc_msgSend(*(id *)(a1 + 48), "cachedImageDataForKey:");
    uint64_t v18 = *(void *)(*(void *)(a1 + 64) + 8);
    unint64_t v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  v6[2](v6, v20);
}

void __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  id v10 = *(void **)(v8 + 8);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_6;
  v15[3] = &unk_264770530;
  long long v18 = *(_OWORD *)(a1 + 48);
  id v16 = v6;
  id v17 = v7;
  v15[4] = v8;
  double v11 = *(double *)(a1 + 64);
  double v12 = *(double *)(a1 + 72);
  id v13 = v6;
  id v14 = v7;
  objc_msgSend(v10, "imageDataForTransaction:size:completion:", v9, v15, v11, v12);
}

void __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3 && *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)) {
    objc_msgSend(*(id *)(a1 + 32), "setCachedImageData:forKey:", v3);
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  id v6 = v3;

  (*(void (**)(void, void, BOOL))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) != 0);
}

uint64_t __85__PKServicePaymentTransactionImageGenerator_imageDataForTransaction_size_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextKeyToEvict, 0);
  objc_storeStrong((id *)&self->_keysHitCounts, 0);
  objc_storeStrong((id *)&self->_mappedFilesIndices, 0);
  objc_storeStrong((id *)&self->_xpcService, 0);
}

@end