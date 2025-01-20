@interface PKPeerPaymentMessage
- (BOOL)hasBeenSent;
- (BOOL)isFromMe;
- (MSMessage)underlyingMessage;
- (NSDate)recurringPaymentStartDate;
- (NSDecimalNumber)amount;
- (NSString)currency;
- (NSString)memo;
- (NSString)paymentIdentifier;
- (NSString)recipientAddress;
- (NSString)recurringPaymentIdentifier;
- (NSString)senderAddress;
- (NSString)transactionIdentifier;
- (NSUUID)identifier;
- (PKCurrencyAmount)currencyAmount;
- (PKPeerPaymentMessage)init;
- (PKPeerPaymentMessage)initWithType:(unint64_t)a3;
- (PKPeerPaymentMessage)initWithType:(unint64_t)a3 session:(id)a4;
- (PKPeerPaymentMessage)initWithUnderlyingMessage:(id)a3;
- (PKPeerPaymentMessageLocalProperties)localProperties;
- (PKPeerPaymentRecurringPaymentMemo)recurringPaymentMemo;
- (PKPeerPaymentRequestToken)requestToken;
- (id)_recurringPaymentSummaryTextWithAmount:(id)a3 memo:(id)a4;
- (id)_requestDeviceScoreIdentifier;
- (id)description;
- (id)recurringPaymentEmoji;
- (int64_t)recurringPaymentColor;
- (unint64_t)recurringPaymentFrequency;
- (unint64_t)type;
- (void)_updateDataURL;
- (void)_updateLayoutContents;
- (void)_updateSummaryText;
- (void)reportMessageSentWithLocalProperties:(id)a3;
- (void)setAmount:(id)a3;
- (void)setCurrency:(id)a3;
- (void)setCurrencyAmount:(id)a3;
- (void)setLocalProperties:(id)a3;
- (void)setMemo:(id)a3;
- (void)setPaymentIdentifier:(id)a3;
- (void)setRecipientAddress:(id)a3;
- (void)setRecurringPaymentFrequency:(unint64_t)a3;
- (void)setRecurringPaymentIdentifier:(id)a3;
- (void)setRecurringPaymentMemo:(id)a3;
- (void)setRecurringPaymentStartDate:(id)a3;
- (void)setRequestToken:(id)a3;
- (void)setSenderAddress:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)updateWithPeerPaymentPerformResponse:(id)a3;
@end

@implementation PKPeerPaymentMessage

- (PKPeerPaymentMessage)init
{
  return [(PKPeerPaymentMessage *)self initWithType:0];
}

- (PKPeerPaymentMessage)initWithType:(unint64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F35168]);
  v6 = [(PKPeerPaymentMessage *)self initWithType:a3 session:v5];

  return v6;
}

- (PKPeerPaymentMessage)initWithType:(unint64_t)a3 session:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F35150]);
  id v8 = v6;
  if (!v6) {
    id v8 = objc_alloc_init(MEMORY[0x1E4F35168]);
  }
  v9 = (void *)[v7 initWithSession:v8];
  v10 = [(PKPeerPaymentMessage *)self initWithUnderlyingMessage:v9];

  if (!v6)
  {

    if (!v10) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  if (v10) {
LABEL_5:
  }
    [(PKPeerPaymentMessage *)v10 setType:a3];
LABEL_6:

  return v10;
}

