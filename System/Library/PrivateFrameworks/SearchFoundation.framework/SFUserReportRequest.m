@interface SFUserReportRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)hasReportType;
- (BOOL)isEqual:(id)a3;
- (NSArray)userReportOptions;
- (NSData)jsonData;
- (NSDictionary)dictionaryRepresentation;
- (NSString)affordanceText;
- (NSString)attachmentSectionTitle;
- (NSString)disclaimerText;
- (NSString)dismissText;
- (NSString)reportOptionsSectionTitle;
- (NSString)title;
- (SFPunchout)disclaimerLearnMorePunchout;
- (SFUserReportRequest)initWithCoder:(id)a3;
- (SFUserReportRequest)initWithProtobuf:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (int)reportType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAffordanceText:(id)a3;
- (void)setAttachmentSectionTitle:(id)a3;
- (void)setDisclaimerLearnMorePunchout:(id)a3;
- (void)setDisclaimerText:(id)a3;
- (void)setDismissText:(id)a3;
- (void)setReportOptionsSectionTitle:(id)a3;
- (void)setReportType:(int)a3;
- (void)setTitle:(id)a3;
- (void)setUserReportOptions:(id)a3;
@end

@implementation SFUserReportRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentSectionTitle, 0);
  objc_storeStrong((id *)&self->_disclaimerLearnMorePunchout, 0);
  objc_storeStrong((id *)&self->_disclaimerText, 0);
  objc_storeStrong((id *)&self->_reportOptionsSectionTitle, 0);
  objc_storeStrong((id *)&self->_userReportOptions, 0);
  objc_storeStrong((id *)&self->_dismissText, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_affordanceText, 0);
}

- (void)setAttachmentSectionTitle:(id)a3
{
}

- (NSString)attachmentSectionTitle
{
  return self->_attachmentSectionTitle;
}

- (void)setDisclaimerLearnMorePunchout:(id)a3
{
}

- (SFPunchout)disclaimerLearnMorePunchout
{
  return self->_disclaimerLearnMorePunchout;
}

- (void)setDisclaimerText:(id)a3
{
}

- (NSString)disclaimerText
{
  return self->_disclaimerText;
}

- (void)setReportOptionsSectionTitle:(id)a3
{
}

- (NSString)reportOptionsSectionTitle
{
  return self->_reportOptionsSectionTitle;
}

- (int)reportType
{
  return self->_reportType;
}

- (void)setUserReportOptions:(id)a3
{
}

- (NSArray)userReportOptions
{
  return self->_userReportOptions;
}

- (void)setDismissText:(id)a3
{
}

