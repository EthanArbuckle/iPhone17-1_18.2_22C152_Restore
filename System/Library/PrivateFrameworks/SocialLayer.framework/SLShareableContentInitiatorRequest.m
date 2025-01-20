@interface SLShareableContentInitiatorRequest
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (CKContainerSetupInfo)containerSetupInfo;
- (NSString)description;
- (NSURL)fileURL;
- (SLShareableContentInitiatorRequest)initWithBSXPCCoder:(id)a3;
- (SLShareableContentInitiatorRequest)initWithCoder:(id)a3;
- (SLShareableContentInitiatorRequest)initWithCollaborationMetadata:(id)a3;
- (SLShareableContentInitiatorRequest)initWithContainerSetupInfo:(id)a3;
- (SLShareableContentInitiatorRequest)initWithFileURL:(id)a3;
- (SLShareableContentInitiatorRequest)initWithFileURL:(id)a3 containerSetupInfo:(id)a4 collaborationMetadata:(id)a5;
- (_SWCollaborationMetadata)collaborationMetadata;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SLShareableContentInitiatorRequest

- (SLShareableContentInitiatorRequest)initWithFileURL:(id)a3
{
  return [(SLShareableContentInitiatorRequest *)self initWithFileURL:a3 containerSetupInfo:0 collaborationMetadata:0];
}

- (SLShareableContentInitiatorRequest)initWithContainerSetupInfo:(id)a3
{
  return [(SLShareableContentInitiatorRequest *)self initWithFileURL:0 containerSetupInfo:a3 collaborationMetadata:0];
}

- (SLShareableContentInitiatorRequest)initWithCollaborationMetadata:(id)a3
{
  return [(SLShareableContentInitiatorRequest *)self initWithFileURL:0 containerSetupInfo:0 collaborationMetadata:a3];
}

- (SLShareableContentInitiatorRequest)initWithFileURL:(id)a3 containerSetupInfo:(id)a4 collaborationMetadata:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SLShareableContentInitiatorRequest;
  v12 = [(SLShareableContentInitiatorRequest *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fileURL, a3);
    objc_storeStrong((id *)&v13->_containerSetupInfo, a4);
    objc_storeStrong((id *)&v13->_collaborationMetadata, a5);
  }

  return v13;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p", objc_opt_class(), self];
  v4 = [(SLShareableContentInitiatorRequest *)self fileURL];
  [v3 appendFormat:@" fileURL=%@", v4];

  v5 = [(SLShareableContentInitiatorRequest *)self containerSetupInfo];
  [v3 appendFormat:@" containerSetupInfo=%@", v5];

  v6 = [(SLShareableContentInitiatorRequest *)self collaborationMetadata];
  [v3 appendFormat:@" collaborationMetadata=%@", v6];

  [v3 appendString:@">"];
  v7 = (void *)[v3 copy];

  return (NSString *)v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLShareableContentInitiatorRequest)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_fileURL);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id CKContainerSetupInfoClass_0 = getCKContainerSetupInfoClass_0();
  id v9 = NSStringFromSelector(sel_containerSetupInfo);
  id v10 = [v4 decodeObjectOfClass:CKContainerSetupInfoClass_0 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_collaborationMetadata);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  v14 = [(SLShareableContentInitiatorRequest *)self initWithFileURL:v7 containerSetupInfo:v10 collaborationMetadata:v13];
  return v14;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLShareableContentInitiatorRequest *)self fileURL];
  v6 = NSStringFromSelector(sel_fileURL);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(SLShareableContentInitiatorRequest *)self containerSetupInfo];
  v8 = NSStringFromSelector(sel_containerSetupInfo);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(SLShareableContentInitiatorRequest *)self collaborationMetadata];
  id v9 = NSStringFromSelector(sel_collaborationMetadata);
  [v4 encodeObject:v10 forKey:v9];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentInitiatorRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = NSStringFromSelector(sel_fileURL);
  v7 = [v4 decodeObjectOfClass:v5 forKey:v6];

  id CKContainerSetupInfoClass_0 = getCKContainerSetupInfoClass_0();
  id v9 = NSStringFromSelector(sel_containerSetupInfo);
  id v10 = [v4 decodeObjectOfClass:CKContainerSetupInfoClass_0 forKey:v9];

  uint64_t v11 = objc_opt_class();
  v12 = NSStringFromSelector(sel_collaborationMetadata);
  v13 = [v4 decodeObjectOfClass:v11 forKey:v12];

  v14 = [(SLShareableContentInitiatorRequest *)self initWithFileURL:v7 containerSetupInfo:v10 collaborationMetadata:v13];
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLShareableContentInitiatorRequest *)self fileURL];
  v6 = NSStringFromSelector(sel_fileURL);
  [v4 encodeObject:v5 forKey:v6];

  v7 = [(SLShareableContentInitiatorRequest *)self containerSetupInfo];
  v8 = NSStringFromSelector(sel_containerSetupInfo);
  [v4 encodeObject:v7 forKey:v8];

  id v10 = [(SLShareableContentInitiatorRequest *)self collaborationMetadata];
  id v9 = NSStringFromSelector(sel_collaborationMetadata);
  [v4 encodeObject:v10 forKey:v9];
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end