- (PKPeerPaymentMessage)initWithUnderlyingMessage:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPeerPaymentMessage;
  id v5 = [(PKPeerPaymentMessage *)&v22 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = (MSMessage *)v4;
      p_underlyingMessage = (id *)&v5->_underlyingMessage;
      underlyingMessage = v5->_underlyingMessage;
      v5->_underlyingMessage = v6;
    }
    else
    {
      id v9 = objc_alloc(MEMORY[0x1E4F35150]);
      underlyingMessage = (MSMessage *)objc_alloc_init(MEMORY[0x1E4F35168]);
      uint64_t v10 = [v9 initWithSession:underlyingMessage];
      p_underlyingMessage = (id *)&v5->_underlyingMessage;
      v11 = v5->_underlyingMessage;
      v5->_underlyingMessage = (MSMessage *)v10;
    }
    v12 = [*p_underlyingMessage URL];
    v13 = PKPeerPaymentMessageDataWithDataURL();

    if (v13)
    {
      uint64_t v14 = [objc_alloc(MEMORY[0x1E4F84EA0]) initWithData:v13];
      protoMessage = v5->_protoMessage;
      v5->_protoMessage = (PKProtobufPeerPaymentMessage *)v14;
    }
    if (!v5->_protoMessage)
    {
      v16 = (PKProtobufPeerPaymentMessage *)objc_alloc_init(MEMORY[0x1E4F84EA0]);
      v17 = v5->_protoMessage;
      v5->_protoMessage = v16;

      [(PKProtobufPeerPaymentMessage *)v5->_protoMessage setVersion:1];
      v18 = v5->_protoMessage;
      v19 = [MEMORY[0x1E4F29128] UUID];
      v20 = [v19 UUIDString];
      [(PKProtobufPeerPaymentMessage *)v18 setIdentifier:v20];

      [(PKPeerPaymentMessage *)v5 _updateDataURL];
    }
  }
  return v5;
}

- (NSUUID)identifier
{
  id v3 = objc_alloc(MEMORY[0x1E4F29128]);
  id v4 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage identifier];
  id v5 = (void *)[v3 initWithUUIDString:v4];

  return (NSUUID *)v5;
}

- (unint64_t)type
{
  return (int)[(PKProtobufPeerPaymentMessage *)self->_protoMessage type];
}

- (NSString)currency
{
  return (NSString *)[(PKProtobufPeerPaymentMessage *)self->_protoMessage currency];
}

- (NSDecimalNumber)amount
{
  int v3 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage hasDecimalAmount];
  protoMessage = self->_protoMessage;
  if (v3)
  {
    id v5 = [(PKProtobufPeerPaymentMessage *)protoMessage decimalAmount];
    id v6 = PKProtoSupportDecimalNumberFromProtobuf();
  }
  else
  {
    [(PKProtobufPeerPaymentMessage *)protoMessage amount];
    id v6 = PKLegacyCurrencyStorageIntegerToDecimal();
  }

  return (NSDecimalNumber *)v6;
}

- (PKCurrencyAmount)currencyAmount
{
  int v3 = [(PKPeerPaymentMessage *)self amount];
  id v4 = [(PKPeerPaymentMessage *)self currency];
  id v5 = 0;
  if (v4 && v3)
  {
    id v5 = PKCurrencyAmountCreate(v3, v4);
  }

  return (PKCurrencyAmount *)v5;
}

- (NSString)senderAddress
{
  return (NSString *)[(PKProtobufPeerPaymentMessage *)self->_protoMessage senderAddress];
}

- (NSString)recipientAddress
{
  return (NSString *)[(PKProtobufPeerPaymentMessage *)self->_protoMessage recipientAddress];
}

- (id)_requestDeviceScoreIdentifier
{
  v2 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage requestDeviceScoreIdentifier];
  if (v2) {
    int v3 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v2];
  }
  else {
    int v3 = 0;
  }

  return v3;
}

- (PKPeerPaymentRequestToken)requestToken
{
  id v3 = objc_alloc(MEMORY[0x1E4F84DF8]);
  id v4 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage requestToken];
  id v5 = [(PKPeerPaymentMessage *)self _requestDeviceScoreIdentifier];
  id v6 = (void *)[v3 initWithRequestToken:v4 deviceScoreIdentifier:v5 expiryDate:0];

  return (PKPeerPaymentRequestToken *)v6;
}

