@interface SSScreenTimeRequestResultBuilder
+ (id)bundleId;
- (BOOL)buildButtonItemsAreTrailing;
- (BOOL)buildSecondaryTitleIsDetached;
- (NSArray)approvers;
- (NSDate)expireDate;
- (NSDate)requestDate;
- (NSDate)respondDate;
- (NSNumber)requestAmountDuration;
- (NSNumber)requesterDSID;
- (NSString)requestIdentifier;
- (NSString)requestStatusString;
- (NSString)requestedItemDescription;
- (NSString)requestedItemName;
- (NSString)requesterContactIdentifier;
- (SSScreenTimeRequestResultBuilder)initWithResult:(id)a3;
- (id)buildBadgingImageWithThumbnail:(id)a3;
- (id)buildButtonItems;
- (id)buildCommand;
- (id)buildDescriptions;
- (id)buildFootnote;
- (id)buildInlineCardSection;
- (id)buildInlineCardSections;
- (id)buildSecondaryTitle;
- (id)buildThumbnail;
- (id)subclassBuildHorizontallyScrollingCardSection;
- (int)requestStatus;
- (void)setApprovers:(id)a3;
- (void)setExpireDate:(id)a3;
- (void)setRequestAmountDuration:(id)a3;
- (void)setRequestDate:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestStatus:(int)a3;
- (void)setRequestStatusString:(id)a3;
- (void)setRequestedItemDescription:(id)a3;
- (void)setRequestedItemName:(id)a3;
- (void)setRequesterContactIdentifier:(id)a3;
- (void)setRequesterDSID:(id)a3;
- (void)setRespondDate:(id)a3;
@end

@implementation SSScreenTimeRequestResultBuilder

+ (id)bundleId
{
  return @"com.apple.people.screenTimeRequest";
}

- (SSScreenTimeRequestResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)SSScreenTimeRequestResultBuilder;
  v5 = [(SSResultBuilder *)&v24 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22AD0] withType:objc_opt_class()];
    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F23658] withType:objc_opt_class()];
    [(SSScreenTimeRequestResultBuilder *)v5 setRequestedItemName:v7];

    v8 = [v6 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v9 = v6;
    }
    else {
      v9 = 0;
    }
    [(SSScreenTimeRequestResultBuilder *)v5 setApprovers:v9];

    v10 = [v4 valueForAttribute:*MEMORY[0x1E4F22CD0] withType:objc_opt_class()];
    [(SSScreenTimeRequestResultBuilder *)v5 setRequestedItemDescription:v10];

    v11 = [v4 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
    [(SSScreenTimeRequestResultBuilder *)v5 setRequestDate:v11];

    v12 = [v4 valueForAttribute:*MEMORY[0x1E4F22F30] withType:objc_opt_class()];
    [(SSScreenTimeRequestResultBuilder *)v5 setExpireDate:v12];

    v13 = [v4 valueForAttribute:*MEMORY[0x1E4F22AA8] withType:objc_opt_class()];
    -[SSScreenTimeRequestResultBuilder setRequestStatus:](v5, "setRequestStatus:", [v13 unsignedIntValue]);

    v14 = [v4 valueForAttribute:*MEMORY[0x1E4F22AB0] withType:objc_opt_class()];
    [(SSScreenTimeRequestResultBuilder *)v5 setRequestStatusString:v14];

    v15 = [v4 valueForAttribute:*MEMORY[0x1E4F22C10] withType:objc_opt_class()];
    [(SSScreenTimeRequestResultBuilder *)v5 setRequesterContactIdentifier:v15];

    v16 = [v4 valueForAttribute:*MEMORY[0x1E4F23670] withType:objc_opt_class()];
    [(SSScreenTimeRequestResultBuilder *)v5 setRequestIdentifier:v16];

    v17 = [v4 valueForAttribute:*MEMORY[0x1E4F22C48] withType:objc_opt_class()];
    [(SSScreenTimeRequestResultBuilder *)v5 setRespondDate:v17];

    v18 = [v4 valueForAttribute:*MEMORY[0x1E4F22B08] withType:objc_opt_class()];
    [(SSScreenTimeRequestResultBuilder *)v5 setRequesterDSID:v18];

    v19 = [v4 valueForAttribute:*MEMORY[0x1E4F22D38] withType:objc_opt_class()];
    [(SSScreenTimeRequestResultBuilder *)v5 setRequestAmountDuration:v19];

    v20 = [(SSScreenTimeRequestResultBuilder *)v5 requestAmountDuration];

    if (!v20)
    {
      if ([(SSScreenTimeRequestResultBuilder *)v5 requestStatus] == 3) {
        uint64_t v21 = 0xFFFFFFFFLL;
      }
      else {
        uint64_t v21 = 0;
      }
      v22 = [MEMORY[0x1E4F28ED0] numberWithInt:v21];
      [(SSScreenTimeRequestResultBuilder *)v5 setRequestAmountDuration:v22];
    }
  }

  return v5;
}

