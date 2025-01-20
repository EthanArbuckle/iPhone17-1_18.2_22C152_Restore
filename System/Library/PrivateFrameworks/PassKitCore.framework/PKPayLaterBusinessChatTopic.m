@interface PKPayLaterBusinessChatTopic
+ (id)genericBusinessChatTopicForContext:(unint64_t)a3;
- (BOOL)requiresFinancingPlan;
- (NSSet)relevantFinancingPlanStates;
- (NSString)analyticsIdentifier;
- (NSString)displayText;
- (NSString)messageBubbleText;
- (NSString)page;
- (NSString)payLaterContentRequestTypeString;
- (NSString)targetDialog;
- (PKPayLaterBusinessChatTopic)initWithContext:(unint64_t)a3 topicType:(unint64_t)a4;
- (PKPayLaterBusinessChatTopic)initWithDictionary:(id)a3;
- (id)messagesBubbleTextWithFinancingPlan:(id)a3 installment:(id)a4 payment:(id)a5 dispute:(id)a6;
- (unint64_t)topicType;
- (void)setMessageBubbleText:(id)a3;
- (void)updateWithBusinessChatTopic:(id)a3;
@end

@implementation PKPayLaterBusinessChatTopic

- (PKPayLaterBusinessChatTopic)initWithContext:(unint64_t)a3 topicType:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterBusinessChatTopic;
  result = [(PKPayLaterBusinessChatTopic *)&v7 init];
  if (result)
  {
    result->_topicType = a4;
    if (a4) {
      result->_requiresFinancingPlan = a3 == 1;
    }
  }
  return result;
}

- (PKPayLaterBusinessChatTopic)initWithDictionary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PKPayLaterBusinessChatTopic *)self initWithContext:0 topicType:0];
  if (v5)
  {
    uint64_t v6 = [v4 PKStringForKey:@"displayText"];
    displayText = v5->_displayText;
    v5->_displayText = (NSString *)v6;

    uint64_t v8 = [v4 PKStringForKey:@"businessChatPage"];
    page = v5->_page;
    v5->_page = (NSString *)v8;

    uint64_t v10 = [v4 PKStringForKey:@"buesinessChatTargetDialog"];
    targetDialog = v5->_targetDialog;
    v5->_targetDialog = (NSString *)v10;

    uint64_t v12 = [v4 PKStringForKey:@"analyticsIdentifier"];
    analyticsIdentifier = v5->_analyticsIdentifier;
    v5->_analyticsIdentifier = (NSString *)v12;

    uint64_t v14 = [v4 PKStringForKey:@"messageBubbleText"];
    messageBubbleText = v5->_messageBubbleText;
    v5->_messageBubbleText = (NSString *)v14;

    uint64_t v16 = [v4 PKStringForKey:@"contentRequestType"];
    serverDefinedContentRequestType = v5->_serverDefinedContentRequestType;
    v5->_serverDefinedContentRequestType = (NSString *)v16;

    v5->_requiresFinancingPlan = [v4 PKBoolForKey:@"requiresFinancingPlan"];
    v18 = [v4 PKArrayContaining:objc_opt_class() forKey:@"relevantFinancingPlanStates"];
    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v31;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v31 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = PKPayLaterFinancingPlanStateFromString(*(void **)(*((void *)&v30 + 1) + 8 * v24));
          if (v25)
          {
            v26 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v25, (void)v30);
            [v19 addObject:v26];
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v20 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v22);
    }

    if ([v19 count])
    {
      uint64_t v27 = [v19 copy];
      relevantFinancingPlanStates = v5->_relevantFinancingPlanStates;
      v5->_relevantFinancingPlanStates = (NSSet *)v27;
    }
    else
    {
      relevantFinancingPlanStates = v5->_relevantFinancingPlanStates;
      v5->_relevantFinancingPlanStates = 0;
    }
  }
  return v5;
}