- (NSString)paymentIdentifier
{
  return (NSString *)[(PKProtobufPeerPaymentMessage *)self->_protoMessage paymentIdentifier];
}

- (NSString)transactionIdentifier
{
  return (NSString *)[(PKProtobufPeerPaymentMessage *)self->_protoMessage transactionIdentifier];
}

- (NSString)memo
{
  return (NSString *)[(PKProtobufPeerPaymentMessage *)self->_protoMessage memo];
}

- (NSString)recurringPaymentIdentifier
{
  return (NSString *)[(PKProtobufPeerPaymentMessage *)self->_protoMessage recurringPaymentIdentifier];
}

- (id)recurringPaymentEmoji
{
  return (id)[(PKProtobufPeerPaymentMessage *)self->_protoMessage recurringPaymentEmoji];
}

- (int64_t)recurringPaymentColor
{
  v2 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage recurringPaymentColor];
  PKSemanticColorFromString();

  return 0;
}

- (PKPeerPaymentRecurringPaymentMemo)recurringPaymentMemo
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F84DE8]);
  id v4 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage recurringPaymentColor];
  PKSemanticColorFromString();

  id v5 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage memo];
  [v3 setText:v5];

  id v6 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage recurringPaymentEmoji];
  [v3 setEmoji:v6];

  [v3 setColor:0];

  return (PKPeerPaymentRecurringPaymentMemo *)v3;
}

- (NSDate)recurringPaymentStartDate
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  [(PKProtobufPeerPaymentMessage *)self->_protoMessage recurringPaymentStartDate];

  return (NSDate *)objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");
}

- (unint64_t)recurringPaymentFrequency
{
  v2 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage recurringPaymentFrequency];
  unint64_t v3 = PKPeerPaymentRecurringPaymentFrequencyFromString();

  return v3;
}

- (void)setType:(unint64_t)a3
{
  -[PKProtobufPeerPaymentMessage setType:](self->_protoMessage, "setType:");
  [(MSMessage *)self->_underlyingMessage setRequiresValidation:a3 - 1 < 3];
  [(PKPeerPaymentMessage *)self _updateDataURL];
  [(PKPeerPaymentMessage *)self _updateLayoutContents];

  [(PKPeerPaymentMessage *)self _updateSummaryText];
}

- (void)setCurrency:(id)a3
{
  [(PKProtobufPeerPaymentMessage *)self->_protoMessage setCurrency:a3];
  [(PKPeerPaymentMessage *)self _updateDataURL];
  [(PKPeerPaymentMessage *)self _updateLayoutContents];

  [(PKPeerPaymentMessage *)self _updateSummaryText];
}

- (void)setAmount:(id)a3
{
  protoMessage = self->_protoMessage;
  id v5 = a3;
  [(PKProtobufPeerPaymentMessage *)protoMessage setAmount:PKCurrencyDecimalToLegacyStorageInteger()];
  id v6 = self->_protoMessage;
  id v7 = PKProtoSupportProtoDecimalNumberFromDecimalNumber();

  [(PKProtobufPeerPaymentMessage *)v6 setDecimalAmount:v7];
  [(PKPeerPaymentMessage *)self _updateDataURL];
  [(PKPeerPaymentMessage *)self _updateLayoutContents];

  [(PKPeerPaymentMessage *)self _updateSummaryText];
}

- (void)setCurrencyAmount:(id)a3
{
  id v4 = a3;
  id v5 = [v4 currency];
  [(PKPeerPaymentMessage *)self setCurrency:v5];

  id v6 = [v4 amount];

  [(PKPeerPaymentMessage *)self setAmount:v6];
}

- (void)setSenderAddress:(id)a3
{
  [(PKProtobufPeerPaymentMessage *)self->_protoMessage setSenderAddress:a3];

  [(PKPeerPaymentMessage *)self _updateDataURL];
}

- (void)setRecipientAddress:(id)a3
{
  [(PKProtobufPeerPaymentMessage *)self->_protoMessage setRecipientAddress:a3];

  [(PKPeerPaymentMessage *)self _updateDataURL];
}

