@interface SFAirDropTransferTestingSnapshot
+ (BOOL)supportsSecureCoding;
+ (id)loadSnapshotFromURL:(id)a3 error:(id *)a4;
+ (id)writeSnapshotForTransfer:(id)a3 initialInfo:(id)a4 name:(id)a5 error:(id *)a6;
- (BOOL)writeToURL:(id)a3 error:(id *)a4;
- (NSData)transferFileIcon;
- (NSData)transferSmallFileIcon;
- (NSDictionary)initialInfo;
- (NSSet)nodeContactIdentifiers;
- (NSString)nodeContactIdentifier;
- (NSString)nodeDisplayName;
- (NSString)nodeIdentifier;
- (NSString)nodeRealName;
- (SFAirDropTransfer)transfer;
- (SFAirDropTransferTestingSnapshot)initWithCoder:(id)a3;
- (SFAirDropTransferTestingSnapshot)initWithTransfer:(id)a3 initialInfo:(id)a4;
- (void)encodeWithCoder:(id)a3;
- (void)setInitialInfo:(id)a3;
- (void)setNodeContactIdentifier:(id)a3;
- (void)setNodeContactIdentifiers:(id)a3;
- (void)setNodeDisplayName:(id)a3;
- (void)setNodeIdentifier:(id)a3;
- (void)setNodeRealName:(id)a3;
- (void)setTransfer:(id)a3;
- (void)setTransferFileIcon:(id)a3;
- (void)setTransferSmallFileIcon:(id)a3;
@end

@implementation SFAirDropTransferTestingSnapshot

+ (id)writeSnapshotForTransfer:(id)a3 initialInfo:(id)a4 name:(id)a5 error:(id *)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = [[SFAirDropTransferTestingSnapshot alloc] initWithTransfer:v11 initialInfo:v10];

  v13 = NSString;
  v14 = [v11 identifier];

  v15 = [v13 stringWithFormat:@"%@_%@", v14, v9];

  v16 = [MEMORY[0x1E4F28CB8] defaultManager];
  v17 = [v16 temporaryDirectory];
  v18 = [v17 URLByAppendingPathComponent:v15];

  id v25 = 0;
  BOOL v19 = [(SFAirDropTransferTestingSnapshot *)v12 writeToURL:v18 error:&v25];
  id v20 = v25;
  v21 = airdrop_log();
  BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
  if (v19)
  {
    if (v22)
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v18;
      _os_log_impl(&dword_1A5389000, v21, OS_LOG_TYPE_DEFAULT, "Write AirDrop snapshot SUCCESS {url: %@}", buf, 0xCu);
    }

    id v23 = v18;
  }
  else
  {
    if (v22)
    {
      *(_DWORD *)buf = 138412290;
      id v27 = v20;
      _os_log_impl(&dword_1A5389000, v21, OS_LOG_TYPE_DEFAULT, "Write AirDrop snapshot FAIL {error: %@}", buf, 0xCu);
    }

    id v23 = 0;
    if (a6) {
      *a6 = v20;
    }
  }

  return v23;
}

