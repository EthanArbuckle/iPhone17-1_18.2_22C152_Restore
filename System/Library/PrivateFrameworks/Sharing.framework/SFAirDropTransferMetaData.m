@interface SFAirDropTransferMetaData
+ (BOOL)supportsSecureCoding;
- (BOOL)canAutoAccept;
- (BOOL)didAutoAccept;
- (BOOL)isEqual:(id)a3;
- (BOOL)isVerifiableIdentity;
- (BOOL)senderIsMe;
- (NSArray)rawFiles;
- (NSDictionary)itemsDescriptionAdvanced;
- (NSSet)items;
- (NSString)contactIdentifier;
- (NSString)itemsDescription;
- (NSString)senderBundleID;
- (NSString)senderCompositeName;
- (NSString)senderComputerName;
- (NSString)senderEmail;
- (NSString)senderEmailHash;
- (NSString)senderFirstName;
- (NSString)senderID;
- (NSString)senderLastName;
- (SFAirDropTransferMetaData)initWithCoder:(id)a3;
- (SFAirDropTransferMetaData)initWithInformation:(id)a3;
- (SFAirDropTransferMetaData)initWithTransferTypes:(int64_t)a3 canAutoAccept:(BOOL)a4 didAutoAccept:(BOOL)a5 verifiableIdentity:(BOOL)a6 senderIsMe:(BOOL)a7 contactIdentifier:(id)a8 senderBundleID:(id)a9 senderComputerName:(id)a10 senderEmail:(id)a11 senderEmailHash:(id)a12 senderCompositeName:(id)a13 senderFirstName:(id)a14 senderLastName:(id)a15 senderID:(id)a16 senderIcon:(id)a17 smallPreviewImage:(id)a18 previewImage:(id)a19 itemsDescription:(id)a20 itemsDescriptionAdvanced:(id)a21 items:(id)a22 rawFiles:(id)a23;
- (id)description;
- (id)previewImage;
- (id)senderIcon;
- (id)smallPreviewImage;
- (int64_t)transferTypes;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setDidAutoAccept:(BOOL)a3;
- (void)setItems:(id)a3;
- (void)setItemsDescription:(id)a3;
- (void)setTransferTypes:(int64_t)a3;
- (void)updateUsingCoder:(id)a3;
@end

@implementation SFAirDropTransferMetaData

