@interface _NTKCollectionClientProxy
- (_NTKCollectionClientProxy)initWithWeakProxy:(id)a3;
- (void)addFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqId:(id)a5;
- (void)flushCompleteForIdentifier:(id)a3;
- (void)loadFullCollectionWithOrderedUUIDs:(id)a3 selectedUUID:(id)a4 facesDescriptorsByUUID:(id)a5 seqId:(id)a6 completion:(id)a7;
- (void)removeFaceForUUID:(id)a3 seqId:(id)a4 completion:(id)a5;
- (void)resetClientCollectionWithCompletion:(id)a3;
- (void)updateFaceForUUID:(id)a3 withConfigurationJSONRepresentation:(id)a4 seqId:(id)a5;
- (void)updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4 seqId:(id)a5 completion:(id)a6;
- (void)updateOrderedFaceUUIDs:(id)a3 seqId:(id)a4;
- (void)updateSelectedFaceUUID:(id)a3 seqId:(id)a4;
- (void)upgradeFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqID:(id)a5;
@end

@implementation _NTKCollectionClientProxy

- (_NTKCollectionClientProxy)initWithWeakProxy:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_NTKCollectionClientProxy;
  v5 = [(_NTKCollectionClientProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_proxy, v4);
  }

  return v6;
}

- (void)loadFullCollectionWithOrderedUUIDs:(id)a3 selectedUUID:(id)a4 facesDescriptorsByUUID:(id)a5 seqId:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = (void (**)(void))a7;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__14;
  v27 = __Block_byref_object_dispose__14;
  p_proxy = &self->_proxy;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  if (v24[5])
  {
    id v18 = objc_loadWeakRetained((id *)p_proxy);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __117___NTKCollectionClientProxy_loadFullCollectionWithOrderedUUIDs_selectedUUID_facesDescriptorsByUUID_seqId_completion___block_invoke;
    v20[3] = &unk_1E62C3280;
    v21 = v16;
    v22 = &v23;
    [v18 loadFullCollectionWithOrderedUUIDs:v12 selectedUUID:v13 facesDescriptorsByUUID:v14 seqId:v15 completion:v20];
  }
  else
  {
    v19 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[_NTKCollectionClientProxy loadFullCollectionWithOrderedUUIDs:selectedUUID:facesDescriptorsByUUID:seqId:completion:]();
    }

    if (v16) {
      v16[2](v16);
    }
  }
  _Block_object_dispose(&v23, 8);
}

- (void)updateSelectedFaceUUID:(id)a3 seqId:(id)a4
{
  p_proxy = &self->_proxy;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  [WeakRetained updateSelectedFaceUUID:v7 seqId:v6];
}

- (void)updateOrderedFaceUUIDs:(id)a3 seqId:(id)a4
{
  p_proxy = &self->_proxy;
  id v6 = a4;
  id v7 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  [WeakRetained updateOrderedFaceUUIDs:v7 seqId:v6];
}

- (void)updateFaceForUUID:(id)a3 withConfigurationJSONRepresentation:(id)a4 seqId:(id)a5
{
  p_proxy = &self->_proxy;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  [WeakRetained updateFaceForUUID:v10 withConfigurationJSONRepresentation:v9 seqId:v8];
}

- (void)updateFaceForUUID:(id)a3 withResourceDirectory:(id)a4 seqId:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(void))a6;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__14;
  uint64_t v23 = __Block_byref_object_dispose__14;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);
  id v14 = (void *)v20[5];
  if (v14)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __86___NTKCollectionClientProxy_updateFaceForUUID_withResourceDirectory_seqId_completion___block_invoke;
    v16[3] = &unk_1E62C3280;
    v17 = v13;
    id v18 = &v19;
    [v14 updateFaceForUUID:v10 withResourceDirectory:v11 seqId:v12 completion:v16];
  }
  else
  {
    id v15 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[_NTKCollectionClientProxy updateFaceForUUID:withResourceDirectory:seqId:completion:]();
    }

    if (v13) {
      v13[2](v13);
    }
  }
  _Block_object_dispose(&v19, 8);
}

- (void)removeFaceForUUID:(id)a3 seqId:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__14;
  uint64_t v21 = __Block_byref_object_dispose__14;
  p_proxy = &self->_proxy;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  if (v18[5])
  {
    id v12 = objc_loadWeakRetained((id *)p_proxy);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64___NTKCollectionClientProxy_removeFaceForUUID_seqId_completion___block_invoke;
    v14[3] = &unk_1E62C3280;
    id v15 = v10;
    v16 = &v17;
    [v12 removeFaceForUUID:v8 seqId:v9 completion:v14];
  }
  else
  {
    id v13 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_NTKCollectionClientProxy removeFaceForUUID:seqId:completion:]();
    }

    if (v10) {
      v10[2](v10);
    }
  }
  _Block_object_dispose(&v17, 8);
}

- (void)resetClientCollectionWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__14;
  id v15 = __Block_byref_object_dispose__14;
  p_proxy = &self->_proxy;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  if (v12[5])
  {
    id v6 = objc_loadWeakRetained((id *)p_proxy);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __65___NTKCollectionClientProxy_resetClientCollectionWithCompletion___block_invoke;
    v8[3] = &unk_1E62C3280;
    id v9 = v4;
    id v10 = &v11;
    [v6 resetClientCollectionWithCompletion:v8];
  }
  else
  {
    id v7 = _NTKLoggingObjectForDomain(10, (uint64_t)"NTKLoggingDomainCollection");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_NTKCollectionClientProxy resetClientCollectionWithCompletion:]();
    }

    if (v4) {
      v4[2](v4);
    }
  }
  _Block_object_dispose(&v11, 8);
}

- (void)flushCompleteForIdentifier:(id)a3
{
  p_proxy = &self->_proxy;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  [WeakRetained flushCompleteForIdentifier:v4];
}

- (void)addFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqId:(id)a5
{
  p_proxy = &self->_proxy;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  [WeakRetained addFaceInstanceDescriptor:v10 forUUID:v9 seqId:v8];
}

- (void)upgradeFaceInstanceDescriptor:(id)a3 forUUID:(id)a4 seqID:(id)a5
{
  p_proxy = &self->_proxy;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  [WeakRetained upgradeFaceInstanceDescriptor:v10 forUUID:v9 seqID:v8];
}

- (void).cxx_destruct
{
}

- (void)loadFullCollectionWithOrderedUUIDs:selectedUUID:facesDescriptorsByUUID:seqId:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "Proxy is nil - cannot load collection", v2, v3, v4, v5, v6);
}

- (void)updateFaceForUUID:withResourceDirectory:seqId:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "Proxy is nil - cannot update face for UUID", v2, v3, v4, v5, v6);
}

- (void)removeFaceForUUID:seqId:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "Proxy is nil - cannot remove face for UUID", v2, v3, v4, v5, v6);
}

- (void)resetClientCollectionWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_4(&dword_1BC5A9000, v0, v1, "Proxy is nil - cannot reset client collection", v2, v3, v4, v5, v6);
}

@end