@interface _UIConcreteRemoteViewService
- (BOOL)multipleInstances;
- (BOOL)overridesHostAppearance;
- (NSExtension)extension;
- (PKPlugIn)plugin;
- (_UIConcreteRemoteViewService)initWithExtension:(id)a3 andContextToken:(id)a4;
- (id)contextToken;
- (id)identifier;
- (id)multipleInstanceUUID;
- (id)viewControllerClassName;
- (id)xpcServiceNameRoot;
- (int)processIdentifier;
- (void)beginUsing:(id)a3;
- (void)endUsing:(id)a3;
- (void)setExtension:(id)a3;
- (void)setPlugin:(id)a3;
- (void)updateOverridesHostAppearance;
@end

@implementation _UIConcreteRemoteViewService

- (_UIConcreteRemoteViewService)initWithExtension:(id)a3 andContextToken:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_UIConcreteRemoteViewService;
  v9 = [(_UIRemoteViewService *)&v14 _init];
  v10 = (_UIConcreteRemoteViewService *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 3, a3);
    uint64_t v11 = [v8 copy];
    contextToken = v10->_contextToken;
    v10->_contextToken = (NSUUID *)v11;

    [(_UIConcreteRemoteViewService *)v10 updateOverridesHostAppearance];
  }

  return v10;
}

- (void)updateOverridesHostAppearance
{
  id v6 = [(_UIConcreteRemoteViewService *)self plugin];
  v3 = [v6 bundleInfoDictionary];
  v4 = [v3 objectForKeyedSubscript:@"NSExtension"];
  v5 = [v4 objectForKeyedSubscript:@"NSExtensionOverridesHostUIAppearance"];
  self->_overridesHostAppearance = [v5 BOOLValue];
}

- (void)setPlugin:(id)a3
{
  [(NSExtension *)self->_extension _setPlugIn:a3];
  [(_UIConcreteRemoteViewService *)self updateOverridesHostAppearance];
}

- (PKPlugIn)plugin
{
  return (PKPlugIn *)[(NSExtension *)self->_extension _plugIn];
}

- (id)identifier
{
  v2 = [(_UIConcreteRemoteViewService *)self plugin];
  v3 = [v2 identifier];

  return v3;
}

- (id)xpcServiceNameRoot
{
  v3 = [(_UIConcreteRemoteViewService *)self extension];
  v4 = [v3 _extensionBundle];
  v5 = [v4 bundleIdentifier];

  if (!v5)
  {
    id v6 = [(_UIConcreteRemoteViewService *)self plugin];
    v5 = [v6 identifier];
  }
  return v5;
}

- (BOOL)multipleInstances
{
  v2 = [(_UIConcreteRemoteViewService *)self plugin];
  v3 = [v2 bundleInfoDictionary];
  v4 = [v3 objectForKeyedSubscript:@"XPCService"];
  v5 = [v4 objectForKeyedSubscript:@"_MultipleInstances"];
  char v6 = [v5 BOOLValue];

  return v6;
}

- (id)multipleInstanceUUID
{
  v2 = [(_UIConcreteRemoteViewService *)self plugin];
  v3 = [v2 multipleInstanceUUID];

  return v3;
}

- (int)processIdentifier
{
  v3 = [(_UIConcreteRemoteViewService *)self extension];
  v4 = [(_UIConcreteRemoteViewService *)self contextToken];
  int v5 = [v3 pidForRequestIdentifier:v4];

  return v5;
}

- (id)viewControllerClassName
{
  v3 = [(_UIConcreteRemoteViewService *)self plugin];
  v4 = [v3 bundleInfoDictionary];
  int v5 = [v4 objectForKeyedSubscript:@"NSExtension"];
  char v6 = [v5 objectForKeyedSubscript:@"NSExtensionPrincipalClass"];
  id v7 = (void *)[v6 copy];
  id v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    v10 = [(_UIConcreteRemoteViewService *)self plugin];
    uint64_t v11 = [v10 bundleInfoDictionary];
    v12 = [v11 objectForKeyedSubscript:@"NSExtensionPrincipalClass"];
    id v9 = (id)[v12 copy];
  }
  return v9;
}

- (void)beginUsing:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIConcreteRemoteViewService *)self extension];
  [v5 _safelyBeginUsing:v4];
}

- (void)endUsing:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIConcreteRemoteViewService *)self extension];
  [v5 _safelyEndUsing:v4];
}

- (id)contextToken
{
  return self->_contextToken;
}

- (BOOL)overridesHostAppearance
{
  return self->_overridesHostAppearance;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_contextToken, 0);
}

@end