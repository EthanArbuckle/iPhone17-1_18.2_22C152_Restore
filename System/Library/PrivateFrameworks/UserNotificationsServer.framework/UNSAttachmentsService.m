@interface UNSAttachmentsService
+ (id)_attachmentURLsRemovedByReplaceUpdate:(id)a3;
+ (id)_notificationIdentifiersForNotificationRecords:(id)a3;
+ (id)_stagingDirectory;
- (UNSAttachmentsService)initWithAttachmentsRepository:(id)a3 notificationRepository:(id)a4 notificationSchedulingService:(id)a5 pendingNotificationRepository:(id)a6;
- (id)_queue_resolveAttachmentsForRequest:(id)a3 bundleIdentifier:(id)a4 fromLocalClientConnection:(id)a5 orFromServiceExtensionOfBundleProxy:(id)a6 continueOnFailure:(BOOL)a7 error:(id *)a8;
- (id)_queue_resolveGenmojiAttachmentsForRequest:(id)a3;
- (id)_queue_resolvedFileURLForNotificationAttachment:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 fromLocalClientConnection:(id)a6 orFromServiceExtensionOfBundleProxy:(id)a7 error:(id *)a8;
- (id)_queue_resolvedURLForNotificationAttachment:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 fromLocalClientConnection:(id)a6 orFromServiceExtensionOfBundleProxy:(id)a7 error:(id *)a8;
- (id)_queue_validatedRepositoryURLForNotificationAttachment:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 fromLocalClientConnection:(id)a6 orFromServiceExtensionOfBundleProxy:(id)a7 error:(id *)a8;
- (id)_temporaryAttachmentFileURL;
- (id)_thumbnailRepresentationsForGlyphData:(id)a3;
- (id)resolveAttachmentsForRequest:(id)a3 bundleIdentifier:(id)a4 fromLocalClientConnection:(id)a5 error:(id *)a6;
- (id)resolveAttachmentsSkippingErrorsForRequest:(id)a3 bundleIdentifier:(id)a4 fromBundleProxyForServiceExtension:(id)a5;
- (void)_beginObservingNotificationChanges;
- (void)_notificationIdentifiersForBundleIdentifier:(id)a3 replyOnQueue:(id)a4 completionHandler:(id)a5;
- (void)_queue_applicationDidUninstall:(id)a3;
- (void)_queue_deleteAttachmentDataForNotificationRecord:(id)a3 bundleIdentifier:(id)a4;
- (void)_queue_deleteAttachmentDataForNotificationRecords:(id)a3 bundleIdentifier:(id)a4;
- (void)_queue_ensureIntegrityWithCompletionHandler:(id)a3;
- (void)_queue_notificationSourcesDidUninstall:(id)a3;
- (void)_repositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4;
- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3;
- (void)ensureIntegrityWithCompletionHandler:(id)a3;
- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5;
- (void)notificationSourcesDidUninstall:(id)a3;
- (void)pendingNotificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5;
@end

@implementation UNSAttachmentsService

- (UNSAttachmentsService)initWithAttachmentsRepository:(id)a3 notificationRepository:(id)a4 notificationSchedulingService:(id)a5 pendingNotificationRepository:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)UNSAttachmentsService;
  v15 = [(UNSAttachmentsService *)&v20 init];
  if (v15)
  {
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.usernotificationsserver.AttachmentsService", v16);
    queue = v15->_queue;
    v15->_queue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v15->_attachmentsRepository, a3);
    objc_storeStrong((id *)&v15->_notificationRepository, a4);
    objc_storeStrong((id *)&v15->_notificationSchedulingService, a5);
    objc_storeStrong((id *)&v15->_pendingNotificationRepository, a6);
    [(UNSAttachmentsService *)v15 _beginObservingNotificationChanges];
  }

  return v15;
}

- (void)contentProtectionStateChangedForFirstUnlock:(BOOL)a3
{
  if (a3) {
    [(UNSAttachmentsService *)self ensureIntegrityWithCompletionHandler:&__block_literal_global_1];
  }
}

void __69__UNSAttachmentsService_contentProtectionStateChangedForFirstUnlock___block_invoke()
{
  v0 = *MEMORY[0x263F1DFF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_22289A000, v0, OS_LOG_TYPE_DEFAULT, "Attachment integrity check complete after first unlock", v1, 2u);
  }
}

- (void)ensureIntegrityWithCompletionHandler:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __62__UNSAttachmentsService_ensureIntegrityWithCompletionHandler___block_invoke;
  v7[3] = &unk_26462F2F0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __62__UNSAttachmentsService_ensureIntegrityWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = *MEMORY[0x263F1DFF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22289A000, v2, OS_LOG_TYPE_DEFAULT, "Suspending attachment service", buf, 2u);
  }
  dispatch_suspend(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __62__UNSAttachmentsService_ensureIntegrityWithCompletionHandler___block_invoke_3;
  v4[3] = &unk_26462F2F0;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_queue_ensureIntegrityWithCompletionHandler:", v4);
}

uint64_t __62__UNSAttachmentsService_ensureIntegrityWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  v2 = *MEMORY[0x263F1DFF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_22289A000, v2, OS_LOG_TYPE_DEFAULT, "Resuming attachment service", v4, 2u);
  }
  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 8));
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_queue_ensureIntegrityWithCompletionHandler:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  queue = dispatch_queue_create("com.apple.usernotificationsserver.AttachmentsService.integrity", v4);

  id v5 = dispatch_group_create();
  id v6 = [(UNCAttachmentsRepository *)self->_attachmentsRepository bundleIdentifiersClaimingAttachments];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v26 = [MEMORY[0x263EFF9A0] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * v9);
        dispatch_group_enter(v5);
        v18[0] = MEMORY[0x263EF8330];
        v18[1] = 3221225472;
        v18[2] = __69__UNSAttachmentsService__queue_ensureIntegrityWithCompletionHandler___block_invoke;
        v18[3] = &unk_26462F318;
        objc_super v20 = v25;
        v18[4] = v10;
        v19 = v5;
        [(UNSAttachmentsService *)self _notificationIdentifiersForBundleIdentifier:v10 replyOnQueue:queue completionHandler:v18];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v7);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__UNSAttachmentsService__queue_ensureIntegrityWithCompletionHandler___block_invoke_2;
  block[3] = &unk_26462F340;
  dispatch_queue_t v17 = v25;
  block[4] = self;
  id v16 = v12;
  id v11 = v12;
  dispatch_group_notify(v5, queue, block);

  _Block_object_dispose(v25, 8);
}

