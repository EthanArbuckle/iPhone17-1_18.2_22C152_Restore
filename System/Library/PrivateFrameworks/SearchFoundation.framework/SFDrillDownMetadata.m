@interface SFDrillDownMetadata
+ (BOOL)supportsSecureCoding;
- (BOOL)hasCardOnlyMetadata;
- (BOOL)hasCardSearchMetadata;
- (BOOL)hasEntitySearchMetadata;
- (BOOL)hasEntitySearchOnlyMetadata;
- (BOOL)isEqual:(id)a3;
- (NSArray)cardDomains;
- (NSArray)cardIdentifiers;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)cardIdentifier;
- (NSString)debugParams;
- (NSString)params;
- (NSString)qtype;
- (NSString)viewConfigName;
- (SFCardMetadata)cardOnlyMetadata;
- (SFCardSearchMetadata)cardSearchMetadata;
- (SFDrillDownMetadata)initWithCoder:(id)a3;
- (SFDrillDownMetadata)initWithProtobuf:(id)a3;
- (SFEntitySearchMetadata)entitySearchMetadata;
- (SFEntitySearchMetadata)entitySearchOnlyMetadata;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCardDomains:(id)a3;
- (void)setCardIdentifier:(id)a3;
- (void)setCardIdentifiers:(id)a3;
- (void)setCardOnlyMetadata:(id)a3;
- (void)setCardSearchMetadata:(id)a3;
- (void)setDebugParams:(id)a3;
- (void)setEntitySearchMetadata:(id)a3;
- (void)setEntitySearchOnlyMetadata:(id)a3;
- (void)setParams:(id)a3;
- (void)setQtype:(id)a3;
- (void)setViewConfigName:(id)a3;
@end

@implementation SFDrillDownMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_params, 0);
  objc_storeStrong((id *)&self->_debugParams, 0);
  objc_storeStrong((id *)&self->_entitySearchMetadata, 0);
  objc_storeStrong((id *)&self->_cardSearchMetadata, 0);
  objc_storeStrong((id *)&self->_entitySearchOnlyMetadata, 0);
  objc_storeStrong((id *)&self->_cardOnlyMetadata, 0);
  objc_storeStrong((id *)&self->_viewConfigName, 0);
  objc_storeStrong((id *)&self->_qtype, 0);
  objc_storeStrong((id *)&self->_cardDomains, 0);
  objc_storeStrong((id *)&self->_cardIdentifiers, 0);
  objc_storeStrong((id *)&self->_cardIdentifier, 0);
}

- (void)setParams:(id)a3
{
}

- (NSString)params
{
  return self->_params;
}

- (void)setDebugParams:(id)a3
{
}

- (NSString)debugParams
{
  return self->_debugParams;
}

- (SFEntitySearchMetadata)entitySearchMetadata
{
  return self->_entitySearchMetadata;
}

- (SFCardSearchMetadata)cardSearchMetadata
{
  return self->_cardSearchMetadata;
}

- (SFEntitySearchMetadata)entitySearchOnlyMetadata
{
  return self->_entitySearchOnlyMetadata;
}

- (SFCardMetadata)cardOnlyMetadata
{
  return self->_cardOnlyMetadata;
}

- (void)setViewConfigName:(id)a3
{
}

- (NSString)viewConfigName
{
  return self->_viewConfigName;
}

- (void)setQtype:(id)a3
{
}

- (NSString)qtype
{
  return self->_qtype;
}

- (void)setCardDomains:(id)a3
{
}

- (NSArray)cardDomains
{
  return self->_cardDomains;
}

- (void)setCardIdentifiers:(id)a3
{
}

- (NSArray)cardIdentifiers
{
  return self->_cardIdentifiers;
}

- (void)setCardIdentifier:(id)a3
{
}

- (NSString)cardIdentifier
{
  return self->_cardIdentifier;
}

