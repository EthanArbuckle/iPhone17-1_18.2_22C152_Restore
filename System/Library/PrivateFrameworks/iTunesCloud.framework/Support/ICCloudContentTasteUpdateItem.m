@interface ICCloudContentTasteUpdateItem
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICCloudContentTasteUpdateItem)initWithCoder:(id)a3;
- (ICCloudContentTasteUpdateItem)initWithGlobalPlaylistID:(id)a3 contentTaste:(int64_t)a4 configuration:(id)a5;
- (ICCloudContentTasteUpdateItem)initWithStoreItemID:(int64_t)a3 mediaContentTasteItem:(int64_t)a4 contentTaste:(int64_t)a5 configuration:(id)a6 timeStamp:(id)a7;
- (ICConnectionConfiguration)configuration;
- (NSDate)updateActionTimeStamp;
- (NSNumber)dsid;
- (NSString)globalPlaylistID;
- (id)description;
- (int64_t)contentTasteItem;
- (int64_t)contentTasteType;
- (int64_t)storeID;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setContentTasteItem:(int64_t)a3;
- (void)setContentTasteType:(int64_t)a3;
- (void)setDsid:(id)a3;
- (void)setGlobalPlaylistID:(id)a3;
- (void)setStoreID:(int64_t)a3;
- (void)setUpdateActionTimeStamp:(id)a3;
@end

@implementation ICCloudContentTasteUpdateItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);
  objc_storeStrong((id *)&self->_updateActionTimeStamp, 0);
  objc_storeStrong((id *)&self->_globalPlaylistID, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (void)setDsid:(id)a3
{
}

- (NSNumber)dsid
{
  return self->_dsid;
}

- (void)setUpdateActionTimeStamp:(id)a3
{
}

- (NSDate)updateActionTimeStamp
{
  return self->_updateActionTimeStamp;
}

- (void)setGlobalPlaylistID:(id)a3
{
}

- (NSString)globalPlaylistID
{
  return self->_globalPlaylistID;
}

- (void)setContentTasteItem:(int64_t)a3
{
  self->_contentTasteItem = a3;
}

- (int64_t)contentTasteItem
{
  return self->_contentTasteItem;
}

- (void)setContentTasteType:(int64_t)a3
{
  self->_contentTasteType = a3;
}

- (int64_t)contentTasteType
{
  return self->_contentTasteType;
}

- (void)setConfiguration:(id)a3
{
}

- (ICConnectionConfiguration)configuration
{
  return self->_configuration;
}

- (void)setStoreID:(int64_t)a3
{
  self->_storeID = a3;
}

- (int64_t)storeID
{
  return self->_storeID;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v4 ^ 0x646F72616E646F6DLL;
  uint64_t v8 = v3 ^ 0x6C7967656E657261;
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v11 = (unint64_t)[v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v7) ^ __ROR8__(v7, 51);
  uint64_t v14 = v8 + v12;
  uint64_t v15 = (v8 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v7, 32);
  uint64_t v104 = __ROR8__(v14 + v13, 32);
  uint64_t v108 = v16 ^ __ROR8__(v15, 43);
  unint64_t v17 = v16 ^ v11;
  uint64_t v97 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_dsid;
  unint64_t v19 = (unint64_t)[(NSNumber *)v18 hash];
  unint64_t v20 = (v17 + v97) ^ __ROR8__(v97, 51);
  uint64_t v21 = v104 + (v108 ^ v19);
  uint64_t v22 = __ROR8__(v108 ^ v19, 48);
  uint64_t v23 = (v21 ^ v22) + __ROR8__(v17 + v97, 32);
  uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  uint64_t v25 = v21 + v20;
  uint64_t v105 = __ROR8__(v25, 32);
  uint64_t v109 = v24;
  unint64_t v92 = v23 ^ v19;
  uint64_t v98 = v25 ^ __ROR8__(v20, 47);

  v26 = self->_globalPlaylistID;
  NSUInteger v27 = [(NSString *)v26 hash];
  unint64_t v28 = (v92 + v98) ^ __ROR8__(v98, 51);
  NSUInteger v29 = v105 + (v109 ^ v27);
  uint64_t v30 = __ROR8__(v109 ^ v27, 48);
  NSUInteger v31 = (v29 ^ v30) + __ROR8__(v92 + v98, 32);
  uint64_t v32 = v31 ^ __ROR8__(v29 ^ v30, 43);
  uint64_t v33 = v29 + v28;
  uint64_t v106 = __ROR8__(v33, 32);
  uint64_t v110 = v32;
  unint64_t v93 = v31 ^ v27;
  uint64_t v99 = v33 ^ __ROR8__(v28, 47);

  v34 = self->_updateActionTimeStamp;
  unint64_t v35 = (unint64_t)[(NSDate *)v34 hash];
  unint64_t v36 = (v93 + v99) ^ __ROR8__(v99, 51);
  uint64_t v37 = v106 + (v110 ^ v35);
  uint64_t v38 = __ROR8__(v110 ^ v35, 48);
  uint64_t v39 = (v37 ^ v38) + __ROR8__(v93 + v99, 32);
  uint64_t v40 = v39 ^ __ROR8__(v37 ^ v38, 43);
  uint64_t v41 = v37 + v36;
  uint64_t v107 = __ROR8__(v41, 32);
  uint64_t v111 = v40;
  unint64_t v94 = v39 ^ v35;
  uint64_t v100 = v41 ^ __ROR8__(v36, 47);

  int64_t contentTasteItem = self->_contentTasteItem;
  unint64_t v43 = (v94 + v100) ^ __ROR8__(v100, 51);
  uint64_t v44 = v107 + (v111 ^ contentTasteItem);
  uint64_t v45 = __ROR8__(v111 ^ contentTasteItem, 48);
  uint64_t v46 = (v44 ^ v45) + __ROR8__(v94 + v100, 32);
  uint64_t v47 = v46 ^ __ROR8__(v44 ^ v45, 43);
  uint64_t v48 = v44 + v43;
  int64_t v95 = v46 ^ contentTasteItem;
  uint64_t v101 = v48 ^ __ROR8__(v43, 47);
  int64_t contentTasteType = self->_contentTasteType;
  int64_t v50 = (v95 + v101) ^ __ROR8__(v101, 51);
  int64_t v51 = __ROR8__(v48, 32) + (v47 ^ contentTasteType);
  uint64_t v52 = __ROR8__(v47 ^ contentTasteType, 48);
  int64_t v53 = (v51 ^ v52) + __ROR8__(v95 + v101, 32);
  int64_t v54 = v53 ^ __ROR8__(v51 ^ v52, 43);
  int64_t v55 = v51 + v50;
  int64_t v96 = v53 ^ contentTasteType;
  uint64_t v102 = v55 ^ __ROR8__(v50, 47);
  int64_t storeID = self->_storeID;
  int64_t v57 = (v96 + v102) ^ __ROR8__(v102, 51);
  int64_t v58 = __ROR8__(v55, 32) + (v54 ^ storeID);
  uint64_t v59 = __ROR8__(v54 ^ storeID, 48);
  int64_t v60 = (v58 ^ v59) + __ROR8__(v96 + v102, 32);
  int64_t v61 = v60 ^ __ROR8__(v58 ^ v59, 43);
  int64_t v62 = v58 + v57;
  uint64_t v103 = v62 ^ __ROR8__(v57, 47);
  int64_t v63 = ((v60 ^ storeID) + v103) ^ __ROR8__(v103, 51);
  uint64_t v64 = __ROR8__(v62, 32) + (v61 ^ 0x3800000000000000);
  uint64_t v65 = __ROR8__(v61 ^ 0x3800000000000000, 48);
  uint64_t v66 = (v64 ^ v65) + __ROR8__((v60 ^ storeID) + v103, 32);
  uint64_t v67 = v66 ^ __ROR8__(v64 ^ v65, 43);
  uint64_t v68 = v64 + v63;
  uint64_t v69 = v68 ^ __ROR8__(v63, 47);
  uint64_t v70 = (v66 ^ 0x3800000000000000) + v69;
  uint64_t v71 = v70 ^ __ROR8__(v69, 51);
  uint64_t v72 = (__ROR8__(v68, 32) ^ 0xFFLL) + v67;
  uint64_t v73 = __ROR8__(v67, 48);
  uint64_t v74 = __ROR8__(v70, 32) + (v72 ^ v73);
  uint64_t v75 = v74 ^ __ROR8__(v72 ^ v73, 43);
  uint64_t v76 = v71 + v72;
  uint64_t v77 = v76 ^ __ROR8__(v71, 47);
  uint64_t v78 = v77 + v74;
  uint64_t v79 = v78 ^ __ROR8__(v77, 51);
  uint64_t v80 = __ROR8__(v76, 32) + v75;
  uint64_t v81 = __ROR8__(v75, 48);
  uint64_t v82 = __ROR8__(v78, 32) + (v80 ^ v81);
  uint64_t v83 = v82 ^ __ROR8__(v80 ^ v81, 43);
  uint64_t v84 = v79 + v80;
  uint64_t v85 = v84 ^ __ROR8__(v79, 47);
  uint64_t v86 = v85 + v82;
  uint64_t v87 = v86 ^ __ROR8__(v85, 51);
  uint64_t v88 = __ROR8__(v84, 32) + v83;
  uint64_t v89 = __ROR8__(v83, 48);
  uint64_t v90 = __ROR8__(v86, 32) + (v88 ^ v89);
  return (v87 + v88) ^ __ROR8__(v87, 47) ^ v90 ^ __ROR8__(v87 + v88, 32) ^ v90 ^ __ROR8__(v88 ^ v89, 43);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICCloudContentTasteUpdateItem *)a3;
  if (self == v4)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = v4;
      v23.receiver = self;
      v23.super_class = (Class)ICCloudContentTasteUpdateItem;
      if ([(ICCloudContentTasteUpdateItem *)&v23 isEqual:v5])
      {
        updateActionTimeStamp = self->_updateActionTimeStamp;
        uint64_t v7 = v5->_updateActionTimeStamp;
        if (updateActionTimeStamp == v7)
        {
        }
        else
        {
          uint64_t v8 = v7;
          v9 = updateActionTimeStamp;
          unsigned int v10 = [(NSDate *)v9 isEqual:v8];

          if (!v10) {
            goto LABEL_20;
          }
        }
        globalPlaylistID = self->_globalPlaylistID;
        uint64_t v13 = v5->_globalPlaylistID;
        if (globalPlaylistID == v13)
        {
        }
        else
        {
          uint64_t v14 = v13;
          uint64_t v15 = globalPlaylistID;
          unsigned int v16 = [(NSString *)v15 isEqual:v14];

          if (!v16) {
            goto LABEL_20;
          }
        }
        dsid = self->_dsid;
        v18 = v5->_dsid;
        if (dsid == v18)
        {
        }
        else
        {
          unint64_t v19 = v18;
          unint64_t v20 = dsid;
          unsigned int v21 = [(NSNumber *)v20 isEqual:v19];

          if (!v21) {
            goto LABEL_20;
          }
        }
        if (self->_contentTasteType == v5->_contentTasteType)
        {
          BOOL v11 = self->_contentTasteItem == v5->_contentTasteItem;
LABEL_21:

          goto LABEL_22;
        }
      }
LABEL_20:
      BOOL v11 = 0;
      goto LABEL_21;
    }
    BOOL v11 = 0;
  }
