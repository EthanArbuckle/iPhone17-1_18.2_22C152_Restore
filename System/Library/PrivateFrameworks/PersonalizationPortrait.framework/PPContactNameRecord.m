@interface PPContactNameRecord
+ (BOOL)supportsSecureCoding;
+ (id)describeChangeType:(unsigned __int8)a3;
+ (id)describeSource:(unsigned __int8)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToContactNameRecord:(id)a3;
- (PPContactNameRecord)initWithCoder:(id)a3;
- (PPContactNameRecord)initWithIdentifier:(id)a3 score:(double)a4 source:(unsigned __int8)a5 sourceIdentifier:(id)a6 changeType:(unsigned __int8)a7 firstName:(id)a8 phoneticFirstName:(id)a9 middleName:(id)a10 phoneticMiddleName:(id)a11 lastName:(id)a12 phoneticLastName:(id)a13 organizationName:(id)a14 jobTitle:(id)a15 nickname:(id)a16 relatedNames:(id)a17 streetNames:(id)a18 cityNames:(id)a19;
- (id)description;
- (id)init_;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPContactNameRecord

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PPContactNameRecord *)self lastName];
  v6 = (void *)v5;
  if (v5) {
    v7 = (__CFString *)v5;
  }
  else {
    v7 = &stru_1EDA56F70;
  }
  uint64_t v8 = [v4 lastName];
  v9 = (void *)v8;
  if (v8) {
    v10 = (__CFString *)v8;
  }
  else {
    v10 = &stru_1EDA56F70;
  }
  int64_t v11 = [(__CFString *)v7 compare:v10];

  if (!v11)
  {
    v12 = [(PPContactNameRecord *)self firstName];
    v13 = v12;
    v14 = v12 ? v12 : &stru_1EDA56F70;
    v15 = [v4 firstName];
    v16 = v15;
    v17 = v15 ? v15 : &stru_1EDA56F70;
    int64_t v11 = [(__CFString *)v14 compare:v17];

    if (!v11)
    {
      v18 = [(PPContactNameRecord *)self middleName];
      v19 = v18;
      v20 = v18 ? v18 : &stru_1EDA56F70;
      v21 = [v4 middleName];
      v22 = v21;
      v23 = v21 ? v21 : &stru_1EDA56F70;
      int64_t v11 = [(__CFString *)v20 compare:v23];

      if (!v11)
      {
        uint64_t v24 = [(PPContactNameRecord *)self sourceIdentifier];
        v25 = (void *)v24;
        if (v24) {
          v26 = (__CFString *)v24;
        }
        else {
          v26 = &stru_1EDA56F70;
        }
        uint64_t v27 = [v4 sourceIdentifier];
        v28 = (void *)v27;
        if (v27) {
          v29 = (__CFString *)v27;
        }
        else {
          v29 = &stru_1EDA56F70;
        }
        int64_t v11 = [(__CFString *)v26 compare:v29];
      }
    }
  }

  return v11;
}

