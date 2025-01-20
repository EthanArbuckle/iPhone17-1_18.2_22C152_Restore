@interface ExtensionItem
+ (id)itemWithExtension:(id)a3 activationStyle:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)wasEverActivated;
- (id)activate;
- (id)name;
- (unint64_t)hash;
- (void)deactivate;
- (void)dealloc;
- (void)invalidate;
@end

@implementation ExtensionItem

+ (id)itemWithExtension:(id)a3 activationStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = objc_alloc_init((Class)a1);
  v8 = (void *)v7[1];
  v7[1] = v6;

  v7[4] = a4;
  return v7;
}

- (void)dealloc
{
  [(ExtensionItem *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)ExtensionItem;
  [(ExtensionItem *)&v3 dealloc];
}

- (id)name
{
  objc_super v3 = [(_EXExtensionIdentity *)self->_extension localizedName];
  if ([(ExtensionItem *)self wasEverActivated])
  {
    uint64_t v4 = [v3 stringByAppendingString:@" 🟢"];

    objc_super v3 = (void *)v4;
  }
  return v3;
}

- (id)activate
{
  if (!MEMORY[0x1D9433950]("-[ExtensionItem activate]", a2))
  {
    id v6 = 0;
    goto LABEL_14;
  }
  viewController = self->_viewController;
  if (!viewController)
  {
    int64_t activationStyle = self->_activationStyle;
    if (activationStyle)
    {
      if (activationStyle != 1)
      {
        v7 = 0;
        id v8 = 0;
        goto LABEL_10;
      }
      v5 = (id *)MEMORY[0x1E4F92838];
    }
    else
    {
      v5 = (id *)MEMORY[0x1E4F92840];
    }
    v7 = (objc_class *)self;
    id v8 = *v5;
LABEL_10:
    uint64_t v9 = *MEMORY[0x1E4F92790];
    v10 = [MEMORY[0x1E4F924B8] temporaryPathForRole:*MEMORY[0x1E4F92790]];
    tmpPoster = self->_tmpPoster;
    self->_tmpPoster = v10;

    v12 = (void *)MEMORY[0x1E4F924C8];
    v13 = [(_EXExtensionIdentity *)self->_extension bundleIdentifier];
    v14 = [MEMORY[0x1E4F29128] UUID];
    v15 = [v12 configurationIdentityWithProvider:v13 identifier:0 role:v9 posterUUID:v14 version:1 supplement:0];

    v16 = (void *)MEMORY[0x1E4F924D0];
    v17 = [(BSInvalidatable *)self->_tmpPoster contentsURL];
    v18 = [v16 pathWithContainerURL:v17 identity:v15];

    [v18 ensureContentsURLIsReachableAndReturnError:0];
    v19 = (void *)MEMORY[0x1E4F924A8];
    extension = self->_extension;
    v21 = [MEMORY[0x1E4F29128] UUID];
    v22 = [v19 extensionInstanceForIdentity:extension instanceIdentifier:v21];

    v23 = (PRSceneViewController *)[[v7 alloc] initWithProvider:v22 contents:v18];
    v24 = self->_viewController;
    self->_viewController = v23;

    if (self->_activationStyle == 1) {
      [(PRSceneViewController *)self->_viewController setModalPresentationStyle:0];
    }

    viewController = self->_viewController;
  }
  id v6 = viewController;
LABEL_14:
  return v6;
}

- (void)deactivate
{
}

- (void)invalidate
{
  [(ExtensionItem *)self deactivate];
  [(PRSceneViewController *)self->_viewController invalidate];
  viewController = self->_viewController;
  self->_viewController = 0;

  [(BSInvalidatable *)self->_tmpPoster invalidate];
  tmpPoster = self->_tmpPoster;
  self->_tmpPoster = 0;
}

- (BOOL)wasEverActivated
{
  return self->_viewController != 0;
}

- (unint64_t)hash
{
  v2 = [(_EXExtensionIdentity *)self->_extension uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  extension = self->_extension;
  uint64_t v4 = a3;
  v5 = [(_EXExtensionIdentity *)extension uniqueIdentifier];
  id v6 = (void *)v4[1];

  v7 = [v6 uniqueIdentifier];
  LOBYTE(v6) = [v5 isEqual:v7];

  return (char)v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tmpPoster, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end