- (unint64_t)hash
{
  v25 = [(SFDrillDownMetadata *)self cardIdentifier];
  uint64_t v3 = [v25 hash];
  v24 = [(SFDrillDownMetadata *)self cardIdentifiers];
  uint64_t v4 = [v24 hash] ^ v3;
  v23 = [(SFDrillDownMetadata *)self cardDomains];
  uint64_t v5 = [v23 hash];
  v6 = [(SFDrillDownMetadata *)self qtype];
  uint64_t v7 = v4 ^ v5 ^ [v6 hash];
  v8 = [(SFDrillDownMetadata *)self viewConfigName];
  uint64_t v9 = [v8 hash];
  v10 = [(SFDrillDownMetadata *)self cardOnlyMetadata];
  uint64_t v11 = v9 ^ [v10 hash];
  v12 = [(SFDrillDownMetadata *)self entitySearchOnlyMetadata];
  uint64_t v13 = v7 ^ v11 ^ [v12 hash];
  v14 = [(SFDrillDownMetadata *)self cardSearchMetadata];
  uint64_t v15 = [v14 hash];
  v16 = [(SFDrillDownMetadata *)self entitySearchMetadata];
  uint64_t v17 = v15 ^ [v16 hash];
  v18 = [(SFDrillDownMetadata *)self debugParams];
  uint64_t v19 = v17 ^ [v18 hash];
  v20 = [(SFDrillDownMetadata *)self params];
  unint64_t v21 = v13 ^ v19 ^ [v20 hash];

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFDrillDownMetadata *)a3;
  if (self == v4)
  {
    char v18 = 1;
    goto LABEL_78;
  }
  if (![(SFDrillDownMetadata *)v4 isMemberOfClass:objc_opt_class()])
  {
    char v18 = 0;
    goto LABEL_78;
  }
  uint64_t v5 = v4;
  v6 = [(SFDrillDownMetadata *)self cardIdentifier];
  uint64_t v7 = [(SFDrillDownMetadata *)v5 cardIdentifier];
  id v103 = v7;
  id v104 = v6;
  int v101 = v7 != 0;
  int v102 = v6 == 0;
  if (v102 == v101)
  {
    memset(v100, 0, sizeof(v100));
    long long v99 = 0uLL;
    memset(v105, 0, sizeof(v105));
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    goto LABEL_15;
  }
  uint64_t v8 = [(SFDrillDownMetadata *)self cardIdentifier];
  BOOL v9 = v8 != 0;
  v98 = (void *)v8;
  if (v8)
  {
    v10 = [(SFDrillDownMetadata *)self cardIdentifier];
    v94 = [(SFDrillDownMetadata *)v5 cardIdentifier];
    v95 = v10;
    if (!objc_msgSend(v10, "isEqual:"))
    {
      memset(v100, 0, 44);
      memset(v105, 0, sizeof(v105));
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      HIDWORD(v100[5]) = 1;
      goto LABEL_15;
    }
  }
  v97 = [(SFDrillDownMetadata *)self cardIdentifiers];
  v96 = [(SFDrillDownMetadata *)v5 cardIdentifiers];
  HIDWORD(v100[5]) = v9;
  if ((v97 == 0) == (v96 != 0))
  {
    long long v99 = 0uLL;
    memset(v100, 0, 36);
    memset(v105, 0, sizeof(v105));
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    *(void *)((char *)&v100[4] + 4) = 1;
    goto LABEL_15;
  }
  uint64_t v19 = [(SFDrillDownMetadata *)self cardIdentifiers];
  HIDWORD(v105[3]) = v19 != 0;
  v93 = (void *)v19;
  if (v19)
  {
    v20 = [(SFDrillDownMetadata *)self cardIdentifiers];
    v89 = [(SFDrillDownMetadata *)v5 cardIdentifiers];
    v90 = v20;
    if (!objc_msgSend(v20, "isEqual:"))
    {
      memset(v100, 0, 32);
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      memset(v105, 0, 28);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      HIDWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  v92 = [(SFDrillDownMetadata *)self cardDomains];
  v91 = [(SFDrillDownMetadata *)v5 cardDomains];
  if ((v92 == 0) == (v91 != 0))
  {
    memset(v100, 0, 24);
    long long v99 = 0uLL;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    memset(v105, 0, 28);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 1;
    goto LABEL_15;
  }
  v88 = [(SFDrillDownMetadata *)self cardDomains];
  LODWORD(v105[3]) = v88 != 0;
  if (v88)
  {
    v29 = [(SFDrillDownMetadata *)self cardDomains];
    v84 = [(SFDrillDownMetadata *)v5 cardDomains];
    v85 = v29;
    if (!objc_msgSend(v29, "isEqual:"))
    {
      memset(v100, 0, 24);
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      memset(v105, 0, 24);
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      LODWORD(v105[3]) = 1;
      goto LABEL_15;
    }
  }
  v87 = [(SFDrillDownMetadata *)self qtype];
  v86 = [(SFDrillDownMetadata *)v5 qtype];
  if ((v87 == 0) == (v86 != 0))
  {
    v100[0] = 0;
    v100[1] = 0;
    long long v99 = 0uLL;
    int v11 = 0;
    int v12 = 0;
    memset(v105, 0, 24);
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 1;
    goto LABEL_15;
  }
  uint64_t v30 = [(SFDrillDownMetadata *)self qtype];
  HIDWORD(v105[2]) = v30 != 0;
  v83 = (void *)v30;
  if (v30)
  {
    v31 = [(SFDrillDownMetadata *)self qtype];
    v79 = [(SFDrillDownMetadata *)v5 qtype];
    v80 = v31;
    if (!objc_msgSend(v31, "isEqual:"))
    {
      v100[0] = 0;
      v100[1] = 0;
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      memset(v105, 0, 20);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      LODWORD(v100[5]) = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      HIDWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  uint64_t v32 = [(SFDrillDownMetadata *)self viewConfigName];
  v81 = [(SFDrillDownMetadata *)v5 viewConfigName];
  v82 = (void *)v32;
  if ((v32 == 0) == (v81 != 0))
  {
    v100[0] = 0;
    long long v99 = 0uLL;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    memset(v105, 0, 20);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    LODWORD(v100[5]) = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 1;
    goto LABEL_15;
  }
  uint64_t v33 = [(SFDrillDownMetadata *)self viewConfigName];
  BOOL v34 = v33 != 0;
  v78 = (void *)v33;
  if (v33)
  {
    v35 = [(SFDrillDownMetadata *)self viewConfigName];
    v74 = [(SFDrillDownMetadata *)v5 viewConfigName];
    v75 = v35;
    if (!objc_msgSend(v35, "isEqual:"))
    {
      v100[0] = 0;
      long long v99 = 0uLL;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      memset(v105, 0, 20);
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      LODWORD(v100[5]) = 1;
      goto LABEL_15;
    }
    LODWORD(v100[5]) = v34;
  }
  else
  {
    LODWORD(v100[5]) = 0;
  }
  uint64_t v36 = [(SFDrillDownMetadata *)self cardOnlyMetadata];
  v76 = [(SFDrillDownMetadata *)v5 cardOnlyMetadata];
  v77 = (void *)v36;
  if ((v36 == 0) == (v76 != 0))
  {
    v100[0] = 0;
    *(void *)((char *)&v99 + 4) = 0;
    LODWORD(v99) = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    memset(v105, 0, 20);
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    goto LABEL_15;
  }
  v73 = [(SFDrillDownMetadata *)self cardOnlyMetadata];
  LODWORD(v105[2]) = v73 != 0;
  if (v73)
  {
    v37 = [(SFDrillDownMetadata *)self cardOnlyMetadata];
    v69 = [(SFDrillDownMetadata *)v5 cardOnlyMetadata];
    v70 = v37;
    if (!objc_msgSend(v37, "isEqual:"))
    {
      *(void *)((char *)&v99 + 4) = 0;
      v100[0] = 0x100000000;
      v105[0] = 0;
      v105[1] = 0;
      LODWORD(v99) = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      HIDWORD(v99) = 1;
      LODWORD(v105[2]) = 1;
      goto LABEL_15;
    }
  }
  v72 = [(SFDrillDownMetadata *)self entitySearchOnlyMetadata];
  v71 = [(SFDrillDownMetadata *)v5 entitySearchOnlyMetadata];
  if ((v72 == 0) == (v71 != 0))
  {
    v100[0] = 0x100000000;
    v105[0] = 0;
    v105[1] = 0;
    *(void *)&long long v99 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    *((void *)&v99 + 1) = 0x100000001;
    goto LABEL_15;
  }
  v68 = [(SFDrillDownMetadata *)self entitySearchOnlyMetadata];
  HIDWORD(v105[1]) = v68 != 0;
  if (v68)
  {
    v38 = [(SFDrillDownMetadata *)self entitySearchOnlyMetadata];
    v64 = [(SFDrillDownMetadata *)v5 entitySearchOnlyMetadata];
    v65 = v38;
    if (!objc_msgSend(v38, "isEqual:"))
    {
      *(void *)&long long v99 = 0;
      int v11 = 0;
      *(void *)((char *)v105 + 4) = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      LODWORD(v105[0]) = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((void *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      HIDWORD(v105[1]) = 1;
      goto LABEL_15;
    }
  }
  v67 = [(SFDrillDownMetadata *)self cardSearchMetadata];
  v66 = [(SFDrillDownMetadata *)v5 cardSearchMetadata];
  if ((v67 == 0) == (v66 != 0))
  {
    int v11 = 0;
    *(void *)((char *)v105 + 4) = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    LODWORD(v105[0]) = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(void *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    goto LABEL_15;
  }
  uint64_t v39 = [(SFDrillDownMetadata *)self cardSearchMetadata];
  LODWORD(v105[1]) = v39 != 0;
  v63 = (void *)v39;
  v46 = v5;
  if (!v39
    || ([(SFDrillDownMetadata *)self cardSearchMetadata],
        v40 = objc_claimAutoreleasedReturnValue(),
        [(SFDrillDownMetadata *)v5 cardSearchMetadata],
        v59 = objc_claimAutoreleasedReturnValue(),
        v60 = v40,
        objc_msgSend(v40, "isEqual:")))
  {
    v62 = [(SFDrillDownMetadata *)self entitySearchMetadata];
    v61 = [(SFDrillDownMetadata *)v5 entitySearchMetadata];
    if ((v62 == 0) == (v61 != 0))
    {
      int v12 = 0;
      v105[0] = 0;
      int v13 = 0;
      int v14 = 0;
      int v15 = 0;
      int v16 = 0;
      int v17 = 0;
      char v18 = 0;
      v100[4] = 0x100000001;
      v100[3] = 0x100000001;
      v100[2] = 0x100000001;
      v100[1] = 0x100000001;
      *((void *)&v99 + 1) = 0x100000001;
      v100[0] = 0x100000001;
      int v11 = 1;
      *(void *)&long long v99 = 0x100000001;
    }
    else
    {
      uint64_t v41 = [(SFDrillDownMetadata *)self entitySearchMetadata];
      HIDWORD(v105[0]) = v41 != 0;
      v58 = (void *)v41;
      if (!v41
        || ([(SFDrillDownMetadata *)self entitySearchMetadata],
            v42 = objc_claimAutoreleasedReturnValue(),
            [(SFDrillDownMetadata *)v46 entitySearchMetadata],
            v54 = objc_claimAutoreleasedReturnValue(),
            v55 = v42,
            objc_msgSend(v42, "isEqual:")))
      {
        v57 = [(SFDrillDownMetadata *)self debugParams];
        v56 = [(SFDrillDownMetadata *)v46 debugParams];
        if ((v57 == 0) == (v56 != 0))
        {
          int v14 = 0;
          LODWORD(v105[0]) = 0;
          int v15 = 0;
          int v16 = 0;
          int v17 = 0;
          char v18 = 0;
          v100[4] = 0x100000001;
          v100[3] = 0x100000001;
          v100[2] = 0x100000001;
          v100[1] = 0x100000001;
          *((void *)&v99 + 1) = 0x100000001;
          v100[0] = 0x100000001;
          *(void *)&long long v99 = 0x100000001;
          int v11 = 1;
          int v12 = 1;
          int v13 = 1;
        }
        else
        {
          uint64_t v43 = [(SFDrillDownMetadata *)self debugParams];
          LODWORD(v105[0]) = v43 != 0;
          v53 = (void *)v43;
          if (!v43
            || ([(SFDrillDownMetadata *)self debugParams],
                v44 = objc_claimAutoreleasedReturnValue(),
                [(SFDrillDownMetadata *)v46 debugParams],
                v49 = objc_claimAutoreleasedReturnValue(),
                v50 = v44,
                objc_msgSend(v44, "isEqual:")))
          {
            v52 = [(SFDrillDownMetadata *)self params];
            v51 = [(SFDrillDownMetadata *)v46 params];
            if ((v52 == 0) == (v51 != 0))
            {
              int v16 = 0;
              int v17 = 0;
              char v18 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((void *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(void *)&long long v99 = 0x100000001;
              int v11 = 1;
              int v12 = 1;
              int v13 = 1;
              int v14 = 1;
              int v15 = 1;
            }
            else
            {
              v48 = [(SFDrillDownMetadata *)self params];
              if (v48)
              {
                v45 = [(SFDrillDownMetadata *)self params];
                uint64_t v5 = v46;
                uint64_t v7 = [(SFDrillDownMetadata *)v46 params];
                v47 = v45;
                char v18 = [v45 isEqual:v7];
                int v17 = 1;
                v100[4] = 0x100000001;
                v100[3] = 0x100000001;
                v100[2] = 0x100000001;
                v100[1] = 0x100000001;
                *((void *)&v99 + 1) = 0x100000001;
                v100[0] = 0x100000001;
                *(void *)&long long v99 = 0x100000001;
                int v11 = 1;
                int v12 = 1;
                int v13 = 1;
                int v14 = 1;
                int v15 = 1;
                int v16 = 1;
                goto LABEL_15;
              }
              v48 = 0;
              int v17 = 0;
              v100[4] = 0x100000001;
              v100[3] = 0x100000001;
              v100[2] = 0x100000001;
              v100[1] = 0x100000001;
              *((void *)&v99 + 1) = 0x100000001;
              v100[0] = 0x100000001;
              *(void *)&long long v99 = 0x100000001;
              int v11 = 1;
              int v12 = 1;
              int v13 = 1;
              int v14 = 1;
              int v15 = 1;
              int v16 = 1;
              char v18 = 1;
            }
          }
          else
          {
            int v15 = 0;
            int v16 = 0;
            int v17 = 0;
            char v18 = 0;
            v100[4] = 0x100000001;
            v100[3] = 0x100000001;
            v100[2] = 0x100000001;
            v100[1] = 0x100000001;
            *((void *)&v99 + 1) = 0x100000001;
            v100[0] = 0x100000001;
            *(void *)&long long v99 = 0x100000001;
            int v11 = 1;
            int v12 = 1;
            int v13 = 1;
            int v14 = 1;
            LODWORD(v105[0]) = 1;
          }
        }
      }
      else
      {
        int v13 = 0;
        int v14 = 0;
        v105[0] = 0x100000000;
        int v15 = 0;
        int v16 = 0;
        int v17 = 0;
        char v18 = 0;
        v100[4] = 0x100000001;
        v100[3] = 0x100000001;
        v100[2] = 0x100000001;
        v100[1] = 0x100000001;
        *((void *)&v99 + 1) = 0x100000001;
        v100[0] = 0x100000001;
        *(void *)&long long v99 = 0x100000001;
        int v11 = 1;
        int v12 = 1;
      }
    }
  }
  else
  {
    int v12 = 0;
    v105[0] = 0;
    int v13 = 0;
    int v14 = 0;
    int v15 = 0;
    int v16 = 0;
    int v17 = 0;
    char v18 = 0;
    v100[4] = 0x100000001;
    v100[3] = 0x100000001;
    v100[2] = 0x100000001;
    v100[1] = 0x100000001;
    HIDWORD(v99) = 1;
    v100[0] = 0x100000001;
    *(void *)((char *)&v99 + 4) = 0x100000000;
    LODWORD(v99) = 1;
    int v11 = 1;
    LODWORD(v105[1]) = 1;
  }
  uint64_t v5 = v46;
LABEL_15:
  if (v17)
  {
    unint64_t v21 = v5;
    int v22 = v11;
    int v23 = v13;
    int v24 = v12;
    int v25 = v14;
    int v26 = v15;
    int v27 = v16;

    int v16 = v27;
    int v15 = v26;
    int v14 = v25;
    int v12 = v24;
    int v13 = v23;
    int v11 = v22;
    uint64_t v5 = v21;
  }
  if (v16) {

  }
  if (v15)
  {
  }
  if (LODWORD(v105[0]))
  {

    if (!v14) {
      goto LABEL_23;
    }
LABEL_80:

    if (!v13) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (v14) {
    goto LABEL_80;
  }
LABEL_23:
  if (v13)
  {
LABEL_24:
  }
LABEL_25:
  if (HIDWORD(v105[0]))
  {
  }
  if (v12) {

  }
  if (DWORD1(v99))
  {
  }
  if (LODWORD(v105[1]))
  {
  }
  if (v11) {

  }
  if (v99)
  {
  }
  if (HIDWORD(v105[1]))
  {
  }
  if (LODWORD(v100[0])) {

  }
  if (DWORD2(v99))
  {
  }
  if (LODWORD(v105[2]))
  {
  }
  if (HIDWORD(v100[0])) {

  }
  if (HIDWORD(v99))
  {
  }
  if (LODWORD(v100[5]))
  {
  }
  if (HIDWORD(v100[1])) {

  }
  if (LODWORD(v100[1]))
  {
  }
  if (HIDWORD(v105[2]))
  {
  }
  if (HIDWORD(v100[2])) {

  }
  if (LODWORD(v100[2]))
  {
  }
  if (LODWORD(v105[3]))
  {
  }
  if (HIDWORD(v100[3])) {

  }
  if (LODWORD(v100[3]))
  {
  }
  if (HIDWORD(v105[3]))
  {
  }
  if (LODWORD(v100[4])) {

  }
  if (HIDWORD(v100[4]))
  {
  }
  if (HIDWORD(v100[5]))
  {
  }
  if (v102 != v101) {

  }
LABEL_78:
  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v5 = [(SFDrillDownMetadata *)self cardIdentifier];
  v6 = (void *)[v5 copy];
  [v4 setCardIdentifier:v6];

  uint64_t v7 = [(SFDrillDownMetadata *)self cardIdentifiers];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setCardIdentifiers:v8];

  BOOL v9 = [(SFDrillDownMetadata *)self cardDomains];
  v10 = (void *)[v9 copy];
  [v4 setCardDomains:v10];

  int v11 = [(SFDrillDownMetadata *)self qtype];
  int v12 = (void *)[v11 copy];
  [v4 setQtype:v12];

  int v13 = [(SFDrillDownMetadata *)self viewConfigName];
  int v14 = (void *)[v13 copy];
  [v4 setViewConfigName:v14];

  if ([(SFDrillDownMetadata *)self hasCardOnlyMetadata])
  {
    int v15 = [(SFDrillDownMetadata *)self cardOnlyMetadata];
    int v16 = (void *)[v15 copy];
    [v4 setCardOnlyMetadata:v16];
  }
  if ([(SFDrillDownMetadata *)self hasEntitySearchOnlyMetadata])
  {
    int v17 = [(SFDrillDownMetadata *)self entitySearchOnlyMetadata];
    char v18 = (void *)[v17 copy];
    [v4 setEntitySearchOnlyMetadata:v18];
  }
  if ([(SFDrillDownMetadata *)self hasCardSearchMetadata])
  {
    uint64_t v19 = [(SFDrillDownMetadata *)self cardSearchMetadata];
    v20 = (void *)[v19 copy];
    [v4 setCardSearchMetadata:v20];
  }
  if ([(SFDrillDownMetadata *)self hasEntitySearchMetadata])
  {
    unint64_t v21 = [(SFDrillDownMetadata *)self entitySearchMetadata];
    int v22 = (void *)[v21 copy];
    [v4 setEntitySearchMetadata:v22];
  }
  int v23 = [(SFDrillDownMetadata *)self debugParams];
  int v24 = (void *)[v23 copy];
  [v4 setDebugParams:v24];

  int v25 = [(SFDrillDownMetadata *)self params];
  int v26 = (void *)[v25 copy];
  [v4 setParams:v26];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBDrillDownMetadata alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBDrillDownMetadata *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBDrillDownMetadata alloc] initWithFacade:self];
  uint64_t v3 = [(_SFPBDrillDownMetadata *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6 = [[_SFPBDrillDownMetadata alloc] initWithFacade:self];
  uint64_t v5 = [(_SFPBDrillDownMetadata *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFDrillDownMetadata)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  v6 = [[_SFPBDrillDownMetadata alloc] initWithData:v5];
  uint64_t v7 = [(SFDrillDownMetadata *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasEntitySearchMetadata
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setEntitySearchMetadata:(id)a3
{
  *(unsigned char *)&self->_has |= 8u;
  objc_storeStrong((id *)&self->_entitySearchMetadata, a3);
  id v8 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  *(unsigned char *)&self->_has &= ~2u;
  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  *(unsigned char *)&self->_has &= ~4u;
  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;
}

- (BOOL)hasCardSearchMetadata
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCardSearchMetadata:(id)a3
{
  *(unsigned char *)&self->_has |= 4u;
  objc_storeStrong((id *)&self->_cardSearchMetadata, a3);
  id v8 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  *(unsigned char *)&self->_has &= ~2u;
  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  *(unsigned char *)&self->_has &= ~8u;
  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;
}

- (BOOL)hasEntitySearchOnlyMetadata
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setEntitySearchOnlyMetadata:(id)a3
{
  *(unsigned char *)&self->_has |= 2u;
  objc_storeStrong((id *)&self->_entitySearchOnlyMetadata, a3);
  id v8 = a3;
  *(unsigned char *)&self->_has &= ~1u;
  cardOnlyMetadata = self->_cardOnlyMetadata;
  self->_cardOnlyMetadata = 0;

  *(unsigned char *)&self->_has &= ~4u;
  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;

  *(unsigned char *)&self->_has &= ~8u;
  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;
}

- (BOOL)hasCardOnlyMetadata
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setCardOnlyMetadata:(id)a3
{
  *(unsigned char *)&self->_has |= 1u;
  objc_storeStrong((id *)&self->_cardOnlyMetadata, a3);
  id v8 = a3;
  *(unsigned char *)&self->_has &= ~2u;
  entitySearchOnlyMetadata = self->_entitySearchOnlyMetadata;
  self->_entitySearchOnlyMetadata = 0;

  *(unsigned char *)&self->_has &= ~4u;
  cardSearchMetadata = self->_cardSearchMetadata;
  self->_cardSearchMetadata = 0;

  *(unsigned char *)&self->_has &= ~8u;
  entitySearchMetadata = self->_entitySearchMetadata;
  self->_entitySearchMetadata = 0;
}

- (SFDrillDownMetadata)initWithProtobuf:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v56.receiver = self;
  v56.super_class = (Class)SFDrillDownMetadata;
  uint64_t v5 = [(SFDrillDownMetadata *)&v56 init];
  if (v5)
  {
    v6 = [v4 cardIdentifier];

    if (v6)
    {
      uint64_t v7 = [v4 cardIdentifier];
      [(SFDrillDownMetadata *)v5 setCardIdentifier:v7];
    }
    id v8 = [v4 cardIdentifiers];
    if (v8) {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v9 = 0;
    }

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v10 = [v4 cardIdentifiers];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v52 objects:v58 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v53 != v13) {
            objc_enumerationMutation(v10);
          }
          if (*(void *)(*((void *)&v52 + 1) + 8 * i)) {
            objc_msgSend(v9, "addObject:");
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v52 objects:v58 count:16];
      }
      while (v12);
    }

    [(SFDrillDownMetadata *)v5 setCardIdentifiers:v9];
    int v15 = [v4 cardDomains];
    if (v15) {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v16 = 0;
    }

    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    int v17 = objc_msgSend(v4, "cardDomains", 0);
    uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v49 != v20) {
            objc_enumerationMutation(v17);
          }
          if (*(void *)(*((void *)&v48 + 1) + 8 * j)) {
            objc_msgSend(v16, "addObject:");
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v19);
    }

    [(SFDrillDownMetadata *)v5 setCardDomains:v16];
    int v22 = [v4 qtype];

    if (v22)
    {
      int v23 = [v4 qtype];
      [(SFDrillDownMetadata *)v5 setQtype:v23];
    }
    int v24 = [v4 viewConfigName];

    if (v24)
    {
      int v25 = [v4 viewConfigName];
      [(SFDrillDownMetadata *)v5 setViewConfigName:v25];
    }
    int v26 = [v4 cardOnlyMetadata];

    if (v26)
    {
      int v27 = [SFCardMetadata alloc];
      v28 = [v4 cardOnlyMetadata];
      v29 = [(SFCardMetadata *)v27 initWithProtobuf:v28];
      [(SFDrillDownMetadata *)v5 setCardOnlyMetadata:v29];
    }
    uint64_t v30 = [v4 entitySearchOnlyMetadata];

    if (v30)
    {
      v31 = [SFEntitySearchMetadata alloc];
      uint64_t v32 = [v4 entitySearchOnlyMetadata];
      uint64_t v33 = [(SFEntitySearchMetadata *)v31 initWithProtobuf:v32];
      [(SFDrillDownMetadata *)v5 setEntitySearchOnlyMetadata:v33];
    }
    BOOL v34 = [v4 cardSearchMetadata];

    if (v34)
    {
      v35 = [SFCardSearchMetadata alloc];
      uint64_t v36 = [v4 cardSearchMetadata];
      v37 = [(SFCardSearchMetadata *)v35 initWithProtobuf:v36];
      [(SFDrillDownMetadata *)v5 setCardSearchMetadata:v37];
    }
    v38 = [v4 entitySearchMetadata];

    if (v38)
    {
      uint64_t v39 = [SFEntitySearchMetadata alloc];
      v40 = [v4 entitySearchMetadata];
      uint64_t v41 = [(SFEntitySearchMetadata *)v39 initWithProtobuf:v40];
      [(SFDrillDownMetadata *)v5 setEntitySearchMetadata:v41];
    }
    v42 = [v4 debugParams];

    if (v42)
    {
      uint64_t v43 = [v4 debugParams];
      [(SFDrillDownMetadata *)v5 setDebugParams:v43];
    }
    v44 = [v4 params];

    if (v44)
    {
      v45 = [v4 params];
      [(SFDrillDownMetadata *)v5 setParams:v45];
    }
    v46 = v5;
  }
  return v5;
}

@end