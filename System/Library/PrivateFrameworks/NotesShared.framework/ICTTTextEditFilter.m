@interface ICTTTextEditFilter
- (BOOL)allowsMissingTimestamps;
- (BOOL)allowsMissingUsers;
- (BOOL)isEqual:(id)a3;
- (ICTTTextEditFilter)init;
- (NSDate)fromDate;
- (NSDate)toDate;
- (NSSet)allowedAttachmentIDs;
- (NSSet)allowedUserIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setAllowedAttachmentIDs:(id)a3;
- (void)setAllowedUserIDs:(id)a3;
- (void)setAllowsMissingTimestamps:(BOOL)a3;
- (void)setAllowsMissingUsers:(BOOL)a3;
- (void)setFromDate:(id)a3;
- (void)setToDate:(id)a3;
@end

@implementation ICTTTextEditFilter

- (BOOL)allowsMissingUsers
{
  return self->_allowsMissingUsers;
}

- (NSSet)allowedAttachmentIDs
{
  return self->_allowedAttachmentIDs;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[ICTTTextEditFilter allocWithZone:a3] init];
  v5 = [(ICTTTextEditFilter *)self allowedUserIDs];
  [(ICTTTextEditFilter *)v4 setAllowedUserIDs:v5];

  v6 = [(ICTTTextEditFilter *)self allowedAttachmentIDs];
  [(ICTTTextEditFilter *)v4 setAllowedAttachmentIDs:v6];

  [(ICTTTextEditFilter *)v4 setAllowsMissingTimestamps:[(ICTTTextEditFilter *)self allowsMissingTimestamps]];
  [(ICTTTextEditFilter *)v4 setAllowsMissingUsers:[(ICTTTextEditFilter *)self allowsMissingUsers]];
  v7 = [(ICTTTextEditFilter *)self fromDate];
  [(ICTTTextEditFilter *)v4 setFromDate:v7];

  v8 = [(ICTTTextEditFilter *)self toDate];
  [(ICTTTextEditFilter *)v4 setToDate:v8];

  return v4;
}

- (void)setAllowsMissingUsers:(BOOL)a3
{
  self->_allowsMissingUsers = a3;
}

- (ICTTTextEditFilter)init
{
  v3.receiver = self;
  v3.super_class = (Class)ICTTTextEditFilter;
  result = [(ICTTTextEditFilter *)&v3 init];
  if (result) {
    *(_WORD *)&result->_allowsMissingTimestamps = 257;
  }
  return result;
}

- (NSDate)toDate
{
  return self->_toDate;
}

- (void)setToDate:(id)a3
{
}

- (void)setFromDate:(id)a3
{
}

- (void)setAllowsMissingTimestamps:(BOOL)a3
{
  self->_allowsMissingTimestamps = a3;
}

- (void)setAllowedUserIDs:(id)a3
{
}

- (void)setAllowedAttachmentIDs:(id)a3
{
}

- (NSDate)fromDate
{
  return self->_fromDate;
}

- (BOOL)allowsMissingTimestamps
{
  return self->_allowsMissingTimestamps;
}