- (void)setRequestToken:(id)a3
{
  protoMessage = self->_protoMessage;
  id v5 = a3;
  id v6 = [v5 requestToken];
  [(PKProtobufPeerPaymentMessage *)protoMessage setRequestToken:v6];

  id v7 = self->_protoMessage;
  id v8 = [v5 deviceScoreIdentifier];

  id v9 = [v8 UUIDString];
  [(PKProtobufPeerPaymentMessage *)v7 setRequestDeviceScoreIdentifier:v9];

  [(PKPeerPaymentMessage *)self _updateDataURL];
}

- (void)setPaymentIdentifier:(id)a3
{
  [(PKProtobufPeerPaymentMessage *)self->_protoMessage setPaymentIdentifier:a3];

  [(PKPeerPaymentMessage *)self _updateDataURL];
}

- (void)setTransactionIdentifier:(id)a3
{
  [(PKProtobufPeerPaymentMessage *)self->_protoMessage setTransactionIdentifier:a3];

  [(PKPeerPaymentMessage *)self _updateDataURL];
}

- (void)setMemo:(id)a3
{
  [(PKProtobufPeerPaymentMessage *)self->_protoMessage setMemo:a3];
  [(PKPeerPaymentMessage *)self _updateDataURL];

  [(PKPeerPaymentMessage *)self _updateSummaryText];
}

- (BOOL)hasBeenSent
{
  unint64_t v3 = [(PKPeerPaymentMessage *)self type];
  id v4 = [(PKPeerPaymentMessage *)self underlyingMessage];
  uint64_t v5 = [v4 senderParticipantIdentifier];
  id v6 = (void *)v5;
  if (v3 == 1)
  {
    if (v5)
    {
      id v7 = [(PKPeerPaymentMessage *)self paymentIdentifier];
      BOOL v8 = v7 != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = v5 != 0;
  }

  return v8;
}

- (BOOL)isFromMe
{
  v2 = [(PKPeerPaymentMessage *)self underlyingMessage];
  char v3 = [v2 isFromMe];

  return v3;
}

- (void)setRecurringPaymentIdentifier:(id)a3
{
  [(PKProtobufPeerPaymentMessage *)self->_protoMessage setRecurringPaymentIdentifier:a3];

  [(PKPeerPaymentMessage *)self _updateDataURL];
}

- (void)setRecurringPaymentMemo:(id)a3
{
  protoMessage = self->_protoMessage;
  id v5 = a3;
  id v6 = [v5 text];
  [(PKProtobufPeerPaymentMessage *)protoMessage setMemo:v6];

  id v7 = self->_protoMessage;
  BOOL v8 = [v5 emoji];
  [(PKProtobufPeerPaymentMessage *)v7 setRecurringPaymentEmoji:v8];

  id v9 = self->_protoMessage;
  [v5 color];

  uint64_t v10 = PKSemanticColorToString();
  [(PKProtobufPeerPaymentMessage *)v9 setRecurringPaymentColor:v10];

  [(PKPeerPaymentMessage *)self _updateDataURL];
  [(PKPeerPaymentMessage *)self _updateLayoutContents];

  [(PKPeerPaymentMessage *)self _updateSummaryText];
}

- (void)setRecurringPaymentStartDate:(id)a3
{
  protoMessage = self->_protoMessage;
  [a3 timeIntervalSinceReferenceDate];
  -[PKProtobufPeerPaymentMessage setRecurringPaymentStartDate:](protoMessage, "setRecurringPaymentStartDate:");
  [(PKPeerPaymentMessage *)self _updateDataURL];
  [(PKPeerPaymentMessage *)self _updateLayoutContents];

  [(PKPeerPaymentMessage *)self _updateSummaryText];
}

- (void)setRecurringPaymentFrequency:(unint64_t)a3
{
  protoMessage = self->_protoMessage;
  id v5 = PKPeerPaymentRecurringPaymentFrequencyToString();
  [(PKProtobufPeerPaymentMessage *)protoMessage setRecurringPaymentFrequency:v5];

  [(PKPeerPaymentMessage *)self _updateDataURL];
  [(PKPeerPaymentMessage *)self _updateLayoutContents];

  [(PKPeerPaymentMessage *)self _updateSummaryText];
}

- (PKPeerPaymentMessageLocalProperties)localProperties
{
  v2 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage localData];
  if (v2)
  {
    char v3 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v2 error:0];
  }
  else
  {
    char v3 = 0;
  }

  return (PKPeerPaymentMessageLocalProperties *)v3;
}

