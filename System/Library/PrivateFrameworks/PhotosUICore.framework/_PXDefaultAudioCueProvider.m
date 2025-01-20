@interface _PXDefaultAudioCueProvider
- (_PXDefaultAudioCueProvider)init;
- (id)_cueProviderForCatalog:(int64_t)a3;
- (id)requestCuesForAudioAsset:(id)a3 resultHandler:(id)a4;
@end

@implementation _PXDefaultAudioCueProvider

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_providersByCatalog, 0);
}

- (id)_cueProviderForCatalog:(int64_t)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__215542;
  v11 = __Block_byref_object_dispose__215543;
  id v12 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53___PXDefaultAudioCueProvider__cueProviderForCatalog___block_invoke;
  block[3] = &unk_1E5DCDEC8;
  block[4] = self;
  block[5] = &v7;
  block[6] = a3;
  dispatch_sync(stateQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)requestCuesForAudioAsset:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = -[_PXDefaultAudioCueProvider _cueProviderForCatalog:](self, "_cueProviderForCatalog:", [v7 catalog]);
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer((os_log_t)self->_log, v8);
  v10 = self->_log;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "requestAudioCues", "", buf, 2u);
  }

  id v12 = self->_log;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69___PXDefaultAudioCueProvider_requestCuesForAudioAsset_resultHandler___block_invoke;
  v17[3] = &unk_1E5DC5F08;
  id v19 = v6;
  os_signpost_id_t v20 = v9;
  v18 = v12;
  id v13 = v6;
  v14 = v12;
  v15 = [v8 requestCuesForAudioAsset:v7 resultHandler:v17];

  return v15;
}

- (_PXDefaultAudioCueProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)_PXDefaultAudioCueProvider;
  v2 = [(_PXDefaultAudioCueProvider *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    providersByCatalog = v2->_providersByCatalog;
    v2->_providersByCatalog = v3;

    px_dispatch_queue_create_serial();
  }
  return 0;
}

@end