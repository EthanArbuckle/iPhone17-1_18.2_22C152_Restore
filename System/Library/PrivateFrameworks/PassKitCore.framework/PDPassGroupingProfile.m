@interface PDPassGroupingProfile
- (BOOL)isEqual:(id)a3;
- (BOOL)isNFCEnabled;
- (NSArray)relevantDates;
- (NSDate)ingestedDate;
- (NSString)groupingID;
- (NSString)passTypeID;
- (int64_t)passStyle;
- (unint64_t)passType;
- (void)setGroupingID:(id)a3;
- (void)setIngestedDate:(id)a3;
- (void)setNFCEnabled:(BOOL)a3;
- (void)setPassStyle:(int64_t)a3;
- (void)setPassTypeID:(id)a3;
- (void)setRelevantDates:(id)a3;
@end

@implementation PDPassGroupingProfile

- (void)setPassTypeID:(id)a3
{
  v4 = (NSString *)[a3 copy];
  passTypeID = self->_passTypeID;
  self->_passTypeID = v4;

  self->_passType = PKPassTypeForPassTypeIdentifier();
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(PDPassGroupingProfile *)self passTypeID];
    v7 = [v5 passTypeID];
    id v8 = v6;
    id v9 = v7;
    v10 = v9;
    if (v8 == v9)
    {
    }
    else
    {
      BOOL v11 = 0;
      v12 = v9;
      id v13 = v8;
      if (!v8 || !v9) {
        goto LABEL_33;
      }
      unsigned int v14 = [v8 isEqualToString:v9];

      if (!v14)
      {
        BOOL v11 = 0;
LABEL_34:

        goto LABEL_35;
      }
    }
    v15 = [(PDPassGroupingProfile *)self groupingID];
    v16 = [v5 groupingID];
    id v13 = v15;
    id v17 = v16;
    v12 = v17;
    if (v13 == v17)
    {
    }
    else
    {
      BOOL v11 = 0;
      v18 = v17;
      v19 = v13;
      if (!v13 || !v17) {
        goto LABEL_32;
      }
      unsigned int v20 = [v13 isEqualToString:v17];

      if (!v20)
      {
        BOOL v11 = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    v19 = [(PDPassGroupingProfile *)self ingestedDate];
    v18 = [v5 ingestedDate];
    if (!PKEqualObjects())
    {
      BOOL v11 = 0;
LABEL_32:

      goto LABEL_33;
    }
    uint64_t v30 = [(PDPassGroupingProfile *)self relevantDates];
    if (v30 || ([v5 relevantDates], (v26 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v21 = [(PDPassGroupingProfile *)self relevantDates];
      v28 = [v5 relevantDates];
      v29 = v21;
      if (!objc_msgSend(v21, "isEqualToArray:"))
      {
        BOOL v11 = 0;
        goto LABEL_27;
      }
      int v27 = 1;
    }
    else
    {
      v26 = 0;
      int v27 = 0;
    }
    unsigned int v22 = [(PDPassGroupingProfile *)self isNFCEnabled];
    if (v22 != [v5 isNFCEnabled])
    {
      BOOL v11 = 0;
      v23 = (void *)v30;
      if (!v27)
      {
LABEL_29:
        if (v23)
        {
LABEL_31:

          goto LABEL_32;
        }
LABEL_30:

        goto LABEL_31;
      }
LABEL_28:

      goto LABEL_29;
    }
    id v24 = [(PDPassGroupingProfile *)self passStyle];
    BOOL v11 = v24 == [v5 passStyle];
    if ((v27 & 1) == 0)
    {
      v23 = (void *)v30;
      if (v30) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
LABEL_27:
    v23 = (void *)v30;
    goto LABEL_28;
  }
  BOOL v11 = 0;
LABEL_35:

  return v11;
}

- (NSString)passTypeID
{
  return self->_passTypeID;
}

- (NSString)groupingID
{
  return self->_groupingID;
}

- (void)setGroupingID:(id)a3
{
}

- (int64_t)passStyle
{
  return self->_passStyle;
}

- (void)setPassStyle:(int64_t)a3
{
  self->_passStyle = a3;
}

- (NSArray)relevantDates
{
  return self->_relevantDates;
}

- (void)setRelevantDates:(id)a3
{
}

- (NSDate)ingestedDate
{
  return self->_ingestedDate;
}

- (void)setIngestedDate:(id)a3
{
}

- (BOOL)isNFCEnabled
{
  return self->_nfcEnabled;
}

- (void)setNFCEnabled:(BOOL)a3
{
  self->_nfcEnabled = a3;
}

- (unint64_t)passType
{
  return self->_passType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ingestedDate, 0);
  objc_storeStrong((id *)&self->_relevantDates, 0);
  objc_storeStrong((id *)&self->_groupingID, 0);
  objc_storeStrong((id *)&self->_passTypeID, 0);
}

@end