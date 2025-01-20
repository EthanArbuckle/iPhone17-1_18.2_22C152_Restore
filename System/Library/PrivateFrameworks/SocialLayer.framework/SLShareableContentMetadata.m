@interface SLShareableContentMetadata
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (LPLinkMetadata)metadata;
- (NSArray)representations;
- (NSPersonNameComponents)initiatorNameComponents;
- (NSString)bundleIdentifier;
- (NSString)description;
- (NSString)initiatorHandle;
- (NSString)sceneIdentifier;
- (NSURL)highlightURL;
- (SLShareableContentMetadata)initWithBSXPCCoder:(id)a3;
- (SLShareableContentMetadata)initWithCoder:(id)a3;
- (SLShareableContentMetadata)initWithSceneIdentifier:(id)a3 bundleIdentifier:(id)a4 representations:(id)a5 metadata:(id)a6 highlightURL:(id)a7;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setInitiatorHandle:(id)a3;
- (void)setInitiatorNameComponents:(id)a3;
@end

@implementation SLShareableContentMetadata

- (SLShareableContentMetadata)initWithSceneIdentifier:(id)a3 bundleIdentifier:(id)a4 representations:(id)a5 metadata:(id)a6 highlightURL:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v23.receiver = self;
  v23.super_class = (Class)SLShareableContentMetadata;
  v18 = [(SLShareableContentMetadata *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_sceneIdentifier, a3);
    objc_storeStrong((id *)&v19->_bundleIdentifier, a4);
    uint64_t v20 = [v15 copy];
    representations = v19->_representations;
    v19->_representations = (NSArray *)v20;

    objc_storeStrong((id *)&v19->_metadata, a6);
    objc_storeStrong((id *)&v19->_highlightURL, a7);
  }

  return v19;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(SLShareableContentMetadata *)self sceneIdentifier];
  [v3 appendFormat:@" sceneIdentifier=%@", v4];

  v5 = [(SLShareableContentMetadata *)self bundleIdentifier];
  [v3 appendFormat:@" bundleIdentifier=%@", v5];

  v6 = [(SLShareableContentMetadata *)self representations];
  [v3 appendFormat:@" representations=%@", v6];

  v7 = [(SLShareableContentMetadata *)self highlightURL];
  [v3 appendFormat:@" highlightURL=%@", v7];

  [v3 appendString:@">"];
  v8 = (void *)[v3 copy];

  return (NSString *)v8;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLShareableContentMetadata)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_sceneIdentifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_bundleIdentifier);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  id v13 = NSStringFromSelector(sel_representations);
  id v14 = [v4 decodeCollectionOfClass:v11 containingClass:v12 forKey:v13];

  uint64_t v15 = objc_opt_class();
  id v16 = NSStringFromSelector(sel_metadata);
  id v17 = [v4 decodeObjectOfClass:v15 forKey:v16];

  v18 = [MEMORY[0x1E4F30A78] metadataWithDataRepresentation:v17];
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = NSStringFromSelector(sel_highlightURL);
  v21 = [v4 decodeObjectOfClass:v19 forKey:v20];

  v22 = [(SLShareableContentMetadata *)self initWithSceneIdentifier:v7 bundleIdentifier:v10 representations:v14 metadata:v18 highlightURL:v21];
  return v22;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLShareableContentMetadata *)self sceneIdentifier];
  v6 = NSStringFromSelector(sel_sceneIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(SLShareableContentMetadata *)self bundleIdentifier];
  uint64_t v8 = NSStringFromSelector(sel_bundleIdentifier);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(SLShareableContentMetadata *)self representations];
  v10 = NSStringFromSelector(sel_representations);
  [v4 encodeCollection:v9 forKey:v10];

  uint64_t v11 = [(SLShareableContentMetadata *)self metadata];
  uint64_t v12 = [v11 dataRepresentation];
  id v13 = NSStringFromSelector(sel_metadata);
  [v4 encodeObject:v12 forKey:v13];

  id v15 = [(SLShareableContentMetadata *)self highlightURL];
  id v14 = NSStringFromSelector(sel_highlightURL);
  [v4 encodeObject:v15 forKey:v14];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_sceneIdentifier);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  uint64_t v8 = objc_opt_class();
  v9 = NSStringFromSelector(sel_bundleIdentifier);
  v10 = [v4 decodeObjectOfClass:v8 forKey:v9];

  uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  id v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  id v14 = NSStringFromSelector(sel_representations);
  id v15 = [v4 decodeObjectOfClasses:v13 forKey:v14];

  uint64_t v16 = objc_opt_class();
  id v17 = NSStringFromSelector(sel_metadata);
  v18 = [v4 decodeObjectOfClass:v16 forKey:v17];

  uint64_t v19 = [MEMORY[0x1E4F30A78] metadataWithDataRepresentation:v18];
  uint64_t v20 = objc_opt_class();
  v21 = NSStringFromSelector(sel_highlightURL);
  v22 = [v4 decodeObjectOfClass:v20 forKey:v21];

  objc_super v23 = [(SLShareableContentMetadata *)self initWithSceneIdentifier:v7 bundleIdentifier:v10 representations:v15 metadata:v19 highlightURL:v22];
  uint64_t v24 = objc_opt_class();
  v25 = NSStringFromSelector(sel_initiatorHandle);
  v26 = [v4 decodeObjectOfClass:v24 forKey:v25];
  [(SLShareableContentMetadata *)v23 setInitiatorHandle:v26];

  uint64_t v27 = objc_opt_class();
  v28 = NSStringFromSelector(sel_initiatorNameComponents);
  v29 = [v4 decodeObjectOfClass:v27 forKey:v28];

  [(SLShareableContentMetadata *)v23 setInitiatorNameComponents:v29];
  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLShareableContentMetadata *)self sceneIdentifier];
  v6 = NSStringFromSelector(sel_sceneIdentifier);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(SLShareableContentMetadata *)self bundleIdentifier];
  uint64_t v8 = NSStringFromSelector(sel_bundleIdentifier);
  [v4 encodeObject:v7 forKey:v8];

  v9 = [(SLShareableContentMetadata *)self representations];
  v10 = NSStringFromSelector(sel_representations);
  [v4 encodeObject:v9 forKey:v10];

  uint64_t v11 = [(SLShareableContentMetadata *)self metadata];
  uint64_t v12 = [v11 dataRepresentation];
  id v13 = NSStringFromSelector(sel_metadata);
  [v4 encodeObject:v12 forKey:v13];

  id v14 = [(SLShareableContentMetadata *)self highlightURL];
  id v15 = NSStringFromSelector(sel_highlightURL);
  [v4 encodeObject:v14 forKey:v15];

  uint64_t v16 = [(SLShareableContentMetadata *)self initiatorHandle];
  id v17 = NSStringFromSelector(sel_initiatorHandle);
  [v4 encodeObject:v16 forKey:v17];

  id v19 = [(SLShareableContentMetadata *)self initiatorNameComponents];
  v18 = NSStringFromSelector(sel_initiatorNameComponents);
  [v4 encodeObject:v19 forKey:v18];
}

- (NSString)sceneIdentifier
{
  return self->_sceneIdentifier;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSArray)representations
{
  return self->_representations;
}

- (LPLinkMetadata)metadata
{
  return self->_metadata;
}

- (NSURL)highlightURL
{
  return self->_highlightURL;
}

- (NSString)initiatorHandle
{
  return self->_initiatorHandle;
}

- (void)setInitiatorHandle:(id)a3
{
}

- (NSPersonNameComponents)initiatorNameComponents
{
  return self->_initiatorNameComponents;
}

- (void)setInitiatorNameComponents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initiatorNameComponents, 0);
  objc_storeStrong((id *)&self->_initiatorHandle, 0);
  objc_storeStrong((id *)&self->_highlightURL, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_representations, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
}

@end