LABEL_22:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  globalPlaylistID = self->_globalPlaylistID;
  id v5 = a3;
  [v5 encodeObject:globalPlaylistID forKey:@"_ICCloudContentTasteUpdateItemCodingKeyGlobalPlaylistIDKey"];
  [(NSDate *)self->_updateActionTimeStamp timeIntervalSince1970];
  objc_msgSend(v5, "encodeDouble:forKey:", @"_ICCloudContentTasteUpdateItemCodingKeyTimeStampKey");
  [v5 encodeObject:self->_dsid forKey:@"_ICCloudContentTasteUpdateItemCodingKeyDSIDKey"];
  [v5 encodeInt64:self->_storeID forKey:@"_ICCloudContentTasteUpdateItemCodingKeyStoreIDKey"];
  [v5 encodeInteger:self->_contentTasteType forKey:@"_ICCloudContentTasteUpdateItemCodingKeyTasteTypeKey"];
  [v5 encodeInteger:self->_contentTasteItem forKey:@"_ICCloudContentTasteUpdateItemCodingKeyItemTypeKey"];
}

- (ICCloudContentTasteUpdateItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ICCloudContentTasteUpdateItem;
  id v5 = [(ICCloudContentTasteUpdateItem *)&v16 init];
  if (v5)
  {
    v5->_int64_t storeID = (int64_t)[v4 decodeInt64ForKey:@"_ICCloudContentTasteUpdateItemCodingKeyStoreIDKey"];
    v5->_int64_t contentTasteItem = (int64_t)[v4 decodeIntegerForKey:@"_ICCloudContentTasteUpdateItemCodingKeyItemTypeKey"];
    v5->_int64_t contentTasteType = (int64_t)[v4 decodeIntegerForKey:@"_ICCloudContentTasteUpdateItemCodingKeyTasteTypeKey"];
    uint64_t v6 = [v4 decodeObjectForKey:@"_ICCloudContentTasteUpdateItemCodingKeyGlobalPlaylistIDKey"];
    globalPlaylistID = v5->_globalPlaylistID;
    v5->_globalPlaylistID = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"_ICCloudContentTasteUpdateItemCodingKeyDSIDKey"];
    dsid = v5->_dsid;
    v5->_dsid = (NSNumber *)v8;

    unsigned int v10 = +[ICUserIdentity specificAccountWithDSID:v5->_dsid];
    BOOL v11 = (ICConnectionConfiguration *)[objc_alloc((Class)ICConnectionConfiguration) initWithUserIdentity:v10];
    configuration = v5->_configuration;
    v5->_configuration = v11;

    [v4 decodeDoubleForKey:@"_ICCloudContentTasteUpdateItemCodingKeyTimeStampKey"];
    uint64_t v13 = +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:");
    updateActionTimeStamp = v5->_updateActionTimeStamp;
    v5->_updateActionTimeStamp = (NSDate *)v13;
  }
  return v5;
}