- (NSString)dismissText
{
  return self->_dismissText;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setAffordanceText:(id)a3
{
}

- (NSString)affordanceText
{
  return self->_affordanceText;
}

- (unint64_t)hash
{
  v3 = [(SFUserReportRequest *)self affordanceText];
  uint64_t v4 = [v3 hash];
  v5 = [(SFUserReportRequest *)self title];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(SFUserReportRequest *)self dismissText];
  uint64_t v8 = [v7 hash];
  v9 = [(SFUserReportRequest *)self userReportOptions];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  uint64_t v11 = [(SFUserReportRequest *)self reportType];
  v12 = [(SFUserReportRequest *)self reportOptionsSectionTitle];
  uint64_t v13 = v11 ^ [v12 hash];
  v14 = [(SFUserReportRequest *)self disclaimerText];
  uint64_t v15 = v10 ^ v13 ^ [v14 hash];
  v16 = [(SFUserReportRequest *)self disclaimerLearnMorePunchout];
  uint64_t v17 = [v16 hash];
  v18 = [(SFUserReportRequest *)self attachmentSectionTitle];
  unint64_t v19 = v15 ^ v17 ^ [v18 hash];

  return v19;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (SFUserReportRequest *)a3;
  if (self == v4)
  {
    char v11 = 1;
  }
  else
  {
    if ([(SFUserReportRequest *)v4 isMemberOfClass:objc_opt_class()])
    {
      v5 = v4;
      uint64_t v6 = [(SFUserReportRequest *)self affordanceText];
      v7 = [(SFUserReportRequest *)v5 affordanceText];
      if ((v6 == 0) == (v7 != 0))
      {
        char v11 = 0;
LABEL_26:

        goto LABEL_27;
      }
      uint64_t v8 = [(SFUserReportRequest *)self affordanceText];
      if (v8)
      {
        v9 = [(SFUserReportRequest *)self affordanceText];
        uint64_t v10 = [(SFUserReportRequest *)v5 affordanceText];
        if (![v9 isEqual:v10])
        {
          char v11 = 0;
LABEL_24:

          goto LABEL_25;
        }
        v71 = v10;
        v72 = v9;
      }
      v12 = [(SFUserReportRequest *)self title];
      uint64_t v13 = [(SFUserReportRequest *)v5 title];
      if ((v12 == 0) == (v13 != 0)) {
        goto LABEL_22;
      }
      v14 = [(SFUserReportRequest *)self title];
      if (v14)
      {
        uint64_t v15 = [(SFUserReportRequest *)self title];
        v68 = [(SFUserReportRequest *)v5 title];
        v69 = v15;
        if (![v15 isEqual:v68]) {
          goto LABEL_20;
        }
      }
      v70 = v14;
      v16 = [(SFUserReportRequest *)self dismissText];
      uint64_t v17 = [(SFUserReportRequest *)v5 dismissText];
      if ((v16 == 0) == (v17 != 0))
      {

        if (!v14)
        {
LABEL_21:

LABEL_22:
          char v11 = 0;
          if (!v8)
          {
LABEL_25:

            goto LABEL_26;
          }
          goto LABEL_23;
        }
LABEL_20:

        goto LABEL_21;
      }
      v65 = v16;
      v66 = v17;
      v67 = [(SFUserReportRequest *)self dismissText];
      if (v67)
      {
        v18 = [(SFUserReportRequest *)self dismissText];
        v63 = [(SFUserReportRequest *)v5 dismissText];
        v64 = v18;
        if (![v18 isEqual:v63])
        {
LABEL_50:

LABEL_51:
          if (!v14) {
            goto LABEL_21;
          }
          goto LABEL_20;
        }
      }
      v20 = [(SFUserReportRequest *)self userReportOptions];
      v21 = [(SFUserReportRequest *)v5 userReportOptions];
      if ((v20 == 0) == (v21 != 0))
      {

        goto LABEL_49;
      }
      v60 = v20;
      v61 = v21;
      v62 = [(SFUserReportRequest *)self userReportOptions];
      if (v62)
      {
        v22 = [(SFUserReportRequest *)self userReportOptions];
        v58 = [(SFUserReportRequest *)v5 userReportOptions];
        v59 = v22;
        int v23 = objc_msgSend(v22, "isEqual:");
        v14 = v70;
        if (!v23) {
          goto LABEL_47;
        }
      }
      int v24 = [(SFUserReportRequest *)self reportType];
      if (v24 != [(SFUserReportRequest *)v5 reportType])
      {
LABEL_46:
        if (!v62)
        {
LABEL_48:

LABEL_49:
          if (!v67) {
            goto LABEL_51;
          }
          goto LABEL_50;
        }
LABEL_47:

        goto LABEL_48;
      }
      v25 = [(SFUserReportRequest *)self reportOptionsSectionTitle];
      v26 = [(SFUserReportRequest *)v5 reportOptionsSectionTitle];
      if ((v25 == 0) == (v26 != 0))
      {

        v14 = v70;
        goto LABEL_46;
      }
      v55 = v26;
      v56 = v25;
      [(SFUserReportRequest *)self reportOptionsSectionTitle];
      v57 = v14 = v70;
      if (v57)
      {
        v27 = [(SFUserReportRequest *)self reportOptionsSectionTitle];
        v53 = [(SFUserReportRequest *)v5 reportOptionsSectionTitle];
        v54 = v27;
        if (![v27 isEqual:v53]) {
          goto LABEL_44;
        }
      }
      v28 = [(SFUserReportRequest *)self disclaimerText];
      v29 = [(SFUserReportRequest *)v5 disclaimerText];
      if ((v28 == 0) == (v29 != 0))
      {

        v14 = v70;
        if (!v57)
        {
LABEL_45:

          goto LABEL_46;
        }
LABEL_44:

        goto LABEL_45;
      }
      v51 = v29;
      v52 = v28;
      uint64_t v50 = [(SFUserReportRequest *)self disclaimerText];
      if (v50)
      {
        v30 = [(SFUserReportRequest *)self disclaimerText];
        v48 = [(SFUserReportRequest *)v5 disclaimerText];
        v49 = v30;
        if (!objc_msgSend(v30, "isEqual:"))
        {
          char v11 = 0;
          v31 = (void *)v50;
          goto LABEL_58;
        }
      }
      v32 = [(SFUserReportRequest *)self disclaimerLearnMorePunchout];
      v33 = [(SFUserReportRequest *)v5 disclaimerLearnMorePunchout];
      if ((v32 == 0) == (v33 != 0))
      {

        char v11 = 0;
        v28 = v52;
        v31 = (void *)v50;
        if (!v50) {
          goto LABEL_59;
        }
        goto LABEL_58;
      }
      v45 = v33;
      v46 = v32;
      uint64_t v47 = [(SFUserReportRequest *)self disclaimerLearnMorePunchout];
      if (!v47
        || ([(SFUserReportRequest *)self disclaimerLearnMorePunchout],
            v34 = objc_claimAutoreleasedReturnValue(),
            [(SFUserReportRequest *)v5 disclaimerLearnMorePunchout],
            v43 = objc_claimAutoreleasedReturnValue(),
            v44 = v34,
            objc_msgSend(v34, "isEqual:")))
      {
        v42 = [(SFUserReportRequest *)self attachmentSectionTitle];
        v36 = [(SFUserReportRequest *)v5 attachmentSectionTitle];
        v37 = v36;
        if ((v42 == 0) == (v36 != 0))
        {

          char v11 = 0;
        }
        else
        {
          uint64_t v38 = [(SFUserReportRequest *)self attachmentSectionTitle];
          if (v38)
          {
            v39 = (void *)v38;
            v41 = [(SFUserReportRequest *)self attachmentSectionTitle];
            v40 = [(SFUserReportRequest *)v5 attachmentSectionTitle];
            char v11 = [v41 isEqual:v40];
          }
          else
          {

            char v11 = 1;
          }
        }
        v32 = v46;
        v35 = (void *)v47;
        if (!v47)
        {
LABEL_76:

          v31 = (void *)v50;
          v28 = v52;
          if (!v50)
          {
LABEL_59:

            if (v57)
            {
            }
            if (v62)
            {
            }
            if (v67)
            {
            }
            if (v70)
            {
            }
            if (!v8) {
              goto LABEL_25;
            }
LABEL_23:
            uint64_t v10 = v71;
            v9 = v72;
            goto LABEL_24;
          }
LABEL_58:

          goto LABEL_59;
        }
      }
      else
      {
        char v11 = 0;
        v35 = (void *)v47;
      }

      goto LABEL_76;
    }
    char v11 = 0;
  }
LABEL_27:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = [(SFUserReportRequest *)self affordanceText];
  uint64_t v6 = (void *)[v5 copy];
  [v4 setAffordanceText:v6];

  v7 = [(SFUserReportRequest *)self title];
  uint64_t v8 = (void *)[v7 copy];
  [v4 setTitle:v8];

  v9 = [(SFUserReportRequest *)self dismissText];
  uint64_t v10 = (void *)[v9 copy];
  [v4 setDismissText:v10];

  char v11 = [(SFUserReportRequest *)self userReportOptions];
  v12 = (void *)[v11 copy];
  [v4 setUserReportOptions:v12];

  objc_msgSend(v4, "setReportType:", -[SFUserReportRequest reportType](self, "reportType"));
  uint64_t v13 = [(SFUserReportRequest *)self reportOptionsSectionTitle];
  v14 = (void *)[v13 copy];
  [v4 setReportOptionsSectionTitle:v14];

  uint64_t v15 = [(SFUserReportRequest *)self disclaimerText];
  v16 = (void *)[v15 copy];
  [v4 setDisclaimerText:v16];

  uint64_t v17 = [(SFUserReportRequest *)self disclaimerLearnMorePunchout];
  v18 = (void *)[v17 copy];
  [v4 setDisclaimerLearnMorePunchout:v18];

  unint64_t v19 = [(SFUserReportRequest *)self attachmentSectionTitle];
  v20 = (void *)[v19 copy];
  [v4 setAttachmentSectionTitle:v20];

  return v4;
}

