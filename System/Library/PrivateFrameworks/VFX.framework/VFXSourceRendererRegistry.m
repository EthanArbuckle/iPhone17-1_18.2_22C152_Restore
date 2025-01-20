@interface VFXSourceRendererRegistry
+ (id)sharedRegistry;
- (VFXSourceRendererRegistry)init;
- (id)sourceRendererForEngineContext:(__CFXEngineContext *)a3 source:(id)a4 textureSource:(id)a5 targetTexture:(id)a6;
- (void)dealloc;
- (void)removeSourceRenderersForSource:(id)a3;
- (void)rendererDidChange:(id)a3;
@end

@implementation VFXSourceRendererRegistry

- (VFXSourceRendererRegistry)init
{
  v4.receiver = self;
  v4.super_class = (Class)VFXSourceRendererRegistry;
  v2 = [(VFXSourceRendererRegistry *)&v4 init];
  if (v2) {
    v2->_registry = CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E4F1D540]);
  }
  return v2;
}

- (void)dealloc
{
  registry = self->_registry;
  if (registry) {
    CFRelease(registry);
  }
  v4.receiver = self;
  v4.super_class = (Class)VFXSourceRendererRegistry;
  [(VFXSourceRendererRegistry *)&v4 dealloc];
}

+ (id)sharedRegistry
{
  if (qword_1EB995FA0 != -1) {
    dispatch_once(&qword_1EB995FA0, &unk_1F0FB5A48);
  }
  return (id)qword_1EB995FA8;
}

- (void)rendererDidChange:(id)a3
{
  if (pthread_main_np())
  {
    uint64_t v7 = objc_msgSend_layer(a3, v4, v5, v6);
    v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v8, v9, v10);
    objc_msgSend_postNotificationName_object_(v11, v12, @"VFXLayerTreeDidChange", v7);
  }
  else
  {
    objc_msgSend_begin(MEMORY[0x1E4F39CF8], v4, v5, v6);
    objc_msgSend_activateBackground_(MEMORY[0x1E4F39CF8], v13, 1, v14);
    uint64_t v18 = objc_msgSend_layer(a3, v15, v16, v17);
    v22 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v19, v20, v21);
    objc_msgSend_postNotificationName_object_(v22, v23, @"VFXLayerTreeDidChange", v18);
    v27 = (void *)MEMORY[0x1E4F39CF8];
    objc_msgSend_commit(v27, v24, v25, v26);
  }
}

- (id)sourceRendererForEngineContext:(__CFXEngineContext *)a3 source:(id)a4 textureSource:(id)a5 targetTexture:(id)a6
{
  v49[1] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1E9DDAFD0);
  Value = (void *)CFDictionaryGetValue(self->_registry, a4);
  if (Value) {
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_14:
    Value = 0;
    goto LABEL_15;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v18 = objc_msgSend_valueForKey_(a4, v11, @"VFXIsBackingViewAsMaterialPropertyTag", v13);
    if (!objc_msgSend_BOOLValue(v18, v19, v20, v21)) {
      goto LABEL_9;
    }
    v48 = @"kCARendererFlags";
    v49[0] = objc_msgSend_numberWithUnsignedInt_(NSNumber, v22, 3, v23);
    uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)v49, (uint64_t)&v48, 1);
    if (!v14) {
      goto LABEL_9;
    }
LABEL_8:
    id v25 = (id)objc_msgSend_mutableCopy(v14, v15, v16, v17);
    goto LABEL_10;
  }
  uint64_t v14 = objc_msgSend_rendererOptions(a4, v11, v12, v13);
  if (v14) {
    goto LABEL_8;
  }
LABEL_9:
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
LABEL_10:
  uint64_t v26 = v25;
  if (!a6)
  {

    goto LABEL_14;
  }
  uint64_t v27 = sub_1B63C93CC();
  objc_msgSend_setObject_forKeyedSubscript_(v26, v28, v27, *MEMORY[0x1E4F3A4D0]);
  v36 = (void *)sub_1B6445900((uint64_t)a3, v29, v30, v31, v32, v33, v34, v35);
  uint64_t v40 = objc_msgSend_commandQueue(v36, v37, v38, v39);
  objc_msgSend_setObject_forKeyedSubscript_(v26, v41, v40, *MEMORY[0x1E4F3A4D8]);
  objc_msgSend_setObject_forKeyedSubscript_(v26, v42, MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F3A4C8]);
  Value = objc_msgSend_rendererWithMTLTexture_options_(MEMORY[0x1E4F39C60], v43, (uint64_t)a6, (uint64_t)v26);
  objc_msgSend_setDelegate_(Value, v44, (uint64_t)self, v45);

  if (Value) {
    CFDictionarySetValue(self->_registry, a4, Value);
  }
LABEL_15:
  id v46 = Value;
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E9DDAFD0);
  return Value;
}

- (void)removeSourceRenderersForSource:(id)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1E9DDAFD0);
  CFDictionaryRemoveValue(self->_registry, a3);

  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1E9DDAFD0);
}

@end