- (NSString)displayText
{
  unint64_t topicType = self->_topicType;
  id v4 = &stru_1EE0F5368;
  switch(topicType)
  {
    case 0uLL:
      id v4 = self->_displayText;
      break;
    case 1uLL:
      v5 = @"DISPUTE_TOPIC_CANCELLATION_ISSUE";
      goto LABEL_14;
    case 2uLL:
      v5 = @"DISPUTE_TOPIC_CANCELLED";
      goto LABEL_14;
    case 3uLL:
      v5 = @"DISPUTE_TOPIC_CHARGED_OFF";
      goto LABEL_14;
    case 4uLL:
      v5 = @"DISPUTE_TOPIC_REFUND_NOT_SHOWN";
      goto LABEL_14;
    case 5uLL:
      v5 = @"DISPUTE_TOPIC_MERCHANT_ISSUE";
      goto LABEL_14;
    case 6uLL:
      v5 = @"DISPUTE_TOPIC_DELIVERY_ISSUE";
      goto LABEL_14;
    case 7uLL:
      v5 = @"DISPUTE_TOPIC_LOAN_AMOUNT_ISSUE";
      goto LABEL_14;
    case 8uLL:
      v5 = @"DISPUTE_TOPIC_PURHCASE_NOT_AUTHORIZED";
      goto LABEL_14;
    case 9uLL:
      v5 = @"DISPUTE_TOPIC_LOAN_PENDING";
      goto LABEL_14;
    case 0xAuLL:
      v5 = @"DISPUTE_TOPIC_PAYMENT_ISSUE";
      goto LABEL_14;
    case 0x11uLL:
      v5 = @"DISPUTE_TOPIC_OTHER";
LABEL_14:
      PKLocalizedCocoonString(&v5->isa, 0);
      id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  return (NSString *)v4;
}

- (NSString)page
{
  unint64_t topicType = self->_topicType;
  id v4 = @"wallet::loan::cancellationissue";
  switch(topicType)
  {
    case 0uLL:
      id v4 = self->_page;
      break;
    case 1uLL:
      break;
    case 2uLL:
      id v4 = @"wallet::loan::cancelled";
      break;
    case 3uLL:
      id v4 = @"wallet::loan::chargedOff";
      break;
    case 4uLL:
      id v4 = @"wallet::loan::refundissue";
      break;
    case 5uLL:
      id v4 = @"wallet::loan::merchantissue";
      break;
    case 6uLL:
      id v4 = @"wallet::loan::deliveryissue";
      break;
    case 7uLL:
      id v4 = @"wallet::loan::loanamountissue";
      break;
    case 8uLL:
      id v4 = @"wallet::loan::purchasenotauthorized";
      break;
    case 9uLL:
      id v4 = @"wallet::loan::loanpending";
      break;
    case 0xAuLL:
      id v4 = @"wallet::payment::paymentissue";
      break;
    case 0xBuLL:
      id v4 = @"wallet::loan::disputeevidenceemail";
      break;
    case 0xCuLL:
      id v4 = @"wallet::loan::restricted";
      break;
    case 0xDuLL:
      id v4 = @"wallet::loan::unusualactivity";
      break;
    case 0xEuLL:
      id v4 = @"wallet::loan::locked";
      break;
    case 0xFuLL:
      id v4 = @"wallet::loan::lockedbankruptcy";
      break;
    case 0x10uLL:
      id v4 = @"wallet::loan::oustandingcredit";
      break;
    case 0x11uLL:
      id v4 = @"wallet::loanorpayment::other";
      break;
    default:
      id v4 = &stru_1EE0F5368;
      break;
  }
  return (NSString *)v4;
}

- (NSString)targetDialog
{
  unint64_t topicType = self->_topicType;
  id v4 = @"wallet_loan_cancellationissue";
  switch(topicType)
  {
    case 0uLL:
      id v4 = self->_targetDialog;
      break;
    case 1uLL:
      break;
    case 2uLL:
      id v4 = @"wallet_loan_cancelled";
      break;
    case 3uLL:
      id v4 = @"wallet_loan_chargedoff";
      break;
    case 4uLL:
      id v4 = @"wallet_loan_refundissue";
      break;
    case 5uLL:
      id v4 = @"wallet_loan_merchantissue";
      break;
    case 6uLL:
      id v4 = @"wallet_loan_deliveryissue";
      break;
    case 7uLL:
      id v4 = @"wallet_loan_loanamountissue";
      break;
    case 8uLL:
      id v4 = @"wallet_loan_purchasenotauthorized";
      break;
    case 9uLL:
      id v4 = @"wallet_loan_loanpending";
      break;
    case 0xAuLL:
      id v4 = @"wallet_payment_paymentissue";
      break;
    case 0xBuLL:
      id v4 = @"wallet_loan_disputeevidenceemail";
      break;
    case 0xCuLL:
      id v4 = @"wallet_loan_restricted";
      break;
    case 0xDuLL:
      id v4 = @"wallet_loan_unusualactivity";
      break;
    case 0xEuLL:
      id v4 = @"wallet_loan_locked";
      break;
    case 0xFuLL:
      id v4 = @"wallet_loan_lockedbankruptcy";
      break;
    case 0x10uLL:
      id v4 = @"wallet_loan_outstandingcredit";
      break;
    case 0x11uLL:
      id v4 = @"wallet_loanorpayment_other";
      break;
    default:
      id v4 = &stru_1EE0F5368;
      break;
  }
  return (NSString *)v4;
}

- (NSString)analyticsIdentifier
{
  unint64_t topicType = self->_topicType;
  id v4 = @"cancellationIssue";
  switch(topicType)
  {
    case 0uLL:
      id v4 = self->_analyticsIdentifier;
      break;
    case 1uLL:
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      id v4 = @"refundNotShown";
      break;
    case 5uLL:
      id v4 = @"merchantIssue";
      break;
    case 6uLL:
      id v4 = @"deliveryIssue";
      break;
    case 7uLL:
      id v4 = @"loanAmountIssue";
      break;
    case 8uLL:
      id v4 = @"purchaseNotAuthorized";
      break;
    case 9uLL:
      id v4 = @"loanPending";
      break;
    case 0xAuLL:
      id v4 = @"paymentIssue";
      break;
    case 0xBuLL:
      id v4 = @"disputeEvidenceEmail";
      break;
    case 0xCuLL:
      id v4 = @"accountRestricted";
      break;
    case 0xDuLL:
      id v4 = @"unusualActivityDetected";
      break;
    case 0xEuLL:
      id v4 = @"accountLocked";
      break;
    case 0xFuLL:
      id v4 = @"accountLockedBankruptcy";
      break;
    case 0x10uLL:
      id v4 = @"outstandingCredit";
      break;
    case 0x11uLL:
      id v4 = @"other";
      break;
    default:
      id v4 = @"unknown";
      break;
  }
  return (NSString *)v4;
}

- (NSSet)relevantFinancingPlanStates
{
  v3 = 0;
  switch(self->_topicType)
  {
    case 0uLL:
      v3 = self->_relevantFinancingPlanStates;
      break;
    case 1uLL:
    case 8uLL:
      id v4 = (void *)MEMORY[0x1E4F1CAD0];
      objc_super v7 = &unk_1EE22BC00;
      uint64_t v8 = 0;
      uint64_t v6 = &unk_1EE22BBE8;
      goto LABEL_4;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      id v4 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v6 = &unk_1EE22BC18;
      objc_super v7 = 0;
LABEL_4:
      objc_msgSend(v4, "setWithObjects:", &unk_1EE22BBD0, v6, v7, v8);
      goto LABEL_5;
    case 9uLL:
      objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EE22BBE8, &unk_1EE22BC00, 0, v8);
LABEL_5:
      v3 = (NSSet *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }
  return v3;
}

- (NSString)payLaterContentRequestTypeString
{
  v2 = 0;
  unint64_t topicType = self->_topicType;
  uint64_t v5 = 2;
  switch(topicType)
  {
    case 0uLL:
      uint64_t v6 = self->_serverDefinedContentRequestType;
      goto LABEL_12;
    case 1uLL:
      goto LABEL_11;
    case 4uLL:
      uint64_t v5 = 3;
      goto LABEL_11;
    case 5uLL:
      uint64_t v5 = 4;
      goto LABEL_11;
    case 6uLL:
      uint64_t v5 = 5;
      goto LABEL_11;
    case 7uLL:
      uint64_t v5 = 6;
      goto LABEL_11;
    case 8uLL:
      uint64_t v5 = 7;
      goto LABEL_11;
    case 9uLL:
      uint64_t v5 = 8;
      goto LABEL_11;
    case 0xAuLL:
      uint64_t v5 = 9;
      goto LABEL_11;
    case 0x11uLL:
      uint64_t v5 = 10;
LABEL_11:
      PKAccountWebServicePayLaterContentRequestTypeToString(v5);
      uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_12:
      v2 = v6;
      break;
    default:
      break;
  }
  return v2;
}

- (id)messagesBubbleTextWithFinancingPlan:(id)a3 installment:(id)a4 payment:(id)a5 dispute:(id)a6
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 merchant];
  v11 = [v10 displayName];

  uint64_t v12 = [v9 planSummary];

  v13 = [v12 totalAmount];

  uint64_t v14 = [v8 amount];
  v15 = [v8 postedDate];

  if (qword_1EB402D68 != -1) {
    dispatch_once(&qword_1EB402D68, &__block_literal_global_74);
  }
  uint64_t v16 = [(id)_MergedGlobals_220 stringFromDate:v15];
  v17 = [v13 formattedStringValue];
  v18 = [v14 formattedStringValue];
  switch(self->_topicType)
  {
    case 0uLL:
      uint64_t v22 = self->_messageBubbleText;
      goto LABEL_26;
    case 1uLL:
      [NSString stringWithFormat:@"I have a cancellation issue with my loan of %@ for my purchase from %@.", v17, v11, v31];
      goto LABEL_22;
    case 2uLL:
      [NSString stringWithFormat:@"I need help with my canceled loan for my purchase from %@", v11, v30, v31];
      goto LABEL_22;
    case 3uLL:
      [NSString stringWithFormat:@"I need help with my charged off loan for my purchase from %@.", v11, v30, v31];
      goto LABEL_22;
    case 4uLL:
      [NSString stringWithFormat:@"I made a return on my purchase from %@ but my payment schedule has not been updated.", v11, v30, v31];
      goto LABEL_22;
    case 5uLL:
      [NSString stringWithFormat:@"I have a return or cancellation issue with my loan for my purchase from %@.", v11, v30, v31];
      goto LABEL_22;
    case 6uLL:
      [NSString stringWithFormat:@"My order, or part of my order, was never received for my purchase from %@.", v11, v30, v31];
      goto LABEL_22;
    case 7uLL:
      [NSString stringWithFormat:@"My order from %@ was for a different amount than my loan of %@.", v11, v17, v31];
      goto LABEL_22;
    case 8uLL:
      [NSString stringWithFormat:@"I never made this purchase or never authorized a loan of %@ to pay for my purchase from %@.", v17, v11, v31];
      goto LABEL_22;
    case 9uLL:
      [NSString stringWithFormat:@"I have a question about when my loan payments for my purchase from %@ will start.", v11, v30, v31];
      goto LABEL_22;
    case 0xAuLL:
      goto LABEL_21;
    case 0xBuLL:
      [NSString stringWithFormat:@"Please resend the email asking for additional information about my dispute for my purchase from %@.", v11, v30, v31];
      goto LABEL_22;
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0x10uLL:
      id v19 = [NSString alloc];
      id v20 = @"I need help with my Apple Pay Later account.";
      goto LABEL_5;
    case 0xFuLL:
      id v19 = [NSString alloc];
      id v20 = @"I’d like more information about my account status.";
LABEL_5:
      uint64_t v21 = [v19 initWithFormat:v20];
      goto LABEL_23;
    case 0x11uLL:
      if (v8 && v11)
      {
LABEL_21:
        [NSString stringWithFormat:@"I need help with my loan payment of %@ made on %@ for my purchase from %@.", v18, v16, v11];
      }
      else
      {
        if (!v11)
        {
          uint64_t v22 = &stru_1EE0F5368;
          goto LABEL_24;
        }
        [NSString stringWithFormat:@"I need help with the loan for my purchase from %@.", v11, v30, v31];
      }
      uint64_t v21 = LABEL_22:;
LABEL_23:
      uint64_t v22 = (__CFString *)v21;
LABEL_24:
      if ([(__CFString *)v22 length])
      {
        uint64_t v27 = PKLocalizedFeatureStringWithDefaultValue(@"BUSINESS_CHAT_PAT_LATER_CONTACT_SUPPORT", 3, v22, 0, v23, v24, v25, v26, v29);

        uint64_t v22 = (__CFString *)v27;
      }
LABEL_26:

      return v22;
    default:
      uint64_t v22 = 0;
      goto LABEL_24;
  }
}