- (NSSet)allowedUserIDs
{
  return self->_allowedUserIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toDate, 0);
  objc_storeStrong((id *)&self->_fromDate, 0);
  objc_storeStrong((id *)&self->_allowedAttachmentIDs, 0);
  objc_storeStrong((id *)&self->_allowedUserIDs, 0);
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [(ICTTTextEditFilter *)self allowedUserIDs];
  v7 = [(ICTTTextEditFilter *)self allowedAttachmentIDs];
  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICTTTextEditFilter allowsMissingTimestamps](self, "allowsMissingTimestamps"));
  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[ICTTTextEditFilter allowsMissingUsers](self, "allowsMissingUsers"));
  v10 = [(ICTTTextEditFilter *)self fromDate];
  v11 = [(ICTTTextEditFilter *)self toDate];
  v12 = [v3 stringWithFormat:@"<%@: %p, allowedUserIDs: %@, allowedAttachmentIDs: %@, allowsMissingTimestamps: %@, allowsMissingUsers: %@, fromDate: %@, toDate: %@>", v5, self, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 != self)
  {
    id v4 = a3;
    objc_opt_class();
    v5 = ICDynamicCast();

    v6 = [(ICTTTextEditFilter *)self allowedUserIDs];
    v7 = [v5 allowedUserIDs];
    v8 = (void *)*MEMORY[0x1E4F1D260];
    if ((void *)*MEMORY[0x1E4F1D260] == v6) {
      v9 = 0;
    }
    else {
      v9 = v6;
    }
    uint64_t v10 = v9;
    if (v8 == v7) {
      v11 = 0;
    }
    else {
      v11 = v7;
    }
    unint64_t v12 = v11;
    if (v10 | v12)
    {
      v13 = (void *)v12;
      if (v10) {
        BOOL v14 = v12 == 0;
      }
      else {
        BOOL v14 = 1;
      }
      if (v14) {
        goto LABEL_31;
      }
      int v15 = [(id)v10 isEqual:v12];

      if (!v15)
      {
        LOBYTE(v22) = 0;
LABEL_58:

        return v22;
      }
    }
    uint64_t v10 = [(ICTTTextEditFilter *)self allowedAttachmentIDs];
    v13 = [v5 allowedAttachmentIDs];
    if (v8 == (void *)v10) {
      v16 = 0;
    }
    else {
      v16 = (void *)v10;
    }
    uint64_t v17 = v16;
    if (v8 == v13) {
      v18 = 0;
    }
    else {
      v18 = v13;
    }
    unint64_t v19 = v18;
    if (v17 | v19)
    {
      v20 = (void *)v19;
      if (v17) {
        BOOL v21 = v19 == 0;
      }
      else {
        BOOL v21 = 1;
      }
      if (v21) {
        goto LABEL_26;
      }
      LODWORD(v22) = [(id)v17 isEqual:v19];

      if (!v22) {
        goto LABEL_57;
      }
    }
    int v23 = [v5 allowsMissingTimestamps];
    if (v23 != [(ICTTTextEditFilter *)self allowsMissingTimestamps]
      || (int v24 = [v5 allowsMissingUsers],
          v24 != [(ICTTTextEditFilter *)self allowsMissingUsers]))
    {
LABEL_31:
      LOBYTE(v22) = 0;
LABEL_57:

      goto LABEL_58;
    }
    uint64_t v17 = [(ICTTTextEditFilter *)self fromDate];
    v20 = [v5 fromDate];
    if (v8 == (void *)v17) {
      v25 = 0;
    }
    else {
      v25 = (void *)v17;
    }
    unint64_t v22 = v25;
    if (v8 == v20) {
      v26 = 0;
    }
    else {
      v26 = v20;
    }
    unint64_t v27 = v26;
    if (!(v22 | v27)) {
      goto LABEL_43;
    }
    v28 = (void *)v27;
    v29 = (void *)v22;
    LOBYTE(v22) = 0;
    v42 = v29;
    if (!v29 || !v27)
    {
LABEL_55:

      goto LABEL_56;
    }
    v30 = (void *)v27;
    int v40 = [v29 isEqual:v27];

    if (v40)
    {
LABEL_43:
      uint64_t v31 = [(ICTTTextEditFilter *)self toDate];
      uint64_t v32 = [v5 toDate];
      v42 = (void *)v31;
      if (v8 == (void *)v31) {
        v33 = 0;
      }
      else {
        v33 = (void *)v31;
      }
      unint64_t v39 = v33;
      v41 = (void *)v32;
      if (v8 == (void *)v32) {
        v34 = 0;
      }
      else {
        v34 = (void *)v32;
      }
      unint64_t v35 = v34;
      v36 = (void *)v35;
      if (v39 | v35)
      {
        LOBYTE(v22) = 0;
        v37 = (void *)v39;
        if (v39 && v35) {
          LOBYTE(v22) = [(id)v39 isEqual:v35];
        }
      }
      else
      {
        v37 = (void *)v39;
        LOBYTE(v22) = 1;
      }

      v28 = v41;
      goto LABEL_55;
    }
LABEL_26:
    LOBYTE(v22) = 0;
LABEL_56:

    goto LABEL_57;
  }
  LOBYTE(v22) = 1;
  return v22;
}

- (unint64_t)hash
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = [(ICTTTextEditFilter *)self allowedUserIDs];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  uint64_t v6 = [v5 hash];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(v7);
        }
        v6 += ICHashWithObject(*(void **)(*((void *)&v32 + 1) + 8 * i));
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v9);
  }

  id v12 = [(ICTTTextEditFilter *)self allowedAttachmentIDs];
  v13 = (objc_class *)objc_opt_class();
  BOOL v14 = NSStringFromClass(v13);
  char v15 = [v14 hash];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v16 = v12;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v33 != v19) {
          objc_enumerationMutation(v16);
        }
        v15 += ICHashWithObject(*(void **)(*((void *)&v32 + 1) + 8 * j));
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v18);
  }

  [(ICTTTextEditFilter *)self allowsMissingTimestamps];
  [(ICTTTextEditFilter *)self allowsMissingUsers];
  BOOL v21 = [(ICTTTextEditFilter *)self fromDate];
  [v21 hash];
  unint64_t v22 = [(ICTTTextEditFilter *)self toDate];
  [v22 hash];
  unint64_t v30 = ICHashWithHashKeys(v6, v23, v24, v25, v26, v27, v28, v29, v15);

  return v30;
}

@end