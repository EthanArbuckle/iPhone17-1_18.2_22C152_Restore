@interface _SFPBUserReportRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)userReportOptions;
- (NSData)jsonData;
- (NSString)affordanceText;
- (NSString)attachmentSectionTitle;
- (NSString)disclaimerText;
- (NSString)dismissText;
- (NSString)reportOptionsSectionTitle;
- (NSString)title;
- (_SFPBPunchout)disclaimerLearnMorePunchout;
- (_SFPBUserReportRequest)initWithDictionary:(id)a3;
- (_SFPBUserReportRequest)initWithFacade:(id)a3;
- (_SFPBUserReportRequest)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)userReportOptionsAtIndex:(unint64_t)a3;
- (int)reportType;
- (unint64_t)hash;
- (unint64_t)userReportOptionsCount;
- (void)addUserReportOptions:(id)a3;
- (void)clearUserReportOptions;
- (void)setAffordanceText:(id)a3;
- (void)setAttachmentSectionTitle:(id)a3;
- (void)setDisclaimerLearnMorePunchout:(id)a3;
- (void)setDisclaimerText:(id)a3;
- (void)setDismissText:(id)a3;
- (void)setReportOptionsSectionTitle:(id)a3;
- (void)setReportType:(int)a3;
- (void)setTitle:(id)a3;
- (void)setUserReportOptions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _SFPBUserReportRequest

- (_SFPBUserReportRequest)initWithFacade:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_SFPBUserReportRequest *)self init];
  if (v5)
  {
    v6 = [v4 affordanceText];

    if (v6)
    {
      v7 = [v4 affordanceText];
      [(_SFPBUserReportRequest *)v5 setAffordanceText:v7];
    }
    v8 = [v4 title];

    if (v8)
    {
      v9 = [v4 title];
      [(_SFPBUserReportRequest *)v5 setTitle:v9];
    }
    v10 = [v4 dismissText];

    if (v10)
    {
      v11 = [v4 dismissText];
      [(_SFPBUserReportRequest *)v5 setDismissText:v11];
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
    uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
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
          v19 = [[_SFPBPunchout alloc] initWithFacade:*(void *)(*((void *)&v32 + 1) + 8 * i)];
          if (v19) {
            [v13 addObject:v19];
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }

    [(_SFPBUserReportRequest *)v5 setUserReportOptions:v13];
    if ([v4 hasReportType]) {
      -[_SFPBUserReportRequest setReportType:](v5, "setReportType:", [v4 reportType]);
    }
    v20 = [v4 reportOptionsSectionTitle];

    if (v20)
    {
      v21 = [v4 reportOptionsSectionTitle];
      [(_SFPBUserReportRequest *)v5 setReportOptionsSectionTitle:v21];
    }
    v22 = [v4 disclaimerText];

    if (v22)
    {
      v23 = [v4 disclaimerText];
      [(_SFPBUserReportRequest *)v5 setDisclaimerText:v23];
    }
    v24 = [v4 disclaimerLearnMorePunchout];

    if (v24)
    {
      v25 = [_SFPBPunchout alloc];
      v26 = [v4 disclaimerLearnMorePunchout];
      v27 = [(_SFPBPunchout *)v25 initWithFacade:v26];
      [(_SFPBUserReportRequest *)v5 setDisclaimerLearnMorePunchout:v27];
    }
    v28 = [v4 attachmentSectionTitle];

    if (v28)
    {
      v29 = [v4 attachmentSectionTitle];
      [(_SFPBUserReportRequest *)v5 setAttachmentSectionTitle:v29];
    }
    v30 = v5;
  }
  return v5;
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

- (NSString)attachmentSectionTitle
{
  return self->_attachmentSectionTitle;
}

- (_SFPBPunchout)disclaimerLearnMorePunchout
{
  return self->_disclaimerLearnMorePunchout;
}

- (NSString)disclaimerText
{
  return self->_disclaimerText;
}

- (NSString)reportOptionsSectionTitle
{
  return self->_reportOptionsSectionTitle;
}

- (int)reportType
{
  return self->_reportType;
}

- (NSArray)userReportOptions
{
  return self->_userReportOptions;
}

- (NSString)dismissText
{
  return self->_dismissText;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)affordanceText
{
  return self->_affordanceText;
}

- (_SFPBUserReportRequest)initWithDictionary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)_SFPBUserReportRequest;
  v5 = [(_SFPBUserReportRequest *)&v38 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"affordanceText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(_SFPBUserReportRequest *)v5 setAffordanceText:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(_SFPBUserReportRequest *)v5 setTitle:v9];
    }
    long long v33 = v8;
    v10 = [v4 objectForKeyedSubscript:@"dismissText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(_SFPBUserReportRequest *)v5 setDismissText:v11];
    }
    long long v32 = v10;
    v12 = [v4 objectForKeyedSubscript:@"userReportOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = v6;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v35 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [[_SFPBPunchout alloc] initWithDictionary:v18];
              [(_SFPBUserReportRequest *)v5 addUserReportOptions:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v15);
      }

      v6 = v31;
    }
    v20 = [v4 objectForKeyedSubscript:@"reportType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[_SFPBUserReportRequest setReportType:](v5, "setReportType:", [v20 intValue]);
    }
    v21 = [v4 objectForKeyedSubscript:@"reportOptionsSectionTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v22 = (void *)[v21 copy];
      [(_SFPBUserReportRequest *)v5 setReportOptionsSectionTitle:v22];
    }
    v23 = [v4 objectForKeyedSubscript:@"disclaimerText"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = (void *)[v23 copy];
      [(_SFPBUserReportRequest *)v5 setDisclaimerText:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"disclaimerLearnMorePunchout"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v26 = [[_SFPBPunchout alloc] initWithDictionary:v25];
      [(_SFPBUserReportRequest *)v5 setDisclaimerLearnMorePunchout:v26];
    }
    v27 = [v4 objectForKeyedSubscript:@"attachmentSectionTitle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v28 = (void *)[v27 copy];
      [(_SFPBUserReportRequest *)v5 setAttachmentSectionTitle:v28];
    }
    v29 = v5;
  }
  return v5;
}

