@interface KCSharingInternetPasswordCredential
+ (NSSet)requiredAttributeKeys;
+ (const)databaseItemClass;
- (BOOL)isEqual:(id)a3;
- (KCSharingInternetPasswordCredential)initWithAttributes:(id)a3 error:(id *)a4;
- (KCSharingInternetPasswordCredential)initWithDatabaseItem:(SecDbItem *)a3 error:(id *)a4;
- (KCSharingInternetPasswordCredential)initWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5;
- (NSData)clientDefined0;
- (NSData)clientDefined1;
- (NSData)clientDefined2;
- (NSData)clientDefined3;
- (NSData)data;
- (NSData)history;
- (NSData)notes;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSNumber)port;
- (NSString)accessGroup;
- (NSString)accessibility;
- (NSString)account;
- (NSString)authenticationType;
- (NSString)comment;
- (NSString)description;
- (NSString)label;
- (NSString)path;
- (NSString)protocol;
- (NSString)securityDomain;
- (NSString)server;
- (NSString)sharingGroup;
- (NSString)viewHint;
- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4;
- (id)proto;
- (unint64_t)hash;
@end

@implementation KCSharingInternetPasswordCredential

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientDefined3, 0);
  objc_storeStrong((id *)&self->_clientDefined2, 0);
  objc_storeStrong((id *)&self->_clientDefined1, 0);
  objc_storeStrong((id *)&self->_clientDefined0, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_securityDomain, 0);
  objc_storeStrong((id *)&self->_viewHint, 0);
  objc_storeStrong((id *)&self->_accessibility, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_comment, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_authenticationType, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_port, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_accessGroup, 0);

  objc_storeStrong((id *)&self->_sharingGroup, 0);
}

- (NSData)clientDefined3
{
  return self->_clientDefined3;
}

- (NSData)clientDefined2
{
  return self->_clientDefined2;
}

- (NSData)clientDefined1
{
  return self->_clientDefined1;
}

- (NSData)clientDefined0
{
  return self->_clientDefined0;
}

- (NSData)history
{
  return self->_history;
}

- (NSData)notes
{
  return self->_notes;
}

- (NSString)securityDomain
{
  return self->_securityDomain;
}

- (NSString)viewHint
{
  return self->_viewHint;
}

- (NSString)accessibility
{
  return self->_accessibility;
}

- (NSString)label
{
  return self->_label;
}

- (NSString)comment
{
  return self->_comment;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSData)data
{
  return self->_data;
}

- (NSString)authenticationType
{
  return self->_authenticationType;
}

- (NSString)path
{
  return self->_path;
}

- (NSNumber)port
{
  return self->_port;
}

- (NSString)server
{
  return self->_server;
}

- (NSString)protocol
{
  return self->_protocol;
}

- (NSString)account
{
  return self->_account;
}

- (NSString)accessGroup
{
  return self->_accessGroup;
}

- (NSString)sharingGroup
{
  return self->_sharingGroup;
}

- (id)attributesWithAccessGroups:(id)a3 error:(id *)a4
{
  v31[0] = kSecAttrSharingGroup;
  v30 = [(KCSharingInternetPasswordCredential *)self sharingGroup];
  v32[0] = v30;
  v31[1] = kSecAttrAccount;
  v29 = [(KCSharingInternetPasswordCredential *)self account];
  v32[1] = v29;
  v31[2] = kSecAttrProtocol;
  v28 = [(KCSharingInternetPasswordCredential *)self protocol];
  v32[2] = v28;
  v31[3] = kSecAttrServer;
  v27 = [(KCSharingInternetPasswordCredential *)self server];
  v32[3] = v27;
  v31[4] = kSecAttrPort;
  v26 = [(KCSharingInternetPasswordCredential *)self port];
  v32[4] = v26;
  v31[5] = kSecAttrPath;
  v25 = [(KCSharingInternetPasswordCredential *)self path];
  v32[5] = v25;
  v31[6] = kSecAttrAuthenticationType;
  v5 = [(KCSharingInternetPasswordCredential *)self authenticationType];
  v32[6] = v5;
  v31[7] = kSecValueData;
  v6 = [(KCSharingInternetPasswordCredential *)self data];
  v32[7] = v6;
  v31[8] = kSecAttrCreationDate;
  v7 = [(KCSharingInternetPasswordCredential *)self creationDate];
  v32[8] = v7;
  v31[9] = kSecAttrModificationDate;
  v8 = [(KCSharingInternetPasswordCredential *)self modificationDate];
  v32[9] = v8;
  v31[10] = kSecAttrSecurityDomain;
  v9 = [(KCSharingInternetPasswordCredential *)self securityDomain];
  v32[10] = v9;
  v32[11] = &__kCFBooleanFalse;
  v31[11] = kSecAttrSynchronizable;
  v31[12] = kSecAttrAccessible;
  v10 = [(KCSharingInternetPasswordCredential *)self accessibility];
  v32[12] = v10;
  v31[13] = kSecAttrAccessGroup;
  v11 = [(KCSharingInternetPasswordCredential *)self accessGroup];
  v32[13] = v11;
  v12 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:14];
  id v13 = [v12 mutableCopy];

  v14 = [(KCSharingInternetPasswordCredential *)self comment];
  [v13 setObject:v14 forKeyedSubscript:kSecAttrComment];

  v15 = [(KCSharingInternetPasswordCredential *)self label];
  [v13 setObject:v15 forKeyedSubscript:kSecAttrLabel];

  v16 = [(KCSharingInternetPasswordCredential *)self viewHint];
  [v13 setObject:v16 forKeyedSubscript:kSecAttrSyncViewHint];

  v17 = [(KCSharingInternetPasswordCredential *)self notes];
  [v13 setObject:v17 forKeyedSubscript:kSecDataInetExtraNotes];

  v18 = [(KCSharingInternetPasswordCredential *)self history];
  [v13 setObject:v18 forKeyedSubscript:kSecDataInetExtraHistory];

  v19 = [(KCSharingInternetPasswordCredential *)self clientDefined0];
  [v13 setObject:v19 forKeyedSubscript:kSecDataInetExtraClientDefined0];

  v20 = [(KCSharingInternetPasswordCredential *)self clientDefined1];
  [v13 setObject:v20 forKeyedSubscript:kSecDataInetExtraClientDefined1];

  v21 = [(KCSharingInternetPasswordCredential *)self clientDefined2];
  [v13 setObject:v21 forKeyedSubscript:kSecDataInetExtraClientDefined2];

  v22 = [(KCSharingInternetPasswordCredential *)self clientDefined3];
  [v13 setObject:v22 forKeyedSubscript:kSecDataInetExtraClientDefined3];

  id v23 = [v13 copy];

  return v23;
}

- (id)proto
{
  v3 = objc_opt_new();
  v4 = [(KCSharingInternetPasswordCredential *)self accessGroup];
  [v3 setAccessGroup:v4];

  v5 = [(KCSharingInternetPasswordCredential *)self account];
  [v3 setAccount:v5];

  v6 = [(KCSharingInternetPasswordCredential *)self protocol];
  [v3 setProtocol:v6];

  v7 = [(KCSharingInternetPasswordCredential *)self server];
  [v3 setServer:v7];

  v8 = [(KCSharingInternetPasswordCredential *)self port];
  [v3 setPort:[v8 intValue]];

  v9 = [(KCSharingInternetPasswordCredential *)self path];
  [v3 setPath:v9];

  v10 = [(KCSharingInternetPasswordCredential *)self authenticationType];
  [v3 setAuthenticationType:v10];

  v11 = [(KCSharingInternetPasswordCredential *)self data];
  [v3 setData:v11];

  v12 = [(KCSharingInternetPasswordCredential *)self creationDate];
  [v12 timeIntervalSinceReferenceDate];
  [v3 setCreationDate:];

  id v13 = [(KCSharingInternetPasswordCredential *)self modificationDate];
  [v13 timeIntervalSinceReferenceDate];
  [v3 setModificationDate:];

  v14 = [(KCSharingInternetPasswordCredential *)self comment];
  [v3 setComment:v14];

  v15 = [(KCSharingInternetPasswordCredential *)self label];
  [v3 setLabel:v15];

  v16 = [(KCSharingInternetPasswordCredential *)self accessibility];
  [v3 setAccessibility:v16];

  v17 = [(KCSharingInternetPasswordCredential *)self viewHint];
  [v3 setViewHint:v17];

  v18 = [(KCSharingInternetPasswordCredential *)self securityDomain];
  [v3 setSecurityDomain:v18];

  v19 = [(KCSharingInternetPasswordCredential *)self notes];
  [v3 setNotes:v19];

  v20 = [(KCSharingInternetPasswordCredential *)self history];
  [v3 setHistory:v20];

  v21 = [(KCSharingInternetPasswordCredential *)self clientDefined0];
  [v3 setClientDefined0:v21];

  v22 = [(KCSharingInternetPasswordCredential *)self clientDefined1];
  [v3 setClientDefined1:v22];

  id v23 = [(KCSharingInternetPasswordCredential *)self clientDefined2];
  [v3 setClientDefined2:v23];

  v24 = [(KCSharingInternetPasswordCredential *)self clientDefined3];
  [v3 setClientDefined3:v24];

  return v3;
}