void __69__UNSAttachmentsService__queue_ensureIntegrityWithCompletionHandler___block_invoke(void *a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1[6] + 8) + 40) setObject:a2 forKey:a1[4]];
  v3 = a1[5];
  dispatch_group_leave(v3);
}

uint64_t __69__UNSAttachmentsService__queue_ensureIntegrityWithCompletionHandler___block_invoke_2(void *a1)
{
  [*(id *)(a1[4] + 16) ensureIntegrityUsingNotificationIdentifiersForBundleIdentifiers:*(void *)(*(void *)(a1[6] + 8) + 40)];
  v2 = *(uint64_t (**)(void))(a1[5] + 16);
  return v2();
}

- (id)resolveAttachmentsForRequest:(id)a3 bundleIdentifier:(id)a4 fromLocalClientConnection:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v13 = v10;
  id v39 = v13;
  uint64_t v14 = [(UNSAttachmentsService *)self _queue_resolveGenmojiAttachmentsForRequest:v35[5]];
  v15 = (void *)v35[5];
  v35[5] = v14;

  id v16 = [v13 content];
  dispatch_queue_t v17 = [v16 attachments];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    id v33 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __103__UNSAttachmentsService_resolveAttachmentsForRequest_bundleIdentifier_fromLocalClientConnection_error___block_invoke;
    block[3] = &unk_26462F368;
    id v26 = &v34;
    block[4] = self;
    id v24 = v11;
    id v25 = v12;
    v27 = &v28;
    dispatch_sync(queue, block);
    if (a6)
    {
      objc_super v20 = (void *)v29[5];
      if (v20) {
        *a6 = v20;
      }
    }

    _Block_object_dispose(&v28, 8);
  }
  id v21 = (id)v35[5];
  _Block_object_dispose(&v34, 8);

  return v21;
}

void __103__UNSAttachmentsService_resolveAttachmentsForRequest_bundleIdentifier_fromLocalClientConnection_error___block_invoke(void *a1)
{
  uint64_t v2 = a1[6];
  uint64_t v3 = *(void *)(*(void *)(a1[7] + 8) + 40);
  id v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = *(void *)(a1[8] + 8);
  id obj = *(id *)(v6 + 40);
  uint64_t v7 = objc_msgSend(v4, "_queue_resolveAttachmentsForRequest:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:continueOnFailure:error:", v3, v5, v2, 0, 0, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  uint64_t v8 = *(void *)(a1[7] + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

- (id)resolveAttachmentsSkippingErrorsForRequest:(id)a3 bundleIdentifier:(id)a4 fromBundleProxyForServiceExtension:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v23 = 0;
  id v24 = (id *)&v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  id v12 = [v9 content];
  id v13 = [v12 attachments];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __120__UNSAttachmentsService_resolveAttachmentsSkippingErrorsForRequest_bundleIdentifier_fromBundleProxyForServiceExtension___block_invoke;
    block[3] = &unk_26462F390;
    long long v22 = &v23;
    block[4] = self;
    id v19 = v9;
    id v20 = v10;
    id v21 = v11;
    dispatch_sync(queue, block);
  }
  else
  {
    objc_storeStrong(v24 + 5, a3);
  }
  id v16 = v24[5];
  _Block_object_dispose(&v23, 8);

  return v16;
}

void __120__UNSAttachmentsService_resolveAttachmentsSkippingErrorsForRequest_bundleIdentifier_fromBundleProxyForServiceExtension___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_queue_resolveAttachmentsForRequest:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:continueOnFailure:error:", *(void *)(a1 + 40), *(void *)(a1 + 48), 0, *(void *)(a1 + 56), 1, 0);
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_queue_resolveGenmojiAttachmentsForRequest:(id)a3
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 content];
  uint64_t v6 = [v5 attributedBody];

  uint64_t v7 = (os_log_t *)MEMORY[0x263F1DFF8];
  if (!v6 || ![v6 length])
  {
    os_log_t v8 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = v8;
      id v10 = [v4 identifier];
      id v11 = objc_msgSend(v10, "un_logDigest");
      *(_DWORD *)buf = 138412546;
      *(void *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl(&dword_22289A000, v9, OS_LOG_TYPE_DEFAULT, "attributedBody is empty for request %@ %@", buf, 0x16u);
    }
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v13 = [v6 length];
  v42[0] = MEMORY[0x263EF8330];
  v42[1] = 3221225472;
  v42[2] = __68__UNSAttachmentsService__queue_resolveGenmojiAttachmentsForRequest___block_invoke;
  v42[3] = &unk_26462F3B8;
  id v14 = v12;
  id v43 = v14;
  objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", 0, v13, 0, v42);
  if (![v14 count])
  {
    os_log_t v15 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v15;
      dispatch_queue_t v17 = [v4 identifier];
      uint64_t v18 = objc_msgSend(v17, "un_logDigest");
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v18;
      _os_log_impl(&dword_22289A000, v16, OS_LOG_TYPE_DEFAULT, "Did not find image glyph data for request %@", buf, 0xCu);
    }
  }
  id v19 = [(UNSAttachmentsService *)self _thumbnailRepresentationsForGlyphData:v14];
  id v20 = (void *)[v6 mutableCopy];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  uint64_t v49 = 0;
  uint64_t v21 = [v6 length];
  uint64_t v35 = MEMORY[0x263EF8330];
  uint64_t v36 = 3221225472;
  v37 = __68__UNSAttachmentsService__queue_resolveGenmojiAttachmentsForRequest___block_invoke_8;
  v38 = &unk_26462F3E0;
  id v22 = v19;
  id v39 = v22;
  v41 = buf;
  id v23 = v20;
  id v40 = v23;
  objc_msgSend(v6, "enumerateAttributesInRange:options:usingBlock:", 0, v21, 0, &v35);
  id v24 = objc_msgSend(v4, "content", v35, v36, v37, v38);
  uint64_t v25 = (void *)[v24 mutableCopy];

  id v26 = *v7;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = [v4 identifier];
    id v28 = objc_msgSend(v27, "un_logDigest");
    uint64_t v29 = *(void *)(*(void *)&buf[8] + 24);
    *(_DWORD *)v44 = 138412546;
    v45 = v28;
    __int16 v46 = 2048;
    uint64_t v47 = v29;
    _os_log_impl(&dword_22289A000, v26, OS_LOG_TYPE_DEFAULT, "Updated attributedBody of request %@ w/ %ld image glyphs", v44, 0x16u);
  }
  [v25 setAttributedBody:v23];
  uint64_t v30 = (void *)MEMORY[0x263F1DF48];
  v31 = [v4 identifier];
  v32 = [v4 trigger];
  id v33 = objc_msgSend(v30, "requestWithIdentifier:content:trigger:destinations:", v31, v25, v32, objc_msgSend(v4, "destinations"));

  _Block_object_dispose(buf, 8);
  return v33;
}