- (_SFPBUserReportRequest)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(_SFPBUserReportRequest *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(_SFPBUserReportRequest *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_affordanceText)
  {
    id v4 = [(_SFPBUserReportRequest *)self affordanceText];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"affordanceText"];
  }
  if (self->_attachmentSectionTitle)
  {
    v6 = [(_SFPBUserReportRequest *)self attachmentSectionTitle];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"attachmentSectionTitle"];
  }
  if (self->_disclaimerLearnMorePunchout)
  {
    v8 = [(_SFPBUserReportRequest *)self disclaimerLearnMorePunchout];
    v9 = [v8 dictionaryRepresentation];
    if (v9)
    {
      [v3 setObject:v9 forKeyedSubscript:@"disclaimerLearnMorePunchout"];
    }
    else
    {
      v10 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v10 forKeyedSubscript:@"disclaimerLearnMorePunchout"];
    }
  }
  if (self->_disclaimerText)
  {
    v11 = [(_SFPBUserReportRequest *)self disclaimerText];
    v12 = (void *)[v11 copy];
    [v3 setObject:v12 forKeyedSubscript:@"disclaimerText"];
  }
  if (self->_dismissText)
  {
    id v13 = [(_SFPBUserReportRequest *)self dismissText];
    uint64_t v14 = (void *)[v13 copy];
    [v3 setObject:v14 forKeyedSubscript:@"dismissText"];
  }
  if (self->_reportOptionsSectionTitle)
  {
    uint64_t v15 = [(_SFPBUserReportRequest *)self reportOptionsSectionTitle];
    uint64_t v16 = (void *)[v15 copy];
    [v3 setObject:v16 forKeyedSubscript:@"reportOptionsSectionTitle"];
  }
  if (self->_reportType)
  {
    uint64_t v17 = [(_SFPBUserReportRequest *)self reportType];
    if (v17 >= 4)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", v17);
      uint64_t v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v18 = off_1E5A2F070[v17];
    }
    [v3 setObject:v18 forKeyedSubscript:@"reportType"];
  }
  if (self->_title)
  {
    v19 = [(_SFPBUserReportRequest *)self title];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"title"];
  }
  if ([(NSArray *)self->_userReportOptions count])
  {
    v21 = [MEMORY[0x1E4F1CA48] array];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    v22 = self->_userReportOptions;
    uint64_t v23 = [(NSArray *)v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v31 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v30 + 1) + 8 * i) dictionaryRepresentation];
          if (v27)
          {
            [v21 addObject:v27];
          }
          else
          {
            v28 = [MEMORY[0x1E4F1CA98] null];
            [v21 addObject:v28];
          }
        }
        uint64_t v24 = [(NSArray *)v22 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v24);
    }

    [v3 setObject:v21 forKeyedSubscript:@"userReportOptions"];
  }
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_affordanceText hash];
  NSUInteger v4 = [(NSString *)self->_title hash];
  NSUInteger v5 = [(NSString *)self->_dismissText hash];
  uint64_t v6 = [(NSArray *)self->_userReportOptions hash];
  uint64_t v7 = 2654435761 * self->_reportType;
  NSUInteger v8 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSString *)self->_reportOptionsSectionTitle hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_disclaimerText hash] ^ v7;
  unint64_t v10 = [(_SFPBPunchout *)self->_disclaimerLearnMorePunchout hash];
  return v9 ^ v10 ^ [(NSString *)self->_attachmentSectionTitle hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  NSUInteger v5 = [(_SFPBUserReportRequest *)self affordanceText];
  uint64_t v6 = [v4 affordanceText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v7 = [(_SFPBUserReportRequest *)self affordanceText];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_SFPBUserReportRequest *)self affordanceText];
    unint64_t v10 = [v4 affordanceText];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBUserReportRequest *)self title];
  uint64_t v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v12 = [(_SFPBUserReportRequest *)self title];
  if (v12)
  {
    id v13 = (void *)v12;
    uint64_t v14 = [(_SFPBUserReportRequest *)self title];
    uint64_t v15 = [v4 title];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBUserReportRequest *)self dismissText];
  uint64_t v6 = [v4 dismissText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v17 = [(_SFPBUserReportRequest *)self dismissText];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(_SFPBUserReportRequest *)self dismissText];
    v20 = [v4 dismissText];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBUserReportRequest *)self userReportOptions];
  uint64_t v6 = [v4 userReportOptions];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v22 = [(_SFPBUserReportRequest *)self userReportOptions];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(_SFPBUserReportRequest *)self userReportOptions];
    uint64_t v25 = [v4 userReportOptions];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  int reportType = self->_reportType;
  if (reportType != [v4 reportType]) {
    goto LABEL_43;
  }
  NSUInteger v5 = [(_SFPBUserReportRequest *)self reportOptionsSectionTitle];
  uint64_t v6 = [v4 reportOptionsSectionTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v28 = [(_SFPBUserReportRequest *)self reportOptionsSectionTitle];
  if (v28)
  {
    v29 = (void *)v28;
    long long v30 = [(_SFPBUserReportRequest *)self reportOptionsSectionTitle];
    long long v31 = [v4 reportOptionsSectionTitle];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBUserReportRequest *)self disclaimerText];
  uint64_t v6 = [v4 disclaimerText];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v33 = [(_SFPBUserReportRequest *)self disclaimerText];
  if (v33)
  {
    long long v34 = (void *)v33;
    uint64_t v35 = [(_SFPBUserReportRequest *)self disclaimerText];
    long long v36 = [v4 disclaimerText];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBUserReportRequest *)self disclaimerLearnMorePunchout];
  uint64_t v6 = [v4 disclaimerLearnMorePunchout];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_42;
  }
  uint64_t v38 = [(_SFPBUserReportRequest *)self disclaimerLearnMorePunchout];
  if (v38)
  {
    v39 = (void *)v38;
    uint64_t v40 = [(_SFPBUserReportRequest *)self disclaimerLearnMorePunchout];
    v41 = [v4 disclaimerLearnMorePunchout];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(_SFPBUserReportRequest *)self attachmentSectionTitle];
  uint64_t v6 = [v4 attachmentSectionTitle];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_42:

    goto LABEL_43;
  }
  uint64_t v43 = [(_SFPBUserReportRequest *)self attachmentSectionTitle];
  if (!v43)
  {

LABEL_46:
    BOOL v48 = 1;
    goto LABEL_44;
  }
  v44 = (void *)v43;
  v45 = [(_SFPBUserReportRequest *)self attachmentSectionTitle];
  v46 = [v4 attachmentSectionTitle];
  char v47 = [v45 isEqual:v46];

  if (v47) {
    goto LABEL_46;
  }