- (NSString)description
{
  v14 = [(KCSharingInternetPasswordCredential *)self sharingGroup];
  id v13 = [(KCSharingInternetPasswordCredential *)self accessGroup];
  v19 = [(KCSharingInternetPasswordCredential *)self account];
  v18 = [(KCSharingInternetPasswordCredential *)self protocol];
  v17 = [(KCSharingInternetPasswordCredential *)self server];
  v16 = [(KCSharingInternetPasswordCredential *)self port];
  v3 = [(KCSharingInternetPasswordCredential *)self path];
  v4 = [(KCSharingInternetPasswordCredential *)self authenticationType];
  v5 = [(KCSharingInternetPasswordCredential *)self creationDate];
  v6 = [(KCSharingInternetPasswordCredential *)self modificationDate];
  v12 = [(KCSharingInternetPasswordCredential *)self comment];
  v7 = [(KCSharingInternetPasswordCredential *)self label];
  v8 = [(KCSharingInternetPasswordCredential *)self accessibility];
  v9 = [(KCSharingInternetPasswordCredential *)self viewHint];
  v10 = [(KCSharingInternetPasswordCredential *)self securityDomain];
  v15 = +[NSString stringWithFormat:@"KCSharingInternetPasswordCredential(sharingGroup:%@ accessGroup:%@ account:%@ protocol:%@ server:%@ port:%@ path:%@ authenticationType:%@ creationDate:%@ modificationDate:%@ comment:%@ label:%@ accessibility:%@ viewHint:%@ securityDomain:%@)", v14, v13, v19, v18, v17, v16, v3, v4, v5, v6, v12, v7, v8, v9, v10];

  return (NSString *)v15;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (KCSharingInternetPasswordCredential *)a3;
  if (v4 == self)
  {
    unsigned __int8 v28 = 1;
    goto LABEL_82;
  }
  if (![(KCSharingInternetPasswordCredential *)v4 isMemberOfClass:objc_opt_class()])
  {
    unsigned __int8 v28 = 0;
    goto LABEL_82;
  }
  v5 = v4;
  v6 = [(KCSharingInternetPasswordCredential *)self sharingGroup];
  id v119 = [(KCSharingInternetPasswordCredential *)v5 sharingGroup];
  id v120 = v6;
  unsigned int v118 = [v6 isEqualToString:v119];
  if (v118)
  {
    v8 = [(KCSharingInternetPasswordCredential *)self accessGroup];
    v114 = [(KCSharingInternetPasswordCredential *)v5 accessGroup];
    v115 = v8;
    if (objc_msgSend(v8, "isEqualToString:"))
    {
      v9 = [(KCSharingInternetPasswordCredential *)self account];
      v112 = [(KCSharingInternetPasswordCredential *)v5 account];
      v113 = v9;
      if (objc_msgSend(v9, "isEqualToString:"))
      {
        v10 = [(KCSharingInternetPasswordCredential *)self protocol];
        v110 = [(KCSharingInternetPasswordCredential *)v5 protocol];
        v111 = v10;
        if (objc_msgSend(v10, "isEqualToString:"))
        {
          v11 = [(KCSharingInternetPasswordCredential *)self server];
          v108 = [(KCSharingInternetPasswordCredential *)v5 server];
          v109 = v11;
          if (objc_msgSend(v11, "isEqualToString:"))
          {
            v12 = [(KCSharingInternetPasswordCredential *)self port];
            v106 = [(KCSharingInternetPasswordCredential *)v5 port];
            v107 = v12;
            if (objc_msgSend(v12, "isEqualToNumber:"))
            {
              id v13 = [(KCSharingInternetPasswordCredential *)self path];
              v104 = [(KCSharingInternetPasswordCredential *)v5 path];
              v105 = v13;
              if (objc_msgSend(v13, "isEqualToString:"))
              {
                v14 = [(KCSharingInternetPasswordCredential *)self authenticationType];
                v102 = [(KCSharingInternetPasswordCredential *)v5 authenticationType];
                v103 = v14;
                if (objc_msgSend(v14, "isEqualToString:"))
                {
                  v15 = [(KCSharingInternetPasswordCredential *)self data];
                  v100 = [(KCSharingInternetPasswordCredential *)v5 data];
                  v101 = v15;
                  if (objc_msgSend(v15, "isEqualToData:"))
                  {
                    v16 = [(KCSharingInternetPasswordCredential *)self creationDate];
                    v98 = [(KCSharingInternetPasswordCredential *)v5 creationDate];
                    v99 = v16;
                    if (objc_msgSend(v16, "isEqualToDate:"))
                    {
                      v17 = [(KCSharingInternetPasswordCredential *)self modificationDate];
                      v96 = [(KCSharingInternetPasswordCredential *)v5 modificationDate];
                      v97 = v17;
                      if (objc_msgSend(v17, "isEqualToDate:"))
                      {
                        uint64_t v18 = [(KCSharingInternetPasswordCredential *)self comment];
                        v94 = [(KCSharingInternetPasswordCredential *)v5 comment];
                        v95 = (void *)v18;
                        HIDWORD(v121[3]) = v18 != (void)v94;
                        if ((void *)v18 == v94
                          || ([(KCSharingInternetPasswordCredential *)self comment],
                              v19 = objc_claimAutoreleasedReturnValue(),
                              [(KCSharingInternetPasswordCredential *)v5 comment],
                              v90 = objc_claimAutoreleasedReturnValue(),
                              v91 = v19,
                              objc_msgSend(v19, "isEqualToString:")))
                        {
                          uint64_t v37 = [(KCSharingInternetPasswordCredential *)self label];
                          v92 = [(KCSharingInternetPasswordCredential *)v5 label];
                          v93 = (void *)v37;
                          LODWORD(v121[3]) = v37 != (void)v92;
                          v56 = v5;
                          if ((void *)v37 == v92
                            || ([(KCSharingInternetPasswordCredential *)self label],
                                v38 = objc_claimAutoreleasedReturnValue(),
                                [(KCSharingInternetPasswordCredential *)v5 label],
                                v86 = objc_claimAutoreleasedReturnValue(),
                                v87 = v38,
                                objc_msgSend(v38, "isEqualToString:")))
                          {
                            v39 = [(KCSharingInternetPasswordCredential *)self accessibility];
                            v5 = v56;
                            v88 = [(KCSharingInternetPasswordCredential *)v56 accessibility];
                            v89 = v39;
                            if (!objc_msgSend(v39, "isEqualToString:"))
                            {
                              *(void *)v116 = 0;
                              int v21 = 0;
                              int v22 = 0;
                              int v23 = 0;
                              int v24 = 0;
                              memset(v121, 0, 24);
                              int v25 = 0;
                              int v26 = 0;
                              int v27 = 0;
                              unsigned __int8 v28 = 0;
                              v117[3] = 0x100000001;
                              v117[2] = 0x100000001;
                              v117[1] = 0x100000001;
                              v117[0] = 0x100000001;
                              *(void *)&v116[12] = 0x100000001;
                              *(_DWORD *)&v116[8] = 1;
                              int v20 = 1;
                              goto LABEL_21;
                            }
                            uint64_t v40 = [(KCSharingInternetPasswordCredential *)self viewHint];
                            v84 = [(KCSharingInternetPasswordCredential *)v56 viewHint];
                            v85 = (void *)v40;
                            HIDWORD(v121[2]) = v40 != (void)v84;
                            if ((void *)v40 == v84
                              || ([(KCSharingInternetPasswordCredential *)self viewHint],
                                  v41 = objc_claimAutoreleasedReturnValue(),
                                  [(KCSharingInternetPasswordCredential *)v56 viewHint],
                                  v80 = objc_claimAutoreleasedReturnValue(),
                                  v81 = v41,
                                  objc_msgSend(v41, "isEqualToString:")))
                            {
                              v42 = [(KCSharingInternetPasswordCredential *)self securityDomain];
                              v82 = [(KCSharingInternetPasswordCredential *)v56 securityDomain];
                              v83 = v42;
                              if (objc_msgSend(v42, "isEqualToString:"))
                              {
                                uint64_t v43 = [(KCSharingInternetPasswordCredential *)self notes];
                                v78 = [(KCSharingInternetPasswordCredential *)v56 notes];
                                v79 = (void *)v43;
                                LODWORD(v121[2]) = v43 != (void)v78;
                                if ((void *)v43 == v78
                                  || ([(KCSharingInternetPasswordCredential *)self notes],
                                      v44 = objc_claimAutoreleasedReturnValue(),
                                      [(KCSharingInternetPasswordCredential *)v56 notes],
                                      v74 = objc_claimAutoreleasedReturnValue(),
                                      v75 = v44,
                                      objc_msgSend(v44, "isEqualToData:")))
                                {
                                  uint64_t v45 = [(KCSharingInternetPasswordCredential *)self history];
                                  v76 = [(KCSharingInternetPasswordCredential *)v56 history];
                                  v77 = (void *)v45;
                                  HIDWORD(v121[1]) = v45 != (void)v76;
                                  if ((void *)v45 == v76
                                    || ([(KCSharingInternetPasswordCredential *)self history],
                                        v46 = objc_claimAutoreleasedReturnValue(),
                                        [(KCSharingInternetPasswordCredential *)v56 history],
                                        v70 = objc_claimAutoreleasedReturnValue(),
                                        v71 = v46,
                                        objc_msgSend(v46, "isEqualToData:")))
                                  {
                                    uint64_t v47 = [(KCSharingInternetPasswordCredential *)self clientDefined0];
                                    v72 = [(KCSharingInternetPasswordCredential *)v56 clientDefined0];
                                    v73 = (void *)v47;
                                    LODWORD(v121[1]) = v47 != (void)v72;
                                    if ((void *)v47 == v72
                                      || ([(KCSharingInternetPasswordCredential *)self clientDefined0],
                                          v48 = objc_claimAutoreleasedReturnValue(),
                                          [(KCSharingInternetPasswordCredential *)v56 clientDefined0],
                                          v66 = objc_claimAutoreleasedReturnValue(),
                                          v67 = v48,
                                          objc_msgSend(v48, "isEqualToData:")))
                                    {
                                      uint64_t v49 = [(KCSharingInternetPasswordCredential *)self clientDefined1];
                                      v68 = [(KCSharingInternetPasswordCredential *)v56 clientDefined1];
                                      v69 = (void *)v49;
                                      HIDWORD(v121[0]) = v49 != (void)v68;
                                      if ((void *)v49 == v68
                                        || (-[KCSharingInternetPasswordCredential clientDefined1](self, "clientDefined1"), v50 = objc_claimAutoreleasedReturnValue(), -[KCSharingInternetPasswordCredential clientDefined1](v56, "clientDefined1"), v60 = objc_claimAutoreleasedReturnValue(), v61 = v50, objc_msgSend(v50, "isEqualToData:")))
                                      {
                                        uint64_t v51 = [(KCSharingInternetPasswordCredential *)self clientDefined2];
                                        v64 = [(KCSharingInternetPasswordCredential *)v56 clientDefined2];
                                        v65 = (void *)v51;
                                        LODWORD(v121[0]) = v51 != (void)v64;
                                        if ((void *)v51 == v64
                                          || (-[KCSharingInternetPasswordCredential clientDefined2](self, "clientDefined2"), v52 = objc_claimAutoreleasedReturnValue(), -[KCSharingInternetPasswordCredential clientDefined2](v56, "clientDefined2"), v58 = objc_claimAutoreleasedReturnValue(), v59 = v52, objc_msgSend(v52, "isEqualToData:")))
                                        {
                                          uint64_t v53 = [(KCSharingInternetPasswordCredential *)self clientDefined3];
                                          v62 = [(KCSharingInternetPasswordCredential *)v56 clientDefined3];
                                          v63 = (void *)v53;
                                          if ((void *)v53 != v62)
                                          {
                                            v54 = [(KCSharingInternetPasswordCredential *)self clientDefined3];
                                            v5 = v56;
                                            uint64_t v55 = [(KCSharingInternetPasswordCredential *)v56 clientDefined3];
                                            v57 = v54;
                                            unsigned __int8 v28 = [v54 isEqualToData:v55];
                                            v7 = (void *)v55;
                                            int v27 = 1;
                                            v117[3] = 0x100000001;
                                            v117[2] = 0x100000001;
                                            v117[1] = 0x100000001;
                                            v117[0] = 0x100000001;
                                            *(void *)&v116[12] = 0x100000001;
                                            *(_DWORD *)&v116[8] = 1;
                                            int v20 = 1;
                                            int v21 = 1;
                                            *(void *)v116 = 0x100000001;
                                            int v22 = 1;
                                            int v23 = 1;
                                            int v24 = 1;
                                            int v25 = 1;
                                            int v26 = 1;
                                            goto LABEL_21;
                                          }
                                          int v27 = 0;
                                          v117[3] = 0x100000001;
                                          v117[2] = 0x100000001;
                                          v117[1] = 0x100000001;
                                          v117[0] = 0x100000001;
                                          *(void *)&v116[12] = 0x100000001;
                                          *(_DWORD *)&v116[8] = 1;
                                          int v20 = 1;
                                          int v21 = 1;
                                          *(void *)v116 = 0x100000001;
                                          int v22 = 1;
                                          int v23 = 1;
                                          int v24 = 1;
                                          int v25 = 1;
                                          v62 = (void *)v53;
                                          int v26 = 1;
                                          unsigned __int8 v28 = 1;
                                        }
                                        else
                                        {
                                          int v26 = 0;
                                          int v27 = 0;
                                          unsigned __int8 v28 = 0;
                                          v117[3] = 0x100000001;
                                          v117[2] = 0x100000001;
                                          v117[1] = 0x100000001;
                                          v117[0] = 0x100000001;
                                          *(void *)&v116[12] = 0x100000001;
                                          *(_DWORD *)&v116[8] = 1;
                                          int v20 = 1;
                                          int v21 = 1;
                                          *(void *)v116 = 0x100000001;
                                          int v22 = 1;
                                          int v23 = 1;
                                          int v24 = 1;
                                          int v25 = 1;
                                          LODWORD(v121[0]) = 1;
                                        }
                                      }
                                      else
                                      {
                                        int v25 = 0;
                                        v121[0] = 0x100000000;
                                        int v26 = 0;
                                        int v27 = 0;
                                        unsigned __int8 v28 = 0;
                                        v117[3] = 0x100000001;
                                        v117[2] = 0x100000001;
                                        v117[1] = 0x100000001;
                                        v117[0] = 0x100000001;
                                        *(void *)&v116[12] = 0x100000001;
                                        *(_DWORD *)&v116[8] = 1;
                                        int v20 = 1;
                                        int v21 = 1;
                                        *(void *)v116 = 0x100000001;
                                        int v22 = 1;
                                        int v23 = 1;
                                        int v24 = 1;
                                      }
                                    }
                                    else
                                    {
                                      int v24 = 0;
                                      v121[0] = 0;
                                      int v25 = 0;
                                      int v26 = 0;
                                      int v27 = 0;
                                      unsigned __int8 v28 = 0;
                                      v117[3] = 0x100000001;
                                      v117[2] = 0x100000001;
                                      v117[1] = 0x100000001;
                                      v117[0] = 0x100000001;
                                      *(void *)&v116[12] = 0x100000001;
                                      *(_DWORD *)&v116[8] = 1;
                                      int v20 = 1;
                                      int v21 = 1;
                                      *(void *)v116 = 0x100000001;
                                      int v22 = 1;
                                      int v23 = 1;
                                      LODWORD(v121[1]) = 1;
                                    }
                                  }
                                  else
                                  {
                                    int v23 = 0;
                                    *(void *)((char *)v121 + 4) = 0;
                                    int v24 = 0;
                                    int v25 = 0;
                                    LODWORD(v121[0]) = 0;
                                    int v26 = 0;
                                    int v27 = 0;
                                    unsigned __int8 v28 = 0;
                                    v117[3] = 0x100000001;
                                    v117[2] = 0x100000001;
                                    v117[1] = 0x100000001;
                                    v117[0] = 0x100000001;
                                    *(void *)&v116[12] = 0x100000001;
                                    *(_DWORD *)&v116[8] = 1;
                                    int v20 = 1;
                                    int v21 = 1;
                                    *(void *)v116 = 0x100000001;
                                    int v22 = 1;
                                    HIDWORD(v121[1]) = 1;
                                  }
                                }
                                else
                                {
                                  int v22 = 0;
                                  v121[0] = 0;
                                  v121[1] = 0;
                                  int v23 = 0;
                                  int v24 = 0;
                                  int v25 = 0;
                                  int v26 = 0;
                                  int v27 = 0;
                                  unsigned __int8 v28 = 0;
                                  v117[3] = 0x100000001;
                                  v117[2] = 0x100000001;
                                  v117[1] = 0x100000001;
                                  v117[0] = 0x100000001;
                                  *(void *)&v116[12] = 0x100000001;
                                  *(_DWORD *)&v116[8] = 1;
                                  int v20 = 1;
                                  int v21 = 1;
                                  *(void *)v116 = 0x100000001;
                                  LODWORD(v121[2]) = 1;
                                }
                              }
                              else
                              {
                                *(void *)v116 = 0x100000000;
                                int v22 = 0;
                                int v23 = 0;
                                int v24 = 0;
                                int v25 = 0;
                                memset(v121, 0, 20);
                                int v26 = 0;
                                int v27 = 0;
                                unsigned __int8 v28 = 0;
                                v117[3] = 0x100000001;
                                v117[2] = 0x100000001;
                                v117[1] = 0x100000001;
                                v117[0] = 0x100000001;
                                *(void *)&v116[12] = 0x100000001;
                                *(_DWORD *)&v116[8] = 1;
                                int v20 = 1;
                                int v21 = 1;
                              }
                            }
                            else
                            {
                              int v21 = 0;
                              *(void *)v116 = 0x100000000;
                              int v22 = 0;
                              int v23 = 0;
                              int v24 = 0;
                              int v25 = 0;
                              memset(v121, 0, 20);
                              int v26 = 0;
                              int v27 = 0;
                              unsigned __int8 v28 = 0;
                              v117[3] = 0x100000001;
                              v117[2] = 0x100000001;
                              v117[1] = 0x100000001;
                              v117[0] = 0x100000001;
                              *(void *)&v116[12] = 0x100000001;
                              *(_DWORD *)&v116[8] = 1;
                              int v20 = 1;
                              HIDWORD(v121[2]) = 1;
                            }
                          }
                          else
                          {
                            int v20 = 0;
                            *(void *)v116 = 0;
                            int v21 = 0;
                            int v22 = 0;
                            int v23 = 0;
                            int v24 = 0;
                            memset(v121, 0, 24);
                            int v25 = 0;
                            int v26 = 0;
                            int v27 = 0;
                            unsigned __int8 v28 = 0;
                            v117[3] = 0x100000001;
                            v117[2] = 0x100000001;
                            v117[1] = 0x100000001;
                            v117[0] = 0x100000001;
                            *(void *)&v116[12] = 0x100000001;
                            *(_DWORD *)&v116[8] = 1;
                            LODWORD(v121[3]) = 1;
                          }
                          v5 = v56;
                          goto LABEL_21;
                        }
                        *(void *)&v116[4] = 0;
                        int v20 = 0;
                        int v21 = 0;
                        *(_DWORD *)v116 = 0;
                        int v22 = 0;
                        int v23 = 0;
                        int v24 = 0;
                        int v25 = 0;
                        memset(v121, 0, 28);
                        int v26 = 0;
                        int v27 = 0;
                        unsigned __int8 v28 = 0;
                        v117[3] = 0x100000001;
                        v117[2] = 0x100000001;
                        v117[1] = 0x100000001;
                        v117[0] = 0x100000001;
                        *(void *)&v116[12] = 0x100000001;
                        HIDWORD(v121[3]) = 1;
                      }
                      else
                      {
                        v117[0] = 0x100000000;
                        *(void *)&v116[4] = 0;
                        int v20 = 0;
                        int v21 = 0;
                        *(_DWORD *)v116 = 0;
                        int v22 = 0;
                        memset(v121, 0, sizeof(v121));
                        int v23 = 0;
                        int v24 = 0;
                        int v25 = 0;
                        int v26 = 0;
                        int v27 = 0;
                        unsigned __int8 v28 = 0;
                        v117[3] = 0x100000001;
                        v117[2] = 0x100000001;
                        v117[1] = 0x100000001;
                        *(void *)&v116[12] = 0x100000001;
                      }
                    }
                    else
                    {
                      *(void *)v116 = 0;
                      *(void *)&v116[8] = 0;
                      v117[0] = 0x100000000;
                      int v20 = 0;
                      int v21 = 0;
                      int v22 = 0;
                      memset(v121, 0, sizeof(v121));
                      int v23 = 0;
                      int v24 = 0;
                      int v25 = 0;
                      int v26 = 0;
                      int v27 = 0;
                      unsigned __int8 v28 = 0;
                      v117[3] = 0x100000001;
                      v117[2] = 0x100000001;
                      v117[1] = 0x100000001;
                      *(_DWORD *)&v116[16] = 1;
                    }
                  }
                  else
                  {
                    v117[0] = 0x100000000;
                    int v20 = 0;
                    int v21 = 0;
                    memset(v116, 0, sizeof(v116));
                    int v22 = 0;
                    memset(v121, 0, sizeof(v121));
                    int v23 = 0;
                    int v24 = 0;
                    int v25 = 0;
                    int v26 = 0;
                    int v27 = 0;
                    unsigned __int8 v28 = 0;
                    v117[3] = 0x100000001;
                    v117[2] = 0x100000001;
                    v117[1] = 0x100000001;
                  }
                }
                else
                {
                  v117[0] = 0;
                  int v20 = 0;
                  int v21 = 0;
                  memset(v116, 0, sizeof(v116));
                  int v22 = 0;
                  memset(v121, 0, sizeof(v121));
                  int v23 = 0;
                  int v24 = 0;
                  int v25 = 0;
                  int v26 = 0;
                  int v27 = 0;
                  unsigned __int8 v28 = 0;
                  v117[3] = 0x100000001;
                  v117[2] = 0x100000001;
                  v117[1] = 0x100000001;
                }
              }
              else
              {
                *(void *)((char *)v117 + 4) = 0;
                LODWORD(v117[0]) = 0;
                int v20 = 0;
                int v21 = 0;
                memset(v116, 0, sizeof(v116));
                int v22 = 0;
                memset(v121, 0, sizeof(v121));
                int v23 = 0;
                int v24 = 0;
                int v25 = 0;
                int v26 = 0;
                int v27 = 0;
                unsigned __int8 v28 = 0;
                v117[3] = 0x100000001;
                v117[2] = 0x100000001;
                HIDWORD(v117[1]) = 1;
              }
            }
            else
            {
              v117[1] = 0;
              v117[0] = 0;
              int v20 = 0;
              int v21 = 0;
              memset(v116, 0, sizeof(v116));
              int v22 = 0;
              memset(v121, 0, sizeof(v121));
              int v23 = 0;
              int v24 = 0;
              int v25 = 0;
              int v26 = 0;
              int v27 = 0;
              unsigned __int8 v28 = 0;
              v117[3] = 0x100000001;
              v117[2] = 0x100000001;
            }
          }
          else
          {
            memset(v117, 0, 20);
            int v20 = 0;
            int v21 = 0;
            memset(v116, 0, sizeof(v116));
            int v22 = 0;
            memset(v121, 0, sizeof(v121));
            int v23 = 0;
            int v24 = 0;
            int v25 = 0;
            int v26 = 0;
            int v27 = 0;
            unsigned __int8 v28 = 0;
            v117[3] = 0x100000001;
            HIDWORD(v117[2]) = 1;
          }
        }
        else
        {
          memset(v117, 0, 24);
          int v20 = 0;
          int v21 = 0;
          memset(v116, 0, sizeof(v116));
          int v22 = 0;
          memset(v121, 0, sizeof(v121));
          int v23 = 0;
          int v24 = 0;
          int v25 = 0;
          int v26 = 0;
          int v27 = 0;
          unsigned __int8 v28 = 0;
          v117[3] = 0x100000001;
        }
      }
      else
      {
        memset(v117, 0, 28);
        int v20 = 0;
        int v21 = 0;
        memset(v116, 0, sizeof(v116));
        int v22 = 0;
        memset(v121, 0, sizeof(v121));
        int v23 = 0;
        int v24 = 0;
        int v25 = 0;
        int v26 = 0;
        int v27 = 0;
        unsigned __int8 v28 = 0;
        HIDWORD(v117[3]) = 1;
      }
    }
    else
    {
      memset(v117, 0, sizeof(v117));
      int v20 = 0;
      int v21 = 0;
      memset(v116, 0, sizeof(v116));
      int v22 = 0;
      memset(v121, 0, sizeof(v121));
      int v23 = 0;
      int v24 = 0;
      int v25 = 0;
      int v26 = 0;
      int v27 = 0;
      unsigned __int8 v28 = 0;
    }
  }
  else
  {
    int v23 = 0;
    memset(v117, 0, sizeof(v117));
    int v20 = 0;
    int v21 = 0;
    memset(v116, 0, sizeof(v116));
    int v22 = 0;
    memset(v121, 0, sizeof(v121));
    int v24 = 0;
    int v25 = 0;
    int v26 = 0;
    int v27 = 0;
    unsigned __int8 v28 = 0;
  }
LABEL_21:
  if (v27)
  {
    int v29 = v20;
    v30 = v5;
    int v31 = v23;
    int v32 = v22;
    int v33 = v24;
    int v34 = v25;
    int v35 = v26;

    int v26 = v35;
    int v25 = v34;
    int v24 = v33;
    int v22 = v32;
    int v23 = v31;
    v5 = v30;
    int v20 = v29;
  }
  if (v26)
  {
  }
  if (LODWORD(v121[0]))
  {
  }
  if (v25)
  {
  }
  if (HIDWORD(v121[0]))
  {
  }
  if (v24)
  {
  }
  if (LODWORD(v121[1]))
  {
  }
  if (v23)
  {
  }
  if (HIDWORD(v121[1]))
  {
  }
  if (v22)
  {
  }
  if (LODWORD(v121[2]))
  {
  }
  if (*(_DWORD *)v116)
  {
  }
  if (v21)
  {
  }
  if (HIDWORD(v121[2]))
  {
  }
  if (*(_DWORD *)&v116[4])
  {
  }
  if (v20)
  {
  }
  if (LODWORD(v121[3]))
  {
  }
  if (*(_DWORD *)&v116[8])
  {
  }
  if (HIDWORD(v121[3]))
  {
  }
  if (LODWORD(v117[0]))
  {
  }
  if (*(_DWORD *)&v116[12])
  {
  }
  if (*(_DWORD *)&v116[16])
  {
  }
  if (HIDWORD(v117[0]))
  {
  }
  if (LODWORD(v117[1]))
  {
  }
  if (HIDWORD(v117[1]))
  {
  }
  if (LODWORD(v117[2]))
  {
  }
  if (HIDWORD(v117[2]))
  {
  }
  if (LODWORD(v117[3]))
  {
  }
  if (HIDWORD(v117[3]))
  {
  }
  if (v118)
  {
  }
LABEL_82:

  return v28;
}