- (BOOL)isEqualToContactNameRecord:(id)a3
{
  id v4 = a3;
  if (!v4) {
    goto LABEL_51;
  }
  [(PPContactNameRecord *)self score];
  double v6 = v5;
  [v4 score];
  if (v6 != v7) {
    goto LABEL_51;
  }
  int v8 = [(PPContactNameRecord *)self source];
  if (v8 != [v4 source]) {
    goto LABEL_51;
  }
  int v9 = [(PPContactNameRecord *)self changeType];
  if (v9 != [v4 changeType]) {
    goto LABEL_51;
  }
  v10 = [(PPContactNameRecord *)self sourceIdentifier];
  uint64_t v11 = [v4 sourceIdentifier];
  if (v10 == (void *)v11)
  {
  }
  else
  {
    v12 = (void *)v11;
    char v13 = [v10 isEqual:v11];

    if ((v13 & 1) == 0) {
      goto LABEL_51;
    }
  }
  v14 = [(PPContactNameRecord *)self firstName];
  uint64_t v15 = [v4 firstName];
  if (v14 == (void *)v15)
  {
  }
  else
  {
    v16 = (void *)v15;
    char v17 = [v14 isEqual:v15];

    if ((v17 & 1) == 0) {
      goto LABEL_51;
    }
  }
  v18 = [(PPContactNameRecord *)self phoneticFirstName];
  uint64_t v19 = [v4 phoneticFirstName];
  if (v18 == (void *)v19)
  {
  }
  else
  {
    v20 = (void *)v19;
    char v21 = [v18 isEqual:v19];

    if ((v21 & 1) == 0) {
      goto LABEL_51;
    }
  }
  v22 = [(PPContactNameRecord *)self middleName];
  uint64_t v23 = [v4 middleName];
  if (v22 == (void *)v23)
  {
  }
  else
  {
    uint64_t v24 = (void *)v23;
    char v25 = [v22 isEqual:v23];

    if ((v25 & 1) == 0) {
      goto LABEL_51;
    }
  }
  v26 = [(PPContactNameRecord *)self phoneticMiddleName];
  uint64_t v27 = [v4 phoneticMiddleName];
  if (v26 == (void *)v27)
  {
  }
  else
  {
    v28 = (void *)v27;
    char v29 = [v26 isEqual:v27];

    if ((v29 & 1) == 0) {
      goto LABEL_51;
    }
  }
  v30 = [(PPContactNameRecord *)self lastName];
  uint64_t v31 = [v4 lastName];
  if (v30 == (void *)v31)
  {
  }
  else
  {
    v32 = (void *)v31;
    char v33 = [v30 isEqual:v31];

    if ((v33 & 1) == 0) {
      goto LABEL_51;
    }
  }
  v34 = [(PPContactNameRecord *)self phoneticLastName];
  uint64_t v35 = [v4 phoneticLastName];
  if (v34 == (void *)v35)
  {
  }
  else
  {
    v36 = (void *)v35;
    char v37 = [v34 isEqual:v35];

    if ((v37 & 1) == 0) {
      goto LABEL_51;
    }
  }
  v38 = [(PPContactNameRecord *)self organizationName];
  uint64_t v39 = [v4 organizationName];
  if (v38 == (void *)v39)
  {
  }
  else
  {
    v40 = (void *)v39;
    char v41 = [v38 isEqual:v39];

    if ((v41 & 1) == 0) {
      goto LABEL_51;
    }
  }
  v42 = [(PPContactNameRecord *)self jobTitle];
  uint64_t v43 = [v4 jobTitle];
  if (v42 == (void *)v43)
  {
  }
  else
  {
    v44 = (void *)v43;
    char v45 = [v42 isEqual:v43];

    if ((v45 & 1) == 0) {
      goto LABEL_51;
    }
  }
  v46 = [(PPContactNameRecord *)self nickname];
  uint64_t v47 = [v4 nickname];
  if (v46 == (void *)v47)
  {
  }
  else
  {
    v48 = (void *)v47;
    char v49 = [v46 isEqual:v47];

    if ((v49 & 1) == 0) {
      goto LABEL_51;
    }
  }
  v50 = [(PPContactNameRecord *)self relatedNames];
  uint64_t v51 = [v4 relatedNames];
  if (v50 == (void *)v51)
  {
  }
  else
  {
    v52 = (void *)v51;
    char v53 = [v50 isEqual:v51];

    if ((v53 & 1) == 0) {
      goto LABEL_51;
    }
  }
  v54 = [(PPContactNameRecord *)self streetNames];
  uint64_t v55 = [v4 streetNames];
  if (v54 == (void *)v55)
  {
  }
  else
  {
    v56 = (void *)v55;
    char v57 = [v54 isEqual:v55];

    if ((v57 & 1) == 0)
    {
LABEL_51:
      char v58 = 0;
      goto LABEL_52;
    }
  }
  v60 = [(PPContactNameRecord *)self cityNames];
  v61 = [v4 cityNames];
  if (v60 == v61) {
    char v58 = 1;
  }
  else {
    char v58 = [v60 isEqual:v61];
  }

LABEL_52:
  return v58;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PPContactNameRecord *)a3;
  double v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPContactNameRecord *)self isEqualToContactNameRecord:v5];

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  double v5 = [(PPContactNameRecord *)self identifier];
  [v4 encodeObject:v5 forKey:@"ide"];

  [(PPContactNameRecord *)self score];
  objc_msgSend(v4, "encodeDouble:forKey:", @"scr");
  objc_msgSend(v4, "encodeInt32:forKey:", -[PPContactNameRecord source](self, "source"), @"src");
  BOOL v6 = [(PPContactNameRecord *)self sourceIdentifier];
  [v4 encodeObject:v6 forKey:@"sid"];

  objc_msgSend(v4, "encodeInt32:forKey:", -[PPContactNameRecord changeType](self, "changeType"), @"cht");
  double v7 = [(PPContactNameRecord *)self firstName];
  [v4 encodeObject:v7 forKey:@"fnm"];

  int v8 = [(PPContactNameRecord *)self phoneticFirstName];
  [v4 encodeObject:v8 forKey:@"pfn"];

  int v9 = [(PPContactNameRecord *)self middleName];
  [v4 encodeObject:v9 forKey:@"mnm"];

  v10 = [(PPContactNameRecord *)self phoneticMiddleName];
  [v4 encodeObject:v10 forKey:@"pmn"];

  uint64_t v11 = [(PPContactNameRecord *)self lastName];
  [v4 encodeObject:v11 forKey:@"lnm"];

  v12 = [(PPContactNameRecord *)self phoneticLastName];
  [v4 encodeObject:v12 forKey:@"pln"];

  char v13 = [(PPContactNameRecord *)self organizationName];
  [v4 encodeObject:v13 forKey:@"org"];

  v14 = [(PPContactNameRecord *)self jobTitle];
  [v4 encodeObject:v14 forKey:@"job"];

  uint64_t v15 = [(PPContactNameRecord *)self nickname];
  [v4 encodeObject:v15 forKey:@"nic"];

  v16 = [(PPContactNameRecord *)self relatedNames];
  [v4 encodeObject:v16 forKey:@"rel"];

  char v17 = [(PPContactNameRecord *)self streetNames];
  [v4 encodeObject:v17 forKey:@"str"];

  id v18 = [(PPContactNameRecord *)self cityNames];
  [v4 encodeObject:v18 forKey:@"cty"];
}