LABEL_43:
  BOOL v48 = 0;
LABEL_44:

  return v48;
}

- (void)writeTo:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  NSUInteger v5 = [(_SFPBUserReportRequest *)self affordanceText];
  if (v5) {
    PBDataWriterWriteStringField();
  }

  uint64_t v6 = [(_SFPBUserReportRequest *)self title];
  if (v6) {
    PBDataWriterWriteStringField();
  }

  uint64_t v7 = [(_SFPBUserReportRequest *)self dismissText];
  if (v7) {
    PBDataWriterWriteStringField();
  }

  NSUInteger v8 = [(_SFPBUserReportRequest *)self userReportOptions];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  if ([(_SFPBUserReportRequest *)self reportType]) {
    PBDataWriterWriteInt32Field();
  }
  id v13 = [(_SFPBUserReportRequest *)self reportOptionsSectionTitle];
  if (v13) {
    PBDataWriterWriteStringField();
  }

  uint64_t v14 = [(_SFPBUserReportRequest *)self disclaimerText];
  if (v14) {
    PBDataWriterWriteStringField();
  }

  uint64_t v15 = [(_SFPBUserReportRequest *)self disclaimerLearnMorePunchout];
  if (v15) {
    PBDataWriterWriteSubmessage();
  }

  int v16 = [(_SFPBUserReportRequest *)self attachmentSectionTitle];
  if (v16) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return _SFPBUserReportRequestReadFrom(self, (uint64_t)a3);
}