- (void)setLocalProperties:(id)a3
{
  id v4 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:0];
  [(PKProtobufPeerPaymentMessage *)self->_protoMessage setLocalData:v4];
  [(PKPeerPaymentMessage *)self _updateDataURL];
}

- (void)updateWithPeerPaymentPerformResponse:(id)a3
{
  if (a3)
  {
    protoMessage = self->_protoMessage;
    id v5 = a3;
    id v6 = [v5 paymentIdentifier];
    [(PKProtobufPeerPaymentMessage *)protoMessage setPaymentIdentifier:v6];

    id v7 = self->_protoMessage;
    BOOL v8 = [v5 transactionIdentifier];
    [(PKProtobufPeerPaymentMessage *)v7 setTransactionIdentifier:v8];

    id v9 = self->_protoMessage;
    uint64_t v10 = [v5 recurringPaymentIdentifier];

    [(PKProtobufPeerPaymentMessage *)v9 setRecurringPaymentIdentifier:v10];
    [(PKPeerPaymentMessage *)self _updateDataURL];
  }
}

- (void)_updateDataURL
{
  id v4 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage data];
  char v3 = PKPeerPaymentMessageDataURLWithData();
  [(MSMessage *)self->_underlyingMessage setURL:v3];
}

- (void)_updateSummaryText
{
  char v3 = [(PKPeerPaymentMessage *)self currencyAmount];
  id v11 = v3;
  if (v3)
  {
    id v4 = [v3 minimalFormattedStringValue];
    unint64_t v5 = [(PKPeerPaymentMessage *)self type];
    if (v5 == 3)
    {
      BOOL v8 = [(PKPeerPaymentMessage *)self memo];
      id v9 = [(PKPeerPaymentMessage *)self _recurringPaymentSummaryTextWithAmount:v4 memo:v8];
    }
    else
    {
      if (v5 == 2)
      {
        PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes_0.isa, &stru_1EF1B4C70.isa, v4);
      }
      else
      {
        if (v5 != 1)
        {
          id v9 = 0;
          goto LABEL_14;
        }
        PKLocalizedPeerPaymentString(&cfstr_PeerPaymentMes.isa, &stru_1EF1B4C70.isa, v4);
      id v9 = };
    }
LABEL_14:

    goto LABEL_20;
  }
  unint64_t v6 = [(PKPeerPaymentMessage *)self type];
  switch(v6)
  {
    case 3uLL:
      uint64_t v10 = PKLocalizedPeerPaymentRecurringString(&cfstr_PeerPaymentMes_3.isa);
LABEL_18:
      id v9 = (void *)v10;
      goto LABEL_20;
    case 2uLL:
      id v7 = @"PEER_PAYMENT_MESSAGE_SUMMARY_REQUEST_NO_AMOUNT";
      goto LABEL_17;
    case 1uLL:
      id v7 = @"PEER_PAYMENT_MESSAGE_SUMMARY_PAYMENT_NO_AMOUNT";
LABEL_17:
      uint64_t v10 = PKLocalizedPeerPaymentString(&v7->isa);
      goto LABEL_18;
  }
  id v9 = 0;