- (PPContactNameRecord)initWithCoder:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v36 = [v4 decodeObjectOfClass:v5 forKey:@"ide"];
  if (v36)
  {
    [v4 decodeDoubleForKey:@"scr"];
    double v9 = v8;
    unsigned __int8 v32 = [v4 decodeInt32ForKey:@"src"];
    uint64_t v35 = [v4 decodeObjectOfClass:v5 forKey:@"sid"];
    unsigned __int8 v31 = [v4 decodeInt32ForKey:@"cht"];
    v34 = [v4 decodeObjectOfClass:v5 forKey:@"fnm"];
    v30 = [v4 decodeObjectOfClass:v5 forKey:@"pfn"];
    char v33 = [v4 decodeObjectOfClass:v5 forKey:@"mnm"];
    char v29 = [v4 decodeObjectOfClass:v5 forKey:@"pmn"];
    v28 = [v4 decodeObjectOfClass:v5 forKey:@"lnm"];
    v22 = [v4 decodeObjectOfClass:v5 forKey:@"pln"];
    uint64_t v27 = [v4 decodeObjectOfClass:v5 forKey:@"org"];
    char v21 = [v4 decodeObjectOfClass:v5 forKey:@"job"];
    uint64_t v24 = [v4 decodeObjectOfClass:v5 forKey:@"nic"];
    v10 = (void *)MEMORY[0x192F97350]();
    char v25 = self;
    v26 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v7, v5, 0);
    v20 = [v4 decodeObjectOfClasses:v26 forKey:@"rel"];
    uint64_t v11 = (void *)MEMORY[0x192F97350]();
    uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, v5, 0);
    v12 = [v4 decodeObjectOfClasses:v23 forKey:@"str"];
    char v13 = (void *)MEMORY[0x192F97350]();
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, v5, 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"cty"];
    v16 = objc_retain(-[PPContactNameRecord initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:](v25, "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v36, v32, v35, v31, v34, v30, v9, v33, v29, v28, v22, v27, v21, v24, v20,
              v12,
              v15));

    self = v16;
    char v17 = (void *)v36;
  }
  else
  {
    char v17 = 0;
    id v18 = pp_contacts_log_handle();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v4;
      _os_log_error_impl(&dword_18CAA6000, v18, OS_LOG_TYPE_ERROR, "failed to decode identifier from %@", buf, 0xCu);
    }

    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v3 = [(PPContactNameRecord *)self identifier];
  uint64_t v4 = [v3 hash];

  [(PPContactNameRecord *)self score];
  unint64_t v6 = 31 * (31 * ((unint64_t)v5 - v4 + 32 * v4) + [(PPContactNameRecord *)self source]);
  unint64_t v7 = v6 + [(PPContactNameRecord *)self changeType];
  double v8 = [(PPContactNameRecord *)self sourceIdentifier];
  uint64_t v9 = [v8 hash] - v7 + 32 * v7;

  v10 = [(PPContactNameRecord *)self firstName];
  uint64_t v11 = [v10 hash] - v9 + 32 * v9;

  v12 = [(PPContactNameRecord *)self phoneticFirstName];
  uint64_t v13 = [v12 hash] - v11 + 32 * v11;

  v14 = [(PPContactNameRecord *)self middleName];
  uint64_t v15 = [v14 hash] - v13 + 32 * v13;

  v16 = [(PPContactNameRecord *)self phoneticMiddleName];
  uint64_t v17 = [v16 hash] - v15 + 32 * v15;

  id v18 = [(PPContactNameRecord *)self lastName];
  uint64_t v19 = [v18 hash] - v17 + 32 * v17;

  v20 = [(PPContactNameRecord *)self phoneticLastName];
  uint64_t v21 = [v20 hash] - v19 + 32 * v19;

  v22 = [(PPContactNameRecord *)self organizationName];
  uint64_t v23 = [v22 hash] - v21 + 32 * v21;

  uint64_t v24 = [(PPContactNameRecord *)self jobTitle];
  uint64_t v25 = [v24 hash] - v23 + 32 * v23;

  v26 = [(PPContactNameRecord *)self nickname];
  unint64_t v27 = [v26 hash] - v25 + 32 * v25;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v28 = [(PPContactNameRecord *)self relatedNames];
  char v29 = [v28 allKeys];
  v30 = [v29 sortedArrayUsingSelector:sel_compare_];

  uint64_t v31 = [v30 countByEnumeratingWithState:&v63 objects:v69 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v64;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v64 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = *(void **)(*((void *)&v63 + 1) + 8 * v34);
        uint64_t v36 = (void *)MEMORY[0x192F97350]();
        uint64_t v37 = [v35 hash] - v27 + 32 * v27;
        id v38 = [(PPContactNameRecord *)self relatedNames];
        uint64_t v39 = [v38 objectForKeyedSubscript:v35];
        unint64_t v27 = [v39 hash] - v37 + 32 * v37;

        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [v30 countByEnumeratingWithState:&v63 objects:v69 count:16];
    }
    while (v32);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  v40 = [(PPContactNameRecord *)self streetNames];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v59 objects:v68 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v60;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v60 != v43) {
          objc_enumerationMutation(v40);
        }
        char v45 = *(void **)(*((void *)&v59 + 1) + 8 * v44);
        v46 = (void *)MEMORY[0x192F97350]();
        unint64_t v27 = [v45 hash] - v27 + 32 * v27;
        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [v40 countByEnumeratingWithState:&v59 objects:v68 count:16];
    }
    while (v42);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v47 = [(PPContactNameRecord *)self cityNames];
  uint64_t v48 = [v47 countByEnumeratingWithState:&v55 objects:v67 count:16];
  if (v48)
  {
    uint64_t v49 = v48;
    uint64_t v50 = *(void *)v56;
    do
    {
      uint64_t v51 = 0;
      do
      {
        if (*(void *)v56 != v50) {
          objc_enumerationMutation(v47);
        }
        v52 = *(void **)(*((void *)&v55 + 1) + 8 * v51);
        char v53 = (void *)MEMORY[0x192F97350]();
        unint64_t v27 = [v52 hash] - v27 + 32 * v27;
        ++v51;
      }
      while (v49 != v51);
      uint64_t v49 = [v47 countByEnumeratingWithState:&v55 objects:v67 count:16];
    }
    while (v49);
  }

  return v27;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(PPContactNameRecord *)self firstName];
  double v5 = [(PPContactNameRecord *)self middleName];
  unint64_t v6 = [(PPContactNameRecord *)self lastName];
  unint64_t v7 = [(PPContactNameRecord *)self cityNames];
  double v8 = objc_msgSend(v7, "_pas_componentsJoinedByString:", @",");
  [(PPContactNameRecord *)self score];
  uint64_t v10 = v9;
  uint64_t v11 = +[PPContactNameRecord describeSource:[(PPContactNameRecord *)self source]];
  v12 = +[PPContactNameRecord describeChangeType:[(PPContactNameRecord *)self changeType]];
  uint64_t v13 = (void *)[v3 initWithFormat:@"<PPContactNameRecord '%@' '%@' '%@' [%@] s:%f src:%@ ct:%@>", v4, v5, v6, v8, v10, v11, v12];

  return v13;
}