void __68__UNSAttachmentsService__queue_resolveGenmojiAttachmentsForRequest___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = objc_msgSend(v3, "keyEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isEqualToString:@"CTAdaptiveImageProvider"])
        {
          id v10 = *(void **)(a1 + 32);
          id v11 = [v3 objectForKeyedSubscript:v9];
          id v12 = [v11 imageContent];
          [v10 addObject:v12];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

void __68__UNSAttachmentsService__queue_resolveGenmojiAttachmentsForRequest___block_invoke_8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v7 = a2;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  os_log_t v8 = [v7 keyEnumerator];
  uint64_t v49 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v49)
  {
    uint64_t v48 = *(void *)v52;
    unint64_t v9 = 0x263F1C000uLL;
    unint64_t v10 = 0x263EFF000;
    uint64_t v40 = a3;
    uint64_t v41 = a4;
    v42 = v8;
    id v43 = v7;
    uint64_t v39 = a1;
    do
    {
      for (uint64_t i = 0; i != v49; ++i)
      {
        if (*(void *)v52 != v48) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        long long v13 = objc_msgSend(v7, "objectForKeyedSubscript:", v12, v39);
        uint64_t v50 = v12;
        if ([v12 isEqualToString:@"CTAdaptiveImageProvider"])
        {
          if ((unint64_t)[*(id *)(a1 + 32) count] > *(void *)(*(void *)(*(void *)(a1 + 48)
                                                                                                 + 8)
                                                                                     + 24))
          {
            long long v14 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:");

            if (v14)
            {
              long long v15 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
              long long v16 = [v15 generatedProperties];
              dispatch_queue_t v17 = [v16 additionalProperties];

              uint64_t v47 = [v17 objectForKey:@"contentIdentifier"];
              __int16 v46 = [v17 objectForKey:@"shortDescription"];
              uint64_t v18 = [v17 objectForKey:@"alignmentInsetWidths"];
              v44 = v17;
              id v19 = [v17 objectForKey:@"alignmentInsetHeights"];
              v45 = v15;
              id v20 = [v15 images];
              uint64_t v21 = objc_opt_new();
              if ([v20 count])
              {
                unint64_t v22 = 0;
                do
                {
                  uint64_t v23 = [v20 objectAtIndex:v22];
                  id v24 = [v18 objectAtIndex:v22];
                  [v24 floatValue];
                  double v26 = v25;

                  v27 = [v19 objectAtIndex:v22];
                  [v27 floatValue];
                  double v29 = v28;

                  uint64_t v30 = objc_msgSend(objc_alloc(*(Class *)(v9 + 824)), "initWithImage:alignmentInset:", v23, v26, v29);
                  [v21 addObject:v30];

                  ++v22;
                }
                while (v22 < [v20 count]);
              }
              if (v47)
              {
                os_log_t v8 = v42;
                id v7 = v43;
                v31 = v45;
                if (v46 && [v21 count])
                {
                  v32 = (void *)[objc_alloc(MEMORY[0x263F1C330]) initWithContentIdentifier:v47 shortDescription:v46 strikeImages:v21];
                  id v33 = objc_alloc(MEMORY[0x263F1C2E8]);
                  uint64_t v34 = [v32 imageData];
                  uint64_t v35 = (void *)[v33 initWithImageContent:v34];

                  id v36 = v35;
                  a1 = v39;
                  ++*(void *)(*(void *)(*(void *)(v39 + 48) + 8) + 24);

                  long long v13 = v36;
                  os_log_t v8 = v42;
                  id v7 = v43;
                }
                else
                {
                  a1 = v39;
                }
              }
              else
              {
                os_log_t v8 = v42;
                id v7 = v43;
                a1 = v39;
                v31 = v45;
              }

              a3 = v40;
              a4 = v41;
              unint64_t v9 = 0x263F1C000;
              unint64_t v10 = 0x263EFF000uLL;
            }
          }
        }
        if (v13)
        {
          v37 = *(void **)(a1 + 40);
          v55 = v50;
          v56 = v13;
          v38 = [*(id *)(v10 + 2352) dictionaryWithObjects:&v56 forKeys:&v55 count:1];
          objc_msgSend(v37, "setAttributes:range:", v38, a3, a4);

          unint64_t v9 = 0x263F1C000;
        }
      }
      uint64_t v49 = [v8 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v49);
  }
}

- (id)_queue_resolveAttachmentsForRequest:(id)a3 bundleIdentifier:(id)a4 fromLocalClientConnection:(id)a5 orFromServiceExtensionOfBundleProxy:(id)a6 continueOnFailure:(BOOL)a7 error:(id *)a8
{
  BOOL v78 = a7;
  uint64_t v105 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v82 = a4;
  id v73 = a5;
  id v72 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v75 = [MEMORY[0x263EFF980] array];
  long long v13 = [MEMORY[0x263EFF9A0] dictionary];
  [v12 enterSecurityScope];
  long long v95 = 0u;
  long long v96 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v14 = [v12 content];
  long long v15 = [v14 attachments];

  id obj = v15;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v93 objects:v104 count:16];
  v74 = v13;
  v81 = self;
  if (!v16)
  {
    id v77 = 0;
    char v79 = 1;
    goto LABEL_24;
  }
  uint64_t v17 = v16;
  id v77 = 0;
  uint64_t v18 = *(void *)v94;
  char v79 = 1;
  while (2)
  {
    for (uint64_t i = 0; i != v17; ++i)
    {
      if (*(void *)v94 != v18) {
        objc_enumerationMutation(obj);
      }
      id v20 = *(void **)(*((void *)&v93 + 1) + 8 * i);
      uint64_t v21 = [v20 URL];
      unint64_t v22 = [v13 objectForKey:v21];

      if (v22)
      {
        uint64_t v23 = [v20 type];
        id v24 = [v22 type];
        int v25 = [v23 isEqual:v24];

        if (v25)
        {
          double v26 = [v22 URL];
          if (v26) {
            goto LABEL_11;
          }
        }
        else
        {
          id v33 = *MEMORY[0x263F1DFF8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v99 = v20;
            __int16 v100 = 2114;
            *(void *)v101 = v22;
            _os_log_error_impl(&dword_22289A000, v33, OS_LOG_TYPE_ERROR, "Type conflict between attachment and pre-resolved attachment: attachment=%{public}@, preResolvedAttachment=%{public}@", buf, 0x16u);
          }
          uint64_t v34 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 100, 0);

          id v77 = (id)v34;
        }
      }
      else
      {
        id v92 = v77;
        double v26 = [(UNSAttachmentsService *)self _queue_resolvedURLForNotificationAttachment:v20 request:v12 bundleIdentifier:v82 fromLocalClientConnection:v73 orFromServiceExtensionOfBundleProxy:v72 error:&v92];
        id v27 = v92;

        id v77 = v27;
        if (v26)
        {
LABEL_11:
          id v28 = objc_alloc(MEMORY[0x263F1DF20]);
          double v29 = [v20 identifier];
          uint64_t v30 = [v20 type];
          v31 = [v20 options];
          v32 = (void *)[v28 initWithIdentifier:v29 URL:v26 type:v30 options:v31];

          long long v13 = v74;
          [v75 addObject:v32];

          self = v81;
          goto LABEL_19;
        }
      }
      self = v81;
      uint64_t v35 = *MEMORY[0x263F1DFF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v99 = v20;
        __int16 v100 = 2114;
        *(void *)v101 = v77;
        _os_log_error_impl(&dword_22289A000, v35, OS_LOG_TYPE_ERROR, "Unable to stage attachment: attachment=%{public}@, error=%{public}@", buf, 0x16u);
      }
      if (!v78)
      {

        char v79 = 0;
        goto LABEL_24;
      }
      char v79 = 0;
LABEL_19:
    }
    uint64_t v17 = [obj countByEnumeratingWithState:&v93 objects:v104 count:16];
    if (v17) {
      continue;
    }
    break;
  }
