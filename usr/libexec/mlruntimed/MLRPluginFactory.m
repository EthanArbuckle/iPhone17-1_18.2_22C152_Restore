@interface MLRPluginFactory
- (MLRPluginFactory)initWithBundleRegistry:(id)a3;
- (id)pluginWithBundleIdentifier:(id)a3 errorOut:(id *)a4;
@end

@implementation MLRPluginFactory

- (MLRPluginFactory)initWithBundleRegistry:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)MLRPluginFactory;
    v6 = [(MLRPluginFactory *)&v10 init];
    v7 = v6;
    if (v6) {
      objc_storeStrong((id *)&v6->_bundleRegistry, a3);
    }
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)pluginWithBundleIdentifier:(id)a3 errorOut:(id *)a4
{
  id v5 = a3;
  id v6 = [(DESBundleRegistryManaging *)self->_bundleRegistry pluginTypeForBundleId:v5];
  if (v6 == (id)4)
  {
    v7 = &kRestrictedExtensionPointName;
    goto LABEL_7;
  }
  if (v6 == (id)3)
  {
    v7 = &kHighMemoryExtensionPointName;
    goto LABEL_7;
  }
  if (v6 == (id)2)
  {
    v7 = &kLowMemoryExtensionPointName;
LABEL_7:
    v8 = +[MLRExtensionPluginManager pluginManagerForBundleIdentifier:v5 endpoint:*v7];
    goto LABEL_11;
  }
  v9 = +[DESLogging coreChannel];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_100010050((uint64_t)v5, v9);
  }

  v8 = 0;
LABEL_11:

  return v8;
}

- (void).cxx_destruct
{
}

@end