- (id)buildInlineCardSection
{
  v6.receiver = self;
  v6.super_class = (Class)SSScreenTimeRequestResultBuilder;
  v2 = [(SSResultBuilder *)&v6 buildInlineCardSection];
  v3 = [v2 descriptions];
  id v4 = [v3 firstObject];
  [v4 setMaxLines:1];

  return v2;
}

- (id)buildInlineCardSections
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [(SSScreenTimeRequestResultBuilder *)self buildInlineCardSection];
  v3 = (void *)v2;
  if (v2)
  {
    v6[0] = v2;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)subclassBuildHorizontallyScrollingCardSection
{
  uint64_t v2 = [(SSScreenTimeRequestResultBuilder *)self buildInlineCardSection];
  [v2 setPreventThumbnailImageScaling:1];
  return v2;
}

- (id)buildDescriptions
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(SSScreenTimeRequestResultBuilder *)self requestedItemDescription];

  if (v4)
  {
    v5 = [(SSScreenTimeRequestResultBuilder *)self requestedItemDescription];
    [v3 appendString:v5];
  }
  if ([v3 length])
  {
    objc_super v6 = [MEMORY[0x1E4F9A378] textWithString:v3];
    v9[0] = v6;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildFootnote
{
  int v3 = [(SSScreenTimeRequestResultBuilder *)self requestStatus];
  int v4 = [(SSScreenTimeRequestResultBuilder *)self requestStatus];
  if (v3 == 3 || v4 == 2)
  {
    objc_super v6 = [(SSScreenTimeRequestResultBuilder *)self requestAmountDuration];
    int v7 = [v6 intValue];

    if (v7 == -1)
    {
      v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v9 = v8;
      v10 = @"ASK_FOR_TIME_APPROVED_DAY";
    }
    else if (v7 == 3600)
    {
      v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v9 = v8;
      v10 = @"ASK_FOR_TIME_APPROVED_HOUR";
    }
    else
    {
      v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      if (v7 == 900)
      {
        v9 = v8;
        v10 = @"ASK_FOR_TIME_APPROVED15";
      }
      else
      {
        v9 = v8;
        v10 = @"ASK_FOR_TIME_DECLINED";
      }
    }
    v11 = [v8 localizedStringForKey:v10 value:&stru_1F1824018 table:@"SpotlightServices"];

    v5 = [MEMORY[0x1E4F9A378] textWithString:v11];
  }
  else
  {
    v5 = [MEMORY[0x1E4F9A378] textWithString:@" "];
  }
  return v5;
}

- (id)buildSecondaryTitle
{
  int v3 = [(SSScreenTimeRequestResultBuilder *)self requestDate];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F9A0E0];
    v5 = [(SSScreenTimeRequestResultBuilder *)self requestDate];
    objc_super v6 = +[SSDateFormatManager dynamicCompactStringFromDate:v5];
    int v7 = [v4 textWithString:v6];
  }
  else
  {
    int v7 = 0;
  }
  return v7;
}