LABEL_20:
  [(MSMessage *)self->_underlyingMessage setSummaryText:v9];
}

- (void)_updateLayoutContents
{
  v26[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(MSMessage *)self->_underlyingMessage layout];
  if (!v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F35158]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F35160]);
    char v3 = (void *)[v4 initWithAlternateLayout:v5];

    [(MSMessage *)self->_underlyingMessage setLayout:v3];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v3;
    id v7 = [v6 alternateLayout];
    if (!v7) {
      goto LABEL_14;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = 0;
      id v6 = 0;
      goto LABEL_29;
    }
    id v7 = v3;
    id v6 = 0;
    if (!v7) {
      goto LABEL_14;
    }
  }
  unint64_t v8 = [(PKPeerPaymentMessage *)self type];
  int has_internal_ui = os_variant_has_internal_ui();
  if (v8 == 3)
  {
    if (has_internal_ui
      && PKSecureElementIsAvailable()
      && (id v10 = objc_alloc_init(MEMORY[0x1E4F84FC0]),
          char v11 = [v10 isProductionSigned],
          v10,
          (v11 & 1) == 0))
    {
      v12 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Skipping adding mediaFileURL to template layout for rdar://problem/32523250", buf, 2u);
      }
    }
    else
    {
      v12 = [(PKProtobufPeerPaymentMessage *)self->_protoMessage data];
      v13 = PKPeerPaymentMessageDataURLWithData();
      uint64_t v14 = +[PKPeerPaymentBubbleView generatedSnapshotForDataURL:contentInset:isFromMe:](PKPeerPaymentBubbleView, "generatedSnapshotForDataURL:contentInset:isFromMe:", v13, 0, 0.0, 6.0, 0.0, 6.0);
      [v7 setImage:v14];
    }
LABEL_14:
    if (!v6) {
      goto LABEL_29;
    }
    goto LABEL_25;
  }
  if (has_internal_ui
    && PKSecureElementIsAvailable()
    && (id v15 = objc_alloc_init(MEMORY[0x1E4F84FC0]),
        char v16 = [v15 isProductionSigned],
        v15,
        (v16 & 1) == 0))
  {
    v17 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v17, OS_LOG_TYPE_DEFAULT, "Skipping adding mediaFileURL to template layout for rdar://problem/32523250", buf, 2u);
    }
  }
  else
  {
    v17 = PKPeerPaymentMessageFallbackMediaURL();
    [v7 setMediaFileURL:v17];
  }

  v18 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentFal.isa);
  [v7 setCaption:v18];

  v19 = [(PKPeerPaymentMessage *)self currencyAmount];
  v20 = [v19 minimalFormattedStringValue];

  if ([(PKPeerPaymentMessage *)self type] == 1) {
    v21 = @"PEER_PAYMENT_FALLBACK_MESSAGE_SUBCAPTION_PAYMENT_FORMAT";
  }
  else {
    v21 = @"PEER_PAYMENT_FALLBACK_MESSAGE_SUBCAPTION_REQUEST_FORMAT";
  }
  objc_super v22 = PKLocalizedPeerPaymentString(&v21->isa, &stru_1EF1B4C70.isa, v20);
  [v7 setSubcaption:v22];

  if (v6)
  {
LABEL_25:
    v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "Using MSMessageLiveLayout", buf, 2u);
    }

    if ([(PKPeerPaymentMessage *)self type] == 3)
    {
      v26[0] = *MEMORY[0x1E4F6B2A0];
      v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      [v6 setRequiredCapabilities:v24];
    }
  }
LABEL_29:
}

