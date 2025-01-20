@interface SSPurchaseRequestResultBuilder
+ (id)bundleId;
- (BOOL)buildButtonItemsAreTrailing;
- (BOOL)buildSecondaryTitleIsDetached;
- (NSArray)approvers;
- (NSDate)requestDate;
- (NSDate)respondDate;
- (NSString)ageRating;
- (NSString)appName;
- (NSString)appPrice;
- (NSString)appType;
- (NSString)requestIdentifier;
- (NSString)requestStatusString;
- (NSString)requesterContactIdentifier;
- (NSString)requesterName;
- (NSString)thumbnailAppType;
- (SSPurchaseRequestResultBuilder)initWithResult:(id)a3;
- (double)starRating;
- (id)buildBadgingImageWithThumbnail:(id)a3;
- (id)buildButtonItems;
- (id)buildCommand;
- (id)buildDescriptions;
- (id)buildFootnote;
- (id)buildInlineCardSection;
- (id)buildSecondaryTitle;
- (id)buildThumbnail;
- (id)subclassBuildHorizontallyScrollingCardSection;
- (int)requestStatus;
- (void)setAgeRating:(id)a3;
- (void)setAppName:(id)a3;
- (void)setAppPrice:(id)a3;
- (void)setAppType:(id)a3;
- (void)setApprovers:(id)a3;
- (void)setRequestDate:(id)a3;
- (void)setRequestIdentifier:(id)a3;
- (void)setRequestStatus:(int)a3;
- (void)setRequestStatusString:(id)a3;
- (void)setRequesterContactIdentifier:(id)a3;
- (void)setRequesterName:(id)a3;
- (void)setRespondDate:(id)a3;
- (void)setStarRating:(double)a3;
- (void)setThumbnailAppType:(id)a3;
@end

@implementation SSPurchaseRequestResultBuilder

+ (id)bundleId
{
  return @"com.apple.people.askToBuyRequest";
}

- (SSPurchaseRequestResultBuilder)initWithResult:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SSPurchaseRequestResultBuilder;
  v5 = [(SSResultBuilder *)&v25 initWithResult:v4];
  if (v5)
  {
    v6 = [v4 valueForAttribute:*MEMORY[0x1E4F22AD0] withType:objc_opt_class()];
    v7 = [v4 valueForAttribute:*MEMORY[0x1E4F23448] withType:objc_opt_class()];
    [(SSPurchaseRequestResultBuilder *)v5 setAgeRating:v7];

    v8 = [v4 valueForAttribute:*MEMORY[0x1E4F23658] withType:objc_opt_class()];
    [(SSPurchaseRequestResultBuilder *)v5 setAppName:v8];

    v9 = [v4 valueForAttribute:*MEMORY[0x1E4F23060] withType:objc_opt_class()];
    [(SSPurchaseRequestResultBuilder *)v5 setAppPrice:v9];

    v10 = [v6 firstObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v6;
    }
    else {
      v11 = 0;
    }
    [(SSPurchaseRequestResultBuilder *)v5 setApprovers:v11];

    v12 = [v4 valueForAttribute:*MEMORY[0x1E4F22CD0] withType:objc_opt_class()];
    [(SSPurchaseRequestResultBuilder *)v5 setAppType:v12];

    v13 = [v4 valueForAttribute:*MEMORY[0x1E4F22C38] withType:objc_opt_class()];
    [(SSPurchaseRequestResultBuilder *)v5 setRequestDate:v13];

    v14 = [v4 valueForAttribute:*MEMORY[0x1E4F22AA8] withType:objc_opt_class()];
    -[SSPurchaseRequestResultBuilder setRequestStatus:](v5, "setRequestStatus:", [v14 unsignedIntValue]);

    v15 = [v4 valueForAttribute:*MEMORY[0x1E4F22AB0] withType:objc_opt_class()];
    [(SSPurchaseRequestResultBuilder *)v5 setRequestStatusString:v15];

    v16 = [v4 valueForAttribute:*MEMORY[0x1E4F22C10] withType:objc_opt_class()];
    [(SSPurchaseRequestResultBuilder *)v5 setRequesterContactIdentifier:v16];

    v17 = [v4 valueForAttribute:*MEMORY[0x1E4F23670] withType:objc_opt_class()];
    [(SSPurchaseRequestResultBuilder *)v5 setRequestIdentifier:v17];

    v18 = [v4 valueForAttribute:*MEMORY[0x1E4F22C48] withType:objc_opt_class()];
    [(SSPurchaseRequestResultBuilder *)v5 setRespondDate:v18];

    v19 = [v4 valueForAttribute:*MEMORY[0x1E4F235A0] withType:objc_opt_class()];
    [v19 floatValue];
    [(SSPurchaseRequestResultBuilder *)v5 setStarRating:v20];

    uint64_t v21 = [v4 valueForAttribute:*MEMORY[0x1E4F23628] withType:objc_opt_class()];
    v22 = (void *)v21;
    if (v21) {
      v23 = (__CFString *)v21;
    }
    else {
      v23 = &stru_1F1824018;
    }
    [(SSPurchaseRequestResultBuilder *)v5 setThumbnailAppType:v23];
  }
  return v5;
}