LABEL_24:

  [v12 leaveSecurityScope];
  if ((v79 & 1) != 0 || v78)
  {
    v63 = [v12 content];
    id v56 = (id)[v63 mutableCopy];

    [v56 setAttachments:v75];
    v64 = (void *)MEMORY[0x263F1DF48];
    v65 = [v12 identifier];
    v66 = [v12 trigger];
    v57 = objc_msgSend(v64, "requestWithIdentifier:content:trigger:destinations:", v65, v56, v66, objc_msgSend(v12, "destinations"));

    v67 = *MEMORY[0x263F1DFF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v99 = v57;
      __int16 v100 = 1024;
      *(_DWORD *)v101 = v79 & 1;
      *(_WORD *)&v101[4] = 1024;
      *(_DWORD *)&v101[6] = v78;
      _os_log_impl(&dword_22289A000, v67, OS_LOG_TYPE_DEFAULT, "Successfully resolved request: resolvedRequest=%{public}@, resolutionSuccess=%{BOOL}d, continueOnFailure=%{BOOL}d", buf, 0x18u);
    }
  }
  else
  {
    id v70 = v12;
    id v36 = *MEMORY[0x263F1DFF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_ERROR)) {
      -[UNSAttachmentsService _queue_resolveAttachmentsForRequest:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:continueOnFailure:error:]((uint64_t)v77, v36);
    }
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    id v37 = v13;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v88 objects:v103 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v89;
      do
      {
        uint64_t v41 = 0;
        uint64_t v80 = v39;
        do
        {
          if (*(void *)v89 != v40) {
            objc_enumerationMutation(v37);
          }
          v42 = *(void **)(*((void *)&v88 + 1) + 8 * v41);
          if (-[UNCAttachmentsRepository isRepositoryURL:](self->_attachmentsRepository, "isRepositoryURL:", v42, v70))
          {
            id v43 = *MEMORY[0x263F1DFF8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v99 = v42;
              _os_log_impl(&dword_22289A000, v43, OS_LOG_TYPE_DEFAULT, "Skipping attachment URL from repository: URL=%{public}@", buf, 0xCu);
            }
          }
          else
          {
            v44 = [v37 objectForKey:v42];
            v45 = [v44 URL];
            __int16 v46 = [MEMORY[0x263F08850] defaultManager];
            uint64_t v47 = [v42 path];
            char v48 = [v46 fileExistsAtPath:v47];

            if ((v48 & 1) == 0)
            {
              uint64_t v49 = v40;
              id v50 = v37;
              long long v51 = [MEMORY[0x263F08850] defaultManager];
              id v87 = 0;
              int v52 = [v51 copyItemAtURL:v45 toURL:v42 error:&v87];
              id v53 = v87;

              long long v54 = *MEMORY[0x263F1DFF8];
              v55 = *MEMORY[0x263F1DFF8];
              if (v52)
              {
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543618;
                  v99 = v45;
                  __int16 v100 = 2114;
                  *(void *)v101 = v42;
                  _os_log_impl(&dword_22289A000, v54, OS_LOG_TYPE_DEFAULT, "Rolled back attachment: resolvedURL=%{public}@, originalAttachmentURL=%{public}@", buf, 0x16u);
                }
              }
              else if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543874;
                v99 = v45;
                __int16 v100 = 2114;
                *(void *)v101 = v42;
                *(_WORD *)&v101[8] = 2114;
                id v102 = v53;
                _os_log_error_impl(&dword_22289A000, v54, OS_LOG_TYPE_ERROR, "Unable to roll back attachment: resolvedURL=%{public}@, originalAttachmentURL=%{public}@, error=%{public}@", buf, 0x20u);
              }

              id v37 = v50;
              uint64_t v40 = v49;
              uint64_t v39 = v80;
            }

            self = v81;
          }
          ++v41;
        }
        while (v39 != v41);
        uint64_t v39 = [v37 countByEnumeratingWithState:&v88 objects:v103 count:16];
      }
      while (v39);
    }

    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v56 = v75;
    v57 = (void *)[v56 countByEnumeratingWithState:&v83 objects:v97 count:16];
    if (v57)
    {
      uint64_t v58 = *(void *)v84;
      id v12 = v70;
      do
      {
        for (j = 0; j != v57; j = (char *)j + 1)
        {
          if (*(void *)v84 != v58) {
            objc_enumerationMutation(v56);
          }
          attachmentsRepository = self->_attachmentsRepository;
          v61 = objc_msgSend(*(id *)(*((void *)&v83 + 1) + 8 * (void)j), "URL", v70);
          v62 = [v12 identifier];
          [(UNCAttachmentsRepository *)attachmentsRepository removeReferenceToRepositoryURL:v61 forNotificationIdentifier:v62 bundleIdentifier:v82];
        }
        v57 = (void *)[v56 countByEnumeratingWithState:&v83 objects:v97 count:16];
      }
      while (v57);
    }
    else
    {
      id v12 = v70;
    }
  }

  if (a8 && v77) {
    *a8 = v77;
  }
  id v68 = v57;

  return v68;
}