- (SFAirDropTransferMetaData)initWithInformation:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)SFAirDropTransferMetaData;
  v5 = [(SFAirDropTransferMetaData *)&v58 init];
  v6 = v5;
  if (v5)
  {
    [(SFAirDropTransferMetaData *)v5 setTransferTypes:2];
    v7 = [v4 objectForKeyedSubscript:@"VerifiableIdentity"];
    v6->_verifiableIdentity = [v7 BOOLValue];

    v8 = [v4 objectForKeyedSubscript:@"SenderIsMe"];
    v6->_senderIsMe = [v8 BOOLValue];

    v9 = [v4 objectForKeyedSubscript:@"AutoAccept"];
    v50 = v6;
    v6->_canAutoAccept = [v9 BOOLValue];

    v51 = v4;
    v10 = [v4 objectForKeyedSubscript:@"Files"];
    id v53 = (id)objc_opt_new();
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id obj = v10;
    uint64_t v11 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v55;
      CFStringRef v14 = (const __CFString *)*MEMORY[0x1E4F224F8];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v55 != v13) {
            objc_enumerationMutation(obj);
          }
          v16 = (void *)[*(id *)(*((void *)&v54 + 1) + 8 * i) mutableCopy];
          v17 = [v16 objectForKeyedSubscript:@"FileType"];
          if (UTTypeIsDynamic(v17))
          {
            v18 = [v16 objectForKeyedSubscript:@"FileName"];
            v19 = [v18 pathExtension];
            PreferredIdentifierForTag = (__CFString *)UTTypeCreatePreferredIdentifierForTag(v14, v19, 0);

            [v16 setObject:PreferredIdentifierForTag forKeyedSubscript:@"FileType"];
          }
          [v53 addObject:v16];
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v12);
    }

    v6 = v50;
    objc_storeStrong((id *)&v50->_rawFiles, v53);
    id v4 = v51;
    v21 = [v51 objectForKeyedSubscript:@"ItemsDescription"];
    [(SFAirDropTransferMetaData *)v50 setItemsDescription:v21];

    uint64_t v22 = [v51 objectForKeyedSubscript:@"SmallFileIcon"];
    id smallPreviewImage = v50->_smallPreviewImage;
    v50->_id smallPreviewImage = (id)v22;

    uint64_t v24 = [v51 objectForKeyedSubscript:@"FileIcon"];
    id previewImage = v50->_previewImage;
    v50->_id previewImage = (id)v24;

    v26 = [v51 objectForKeyedSubscript:@"SenderIcon"];
    v27 = v26;
    if (v26)
    {
      CGImageRef CGImageWithDataOrURL = createCGImageWithDataOrURL(v26);
      id senderIcon = v50->_senderIcon;
      v50->_id senderIcon = CGImageWithDataOrURL;
    }
    else
    {
      id senderIcon = v50->_senderIcon;
      v50->_id senderIcon = 0;
    }

    uint64_t v30 = [v51 objectForKeyedSubscript:@"BundleID"];
    senderBundleID = v50->_senderBundleID;
    v50->_senderBundleID = (NSString *)v30;

    uint64_t v32 = [v51 objectForKeyedSubscript:@"SenderComputerName"];
    senderComputerName = v50->_senderComputerName;
    v50->_senderComputerName = (NSString *)v32;

    uint64_t v34 = [v51 objectForKeyedSubscript:@"SenderEmail"];
    senderEmail = v50->_senderEmail;
    v50->_senderEmail = (NSString *)v34;

    uint64_t v36 = [v51 objectForKeyedSubscript:@"SenderEmailHash"];
    senderEmailHash = v50->_senderEmailHash;
    v50->_senderEmailHash = (NSString *)v36;

    uint64_t v38 = [v51 objectForKeyedSubscript:@"SenderCompositeName"];
    senderCompositeName = v50->_senderCompositeName;
    v50->_senderCompositeName = (NSString *)v38;

    uint64_t v40 = [v51 objectForKeyedSubscript:@"SenderFirstName"];
    senderFirstName = v50->_senderFirstName;
    v50->_senderFirstName = (NSString *)v40;

    uint64_t v42 = [v51 objectForKeyedSubscript:@"SenderLastName"];
    senderLastName = v50->_senderLastName;
    v50->_senderLastName = (NSString *)v42;

    uint64_t v44 = [v51 objectForKeyedSubscript:@"SenderID"];
    senderID = v50->_senderID;
    v50->_senderID = (NSString *)v44;

    v46 = [v51 objectForKeyedSubscript:@"SenderNode"];

    if (v46)
    {
      CFStringRef v47 = SFNodeCopyContactIdentifier((uint64_t)v46);
      contactIdentifier = v50->_contactIdentifier;
      v50->_contactIdentifier = &v47->isa;
    }
  }

  return v6;
}

- (SFAirDropTransferMetaData)initWithTransferTypes:(int64_t)a3 canAutoAccept:(BOOL)a4 didAutoAccept:(BOOL)a5 verifiableIdentity:(BOOL)a6 senderIsMe:(BOOL)a7 contactIdentifier:(id)a8 senderBundleID:(id)a9 senderComputerName:(id)a10 senderEmail:(id)a11 senderEmailHash:(id)a12 senderCompositeName:(id)a13 senderFirstName:(id)a14 senderLastName:(id)a15 senderID:(id)a16 senderIcon:(id)a17 smallPreviewImage:(id)a18 previewImage:(id)a19 itemsDescription:(id)a20 itemsDescriptionAdvanced:(id)a21 items:(id)a22 rawFiles:(id)a23
{
  id v49 = a8;
  id v48 = a9;
  id v47 = a10;
  id v46 = a11;
  id v45 = a12;
  id v44 = a13;
  id v43 = a14;
  id v42 = a15;
  id v41 = a16;
  id v40 = a17;
  id v23 = a18;
  id v24 = a19;
  id v25 = a20;
  id v26 = a21;
  id v27 = a22;
  id v28 = a23;
  v50.receiver = self;
  v50.super_class = (Class)SFAirDropTransferMetaData;
  v29 = [(SFAirDropTransferMetaData *)&v50 init];
  uint64_t v30 = v29;
  if (v29)
  {
    v29->_transferTypes = a3;
    v29->_canAutoAccept = a4;
    v29->_didAutoAccept = a5;
    v29->_verifiableIdentity = a6;
    v29->_senderIsMe = a7;
    objc_storeStrong((id *)&v29->_contactIdentifier, a8);
    objc_storeStrong((id *)&v30->_senderBundleID, a9);
    objc_storeStrong((id *)&v30->_senderComputerName, a10);
    objc_storeStrong((id *)&v30->_senderEmail, a11);
    objc_storeStrong((id *)&v30->_senderEmailHash, a12);
    objc_storeStrong((id *)&v30->_senderCompositeName, a13);
    objc_storeStrong((id *)&v30->_senderFirstName, a14);
    objc_storeStrong((id *)&v30->_senderLastName, a15);
    objc_storeStrong((id *)&v30->_senderID, a16);
    objc_storeStrong(&v30->_senderIcon, a17);
    objc_storeStrong(&v30->_smallPreviewImage, a18);
    objc_storeStrong(&v30->_previewImage, a19);
    objc_storeStrong((id *)&v30->_itemsDescription, a20);
    objc_storeStrong((id *)&v30->_itemsDescriptionAdvanced, a21);
    objc_storeStrong((id *)&v30->_items, a22);
    objc_storeStrong((id *)&v30->_rawFiles, a23);
    v31 = v30;
  }

  return v30;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFAirDropTransferMetaData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SFAirDropTransferMetaData *)self init];
  v6 = v5;
  if (v5) {
    [(SFAirDropTransferMetaData *)v5 updateUsingCoder:v4];
  }

  return v6;
}