uint64_t __95__PKPayLaterBusinessChatTopic_messagesBubbleTextWithFinancingPlan_installment_payment_dispute___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_220;
  _MergedGlobals_220 = (uint64_t)v0;

  v2 = (void *)_MergedGlobals_220;
  v3 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  [v2 setCalendar:v3];

  id v4 = (void *)_MergedGlobals_220;
  return [v4 setDateStyle:1];
}

- (void)updateWithBusinessChatTopic:(id)a3
{
  if (!self->_topicType)
  {
    id v4 = [a3 messageBubbleText];
    if (v4)
    {
      uint64_t v5 = v4;
      objc_storeStrong((id *)&self->_messageBubbleText, v4);
      id v4 = v5;
    }
  }
}

+ (id)genericBusinessChatTopicForContext:(unint64_t)a3
{
  v3 = [[PKPayLaterBusinessChatTopic alloc] initWithContext:a3 topicType:17];
  return v3;
}

- (unint64_t)topicType
{
  return self->_topicType;
}

- (BOOL)requiresFinancingPlan
{
  return self->_requiresFinancingPlan;
}

- (NSString)messageBubbleText
{
  return self->_messageBubbleText;
}

- (void)setMessageBubbleText:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageBubbleText, 0);
  objc_storeStrong((id *)&self->_relevantFinancingPlanStates, 0);
  objc_storeStrong((id *)&self->_serverDefinedContentRequestType, 0);
  objc_storeStrong((id *)&self->_analyticsIdentifier, 0);
  objc_storeStrong((id *)&self->_targetDialog, 0);
  objc_storeStrong((id *)&self->_page, 0);
  objc_storeStrong((id *)&self->_displayText, 0);
}

@end