+ (id)loadSnapshotFromURL:(id)a3 error:(id *)a4
{
  v5 = (objc_class *)MEMORY[0x1E4F1C9B8];
  id v6 = a3;
  v7 = (void *)[[v5 alloc] initWithContentsOfURL:v6];

  if (v7)
  {
    v8 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v7 error:a4];
    id v9 = v8;
    if (v8) {
      id v10 = v8;
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropTransferTestingSnapshot)initWithTransfer:(id)a3 initialInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)SFAirDropTransferTestingSnapshot;
  id v9 = [(SFAirDropTransferTestingSnapshot *)&v28 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_transfer, a3);
    if (v8)
    {
      id v11 = [v8 objectForKeyedSubscript:@"SenderNode"];

      if (v11)
      {
        CFStringRef v12 = SFNodeCopyDisplayName((uint64_t)v11);
        nodeDisplayName = v10->_nodeDisplayName;
        v10->_nodeDisplayName = &v12->isa;

        CFStringRef v14 = SFNodeCopyRealName((uint64_t)v11);
        nodeRealName = v10->_nodeRealName;
        v10->_nodeRealName = &v14->isa;

        CFSetRef v16 = SFNodeCopyContactIdentifiers((uint64_t)v11);
        nodeContactIdentifiers = v10->_nodeContactIdentifiers;
        v10->_nodeContactIdentifiers = (NSSet *)v16;

        CFStringRef v18 = SFNodeCopyContactIdentifier((uint64_t)v11);
        nodeContactIdentifier = v10->_nodeContactIdentifier;
        v10->_nodeContactIdentifier = &v18->isa;
      }
      id v20 = [v8 objectForKeyedSubscript:@"FileIcon"];

      v21 = [v8 objectForKeyedSubscript:@"SmallFileIcon"];

      if (v20)
      {
        TransferDataWithCGImage = createTransferDataWithCGImage((uint64_t)v20);
        transferFileIcon = v10->_transferFileIcon;
        v10->_transferFileIcon = (NSData *)TransferDataWithCGImage;
      }
      else
      {
        transferFileIcon = v10->_transferFileIcon;
        v10->_transferFileIcon = 0;
      }

      if (v21)
      {
        v24 = createTransferDataWithCGImage((uint64_t)v21);
        transferSmallFileIcon = v10->_transferSmallFileIcon;
        v10->_transferSmallFileIcon = (NSData *)v24;
      }
      else
      {
        transferSmallFileIcon = v10->_transferSmallFileIcon;
        v10->_transferSmallFileIcon = 0;
      }

      objc_storeStrong((id *)&v10->_initialInfo, a4);
    }
    v26 = v10;
  }

  return v10;
}