- (id)buildInlineCardSection
{
  v6.receiver = self;
  v6.super_class = (Class)SSPurchaseRequestResultBuilder;
  v2 = [(SSResultBuilder *)&v6 buildInlineCardSection];
  v3 = [v2 descriptions];
  id v4 = [v3 firstObject];
  [v4 setMaxLines:1];

  return v2;
}

- (id)subclassBuildHorizontallyScrollingCardSection
{
  v2 = [(SSPurchaseRequestResultBuilder *)self buildInlineCardSection];
  [v2 setPreventThumbnailImageScaling:1];
  return v2;
}

- (id)buildDescriptions
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  id v4 = [(SSPurchaseRequestResultBuilder *)self appType];

  if (v4)
  {
    v5 = [(SSPurchaseRequestResultBuilder *)self appType];
    [v3 appendString:v5];
  }
  objc_super v6 = [(SSPurchaseRequestResultBuilder *)self appPrice];

  if (v6)
  {
    if ([v3 length]) {
      [v3 appendString:@" · "];
    }
    v7 = [(SSPurchaseRequestResultBuilder *)self appPrice];
    [v3 appendString:v7];
  }
  if ([v3 length])
  {
    v8 = [MEMORY[0x1E4F9A378] textWithString:v3];
    v11[0] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)buildFootnote
{
  v23[1] = *MEMORY[0x1E4F143B8];
  int v3 = [(SSPurchaseRequestResultBuilder *)self requestStatus];
  int v4 = [(SSPurchaseRequestResultBuilder *)self requestStatus];
  if (v3 == 3 || v4 == 2)
  {
    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = v15;
    if (v3 == 3) {
      v17 = @"APPROVED";
    }
    else {
      v17 = @"DENIED";
    }
    v12 = [v15 localizedStringForKey:v17 value:&stru_1F1824018 table:@"SpotlightServices"];

    v18 = [(SSPurchaseRequestResultBuilder *)self approvers];
    v13 = [v18 firstObject];

    v19 = NSString;
    float v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v21 = [v20 localizedStringForKey:@"APPROVED_BY_FORMAT" value:&stru_1F1824018 table:@"SpotlightServices"];
    v14 = objc_msgSend(v19, "localizedStringWithFormat:", v21, v12, v13);

    v5 = [MEMORY[0x1E4F9A378] textWithString:v14];
  }
  else
  {
    v5 = objc_opt_new();
    [(SSPurchaseRequestResultBuilder *)self starRating];
    objc_msgSend(v5, "setStarRating:");
    objc_super v6 = [(SSPurchaseRequestResultBuilder *)self ageRating];

    if (!v6) {
      goto LABEL_12;
    }
    [(SSPurchaseRequestResultBuilder *)self starRating];
    v7 = &stru_1F1824018;
    if (v8 != 0.0) {
      v7 = @"· ";
    }
    v9 = NSString;
    v10 = v7;
    v11 = [(SSPurchaseRequestResultBuilder *)self ageRating];
    v12 = [v9 localizedStringWithFormat:@"%@%@", v10, v11];

    v13 = [MEMORY[0x1E4F9A0E0] textWithString:v12];
    v23[0] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
    [v5 setFormattedTextPieces:v14];
  }

LABEL_12:
  return v5;
}