- (unint64_t)hash
{
  v3 = [(KCSharingInternetPasswordCredential *)self sharingGroup];
  id v4 = [v3 hash];

  v5 = [(KCSharingInternetPasswordCredential *)self accessGroup];
  int64_t v6 = (unsigned char *)[v5 hash] - (unsigned char *)v4 + 32 * (void)v4;

  v7 = [(KCSharingInternetPasswordCredential *)self account];
  int64_t v8 = (int64_t)[v7 hash] + 32 * v6 - v6;

  v9 = [(KCSharingInternetPasswordCredential *)self protocol];
  int64_t v10 = (int64_t)[v9 hash] + 32 * v8 - v8;

  v11 = [(KCSharingInternetPasswordCredential *)self server];
  int64_t v12 = (int64_t)[v11 hash] + 32 * v10 - v10;

  id v13 = [(KCSharingInternetPasswordCredential *)self port];
  int64_t v14 = (int64_t)[v13 hash] + 32 * v12 - v12;

  v15 = [(KCSharingInternetPasswordCredential *)self path];
  int64_t v16 = (int64_t)[v15 hash] + 32 * v14 - v14;

  v17 = [(KCSharingInternetPasswordCredential *)self authenticationType];
  int64_t v18 = (int64_t)[v17 hash] + 32 * v16 - v16;

  v19 = [(KCSharingInternetPasswordCredential *)self data];
  int64_t v20 = (int64_t)[v19 hash] + 32 * v18 - v18;

  int v21 = [(KCSharingInternetPasswordCredential *)self creationDate];
  int64_t v22 = (int64_t)[v21 hash] + 32 * v20 - v20;

  int v23 = [(KCSharingInternetPasswordCredential *)self modificationDate];
  int64_t v24 = (int64_t)[v23 hash] + 32 * v22 - v22;

  int v25 = [(KCSharingInternetPasswordCredential *)self comment];
  int64_t v26 = (int64_t)[v25 hash] + 32 * v24 - v24;

  int v27 = [(KCSharingInternetPasswordCredential *)self label];
  int64_t v28 = (int64_t)[v27 hash] + 32 * v26 - v26;

  int v29 = [(KCSharingInternetPasswordCredential *)self accessibility];
  int64_t v30 = (int64_t)[v29 hash] + 32 * v28 - v28;

  int v31 = [(KCSharingInternetPasswordCredential *)self viewHint];
  int64_t v32 = (int64_t)[v31 hash] + 32 * v30 - v30;

  int v33 = [(KCSharingInternetPasswordCredential *)self securityDomain];
  int64_t v34 = (int64_t)[v33 hash] + 32 * v32 - v32;

  int v35 = [(KCSharingInternetPasswordCredential *)self notes];
  int64_t v36 = (int64_t)[v35 hash] + 32 * v34 - v34;

  uint64_t v37 = [(KCSharingInternetPasswordCredential *)self history];
  int64_t v38 = (int64_t)[v37 hash] + 32 * v36 - v36;

  v39 = [(KCSharingInternetPasswordCredential *)self clientDefined0];
  int64_t v40 = (int64_t)[v39 hash] + 32 * v38 - v38;

  v41 = [(KCSharingInternetPasswordCredential *)self clientDefined1];
  int64_t v42 = (int64_t)[v41 hash] + 32 * v40 - v40;

  uint64_t v43 = [(KCSharingInternetPasswordCredential *)self clientDefined2];
  int64_t v44 = (int64_t)[v43 hash] + 32 * v42 - v42;

  uint64_t v45 = [(KCSharingInternetPasswordCredential *)self clientDefined3];
  v46 = (char *)[v45 hash] + 32 * v44 - v44;

  return (unint64_t)v46;
}