- (BOOL)buildSecondaryTitleIsDetached
{
  return 1;
}

- (BOOL)buildButtonItemsAreTrailing
{
  return 1;
}

- (id)buildCommand
{
  int v3 = [(SSScreenTimeRequestResultBuilder *)self requesterDSID];
  if (!v3) {
    int v3 = (void *)[objc_alloc(MEMORY[0x1E4F28ED0]) initWithInt:0];
  }
  int v4 = (void *)MEMORY[0x1E4F1CB10];
  v5 = NSString;
  objc_super v6 = [(SSScreenTimeRequestResultBuilder *)self requestIdentifier];
  int v7 = [v5 stringWithFormat:@"prefs:root=SCREEN_TIME&path=CHILD_%@#ASK_%@", v3, v6];
  v8 = [v4 URLWithString:v7];

  v9 = [MEMORY[0x1E4F9A2F8] punchoutWithURL:v8];
  v10 = [(SSScreenTimeRequestResultBuilder *)self requestIdentifier];
  [v9 setLabel:v10];

  v11 = objc_opt_new();
  [v11 setPunchout:v9];

  return v11;
}

- (id)buildButtonItems
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(SSScreenTimeRequestResultBuilder *)self requestStatus] == 3
    || [(SSScreenTimeRequestResultBuilder *)self requestStatus] == 2)
  {
    int v3 = 0;
  }
  else
  {
    int v4 = objc_opt_new();
    v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v6 = [v5 localizedStringForKey:@"VIEW" value:&stru_1F1824018 table:@"SpotlightServices"];
    [v4 setTitle:v6];

    int v7 = [(SSScreenTimeRequestResultBuilder *)self buildCommand];
    [v4 setCommand:v7];

    v9[0] = v4;
    int v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  return v3;
}

- (id)buildThumbnail
{
  v4.receiver = self;
  v4.super_class = (Class)SSScreenTimeRequestResultBuilder;
  uint64_t v2 = [(SSResultBuilder *)&v4 buildThumbnail];
  [v2 setCornerRoundingStyle:3];
  return v2;
}

- (id)buildBadgingImageWithThumbnail:(id)a3
{
  return 0;
}

- (int)requestStatus
{
  return self->_requestStatus;
}

- (void)setRequestStatus:(int)a3
{
  self->_requestStatus = a3;
}

- (NSArray)approvers
{
  return self->_approvers;
}

- (void)setApprovers:(id)a3
{
}

- (NSDate)expireDate
{
  return self->_expireDate;
}

- (void)setExpireDate:(id)a3
{
}

- (NSDate)respondDate
{
  return self->_respondDate;
}

- (void)setRespondDate:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
}

- (NSString)requestedItemName
{
  return self->_requestedItemName;
}

- (void)setRequestedItemName:(id)a3
{
}

- (NSString)requestedItemDescription
{
  return self->_requestedItemDescription;
}

- (void)setRequestedItemDescription:(id)a3
{
}

- (NSString)requesterContactIdentifier
{
  return self->_requesterContactIdentifier;
}

- (void)setRequesterContactIdentifier:(id)a3
{
}

- (NSNumber)requesterDSID
{
  return self->_requesterDSID;
}

- (void)setRequesterDSID:(id)a3
{
}

- (NSString)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
}

- (NSString)requestStatusString
{
  return self->_requestStatusString;
}

- (void)setRequestStatusString:(id)a3
{
}

- (NSNumber)requestAmountDuration
{
  return self->_requestAmountDuration;
}

- (void)setRequestAmountDuration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestAmountDuration, 0);
  objc_storeStrong((id *)&self->_requestStatusString, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterDSID, 0);
  objc_storeStrong((id *)&self->_requesterContactIdentifier, 0);
  objc_storeStrong((id *)&self->_requestedItemDescription, 0);
  objc_storeStrong((id *)&self->_requestedItemName, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_respondDate, 0);
  objc_storeStrong((id *)&self->_expireDate, 0);
  objc_storeStrong((id *)&self->_approvers, 0);
}

@end