- (id)buildSecondaryTitle
{
  int v3 = [(SSPurchaseRequestResultBuilder *)self requestDate];

  if (v3)
  {
    int v4 = (void *)MEMORY[0x1E4F9A0E0];
    v5 = [(SSPurchaseRequestResultBuilder *)self requestDate];
    objc_super v6 = +[SSDateFormatManager dynamicCompactStringFromDate:v5];
    v7 = [v4 textWithString:v6];
  }
  else
  {
    v7 = 0;
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
  int v3 = objc_opt_new();
  int v4 = [(SSPurchaseRequestResultBuilder *)self requestIdentifier];
  [v3 setRequestIdentifier:v4];

  return v3;
}

- (id)buildButtonItems
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if ([(SSPurchaseRequestResultBuilder *)self requestStatus] == 3
    || [(SSPurchaseRequestResultBuilder *)self requestStatus] == 2)
  {
    int v3 = 0;
  }
  else
  {
    int v4 = [(SSPurchaseRequestResultBuilder *)self buildCommand];
    v5 = objc_opt_new();
    objc_super v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"VIEW" value:&stru_1F1824018 table:@"SpotlightServices"];
    [v5 setTitle:v7];

    [v5 setCommand:v4];
    v9[0] = v5;
    int v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
  }
  return v3;
}

- (id)buildThumbnail
{
  v7.receiver = self;
  v7.super_class = (Class)SSPurchaseRequestResultBuilder;
  int v3 = [(SSResultBuilder *)&v7 buildThumbnail];
  int v4 = [(SSPurchaseRequestResultBuilder *)self thumbnailAppType];
  if ([&unk_1F18646B8 containsObject:v4]) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 0;
  }
  [v3 setCornerRoundingStyle:v5];

  return v3;
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

- (double)starRating
{
  return self->_starRating;
}

- (void)setStarRating:(double)a3
{
  self->_starRating = a3;
}

- (NSArray)approvers
{
  return self->_approvers;
}

- (void)setApprovers:(id)a3
{
}

- (NSDate)requestDate
{
  return self->_requestDate;
}

- (void)setRequestDate:(id)a3
{
}

- (NSDate)respondDate
{
  return self->_respondDate;
}

- (void)setRespondDate:(id)a3
{
}

- (NSString)ageRating
{
  return self->_ageRating;
}

- (void)setAgeRating:(id)a3
{
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
}

- (NSString)appPrice
{
  return self->_appPrice;
}

- (void)setAppPrice:(id)a3
{
}

- (NSString)appType
{
  return self->_appType;
}

- (void)setAppType:(id)a3
{
}

- (NSString)requesterContactIdentifier
{
  return self->_requesterContactIdentifier;
}

- (void)setRequesterContactIdentifier:(id)a3
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

- (NSString)requesterName
{
  return self->_requesterName;
}

- (void)setRequesterName:(id)a3
{
}

- (NSString)thumbnailAppType
{
  return self->_thumbnailAppType;
}

- (void)setThumbnailAppType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailAppType, 0);
  objc_storeStrong((id *)&self->_requesterName, 0);
  objc_storeStrong((id *)&self->_requestStatusString, 0);
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_requesterContactIdentifier, 0);
  objc_storeStrong((id *)&self->_appType, 0);
  objc_storeStrong((id *)&self->_appPrice, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_ageRating, 0);
  objc_storeStrong((id *)&self->_respondDate, 0);
  objc_storeStrong((id *)&self->_requestDate, 0);
  objc_storeStrong((id *)&self->_approvers, 0);
}

@end