- (id)_thumbnailRepresentationsForGlyphData:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        uint64_t v20 = 0;
        uint64_t v21 = &v20;
        uint64_t v22 = 0x3032000000;
        uint64_t v23 = __Block_byref_object_copy_;
        id v24 = __Block_byref_object_dispose_;
        id v25 = 0;
        v18[0] = 0;
        v18[1] = v18;
        v18[2] = 0x3032000000;
        v18[3] = __Block_byref_object_copy_;
        v18[4] = __Block_byref_object_dispose_;
        id v19 = 0;
        id v7 = objc_msgSend(objc_alloc(MEMORY[0x263F160C8]), "initWithData:contentType:size:scale:representationTypes:", v6, @"com.apple.private.usernotifications.genmoji.attachment", 4, 1025.0, 1025.0, 1.0);
        [v7 setContentTypeUTI:@"com.apple.private.usernotifications.genmoji.attachment"];
        os_log_t v8 = [MEMORY[0x263F160D0] sharedGenerator];
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __63__UNSAttachmentsService__thumbnailRepresentationsForGlyphData___block_invoke;
        v14[3] = &unk_26462F408;
        uint64_t v16 = &v20;
        uint64_t v17 = v18;
        id v9 = v7;
        id v15 = v9;
        [v8 synchronousGenerateThumbnailForRequest:v9 updateHandler:0 statusHandler:0 completionHandler:v14];

        if (v21[5]) {
          objc_msgSend(v12, "addObject:");
        }

        _Block_object_dispose(v18, 8);
        _Block_object_dispose(&v20, 8);
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v4);
  }

  return v12;
}

void __63__UNSAttachmentsService__thumbnailRepresentationsForGlyphData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    os_log_t v8 = *MEMORY[0x263F1DFF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_ERROR)) {
      __63__UNSAttachmentsService__thumbnailRepresentationsForGlyphData___block_invoke_cold_1(a1, a1 + 48, v8);
    }
  }
}

- (id)_queue_resolvedURLForNotificationAttachment:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 fromLocalClientConnection:(id)a6 orFromServiceExtensionOfBundleProxy:(id)a7 error:(id *)a8
{
  id v13 = a3;
  queue = self->_queue;
  id v32 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  dispatch_assert_queue_V2(queue);
  uint64_t v18 = [v13 URL];
  id v19 = [v18 URLByStandardizingPath];

  uint64_t v20 = [v19 URLByResolvingSymlinksInPath];

  id v21 = objc_alloc(MEMORY[0x263F1DF20]);
  uint64_t v22 = [v13 identifier];
  uint64_t v23 = [v13 type];
  id v24 = [v13 options];
  id v25 = (void *)[v21 initWithIdentifier:v22 URL:v20 type:v23 options:v24];

  if ([(UNCAttachmentsRepository *)self->_attachmentsRepository isRepositoryURL:v20])
  {
    uint64_t v35 = 0;
    long long v26 = (id *)&v35;
    long long v27 = v32;
    uint64_t v28 = [(UNSAttachmentsService *)self _queue_validatedRepositoryURLForNotificationAttachment:v25 request:v17 bundleIdentifier:v16 fromLocalClientConnection:v15 orFromServiceExtensionOfBundleProxy:v32 error:&v35];
  }
  else
  {
    uint64_t v34 = 0;
    long long v26 = (id *)&v34;
    long long v27 = v32;
    uint64_t v28 = [(UNSAttachmentsService *)self _queue_resolvedFileURLForNotificationAttachment:v25 request:v17 bundleIdentifier:v16 fromLocalClientConnection:v15 orFromServiceExtensionOfBundleProxy:v32 error:&v34];
  }
  long long v29 = (void *)v28;

  id v30 = *v26;
  if (!v29 && os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_ERROR)) {
    -[UNSAttachmentsService _queue_resolvedURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:]();
  }
  if (a8 && v30) {
    *a8 = v30;
  }

  return v29;
}