- (void)updateUsingCoder:(id)a3
{
  v80[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_transferTypes = [v4 decodeInt64ForKey:@"transferTypes"];
  self->_canAutoAccept = [v4 decodeBoolForKey:@"canAutoAccept"];
  self->_didAutoAccept = [v4 decodeBoolForKey:@"didAutoAccept"];
  self->_verifiableIdentity = [v4 decodeBoolForKey:@"verifiableIdentity"];
  self->_senderIsMe = [v4 decodeBoolForKey:@"senderIsMe"];
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v5;

  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderBundleID"];
  senderBundleID = self->_senderBundleID;
  self->_senderBundleID = v7;

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderComputerName"];
  senderComputerName = self->_senderComputerName;
  self->_senderComputerName = v9;

  uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderEmail"];
  senderEmail = self->_senderEmail;
  self->_senderEmail = v11;

  uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderEmailHash"];
  senderEmailHash = self->_senderEmailHash;
  self->_senderEmailHash = v13;

  v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderCompositeName"];
  senderCompositeName = self->_senderCompositeName;
  self->_senderCompositeName = v15;

  v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderFirstName"];
  senderFirstName = self->_senderFirstName;
  self->_senderFirstName = v17;

  v19 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderLastName"];
  senderLastName = self->_senderLastName;
  self->_senderLastName = v19;

  v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"senderID"];
  senderID = self->_senderID;
  self->_senderID = v21;

  CFDataRef v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_senderIconData"];
  CFDataRef v24 = v23;
  if (v23)
  {
    CGImageRef CGImageWithData = createCGImageWithData(v23);
    id senderIcon = self->_senderIcon;
    self->_id senderIcon = CGImageWithData;

    if (!self->_senderIcon)
    {
      id v27 = airdrop_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        -[SFAirDropTransferMetaData updateUsingCoder:](v27, v28, v29, v30, v31, v32, v33, v34);
      }
    }
  }
  CFDataRef v35 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_smallPreviewImageData"];

  if (v35)
  {
    CGImageRef v36 = createCGImageWithData(v35);
    id smallPreviewImage = self->_smallPreviewImage;
    self->_id smallPreviewImage = v36;

    if (!self->_smallPreviewImage)
    {
      uint64_t v38 = airdrop_log();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
        -[SFAirDropTransferMetaData updateUsingCoder:](v38, v39, v40, v41, v42, v43, v44, v45);
      }
    }
  }
  CFDataRef v46 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_previewImageData"];

  if (v46)
  {
    CGImageRef v47 = createCGImageWithData(v46);
    id previewImage = self->_previewImage;
    self->_id previewImage = v47;

    if (!self->_previewImage)
    {
      id v49 = airdrop_log();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR)) {
        -[SFAirDropTransferMetaData updateUsingCoder:](v49, v50, v51, v52, v53, v54, v55, v56);
      }
    }
  }
  long long v57 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"itemsDescription"];
  objc_super v58 = (NSString *)[v57 copy];
  itemsDescription = self->_itemsDescription;
  self->_itemsDescription = v58;

  uint64_t v60 = (void *)MEMORY[0x1E4F1CAD0];
  v80[0] = objc_opt_class();
  v80[1] = objc_opt_class();
  v80[2] = objc_opt_class();
  v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:3];
  v62 = [v60 setWithArray:v61];
  v63 = [v4 decodeObjectOfClasses:v62 forKey:@"itemsDescriptionAdvanced"];
  itemsDescriptionAdvanced = self->_itemsDescriptionAdvanced;
  self->_itemsDescriptionAdvanced = v63;

  v65 = (void *)MEMORY[0x1E4F1CAD0];
  v79[0] = objc_opt_class();
  v79[1] = objc_opt_class();
  v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:2];
  v67 = [v65 setWithArray:v66];
  v68 = [v4 decodeObjectOfClasses:v67 forKey:@"items"];
  items = self->_items;
  self->_items = v68;

  v70 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v75 = objc_opt_class();
  uint64_t v76 = objc_opt_class();
  uint64_t v77 = objc_opt_class();
  uint64_t v78 = objc_opt_class();
  v71 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v75 count:4];
  v72 = objc_msgSend(v70, "setWithArray:", v71, v75, v76, v77);
  v73 = [v4 decodeObjectOfClasses:v72 forKey:@"rawFiles"];
  rawFiles = self->_rawFiles;
  self->_rawFiles = v73;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  [v10 encodeInt64:self->_transferTypes forKey:@"transferTypes"];
  [v10 encodeBool:self->_canAutoAccept forKey:@"canAutoAccept"];
  [v10 encodeBool:self->_didAutoAccept forKey:@"didAutoAccept"];
  [v10 encodeBool:self->_verifiableIdentity forKey:@"verifiableIdentity"];
  [v10 encodeBool:self->_senderIsMe forKey:@"senderIsMe"];
  [v10 encodeObject:self->_contactIdentifier forKey:@"contactIdentifier"];
  [v10 encodeObject:self->_senderBundleID forKey:@"senderBundleID"];
  [v10 encodeObject:self->_senderComputerName forKey:@"senderComputerName"];
  [v10 encodeObject:self->_senderEmail forKey:@"senderEmail"];
  [v10 encodeObject:self->_senderEmailHash forKey:@"senderEmailHash"];
  [v10 encodeObject:self->_senderCompositeName forKey:@"senderCompositeName"];
  [v10 encodeObject:self->_senderFirstName forKey:@"senderFirstName"];
  [v10 encodeObject:self->_senderLastName forKey:@"senderLastName"];
  [v10 encodeObject:self->_senderID forKey:@"senderID"];
  id senderIcon = self->_senderIcon;
  if (senderIcon)
  {
    v5 = copyImageData(senderIcon, 0);
    [v10 encodeObject:v5 forKey:@"_senderIconData"];
  }
  id smallPreviewImage = self->_smallPreviewImage;
  if (smallPreviewImage)
  {
    v7 = copyImageData(smallPreviewImage, 0);
    [v10 encodeObject:v7 forKey:@"_smallPreviewImageData"];
  }
  id previewImage = self->_previewImage;
  if (previewImage)
  {
    v9 = copyImageData(previewImage, 0);
    [v10 encodeObject:v9 forKey:@"_previewImageData"];
  }
  [v10 encodeObject:self->_itemsDescription forKey:@"itemsDescription"];
  [v10 encodeObject:self->_itemsDescriptionAdvanced forKey:@"itemsDescriptionAdvanced"];
  [v10 encodeObject:self->_items forKey:@"items"];
  [v10 encodeObject:self->_rawFiles forKey:@"rawFiles"];
}