- (void)setAttachmentSectionTitle:(id)a3
{
  self->_attachmentSectionTitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDisclaimerLearnMorePunchout:(id)a3
{
}

- (void)setDisclaimerText:(id)a3
{
  self->_disclaimerText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setReportOptionsSectionTitle:(id)a3
{
  self->_reportOptionsSectionTitle = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setReportType:(int)a3
{
  self->_int reportType = a3;
}

- (id)userReportOptionsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_userReportOptions objectAtIndexedSubscript:a3];
}

- (unint64_t)userReportOptionsCount
{
  return [(NSArray *)self->_userReportOptions count];
}

- (void)addUserReportOptions:(id)a3
{
  id v4 = a3;
  userReportOptions = self->_userReportOptions;
  id v8 = v4;
  if (!userReportOptions)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_userReportOptions;
    self->_userReportOptions = v6;

    id v4 = v8;
    userReportOptions = self->_userReportOptions;
  }
  [(NSArray *)userReportOptions addObject:v4];
}

- (void)clearUserReportOptions
{
}

- (void)setUserReportOptions:(id)a3
{
  self->_userReportOptions = (NSArray *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setDismissText:(id)a3
{
  self->_dismissText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setTitle:(id)a3
{
  self->_title = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

- (void)setAffordanceText:(id)a3
{
  self->_affordanceText = (NSString *)[a3 copy];
  MEMORY[0x1F41817F8]();
}

@end