- (SFAirDropTransferTestingSnapshot)initWithCoder:(id)a3
{
  v38[6] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SFAirDropTransferTestingSnapshot;
  id v5 = [(SFAirDropTransferTestingSnapshot *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transfer"];
    id v7 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v6;

    id v8 = (void *)MEMORY[0x1E4F1CAD0];
    v38[0] = objc_opt_class();
    v38[1] = objc_opt_class();
    v38[2] = objc_opt_class();
    v38[3] = objc_opt_class();
    v38[4] = objc_opt_class();
    v38[5] = objc_opt_class();
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:6];
    id v10 = [v8 setWithArray:v9];
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"initialInfo"];
    CFStringRef v12 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nodeDisplayName"];
    CFStringRef v14 = (void *)*((void *)v5 + 3);
    *((void *)v5 + 3) = v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nodeRealName"];
    CFSetRef v16 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nodeIdentifier"];
    CFStringRef v18 = (void *)*((void *)v5 + 5);
    *((void *)v5 + 5) = v17;

    uint64_t v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nodeContactIdentifier"];
    id v20 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v19;

    v21 = (void *)MEMORY[0x1E4F1CAD0];
    v37[0] = objc_opt_class();
    v37[1] = objc_opt_class();
    BOOL v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
    id v23 = [v21 setWithArray:v22];
    uint64_t v24 = [v4 decodeObjectOfClasses:v23 forKey:@"nodeContactIdentifiers"];
    id v25 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferFileIcon"];
    id v27 = (void *)*((void *)v5 + 8);
    *((void *)v5 + 8) = v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"transferSmallFileIcon"];
    v29 = (void *)*((void *)v5 + 9);
    *((void *)v5 + 9) = v28;

    v30 = (void *)*((void *)v5 + 2);
    if (v30)
    {
      v31 = (void *)[v30 mutableCopy];
      if (*((void *)v5 + 3) && *((void *)v5 + 4))
      {
        uint64_t v32 = SFNodeCreate();
        SFNodeSetContactIdentifier(v32, *((const __CFString **)v5 + 7));
        SFNodeSetContactIdentifiers(v32, *((const __CFSet **)v5 + 6));
        [v31 setObject:v32 forKeyedSubscript:@"SenderNode"];
      }
      if (*((void *)v5 + 8)) {
        [v31 setObject:createTransferCGImageWithData() forKeyedSubscript:@"FileIcon"];
      }
      if (*((void *)v5 + 9)) {
        [v31 setObject:createTransferCGImageWithData() forKeyedSubscript:@"SmallFileIcon"];
      }
      v33 = (void *)*((void *)v5 + 2);
      *((void *)v5 + 2) = v31;
    }
    id v34 = v5;
  }

  return (SFAirDropTransferTestingSnapshot *)v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  [v6 encodeObject:self->_transfer forKey:@"transfer"];
  [v6 encodeObject:self->_nodeDisplayName forKey:@"nodeDisplayName"];
  [v6 encodeObject:self->_nodeRealName forKey:@"nodeRealName"];
  [v6 encodeObject:self->_nodeIdentifier forKey:@"nodeIdentifier"];
  [v6 encodeObject:self->_nodeContactIdentifier forKey:@"nodeContactIdentifier"];
  [v6 encodeObject:self->_nodeContactIdentifiers forKey:@"nodeContactIdentifiers"];
  [v6 encodeObject:self->_transferFileIcon forKey:@"transferFileIcon"];
  [v6 encodeObject:self->_transferSmallFileIcon forKey:@"transferSmallFileIcon"];
  initialInfo = self->_initialInfo;
  if (initialInfo)
  {
    id v5 = (void *)[(NSDictionary *)initialInfo mutableCopy];
    [v5 setObject:0 forKeyedSubscript:@"SenderNode"];
    [v5 setObject:0 forKeyedSubscript:@"FileIcon"];
    [v5 setObject:0 forKeyedSubscript:@"SmallFileIcon"];
    [v6 encodeObject:v5 forKey:@"initialInfo"];
  }
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:self requiringSecureCoding:1 error:a4];
  id v8 = v7;
  if (v7) {
    char v9 = [v7 writeToURL:v6 options:1 error:a4];
  }
  else {
    char v9 = 0;
  }

  return v9;
}

- (SFAirDropTransfer)transfer
{
  return self->_transfer;
}

- (void)setTransfer:(id)a3
{
}

- (NSDictionary)initialInfo
{
  return self->_initialInfo;
}

- (void)setInitialInfo:(id)a3
{
}

- (NSString)nodeDisplayName
{
  return self->_nodeDisplayName;
}

- (void)setNodeDisplayName:(id)a3
{
}

- (NSString)nodeRealName
{
  return self->_nodeRealName;
}

- (void)setNodeRealName:(id)a3
{
}

- (NSString)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (void)setNodeIdentifier:(id)a3
{
}

- (NSSet)nodeContactIdentifiers
{
  return self->_nodeContactIdentifiers;
}

- (void)setNodeContactIdentifiers:(id)a3
{
}

- (NSString)nodeContactIdentifier
{
  return self->_nodeContactIdentifier;
}

- (void)setNodeContactIdentifier:(id)a3
{
}

- (NSData)transferFileIcon
{
  return self->_transferFileIcon;
}

- (void)setTransferFileIcon:(id)a3
{
}

- (NSData)transferSmallFileIcon
{
  return self->_transferSmallFileIcon;
}

- (void)setTransferSmallFileIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferSmallFileIcon, 0);
  objc_storeStrong((id *)&self->_transferFileIcon, 0);
  objc_storeStrong((id *)&self->_nodeContactIdentifier, 0);
  objc_storeStrong((id *)&self->_nodeContactIdentifiers, 0);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_storeStrong((id *)&self->_nodeRealName, 0);
  objc_storeStrong((id *)&self->_nodeDisplayName, 0);
  objc_storeStrong((id *)&self->_initialInfo, 0);

  objc_storeStrong((id *)&self->_transfer, 0);
}

@end