- (NSData)jsonData
{
  v2 = [[_SFPBUserReportRequest alloc] initWithFacade:self];
  v3 = [(_SFPBUserReportRequest *)v2 jsonData];

  return (NSData *)v3;
}

- (NSDictionary)dictionaryRepresentation
{
  v2 = [[_SFPBUserReportRequest alloc] initWithFacade:self];
  v3 = [(_SFPBUserReportRequest *)v2 dictionaryRepresentation];

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v6 = [[_SFPBUserReportRequest alloc] initWithFacade:self];
  v5 = [(_SFPBUserReportRequest *)v6 data];
  [v4 encodeObject:v5 forKey:@"_backingStore"];
}

- (SFUserReportRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_backingStore"];

  uint64_t v6 = [[_SFPBUserReportRequest alloc] initWithData:v5];
  v7 = [(SFUserReportRequest *)self initWithProtobuf:v6];

  return v7;
}

- (BOOL)hasReportType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setReportType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_reportType = a3;
}

- (SFUserReportRequest)initWithProtobuf:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)SFUserReportRequest;
  v5 = [(SFUserReportRequest *)&v36 init];
  if (v5)
  {
    uint64_t v6 = [v4 affordanceText];

    if (v6)
    {
      v7 = [v4 affordanceText];
      [(SFUserReportRequest *)v5 setAffordanceText:v7];
    }
    uint64_t v8 = [v4 title];

    if (v8)
    {
      v9 = [v4 title];
      [(SFUserReportRequest *)v5 setTitle:v9];
    }
    uint64_t v10 = [v4 dismissText];

    if (v10)
    {
      char v11 = [v4 dismissText];
      [(SFUserReportRequest *)v5 setDismissText:v11];
    }
    v12 = [v4 userReportOptions];
    if (v12) {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v13 = 0;
    }

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v14 = objc_msgSend(v4, "userReportOptions", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(v14);
          }
          unint64_t v19 = [[SFPunchout alloc] initWithProtobuf:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          if (v19) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v37 count:16];
      }
      while (v16);
    }

    [(SFUserReportRequest *)v5 setUserReportOptions:v13];
    if ([v4 reportType]) {
      -[SFUserReportRequest setReportType:](v5, "setReportType:", [v4 reportType]);
    }
    v20 = [v4 reportOptionsSectionTitle];

    if (v20)
    {
      v21 = [v4 reportOptionsSectionTitle];
      [(SFUserReportRequest *)v5 setReportOptionsSectionTitle:v21];
    }
    v22 = [v4 disclaimerText];

    if (v22)
    {
      int v23 = [v4 disclaimerText];
      [(SFUserReportRequest *)v5 setDisclaimerText:v23];
    }
    int v24 = [v4 disclaimerLearnMorePunchout];

    if (v24)
    {
      v25 = [SFPunchout alloc];
      v26 = [v4 disclaimerLearnMorePunchout];
      v27 = [(SFPunchout *)v25 initWithProtobuf:v26];
      [(SFUserReportRequest *)v5 setDisclaimerLearnMorePunchout:v27];
    }
    v28 = [v4 attachmentSectionTitle];

    if (v28)
    {
      v29 = [v4 attachmentSectionTitle];
      [(SFUserReportRequest *)v5 setAttachmentSectionTitle:v29];
    }
    v30 = v5;
  }
  return v5;
}

@end