- (id)_queue_validatedRepositoryURLForNotificationAttachment:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 fromLocalClientConnection:(id)a6 orFromServiceExtensionOfBundleProxy:(id)a7 error:(id *)a8
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v13 = [v11 URL];
  if ([(UNCAttachmentsRepository *)self->_attachmentsRepository isValidRepositoryURL:v13 forBundleIdentifier:v12])
  {
    long long v14 = (void *)MEMORY[0x263F1D920];
    id v15 = [v11 type];
    id v16 = [v14 typeWithIdentifier:v15];

    id v17 = [v16 preferredFilenameExtension];
    uint64_t v18 = [v13 pathExtension];
    int v19 = [v17 isEqualToString:v18];
    uint64_t v20 = *MEMORY[0x263F1DFF8];
    if (v19)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_DEFAULT))
      {
        int v25 = 138543618;
        id v26 = v11;
        __int16 v27 = 2112;
        id v28 = v12;
        _os_log_impl(&dword_22289A000, v20, OS_LOG_TYPE_DEFAULT, "Attachment is in repository for bundle: attachment=%{public}@, bundleIdentifier=%@", (uint8_t *)&v25, 0x16u);
      }
      id v21 = v13;
      uint64_t v22 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_ERROR))
      {
        int v25 = 138544130;
        id v26 = v11;
        __int16 v27 = 2112;
        id v28 = v12;
        __int16 v29 = 2114;
        id v30 = v17;
        __int16 v31 = 2114;
        id v32 = v18;
        _os_log_error_impl(&dword_22289A000, v20, OS_LOG_TYPE_ERROR, "Attachment has a type that doesn't match existing file in the repository: attachment=%{public}@, bundleIdentifier=%@, expectedExtension=%{public}@, actualExtension=%{public}@", (uint8_t *)&v25, 0x2Au);
      }
      uint64_t v22 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 101, 0);
      id v21 = 0;
    }

    if (a8)
    {
LABEL_14:
      if (v22) {
        *a8 = v22;
      }
    }
  }
  else
  {
    uint64_t v23 = *MEMORY[0x263F1DFF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_ERROR)) {
      -[UNSAttachmentsService _queue_validatedRepositoryURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:]((uint64_t)v11, (uint64_t)v12, v23);
    }
    uint64_t v22 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 100, 0);
    id v21 = 0;
    if (a8) {
      goto LABEL_14;
    }
  }

  return v21;
}

- (id)_queue_resolvedFileURLForNotificationAttachment:(id)a3 request:(id)a4 bundleIdentifier:(id)a5 fromLocalClientConnection:(id)a6 orFromServiceExtensionOfBundleProxy:(id)a7 error:(id *)a8
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v65 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v18 = [v14 URL];
  id v69 = 0;
  int v19 = [MEMORY[0x263F08840] fileHandleForReadingFromURL:v18 error:&v69];
  id v20 = v69;
  id v21 = v20;
  v64 = v16;
  if (v19 && !v20)
  {
    id v68 = 0;
    uint64_t v22 = [MEMORY[0x263F1DF20] stagingActionForFileHandle:v19 fromLocalClientConnection:v16 orFromServiceExtensionOfBundleProxy:v17 servicingBundleIdentifier:v15 error:&v68];
    id v63 = v68;
    if (!v22)
    {
      v42 = *MEMORY[0x263F1DFF8];
      uint64_t v40 = v63;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v71 = v18;
        __int16 v72 = 2112;
        *(void *)id v73 = v15;
        *(_WORD *)&v73[8] = 2114;
        *(void *)&v73[10] = v63;
        _os_log_error_impl(&dword_22289A000, v42, OS_LOG_TYPE_ERROR, "Attachment file is not related to bundle: fileURL=%{public}@, bundleIdentifier=%@, stagingError=%{public}@", buf, 0x20u);
      }
      uint64_t v39 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 100, 0);
      uint64_t v41 = 0;
LABEL_33:
      [v19 closeFile];
      if (!a8) {
        goto LABEL_36;
      }
      goto LABEL_34;
    }
    id v61 = v15;
    v57 = a8;
    uint64_t v23 = (void *)MEMORY[0x263F1D920];
    id v24 = [v14 type];
    int v25 = [v23 typeWithIdentifier:v24];

    v59 = v25;
    uint64_t v26 = [v25 preferredFilenameExtension];
    __int16 v27 = [(UNSAttachmentsService *)self _temporaryAttachmentFileURL];
    uint64_t v58 = (void *)v26;
    id v28 = [v27 URLByAppendingPathExtension:v26];

    __int16 v29 = *MEMORY[0x263F1DFF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v71 = v18;
      __int16 v72 = 2114;
      *(void *)id v73 = v28;
      _os_log_impl(&dword_22289A000, v29, OS_LOG_TYPE_DEFAULT, "Will stage attachment file via secure copy: fileURL=%{public}@, temporaryFileURL=%{public}@", buf, 0x16u);
    }
    id v30 = [MEMORY[0x263F08850] defaultManager];
    id v67 = 0;
    int v31 = objc_msgSend(v30, "unc_securelyCopyFile:fromURL:toURL:error:", v19, v18, v28, &v67);
    id v60 = v67;

    v62 = v28;
    if (!v31)
    {
      id v43 = *MEMORY[0x263F1DFF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        id v71 = v18;
        __int16 v72 = 2114;
        *(void *)id v73 = v28;
        *(_WORD *)&v73[8] = 2114;
        *(void *)&v73[10] = v60;
        _os_log_error_impl(&dword_22289A000, v43, OS_LOG_TYPE_ERROR, "Unable to stage attachment file: fileURL=%{public}@, temporaryFileURL=%{public}@ error=%{public}@", buf, 0x20u);
      }
      uint64_t v39 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 104, 0);
      uint64_t v41 = 0;
      uint64_t v40 = v63;
      a8 = v57;
      goto LABEL_32;
    }
    id v54 = v17;
    id v32 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v33 = [v28 path];
    uint64_t v34 = [v32 attributesOfItemAtPath:v33 error:0];

    id v56 = v34;
    uint64_t v35 = [v34 objectForKey:*MEMORY[0x263F080B8]];
    [v14 family];
    unint64_t v36 = UNNotificationAttachmentFamilyMaximumSize();
    v55 = v35;
    if ([v35 unsignedLongValue] <= v36)
    {
      attachmentsRepository = self->_attachmentsRepository;
      v45 = [v65 identifier];
      uint64_t v41 = [(UNCAttachmentsRepository *)attachmentsRepository moveFileIntoRepositoryFromFileURL:v28 forNotificationIdentifier:v45 bundleIdentifier:v15];

      __int16 v46 = *MEMORY[0x263F1DFF8];
      uint64_t v47 = *MEMORY[0x263F1DFF8];
      if (v41)
      {
        uint64_t v40 = v63;
        a8 = v57;
        id v17 = v54;
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v71 = v14;
          __int16 v72 = 2114;
          *(void *)id v73 = v41;
          _os_log_impl(&dword_22289A000, v46, OS_LOG_TYPE_DEFAULT, "Copied attachment file into repository: attachment=%{public}@, repositoryURL=%{public}@", buf, 0x16u);
        }
        uint64_t v39 = 0;
        goto LABEL_31;
      }
      id v17 = v54;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
        -[UNSAttachmentsService _queue_resolvedFileURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:]();
      }
      uint64_t v37 = 104;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_ERROR)) {
        -[UNSAttachmentsService _queue_resolvedFileURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:]();
      }
      uint64_t v37 = 102;
      id v17 = v54;
    }
    uint64_t v39 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", v37, 0);
    char v48 = [MEMORY[0x263F08850] defaultManager];
    id v66 = 0;
    int v49 = [v48 removeItemAtURL:v28 error:&v66];
    id v50 = v66;

    long long v51 = *MEMORY[0x263F1DFF8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v71 = v14;
      __int16 v72 = 1024;
      *(_DWORD *)id v73 = v49;
      *(_WORD *)&v73[4] = 2114;
      *(void *)&v73[6] = v50;
      _os_log_impl(&dword_22289A000, v51, OS_LOG_TYPE_DEFAULT, "Performed delete for invalid attachment: attachment=%{public}@, success=%{BOOL}d, error=%{public}@", buf, 0x1Cu);
    }

    uint64_t v41 = 0;
    uint64_t v40 = v63;
    a8 = v57;
    id v15 = v61;