- (KCSharingInternetPasswordCredential)initWithAttributes:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v122.receiver = self;
  v122.super_class = (Class)KCSharingInternetPasswordCredential;
  v7 = [(KCSharingInternetPasswordCredential *)&v122 init];
  if (!v7) {
    goto LABEL_102;
  }
  uint64_t v8 = kSecAttrSharingGroup;
  v9 = [v6 objectForKeyedSubscript:kSecAttrSharingGroup];
  if (!v9)
  {
    CFStringRef v203 = @"KCSharingMissingAttribute";
    uint64_t v204 = v8;
    id v10 = +[NSDictionary dictionaryWithObjects:&v204 forKeys:&v203 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v10);
LABEL_21:

    goto LABEL_22;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
    CFStringRef v201 = @"KCSharingInvalidAttribute";
    uint64_t v199 = v8;
    id v10 = [v9 copy];
    id v200 = v10;
    id v17 = +[NSDictionary dictionaryWithObjects:&v200 forKeys:&v199 count:1];
    id v202 = v17;
    int64_t v18 = +[NSDictionary dictionaryWithObjects:&v202 forKeys:&v201 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v18);
LABEL_19:

    goto LABEL_20;
  }
  id v10 = [v6 objectForKeyedSubscript:kSecAttrAccessGroup];
  if (!v10)
  {
    CFStringRef v197 = @"KCSharingMissingAttribute";
    CFStringRef v198 = kSecAttrAccessGroup;
    id v17 = +[NSDictionary dictionaryWithObjects:&v198 forKeys:&v197 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v17);
LABEL_20:

    goto LABEL_21;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
    CFStringRef v195 = @"KCSharingInvalidAttribute";
    CFStringRef v193 = kSecAttrAccessGroup;
    id v17 = [v10 copy];
    id v194 = v17;
    int64_t v18 = +[NSDictionary dictionaryWithObjects:&v194 forKeys:&v193 count:1];
    v196 = v18;
    v19 = +[NSDictionary dictionaryWithObjects:&v196 forKeys:&v195 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v19);

    goto LABEL_19;
  }
  v11 = [v6 objectForKeyedSubscript:kSecAttrAccount];
  if (!v11)
  {
    CFStringRef v191 = @"KCSharingMissingAttribute";
    CFStringRef v192 = kSecAttrAccount;
    int v21 = 1;
    id v12 = +[NSDictionary dictionaryWithObjects:&v192 forKeys:&v191 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v12);
    goto LABEL_101;
  }
  if ((_NSIsNSString() & 1) == 0)
  {
    CFStringRef v189 = @"KCSharingInvalidAttribute";
    CFStringRef v187 = kSecAttrAccount;
    id v12 = [v11 copy];
    id v188 = v12;
    int64_t v22 = +[NSDictionary dictionaryWithObjects:&v188 forKeys:&v187 count:1];
    v190 = v22;
    int v23 = +[NSDictionary dictionaryWithObjects:&v190 forKeys:&v189 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v23);

    int v21 = 1;
    goto LABEL_101;
  }
  id v12 = [v6 objectForKeyedSubscript:kSecAttrProtocol];
  if (v12)
  {
    if (_NSIsNSString())
    {
      id v13 = [v6 objectForKeyedSubscript:kSecAttrServer];
      v121 = v12;
      if (v13)
      {
        if (_NSIsNSString())
        {
          uint64_t v14 = [v6 objectForKeyedSubscript:kSecAttrPort];
          id v120 = (void *)v14;
          if (!v14)
          {
            CFStringRef v173 = @"KCSharingMissingAttribute";
            CFStringRef v174 = kSecAttrPort;
            int v21 = 1;
            id v29 = +[NSDictionary dictionaryWithObjects:&v174 forKeys:&v173 count:1];
            sub_100046FBC(a4, 22, (uint64_t)v29);
LABEL_98:

            id v26 = v120;
            goto LABEL_99;
          }
          v15 = (void *)v14;
          if (_NSIsNSNumber())
          {
            id v16 = v15;
          }
          else
          {
            if (!_NSIsNSString())
            {
              CFStringRef v171 = @"KCSharingInvalidAttribute";
              CFStringRef v169 = kSecAttrPort;
              id v29 = [v15 copy];
              id v170 = v29;
              uint64_t v62 = +[NSDictionary dictionaryWithObjects:&v170 forKeys:&v169 count:1];
              uint64_t v172 = v62;
              id v31 = +[NSDictionary dictionaryWithObjects:&v172 forKeys:&v171 count:1];
              v63 = a4;
              v61 = (void *)v62;
              sub_100046FBC(v63, 1, (uint64_t)v31);
              int v21 = 1;
              goto LABEL_97;
            }
            +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v15 intValue]);
            id v16 = (id)objc_claimAutoreleasedReturnValue();
          }
          id v119 = v16;
          uint64_t v30 = [v6 objectForKeyedSubscript:kSecAttrPath];
          if (v30)
          {
            unsigned int v118 = (void *)v30;
            if (_NSIsNSString())
            {
              id v31 = [v6 objectForKeyedSubscript:kSecAttrAuthenticationType];
              if (v31)
              {
                v117 = v13;
                v116 = v31;
                if (_NSIsNSString())
                {
                  v115 = [v6 objectForKeyedSubscript:kSecValueData];
                  if (v115)
                  {
                    if (_NSIsNSData())
                    {
                      id v32 = [v6 objectForKeyedSubscript:kSecAttrCreationDate];
                      if (v32)
                      {
                        if (_NSIsNSDate())
                        {
                          v112 = [v6 objectForKeyedSubscript:kSecAttrModificationDate];
                          if (v112)
                          {
                            if (_NSIsNSDate())
                            {
                              v109 = [v6 objectForKeyedSubscript:kSecAttrComment];
                              v106 = [v6 objectForKeyedSubscript:kSecAttrLabel];
                              v108 = [v6 objectForKeyedSubscript:kSecAttrAccessible];
                              if (v108)
                              {
                                if (_NSIsNSString() && [v108 length])
                                {
                                  id v107 = [v6 objectForKeyedSubscript:kSecAttrSyncViewHint];
                                  if (v107 && (_NSIsNSString() & 1) == 0)
                                  {
                                    CFStringRef v131 = @"KCSharingInvalidAttribute";
                                    CFStringRef v129 = kSecAttrSyncViewHint;
                                    id v105 = [v107 copy];
                                    id v130 = v105;
                                    id v104 = +[NSDictionary dictionaryWithObjects:&v130 forKeys:&v129 count:1];
                                    id v132 = v104;
                                    v79 = +[NSDictionary dictionaryWithObjects:&v132 forKeys:&v131 count:1];
                                    sub_100046FBC(a4, 1, (uint64_t)v79);

                                    int v21 = 1;
                                  }
                                  else
                                  {
                                    id v105 = [v6 objectForKeyedSubscript:kSecAttrSecurityDomain];
                                    if (v105)
                                    {
                                      if (_NSIsNSString())
                                      {
                                        id v104 = [v6 objectForKeyedSubscript:kSecDataInetExtraNotes];
                                        int v33 = [v6 objectForKeyedSubscript:kSecDataInetExtraHistory];
                                        int64_t v34 = [v6 objectForKeyedSubscript:kSecDataInetExtraClientDefined0];
                                        int v35 = [v6 objectForKeyedSubscript:kSecDataInetExtraClientDefined1];
                                        v103 = [v6 objectForKeyedSubscript:kSecDataInetExtraClientDefined2];
                                        int64_t v36 = [v6 objectForKeyedSubscript:kSecDataInetExtraClientDefined3];
                                        uint64_t v37 = (NSString *)[v9 copy];
                                        sharingGroup = v7->_sharingGroup;
                                        v7->_sharingGroup = v37;

                                        v39 = (NSString *)[v10 copy];
                                        accessGroup = v7->_accessGroup;
                                        v7->_accessGroup = v39;

                                        v41 = (NSString *)[v11 copy];
                                        account = v7->_account;
                                        v7->_account = v41;

                                        uint64_t v43 = (NSString *)[v121 copy];
                                        protocol = v7->_protocol;
                                        v7->_protocol = v43;

                                        uint64_t v45 = (NSString *)[v117 copy];
                                        server = v7->_server;
                                        v7->_server = v45;

                                        uint64_t v47 = (NSNumber *)[v119 copy];
                                        port = v7->_port;
                                        v7->_port = v47;

                                        uint64_t v49 = (NSString *)[v118 copy];
                                        path = v7->_path;
                                        v7->_path = v49;

                                        uint64_t v51 = (NSString *)[v116 copy];
                                        authenticationType = v7->_authenticationType;
                                        v7->_authenticationType = v51;

                                        uint64_t v53 = (NSData *)[v115 copy];
                                        data = v7->_data;
                                        v7->_data = v53;

                                        uint64_t v55 = (NSDate *)[v32 copy];
                                        creationDate = v7->_creationDate;
                                        v7->_creationDate = v55;

                                        v57 = (NSDate *)[v112 copy];
                                        modificationDate = v7->_modificationDate;
                                        v7->_modificationDate = v57;

                                        if (_NSIsNSString())
                                        {
                                          v59 = (NSString *)[v109 copy];
                                          comment = v7->_comment;
                                          v7->_comment = v59;
                                        }
                                        else
                                        {
                                          comment = v7->_comment;
                                          v7->_comment = 0;
                                        }

                                        if (_NSIsNSString())
                                        {
                                          v82 = (NSString *)[v106 copy];
                                          label = v7->_label;
                                          v7->_label = v82;
                                        }
                                        else
                                        {
                                          label = v7->_label;
                                          v7->_label = 0;
                                        }

                                        v84 = (NSString *)[v108 copy];
                                        accessibility = v7->_accessibility;
                                        v7->_accessibility = v84;

                                        v86 = (NSString *)[v107 copy];
                                        viewHint = v7->_viewHint;
                                        v7->_viewHint = v86;

                                        v88 = (NSString *)[v105 copy];
                                        securityDomain = v7->_securityDomain;
                                        v7->_securityDomain = v88;

                                        if (_NSIsNSData())
                                        {
                                          v90 = (NSData *)[v104 copy];
                                          notes = v7->_notes;
                                          v7->_notes = v90;
                                        }
                                        else
                                        {
                                          notes = v7->_notes;
                                          v7->_notes = 0;
                                        }

                                        if (_NSIsNSData())
                                        {
                                          v92 = (NSData *)[v33 copy];
                                          history = v7->_history;
                                          v7->_history = v92;
                                        }
                                        else
                                        {
                                          history = v7->_history;
                                          v7->_history = 0;
                                        }

                                        if (_NSIsNSData())
                                        {
                                          v94 = (NSData *)[v34 copy];
                                          clientDefined0 = v7->_clientDefined0;
                                          v7->_clientDefined0 = v94;
                                        }
                                        else
                                        {
                                          clientDefined0 = v7->_clientDefined0;
                                          v7->_clientDefined0 = 0;
                                        }

                                        if (_NSIsNSData())
                                        {
                                          v96 = (NSData *)[v35 copy];
                                          clientDefined1 = v7->_clientDefined1;
                                          v7->_clientDefined1 = v96;
                                        }
                                        else
                                        {
                                          clientDefined1 = v7->_clientDefined1;
                                          v7->_clientDefined1 = 0;
                                        }

                                        if (_NSIsNSData())
                                        {
                                          v98 = (NSData *)[v103 copy];
                                          clientDefined2 = v7->_clientDefined2;
                                          v7->_clientDefined2 = v98;
                                        }
                                        else
                                        {
                                          clientDefined2 = v7->_clientDefined2;
                                          v7->_clientDefined2 = 0;
                                        }

                                        if (_NSIsNSData())
                                        {
                                          v100 = (NSData *)[v36 copy];
                                          clientDefined3 = v7->_clientDefined3;
                                          v7->_clientDefined3 = v100;
                                        }
                                        else
                                        {
                                          clientDefined3 = v7->_clientDefined3;
                                          v7->_clientDefined3 = 0;
                                        }

                                        int v21 = 0;
                                      }
                                      else
                                      {
                                        CFStringRef v125 = @"KCSharingInvalidAttribute";
                                        CFStringRef v123 = kSecAttrSecurityDomain;
                                        id v104 = [v105 copy];
                                        id v124 = v104;
                                        v80 = +[NSDictionary dictionaryWithObjects:&v124 forKeys:&v123 count:1];
                                        v126 = v80;
                                        v81 = +[NSDictionary dictionaryWithObjects:&v126 forKeys:&v125 count:1];
                                        sub_100046FBC(a4, 1, (uint64_t)v81);

                                        int v21 = 1;
                                      }
                                    }
                                    else
                                    {
                                      CFStringRef v127 = @"KCSharingMissingAttribute";
                                      CFStringRef v128 = kSecAttrSecurityDomain;
                                      int v21 = 1;
                                      id v104 = +[NSDictionary dictionaryWithObjects:&v128 forKeys:&v127 count:1];
                                      sub_100046FBC(a4, 22, (uint64_t)v104);
                                      id v105 = 0;
                                    }
                                  }
                                }
                                else
                                {
                                  CFStringRef v135 = @"KCSharingInvalidAttribute";
                                  CFStringRef v133 = kSecAttrAccessible;
                                  id v107 = [v108 copy];
                                  id v134 = v107;
                                  int v21 = 1;
                                  v77 = +[NSDictionary dictionaryWithObjects:&v134 forKeys:&v133 count:1];
                                  v136 = v77;
                                  v78 = +[NSDictionary dictionaryWithObjects:&v136 forKeys:&v135 count:1];
                                  sub_100046FBC(a4, 1, (uint64_t)v78);
                                }
                              }
                              else
                              {
                                CFStringRef v137 = @"KCSharingMissingAttribute";
                                CFStringRef v138 = kSecAttrAccessible;
                                int v21 = 1;
                                id v107 = +[NSDictionary dictionaryWithObjects:&v138 forKeys:&v137 count:1];
                                sub_100046FBC(a4, 22, (uint64_t)v107);
                              }
                            }
                            else
                            {
                              CFStringRef v141 = @"KCSharingInvalidAttribute";
                              CFStringRef v139 = kSecAttrModificationDate;
                              id v111 = [v112 copy];
                              id v140 = v111;
                              v75 = +[NSDictionary dictionaryWithObjects:&v140 forKeys:&v139 count:1];
                              v142 = v75;
                              v76 = +[NSDictionary dictionaryWithObjects:&v142 forKeys:&v141 count:1];
                              sub_100046FBC(a4, 1, (uint64_t)v76);

                              int v21 = 1;
                            }
                          }
                          else
                          {
                            CFStringRef v143 = @"KCSharingMissingAttribute";
                            CFStringRef v144 = kSecAttrModificationDate;
                            int v21 = 1;
                            v110 = +[NSDictionary dictionaryWithObjects:&v144 forKeys:&v143 count:1];
                            sub_100046FBC(a4, 22, (uint64_t)v110);
                          }
                        }
                        else
                        {
                          CFStringRef v147 = @"KCSharingInvalidAttribute";
                          CFStringRef v145 = kSecAttrCreationDate;
                          id v114 = [v32 copy];
                          id v146 = v114;
                          v73 = +[NSDictionary dictionaryWithObjects:&v146 forKeys:&v145 count:1];
                          v148 = v73;
                          v74 = +[NSDictionary dictionaryWithObjects:&v148 forKeys:&v147 count:1];
                          sub_100046FBC(a4, 1, (uint64_t)v74);

                          int v21 = 1;
                        }
                      }
                      else
                      {
                        CFStringRef v149 = @"KCSharingMissingAttribute";
                        CFStringRef v150 = kSecAttrCreationDate;
                        int v21 = 1;
                        v113 = +[NSDictionary dictionaryWithObjects:&v150 forKeys:&v149 count:1];
                        sub_100046FBC(a4, 22, (uint64_t)v113);
                      }
                    }
                    else
                    {
                      CFStringRef v153 = @"KCSharingInvalidAttribute";
                      CFStringRef v151 = kSecValueData;
                      id v32 = [v115 copy];
                      id v152 = v32;
                      v71 = +[NSDictionary dictionaryWithObjects:&v152 forKeys:&v151 count:1];
                      v154 = v71;
                      v72 = +[NSDictionary dictionaryWithObjects:&v154 forKeys:&v153 count:1];
                      sub_100046FBC(a4, 1, (uint64_t)v72);

                      int v21 = 1;
                    }
                  }
                  else
                  {
                    CFStringRef v155 = @"KCSharingMissingAttribute";
                    CFStringRef v156 = kSecValueData;
                    int v21 = 1;
                    id v32 = +[NSDictionary dictionaryWithObjects:&v156 forKeys:&v155 count:1];
                    sub_100046FBC(a4, 22, (uint64_t)v32);
                  }

                  id v31 = v116;
                  id v13 = v117;
                  v67 = v115;
                }
                else
                {
                  CFStringRef v159 = @"KCSharingInvalidAttribute";
                  CFStringRef v157 = kSecAttrAuthenticationType;
                  id v68 = [v31 copy];
                  id v158 = v68;
                  v69 = +[NSDictionary dictionaryWithObjects:&v158 forKeys:&v157 count:1];
                  v160 = v69;
                  v70 = +[NSDictionary dictionaryWithObjects:&v160 forKeys:&v159 count:1];
                  sub_100046FBC(a4, 1, (uint64_t)v70);

                  v67 = v68;
                  id v31 = v116;

                  int v21 = 1;
                }
              }
              else
              {
                CFStringRef v161 = @"KCSharingMissingAttribute";
                CFStringRef v162 = kSecAttrAuthenticationType;
                int v21 = 1;
                v67 = +[NSDictionary dictionaryWithObjects:&v162 forKeys:&v161 count:1];
                sub_100046FBC(a4, 22, (uint64_t)v67);
              }

              v61 = v118;
              id v29 = v119;
              goto LABEL_97;
            }
            CFStringRef v165 = @"KCSharingInvalidAttribute";
            CFStringRef v163 = kSecAttrPath;
            id v31 = [v118 copy];
            id v164 = v31;
            v64 = +[NSDictionary dictionaryWithObjects:&v164 forKeys:&v163 count:1];
            v166 = v64;
            v65 = +[NSDictionary dictionaryWithObjects:&v166 forKeys:&v165 count:1];
            v66 = a4;
            v61 = v118;
            sub_100046FBC(v66, 1, (uint64_t)v65);

            int v21 = 1;
          }
          else
          {
            CFStringRef v167 = @"KCSharingMissingAttribute";
            CFStringRef v168 = kSecAttrPath;
            int v21 = 1;
            id v31 = +[NSDictionary dictionaryWithObjects:&v168 forKeys:&v167 count:1];
            sub_100046FBC(a4, 22, (uint64_t)v31);
            v61 = 0;
          }
          id v29 = v119;
LABEL_97:

          goto LABEL_98;
        }
        CFStringRef v177 = @"KCSharingInvalidAttribute";
        CFStringRef v175 = kSecAttrServer;
        id v26 = [v13 copy];
        id v176 = v26;
        int v27 = +[NSDictionary dictionaryWithObjects:&v176 forKeys:&v175 count:1];
        v178 = v27;
        int64_t v28 = +[NSDictionary dictionaryWithObjects:&v178 forKeys:&v177 count:1];
        sub_100046FBC(a4, 1, (uint64_t)v28);

        int v21 = 1;
      }
      else
      {
        CFStringRef v179 = @"KCSharingMissingAttribute";
        CFStringRef v180 = kSecAttrServer;
        int v21 = 1;
        id v26 = +[NSDictionary dictionaryWithObjects:&v180 forKeys:&v179 count:1];
        sub_100046FBC(a4, 22, (uint64_t)v26);
      }