- (PPContactNameRecord)initWithIdentifier:(id)a3 score:(double)a4 source:(unsigned __int8)a5 sourceIdentifier:(id)a6 changeType:(unsigned __int8)a7 firstName:(id)a8 phoneticFirstName:(id)a9 middleName:(id)a10 phoneticMiddleName:(id)a11 lastName:(id)a12 phoneticLastName:(id)a13 organizationName:(id)a14 jobTitle:(id)a15 nickname:(id)a16 relatedNames:(id)a17 streetNames:(id)a18 cityNames:(id)a19
{
  unsigned int v38 = a7;
  unsigned int v37 = a5;
  id v34 = a19;
  id v31 = a18;
  id v30 = a17;
  id v27 = a16;
  id v29 = a15;
  id v42 = a14;
  id v41 = a13;
  id v21 = a12;
  id v22 = a11;
  id v28 = a10;
  id v33 = a9;
  id v23 = a8;
  id v24 = a6;
  id v25 = a3;
  uint64_t v39 = -[PPClientContactNameRecord initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:]([PPClientContactNameRecord alloc], "initWithIdentifier:score:source:sourceIdentifier:changeType:firstName:phoneticFirstName:middleName:phoneticMiddleName:lastName:phoneticLastName:organizationName:jobTitle:nickname:relatedNames:streetNames:cityNames:", v25, v37, v24, v38, v23, v33, a4, v28, v22, v21, v41, v42, v29, v27, v30, v31,
          v34);

  return &v39->super;
}

- (id)init_
{
  v3.receiver = self;
  v3.super_class = (Class)PPContactNameRecord;
  return [(PPContactNameRecord *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)describeChangeType:(unsigned __int8)a3
{
  if (a3 >= 4u) {
    objc_super v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid (%lu)", a3);
  }
  else {
    objc_super v3 = off_1E550F8E0[a3];
  }
  return v3;
}

+ (id)describeSource:(unsigned __int8)a3
{
  if (a3 >= 3u) {
    objc_super v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid (%lu)", a3);
  }
  else {
    objc_super v3 = off_1E550F8C8[a3];
  }
  return v3;
}

@end