- (id)description
{
  int64_t storeID = self->_storeID;
  id v4 = [(ICConnectionConfiguration *)self->_configuration userIdentity];
  globalPlaylistID = self->_globalPlaylistID;
  uint64_t v6 = ICNSStringForICMediaContentTaste();
  uint64_t v7 = ICNSStringForICMediaContentTasteItem();
  uint64_t v8 = +[NSString stringWithFormat:@"ICCloudContentTasteUpdateItem (%p) storeID=%lld, identity=%@, globalPlaylistID=%@, contentTasteType=%@, contentTasteItem=%@, updateTimeStamp=%@", self, storeID, v4, globalPlaylistID, v6, v7, self->_updateActionTimeStamp];

  return v8;
}

- (ICCloudContentTasteUpdateItem)initWithGlobalPlaylistID:(id)a3 contentTaste:(int64_t)a4 configuration:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)ICCloudContentTasteUpdateItem;
  BOOL v11 = [(ICCloudContentTasteUpdateItem *)&v20 init];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a5);
    objc_storeStrong((id *)&v12->_globalPlaylistID, a3);
    v12->_int64_t contentTasteType = a4;
    v12->_int64_t contentTasteItem = 4;
    uint64_t v13 = +[NSDate date];
    updateActionTimeStamp = v12->_updateActionTimeStamp;
    v12->_updateActionTimeStamp = (NSDate *)v13;

    uint64_t v15 = [(ICConnectionConfiguration *)v12->_configuration userIdentityStore];
    objc_super v16 = [(ICConnectionConfiguration *)v12->_configuration userIdentity];
    uint64_t v17 = [v15 DSIDForUserIdentity:v16 outError:0];
    dsid = v12->_dsid;
    v12->_dsid = (NSNumber *)v17;
  }
  return v12;
}

- (ICCloudContentTasteUpdateItem)initWithStoreItemID:(int64_t)a3 mediaContentTasteItem:(int64_t)a4 contentTaste:(int64_t)a5 configuration:(id)a6 timeStamp:(id)a7
{
  id v13 = a6;
  id v14 = a7;
  v22.receiver = self;
  v22.super_class = (Class)ICCloudContentTasteUpdateItem;
  uint64_t v15 = [(ICCloudContentTasteUpdateItem *)&v22 init];
  objc_super v16 = v15;
  if (v15)
  {
    v15->_int64_t storeID = a3;
    objc_storeStrong((id *)&v15->_configuration, a6);
    v16->_int64_t contentTasteType = a5;
    v16->_int64_t contentTasteItem = a4;
    objc_storeStrong((id *)&v16->_updateActionTimeStamp, a7);
    uint64_t v17 = [(ICConnectionConfiguration *)v16->_configuration userIdentityStore];
    v18 = [(ICConnectionConfiguration *)v16->_configuration userIdentity];
    uint64_t v19 = [v17 DSIDForUserIdentity:v18 outError:0];
    dsid = v16->_dsid;
    v16->_dsid = (NSNumber *)v19;
  }
  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end