LABEL_31:

LABEL_32:
    goto LABEL_33;
  }
  uint64_t v38 = *MEMORY[0x263F1DFF8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F1DFF8], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543874;
    id v71 = v18;
    __int16 v72 = 2112;
    *(void *)id v73 = v15;
    *(_WORD *)&v73[8] = 2114;
    *(void *)&v73[10] = v21;
    _os_log_error_impl(&dword_22289A000, v38, OS_LOG_TYPE_ERROR, "Error opening file for attachment URL: fileURL=%{public}@, bundleIdentifier=%@, fileHandleCreationError=%{public}@", buf, 0x20u);
  }
  uint64_t v39 = objc_msgSend(MEMORY[0x263F087E8], "un_errorWithUNErrorCode:userInfo:", 100, 0);
  uint64_t v40 = 0;
  uint64_t v41 = 0;
  if (a8)
  {
LABEL_34:
    if (v39) {
      *a8 = v39;
    }
  }
LABEL_36:
  id v52 = v41;

  return v52;
}

- (id)_temporaryAttachmentFileURL
{
  uint64_t v2 = [(id)objc_opt_class() _stagingDirectory];
  id v3 = [MEMORY[0x263F08C38] UUID];
  uint64_t v4 = [v3 UUIDString];

  uint64_t v5 = [v2 URLByAppendingPathComponent:v4];

  return v5;
}

- (void)_queue_deleteAttachmentDataForNotificationRecords:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[UNSAttachmentsService _queue_deleteAttachmentDataForNotificationRecord:bundleIdentifier:](self, "_queue_deleteAttachmentDataForNotificationRecord:bundleIdentifier:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), v7, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_queue_deleteAttachmentDataForNotificationRecord:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v8 = [v6 identifier];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = objc_msgSend(v6, "attachments", 0);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        attachmentsRepository = self->_attachmentsRepository;
        long long v15 = [*(id *)(*((void *)&v16 + 1) + 8 * v13) URL];
        [(UNCAttachmentsRepository *)attachmentsRepository removeReferenceToRepositoryURL:v15 forNotificationIdentifier:v8 bundleIdentifier:v7];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
}

- (void)notificationSourcesDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__UNSAttachmentsService_notificationSourcesDidUninstall___block_invoke;
  v7[3] = &unk_26462F430;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __57__UNSAttachmentsService_notificationSourcesDidUninstall___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notificationSourcesDidUninstall:", *(void *)(a1 + 40));
}

- (void)_queue_notificationSourcesDidUninstall:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[UNSAttachmentsService _queue_applicationDidUninstall:](self, "_queue_applicationDidUninstall:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_queue_applicationDidUninstall:(id)a3
{
  queue = self->_queue;
  id v5 = a3;
  dispatch_assert_queue_V2(queue);
  attachmentsRepository = self->_attachmentsRepository;
  id v7 = [v5 bundleIdentifier];

  [(UNCAttachmentsRepository *)attachmentsRepository deleteAllFilesForBundleIdentifier:v7];
}

- (void)notificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5
{
}

- (void)pendingNotificationRepository:(id)a3 didPerformUpdates:(id)a4 forBundleIdentifier:(id)a5
{
}

- (void)_beginObservingNotificationChanges
{
  uint64_t v3 = *MEMORY[0x263F84340];
  [(UNCNotificationRepository *)self->_notificationRepository addObserver:self forBundleIdentifier:*MEMORY[0x263F84340]];
  pendingNotificationRepository = self->_pendingNotificationRepository;
  [(UNCPendingNotificationRepository *)pendingNotificationRepository addObserver:self forBundleIdentifier:v3];
}

- (void)_repositoryDidPerformUpdates:(id)a3 forBundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __74__UNSAttachmentsService__repositoryDidPerformUpdates_forBundleIdentifier___block_invoke;
  v11[3] = &unk_26462F458;
  id v12 = v6;
  long long v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  [(UNSAttachmentsService *)self _notificationIdentifiersForBundleIdentifier:v9 replyOnQueue:queue completionHandler:v11];
}