- (id)_recurringPaymentSummaryTextWithAmount:(id)a3 memo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = [(PKPeerPaymentMessage *)self recurringPaymentFrequency];
  if (!v7)
  {
    switch(v8)
    {
      case 1uLL:
        id v14 = v6;
        id v10 = @"PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_WEEKLY";
        goto LABEL_14;
      case 2uLL:
        id v14 = v6;
        id v10 = @"PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_BIWEEKLY";
        goto LABEL_14;
      case 3uLL:
        id v14 = v6;
        id v10 = @"PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_MONTHLY";
        goto LABEL_14;
      case 4uLL:
        id v14 = v6;
        id v10 = @"PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_DAILY";
LABEL_14:
        PKLocalizedPeerPaymentRecurringString(&v10->isa, &stru_1EF1B4C70.isa, v14);
        goto LABEL_15;
      default:
LABEL_6:
        char v11 = 0;
        goto LABEL_16;
    }
  }
  switch(v8)
  {
    case 1uLL:
      id v13 = v6;
      id v15 = v7;
      id v9 = @"PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_WITH_MEMO_WEEKLY";
      break;
    case 2uLL:
      id v13 = v6;
      id v15 = v7;
      id v9 = @"PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_WITH_MEMO_BIWEEKLY";
      break;
    case 3uLL:
      id v13 = v6;
      id v15 = v7;
      id v9 = @"PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_WITH_MEMO_MONTHLY";
      break;
    case 4uLL:
      id v13 = v6;
      id v15 = v7;
      id v9 = @"PEER_PAYMENT_MESSAGE_SUMMARY_RECURRING_PAYMENT_WITH_MEMO_DAILY";
      break;
    default:
      goto LABEL_6;
  }
  PKLocalizedPeerPaymentRecurringString(&v9->isa, &stru_1EF1B5770.isa, v13, v15);
  char v11 = LABEL_15:;
LABEL_16:

  return v11;
}

- (id)description
{
  id v15 = NSString;
  uint64_t v14 = objc_opt_class();
  char v3 = [(PKPeerPaymentMessage *)self identifier];
  [(PKPeerPaymentMessage *)self type];
  id v4 = PKPeerPaymentMessageTypeToString();
  id v5 = [(PKPeerPaymentMessage *)self amount];
  id v6 = [(PKPeerPaymentMessage *)self currency];
  underlyingMessage = self->_underlyingMessage;
  unint64_t v8 = [(PKPeerPaymentMessage *)self requestToken];
  id v9 = [(PKPeerPaymentMessage *)self recurringPaymentIdentifier];
  id v10 = [(PKPeerPaymentMessage *)self recurringPaymentStartDate];
  [(PKPeerPaymentMessage *)self recurringPaymentFrequency];
  char v11 = PKPeerPaymentRecurringPaymentFrequencyToString();
  v12 = [v15 stringWithFormat:@"<%@: %p> identifier: %@, type: %@, amount: %@, currency: %@, underlyingMessage: %@, requestToken: %@, recurringPaymentIdentifier: %@, recurringPaymentStartDate: %@, recurringPaymentFrequency: %@", v14, self, v3, v4, v5, v6, underlyingMessage, v8, v9, v10, v11];

  return v12;
}

- (void)reportMessageSentWithLocalProperties:(id)a3
{
  id v10 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = [(PKPeerPaymentMessage *)self amount];
  id v6 = PKAnalyticsAmountCategoryForAmount();
  [v4 setObject:v6 forKey:*MEMORY[0x1E4F86000]];

  id v7 = [(PKPeerPaymentMessage *)self currency];
  [v4 setObject:v7 forKey:*MEMORY[0x1E4F86008]];

  if (v10) {
    [v10 source];
  }
  unint64_t v8 = PKPeerPaymentMessageSourceToString();
  [v4 setObject:v8 forKey:*MEMORY[0x1E4F86010]];

  unint64_t v9 = [(PKPeerPaymentMessage *)self type];
  if (v9 == 1 || v9 == 2) {
    PKAnalyticsSendEventWithDailyLimit();
  }
}

- (MSMessage)underlyingMessage
{
  return self->_underlyingMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingMessage, 0);

  objc_storeStrong((id *)&self->_protoMessage, 0);
}

@end