LABEL_99:

      id v12 = v121;
      goto LABEL_100;
    }
    CFStringRef v183 = @"KCSharingInvalidAttribute";
    CFStringRef v181 = kSecAttrProtocol;
    id v13 = [v12 copy];
    id v182 = v13;
    int64_t v24 = +[NSDictionary dictionaryWithObjects:&v182 forKeys:&v181 count:1];
    v184 = v24;
    int v25 = +[NSDictionary dictionaryWithObjects:&v184 forKeys:&v183 count:1];
    sub_100046FBC(a4, 1, (uint64_t)v25);

    int v21 = 1;
  }
  else
  {
    CFStringRef v185 = @"KCSharingMissingAttribute";
    CFStringRef v186 = kSecAttrProtocol;
    int v21 = 1;
    id v13 = +[NSDictionary dictionaryWithObjects:&v186 forKeys:&v185 count:1];
    sub_100046FBC(a4, 22, (uint64_t)v13);
  }
LABEL_100:

LABEL_101:
  if (!v21)
  {
LABEL_102:
    int64_t v20 = v7;
    goto LABEL_103;
  }
LABEL_22:
  int64_t v20 = 0;
LABEL_103:

  return v20;
}

- (KCSharingInternetPasswordCredential)initWithProto:(id)a3 sharingGroup:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  v76.receiver = self;
  v76.super_class = (Class)KCSharingInternetPasswordCredential;
  v9 = [(KCSharingInternetPasswordCredential *)&v76 init];
  if (v9)
  {
    id v10 = (NSString *)[v8 copy];
    sharingGroup = v9->_sharingGroup;
    v9->_sharingGroup = v10;

    id v12 = [v7 accessGroup];
    id v13 = (NSString *)[v12 copy];
    accessGroup = v9->_accessGroup;
    v9->_accessGroup = v13;

    v15 = [v7 account];
    id v16 = (NSString *)[v15 copy];
    account = v9->_account;
    v9->_account = v16;

    int64_t v18 = [v7 protocol];
    v19 = (NSString *)[v18 copy];
    protocol = v9->_protocol;
    v9->_protocol = v19;

    int v21 = [v7 server];
    int64_t v22 = (NSString *)[v21 copy];
    server = v9->_server;
    v9->_server = v22;

    uint64_t v24 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v7 port]);
    port = v9->_port;
    v9->_port = (NSNumber *)v24;

    id v26 = [v7 path];
    int v27 = (__CFString *)[v26 copy];
    int64_t v28 = v27;
    if (v27) {
      id v29 = v27;
    }
    else {
      id v29 = &stru_10030AA90;
    }
    objc_storeStrong((id *)&v9->_path, v29);

    uint64_t v30 = [v7 authenticationType];
    id v31 = (NSString *)[v30 copy];
    authenticationType = v9->_authenticationType;
    v9->_authenticationType = v31;

    int v33 = [v7 data];
    int64_t v34 = (NSData *)[v33 copy];
    data = v9->_data;
    v9->_data = v34;

    [v7 creationDate];
    uint64_t v36 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    creationDate = v9->_creationDate;
    v9->_creationDate = (NSDate *)v36;

    [v7 modificationDate];
    uint64_t v38 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
    modificationDate = v9->_modificationDate;
    v9->_modificationDate = (NSDate *)v38;

    int64_t v40 = [v7 comment];
    v41 = (NSString *)[v40 copy];
    comment = v9->_comment;
    v9->_comment = v41;

    uint64_t v43 = [v7 label];
    int64_t v44 = (NSString *)[v43 copy];
    label = v9->_label;
    v9->_label = v44;

    v46 = [v7 accessibility];
    uint64_t v47 = (__CFString *)[v46 copy];
    v48 = v47;
    if (v47) {
      uint64_t v49 = v47;
    }
    else {
      uint64_t v49 = (__CFString *)kSecAttrAccessibleWhenUnlocked;
    }
    objc_storeStrong((id *)&v9->_accessibility, v49);

    v50 = [v7 viewHint];
    uint64_t v51 = (NSString *)[v50 copy];
    viewHint = v9->_viewHint;
    v9->_viewHint = v51;

    uint64_t v53 = [v7 securityDomain];
    v54 = (__CFString *)[v53 copy];
    uint64_t v55 = v54;
    if (v54) {
      v56 = v54;
    }
    else {
      v56 = &stru_10030AA90;
    }
    objc_storeStrong((id *)&v9->_securityDomain, v56);

    v57 = [v7 notes];
    v58 = (NSData *)[v57 copy];
    notes = v9->_notes;
    v9->_notes = v58;

    v60 = [v7 history];
    v61 = (NSData *)[v60 copy];
    history = v9->_history;
    v9->_history = v61;

    v63 = [v7 clientDefined0];
    v64 = (NSData *)[v63 copy];
    clientDefined0 = v9->_clientDefined0;
    v9->_clientDefined0 = v64;

    v66 = [v7 clientDefined1];
    v67 = (NSData *)[v66 copy];
    clientDefined1 = v9->_clientDefined1;
    v9->_clientDefined1 = v67;

    v69 = [v7 clientDefined2];
    v70 = (NSData *)[v69 copy];
    clientDefined2 = v9->_clientDefined2;
    v9->_clientDefined2 = v70;

    v72 = [v7 clientDefined3];
    v73 = (NSData *)[v72 copy];
    clientDefined3 = v9->_clientDefined3;
    v9->_clientDefined3 = v73;
  }
  return v9;
}

- (KCSharingInternetPasswordCredential)initWithDatabaseItem:(SecDbItem *)a3 error:(id *)a4
{
  CFSetRef v7 = [(id)objc_opt_class() requiredAttributeKeys];
  id v8 = sub_100155CF8(a3, v7, a4);

  if (v8)
  {
    self = [(KCSharingInternetPasswordCredential *)self initWithAttributes:v8 error:a4];
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (NSSet)requiredAttributeKeys
{
  if (qword_10035D260 != -1) {
    dispatch_once(&qword_10035D260, &stru_100306D08);
  }
  v2 = (void *)qword_10035D258;

  return (NSSet *)v2;
}

+ (const)databaseItemClass
{
  return (const SecDbClass *)sub_10000C75C(@"inet", &qword_10035D020, (uint64_t)&unk_10035D018);
}

@end