- (id)description
{
  objc_opt_class();
  uint64_t v13 = SFAirDropTransferTypesToString(self->_transferTypes);
  NSAppendPrintF();
  id v3 = 0;

  NSAppendPrintF();
  id v4 = v3;

  NSAppendPrintF();
  id v5 = v4;

  NSAppendPrintF();
  id v6 = v5;

  NSAppendPrintF();
  id v7 = v6;

  NSAppendPrintF();
  id v8 = v7;

  NSAppendPrintF();
  id v9 = v8;

  NSAppendPrintF();
  id v10 = v9;

  NSAppendPrintF();
  id v11 = v10;

  return v11;
}

- (unint64_t)hash
{
  int64_t v3 = [(SFAirDropTransferMetaData *)self transferTypes];
  id v4 = [(SFAirDropTransferMetaData *)self contactIdentifier];
  uint64_t v5 = [v4 hash] ^ v3;
  id v6 = [(SFAirDropTransferMetaData *)self senderID];
  uint64_t v7 = [v6 hash];
  id v8 = [(SFAirDropTransferMetaData *)self senderBundleID];
  unint64_t v9 = v5 ^ v7 ^ [v8 hash];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SFAirDropTransferMetaData *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v5 = [(SFAirDropTransferMetaData *)self hash];
      BOOL v6 = v5 == [(SFAirDropTransferMetaData *)v4 hash];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (void)setItemsDescription:(id)a3
{
  id v5 = a3;
  p_itemsDescription = &self->_itemsDescription;
  if (([v5 isEqual:self->_itemsDescription] & 1) == 0)
  {
    uint64_t v7 = SFStringIsJSON(v5);
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v8 = airdrop_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          -[SFAirDropTransferMetaData setItemsDescription:]((uint64_t)v7, v8);
        }

        objc_storeStrong((id *)&self->_itemsDescriptionAdvanced, v7);
        unint64_t v9 = [(NSDictionary *)self->_itemsDescriptionAdvanced objectForKeyedSubscript:@"SFAirDropActivitySubjectMain"];
        itemsDescription = self->_itemsDescription;
        self->_itemsDescription = v9;
      }
      else
      {
        itemsDescription = *p_itemsDescription;
        *p_itemsDescription = 0;
      }
    }
    else
    {
      objc_storeStrong((id *)&self->_itemsDescription, a3);
    }
  }
}

