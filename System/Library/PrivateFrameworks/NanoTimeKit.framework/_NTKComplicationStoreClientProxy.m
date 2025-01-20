@interface _NTKComplicationStoreClientProxy
- (_NTKComplicationStoreClientProxy)initWithWeakProxy:(id)a3;
- (void)loadFullCollectionWithLocalizableSampleTemplates:(id)a3 complicationDescriptors:(id)a4 seqId:(id)a5;
- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4 seqId:(id)a5;
- (void)updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4 seqId:(id)a5;
- (void)updateSampleTemplateReference:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6 seqId:(id)a7;
@end

@implementation _NTKComplicationStoreClientProxy

- (_NTKComplicationStoreClientProxy)initWithWeakProxy:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_NTKComplicationStoreClientProxy;
  v5 = [(_NTKComplicationStoreClientProxy *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_proxy, v4);
  }

  return v6;
}

- (void)loadFullCollectionWithLocalizableSampleTemplates:(id)a3 complicationDescriptors:(id)a4 seqId:(id)a5
{
  p_proxy = &self->_proxy;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  [WeakRetained loadFullCollectionWithLocalizableSampleTemplates:v10 complicationDescriptors:v9 seqId:v8];
}

- (void)updateSampleTemplateReference:(id)a3 forClientIdentifier:(id)a4 descriptor:(id)a5 family:(int64_t)a6 seqId:(id)a7
{
  p_proxy = &self->_proxy;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  [WeakRetained updateSampleTemplateReference:v15 forClientIdentifier:v14 descriptor:v13 family:a6 seqId:v12];
}

- (void)updateComplicationDescriptors:(id)a3 forClientIdentifier:(id)a4 seqId:(id)a5
{
  p_proxy = &self->_proxy;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  [WeakRetained updateComplicationDescriptors:v10 forClientIdentifier:v9 seqId:v8];
}

- (void)removeComplicationSampleTemplatesForClientIdentifier:(id)a3 descriptor:(id)a4 seqId:(id)a5
{
  p_proxy = &self->_proxy;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_proxy);
  [WeakRetained removeComplicationSampleTemplatesForClientIdentifier:v10 descriptor:v9 seqId:v8];
}

- (void).cxx_destruct
{
}

@end