void __74__UNSAttachmentsService__repositoryDidPerformUpdates_forBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v21 = a2;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v3 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v23 = *(void *)v29;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v28 + 1) + 8 * v5);
        objc_opt_class();
        id v7 = UNSafeCast();
        objc_opt_class();
        uint64_t v8 = UNSafeCast();
        id v9 = (void *)v8;
        if (v7)
        {
          id v10 = [(id)objc_opt_class() _attachmentURLsRemovedByReplaceUpdate:v7];
          long long v11 = [v7 notificationRecord];
          id v12 = [v11 identifier];

          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          id v13 = v10;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v25;
            do
            {
              uint64_t v17 = 0;
              do
              {
                if (*(void *)v25 != v16) {
                  objc_enumerationMutation(v13);
                }
                [*(id *)(*(void *)(a1 + 40) + 16) removeReferenceToRepositoryURL:*(void *)(*((void *)&v24 + 1) + 8 * v17++) forNotificationIdentifier:v12 bundleIdentifier:*(void *)(a1 + 48)];
              }
              while (v15 != v17);
              uint64_t v15 = [v13 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v15);
          }

LABEL_15:
          goto LABEL_16;
        }
        if (v8)
        {
          id v13 = [v6 notificationRecord];
          long long v18 = [v13 identifier];
          char v19 = [v21 containsObject:v18];

          if ((v19 & 1) == 0) {
            objc_msgSend(*(id *)(a1 + 40), "_queue_deleteAttachmentDataForNotificationRecord:bundleIdentifier:", v13, *(void *)(a1 + 48));
          }
          goto LABEL_15;
        }
LABEL_16:

        ++v5;
      }
      while (v5 != v4);
      uint64_t v20 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      uint64_t v4 = v20;
    }
    while (v20);
  }
}

- (void)_notificationIdentifiersForBundleIdentifier:(id)a3 replyOnQueue:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  notificationRepository = self->_notificationRepository;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(UNCNotificationRepository *)notificationRepository notificationRecordsForBundleIdentifier:v11];
  id v13 = [(id)objc_opt_class() _notificationIdentifiersForNotificationRecords:v12];
  uint64_t v14 = [(UNCNotificationSchedulingService *)self->_notificationSchedulingService undeliveredNotificationRecordsForBundleIdentifier:v11];

  uint64_t v15 = [(id)objc_opt_class() _notificationIdentifiersForNotificationRecords:v14];
  uint64_t v16 = [v13 arrayByAddingObjectsFromArray:v15];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __100__UNSAttachmentsService__notificationIdentifiersForBundleIdentifier_replyOnQueue_completionHandler___block_invoke;
  v19[3] = &unk_26462F480;
  id v20 = v16;
  id v21 = v8;
  id v17 = v16;
  id v18 = v8;
  dispatch_async(v10, v19);
}

uint64_t __100__UNSAttachmentsService__notificationIdentifiersForBundleIdentifier_replyOnQueue_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

+ (id)_stagingDirectory
{
  uint64_t v2 = NSURL;
  uint64_t v3 = NSTemporaryDirectory();
  uint64_t v4 = [v2 fileURLWithPath:v3 isDirectory:1];

  return v4;
}

+ (id)_notificationIdentifiersForNotificationRecords:(id)a3
{
  return (id)objc_msgSend(a3, "bs_mapNoNulls:", &__block_literal_global_43);
}

+ (id)_attachmentURLsRemovedByReplaceUpdate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 notificationRecord];
  uint64_t v5 = [v4 attachments];
  id v6 = objc_msgSend(v5, "bs_mapNoNulls:", &__block_literal_global_46);
  id v7 = [v3 replacedNotificationRecord];

  id v8 = [v7 attachments];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __63__UNSAttachmentsService__attachmentURLsRemovedByReplaceUpdate___block_invoke_2;
  v14[3] = &unk_26462F4E8;
  id v15 = v6;
  id v9 = v6;
  id v10 = objc_msgSend(v8, "bs_mapNoNulls:", v14);
  id v11 = [MEMORY[0x263EFFA08] setWithArray:v10];
  id v12 = [v11 allObjects];

  return v12;
}

uint64_t __63__UNSAttachmentsService__attachmentURLsRemovedByReplaceUpdate___block_invoke(uint64_t a1, void *a2)
{
  return [a2 URL];
}

id __63__UNSAttachmentsService__attachmentURLsRemovedByReplaceUpdate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 URL];
  if ([*(id *)(a1 + 32) containsObject:v3]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingNotificationRepository, 0);
  objc_storeStrong((id *)&self->_notificationSchedulingService, 0);
  objc_storeStrong((id *)&self->_notificationRepository, 0);
  objc_storeStrong((id *)&self->_attachmentsRepository, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_queue_resolveAttachmentsForRequest:(uint64_t)a1 bundleIdentifier:(NSObject *)a2 fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:continueOnFailure:error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22289A000, a2, OS_LOG_TYPE_ERROR, "Hit error staging attachment, will roll back: error=%{public}@", (uint8_t *)&v2, 0xCu);
}

void __63__UNSAttachmentsService__thumbnailRepresentationsForGlyphData___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = *(void *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(void *)&v3[14] = *(void *)(*(void *)(*(void *)a2 + 8) + 40);
  OUTLINED_FUNCTION_1(&dword_22289A000, a2, a3, "Could not generate thumbnail for request=%{public}@ with error=%{public}@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_queue_resolvedURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "Unable to resolve URL: attachment=%{public}@, error=%{public}@");
}

- (void)_queue_validatedRepositoryURLForNotificationAttachment:(NSObject *)a3 request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138543618;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1(&dword_22289A000, a2, a3, "Attachment claims to be in the repository for bundle but is not: attachment=%{public}@, bundleIdentifier=%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x263EF8340]);
}

- (void)_queue_resolvedFileURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "Attachment's file exceeds maximum size: attachment=%{public}@, size=%{public}@");
}

- (void)_queue_resolvedFileURLForNotificationAttachment:request:bundleIdentifier:fromLocalClientConnection:orFromServiceExtensionOfBundleProxy:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_22289A000, v0, v1, "Serious error moving attachment file into repository: attachment=%{public}@, temporaryFileURL=%{public}@");
}

@end