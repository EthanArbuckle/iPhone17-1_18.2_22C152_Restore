@interface NPKIdentityExtendedReviewUserNotification
- (NPKIdentityExtendedReviewUserNotification)initWithNotificationType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5;
- (NSString)issuerName;
- (id)body;
- (id)identifierHashComponents;
- (id)title;
- (unint64_t)documentType;
- (unint64_t)notificationType;
@end

@implementation NPKIdentityExtendedReviewUserNotification

- (NPKIdentityExtendedReviewUserNotification)initWithNotificationType:(unint64_t)a3 documentType:(unint64_t)a4 issuerName:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)NPKIdentityExtendedReviewUserNotification;
  v9 = [(NPKIdentityExtendedReviewUserNotification *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_notificationType = a3;
    v9->_documentType = a4;
    uint64_t v11 = [v8 copy];
    issuerName = v10->_issuerName;
    v10->_issuerName = (NSString *)v11;
  }
  return v10;
}

- (id)title
{
  switch(self->_notificationType)
  {
    case 0uLL:
      unint64_t documentType = self->_documentType;
      v3 = @"EXTENDED_REVIEW_ACTION_REQUIRED_TITLE_STATE_ID";
      v4 = @"EXTENDED_REVIEW_ACTION_REQUIRED_TITLE_DRIVER_LICENSE";
      goto LABEL_11;
    case 1uLL:
    case 5uLL:
      unint64_t documentType = self->_documentType;
      v3 = @"EXTENDED_REVIEW_VERIFICATION_CODE_REQUIRED_TITLE_STATE_ID";
      v4 = @"EXTENDED_REVIEW_VERIFICATION_CODE_REQUIRED_TITLE_DRIVER_LICENSE";
      goto LABEL_11;
    case 2uLL:
      unint64_t documentType = self->_documentType;
      v3 = @"EXTENDED_REVIEW_PROVISIONING_REJECTED_TITLE_STATE_ID";
      v4 = @"EXTENDED_REVIEW_PROVISIONING_REJECTED_TITLE_DRIVER_LICENSE";
      goto LABEL_11;
    case 3uLL:
      unint64_t documentType = self->_documentType;
      v3 = @"EXTENDED_REVIEW_UNABLE_TO_ADD_TITLE_STATE_ID";
      v4 = @"EXTENDED_REVIEW_UNABLE_TO_ADD_TITLE_DRIVER_LICENSE";
      goto LABEL_11;
    case 4uLL:
      unint64_t documentType = self->_documentType;
      v3 = @"EXTENDED_REVIEW_FOLLOW_VERIFICATION_INSTRUCTION_REQUIRED_TITLE_STATE_ID";
      v4 = @"EXTENDED_REVIEW_FOLLOW_VERIFICATON_INSTRUCTION_REQUIRED_TITLE_DRIVER_LICENSE";
      goto LABEL_11;
    case 6uLL:
      v5 = @"EXTENDED_REVIEW_VERIFICATION_ETA_TITLE";
      break;
    case 7uLL:
      unint64_t documentType = self->_documentType;
      v3 = @"EXTENDED_REVIEW_LIVENESS_STEP_UP_REQUIRED_TITLE_STATE_ID";
      v4 = @"EXTENDED_REVIEW_LIVENESS_STEP_UP_REQUIRED_TITLE_DRIVER_LICENSE";
      goto LABEL_11;
    case 8uLL:
      unint64_t documentType = self->_documentType;
      v3 = @"EXTENDED_REVIEW_PROOFING_EXPIRED_TITLE_STATE_ID";
      v4 = @"EXTENDED_REVIEW_PROOFING_EXPIRED_TITLE_DRIVER_LICENSE";
LABEL_11:
      NPKSelectStringForDocumentType(documentType, v3, v4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v5 = 0;
      break;
  }
  v6 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
  v7 = [v6 localizedStringForKey:v5 value:&stru_26CFEBA18 table:@"NanoPassKit-Identity"];

  return v7;
}

- (id)body
{
  v3 = @"EXTENDED_REVIEW_FOLLOW_VERIFICATION_INSTRUCTION_REQUIRED_BODY";
  switch(self->_notificationType)
  {
    case 0uLL:
      v3 = @"EXTENDED_REVIEW_ACTION_REQUIRED_BODY";
      goto LABEL_9;
    case 1uLL:
      v3 = @"EXTENDED_REVIEW_VERIFICATION_CODE_REQUIRED_BODY";
      goto LABEL_9;
    case 2uLL:
      v3 = @"EXTENDED_REVIEW_PROVISIONING_REJECTED_BODY";
      goto LABEL_9;
    case 3uLL:
      v3 = @"EXTENDED_REVIEW_UNABLE_TO_ADD_BODY";
      goto LABEL_9;
    case 4uLL:
      goto LABEL_13;
    case 5uLL:
      v3 = @"EXTENDED_REVIEW_VERIFICATION_CODE_TRY_AGAIN_BODY";
      goto LABEL_13;
    case 6uLL:
      v3 = @"EXTENDED_REVIEW_VERIFICATION_ETA_BODY";
      goto LABEL_9;
    case 7uLL:
      unint64_t documentType = self->_documentType;
      v9 = @"EXTENDED_REVIEW_LIVENESS_STEP_UP_REQUIRED_BODY_STATE_ID";
      v10 = @"EXTENDED_REVIEW_LIVENESS_STEP_UP_REQUIRED_BODY_DRIVER_LICENSE";
      goto LABEL_12;
    case 8uLL:
      unint64_t documentType = self->_documentType;
      v9 = @"EXTENDED_REVIEW_PROOFING_EXPIRED_BODY_STATE_ID";
      v10 = @"EXTENDED_REVIEW_PROOFING_EXPIRED_BODY_DRIVER_LICENSE";
LABEL_12:
      NPKSelectStringForDocumentType(documentType, v9, v10);
      v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
      v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
      v7 = [v5 localizedStringForKey:v3 value:&stru_26CFEBA18 table:@"NanoPassKit-Identity"];
      break;
    default:
      v3 = 0;
LABEL_9:
      v4 = NSString;
      v5 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKit"];
      v6 = [v5 localizedStringForKey:v3 value:&stru_26CFEBA18 table:@"NanoPassKit-Identity"];
      v7 = objc_msgSend(v4, "stringWithFormat:", v6, self->_issuerName);

      break;
  }

  return v7;
}

- (id)identifierHashComponents
{
  v6.receiver = self;
  v6.super_class = (Class)NPKIdentityExtendedReviewUserNotification;
  v3 = [(NPKUserNotification *)&v6 identifierHashComponents];
  v4 = (void *)[v3 mutableCopy];

  [v4 safelyAddObject:self->_issuerName];
  return v4;
}

- (unint64_t)notificationType
{
  return self->_notificationType;
}

- (unint64_t)documentType
{
  return self->_documentType;
}

- (NSString)issuerName
{
  return self->_issuerName;
}

- (void).cxx_destruct
{
}

@end