- (int64_t)transferTypes
{
  return self->_transferTypes;
}

- (void)setTransferTypes:(int64_t)a3
{
  self->_transferTypes = a3;
}

- (BOOL)canAutoAccept
{
  return self->_canAutoAccept;
}

- (BOOL)didAutoAccept
{
  return self->_didAutoAccept;
}

- (void)setDidAutoAccept:(BOOL)a3
{
  self->_didAutoAccept = a3;
}

- (BOOL)isVerifiableIdentity
{
  return self->_verifiableIdentity;
}

- (BOOL)senderIsMe
{
  return self->_senderIsMe;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSString)senderBundleID
{
  return self->_senderBundleID;
}

- (NSString)senderComputerName
{
  return self->_senderComputerName;
}

- (NSString)senderEmail
{
  return self->_senderEmail;
}

- (NSString)senderEmailHash
{
  return self->_senderEmailHash;
}

- (NSString)senderCompositeName
{
  return self->_senderCompositeName;
}

- (NSString)senderFirstName
{
  return self->_senderFirstName;
}

- (NSString)senderLastName
{
  return self->_senderLastName;
}

- (NSString)senderID
{
  return self->_senderID;
}

- (id)senderIcon
{
  return self->_senderIcon;
}

- (id)smallPreviewImage
{
  return self->_smallPreviewImage;
}

- (id)previewImage
{
  return self->_previewImage;
}

- (NSString)itemsDescription
{
  return self->_itemsDescription;
}

- (NSDictionary)itemsDescriptionAdvanced
{
  return self->_itemsDescriptionAdvanced;
}

- (NSSet)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (NSArray)rawFiles
{
  return self->_rawFiles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rawFiles, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_itemsDescriptionAdvanced, 0);
  objc_storeStrong((id *)&self->_itemsDescription, 0);
  objc_storeStrong(&self->_previewImage, 0);
  objc_storeStrong(&self->_smallPreviewImage, 0);
  objc_storeStrong(&self->_senderIcon, 0);
  objc_storeStrong((id *)&self->_senderID, 0);
  objc_storeStrong((id *)&self->_senderLastName, 0);
  objc_storeStrong((id *)&self->_senderFirstName, 0);
  objc_storeStrong((id *)&self->_senderCompositeName, 0);
  objc_storeStrong((id *)&self->_senderEmailHash, 0);
  objc_storeStrong((id *)&self->_senderEmail, 0);
  objc_storeStrong((id *)&self->_senderComputerName, 0);
  objc_storeStrong((id *)&self->_senderBundleID, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (void)updateUsingCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateUsingCoder:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)updateUsingCoder:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)setItemsDescription:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A5389000, a2, OS_LOG_TYPE_DEBUG, "Transfer provided JSON items description: %@", (uint8_t *)&v2, 0xCu);
}

@end