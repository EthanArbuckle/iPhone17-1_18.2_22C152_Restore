@interface PKProtobufPaymentClientUpdate
+ (Class)multiTokenContextsType;
+ (Class)paymentSummaryItemsType;
+ (Class)shippingMethodsType;
- (BOOL)hasAutomaticReloadPaymentRequest;
- (BOOL)hasAvailableShippingMethods;
- (BOOL)hasDeferredPaymentRequest;
- (BOOL)hasRecurringPaymentRequest;
- (BOOL)hasRemotePaymentRequestIdentifier;
- (BOOL)hasSelectedAID;
- (BOOL)hasSelectedPaymentType;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)multiTokenContexts;
- (NSMutableArray)paymentSummaryItems;
- (NSMutableArray)shippingMethods;
- (NSString)remotePaymentRequestIdentifier;
- (NSString)selectedAID;
- (PKProtobufAutomaticReloadPaymentRequest)automaticReloadPaymentRequest;
- (PKProtobufDeferredPaymentRequest)deferredPaymentRequest;
- (PKProtobufRecurringPaymentRequest)recurringPaymentRequest;
- (PKProtobufShippingMethods)availableShippingMethods;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)multiTokenContextsAtIndex:(unint64_t)a3;
- (id)paymentSummaryItemsAtIndex:(unint64_t)a3;
- (id)shippingMethodsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)multiTokenContextsCount;
- (unint64_t)paymentSummaryItemsCount;
- (unint64_t)shippingMethodsCount;
- (unsigned)selectedPaymentType;
- (unsigned)status;
- (void)addMultiTokenContexts:(id)a3;
- (void)addPaymentSummaryItems:(id)a3;
- (void)addShippingMethods:(id)a3;
- (void)clearMultiTokenContexts;
- (void)clearPaymentSummaryItems;
- (void)clearShippingMethods;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAutomaticReloadPaymentRequest:(id)a3;
- (void)setAvailableShippingMethods:(id)a3;
- (void)setDeferredPaymentRequest:(id)a3;
- (void)setHasSelectedPaymentType:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setMultiTokenContexts:(id)a3;
- (void)setPaymentSummaryItems:(id)a3;
- (void)setRecurringPaymentRequest:(id)a3;
- (void)setRemotePaymentRequestIdentifier:(id)a3;
- (void)setSelectedAID:(id)a3;
- (void)setSelectedPaymentType:(unsigned int)a3;
- (void)setShippingMethods:(id)a3;
- (void)setStatus:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentClientUpdate

- (BOOL)hasRemotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier != 0;
}

- (void)setStatus:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasStatus
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearPaymentSummaryItems
{
}

- (void)addPaymentSummaryItems:(id)a3
{
  id v4 = a3;
  paymentSummaryItems = self->_paymentSummaryItems;
  id v8 = v4;
  if (!paymentSummaryItems)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_paymentSummaryItems;
    self->_paymentSummaryItems = v6;

    id v4 = v8;
    paymentSummaryItems = self->_paymentSummaryItems;
  }
  [(NSMutableArray *)paymentSummaryItems addObject:v4];
}

- (unint64_t)paymentSummaryItemsCount
{
  return [(NSMutableArray *)self->_paymentSummaryItems count];
}

- (id)paymentSummaryItemsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_paymentSummaryItems objectAtIndex:a3];
}

+ (Class)paymentSummaryItemsType
{
  return (Class)objc_opt_class();
}

- (void)clearShippingMethods
{
}

- (void)addShippingMethods:(id)a3
{
  id v4 = a3;
  shippingMethods = self->_shippingMethods;
  id v8 = v4;
  if (!shippingMethods)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_shippingMethods;
    self->_shippingMethods = v6;

    id v4 = v8;
    shippingMethods = self->_shippingMethods;
  }
  [(NSMutableArray *)shippingMethods addObject:v4];
}

- (unint64_t)shippingMethodsCount
{
  return [(NSMutableArray *)self->_shippingMethods count];
}

- (id)shippingMethodsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_shippingMethods objectAtIndex:a3];
}

+ (Class)shippingMethodsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSelectedAID
{
  return self->_selectedAID != 0;
}

- (BOOL)hasAvailableShippingMethods
{
  return self->_availableShippingMethods != 0;
}

- (void)setSelectedPaymentType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_selectedPaymentType = a3;
}

- (void)setHasSelectedPaymentType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSelectedPaymentType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearMultiTokenContexts
{
}

- (void)addMultiTokenContexts:(id)a3
{
  id v4 = a3;
  multiTokenContexts = self->_multiTokenContexts;
  id v8 = v4;
  if (!multiTokenContexts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_multiTokenContexts;
    self->_multiTokenContexts = v6;

    id v4 = v8;
    multiTokenContexts = self->_multiTokenContexts;
  }
  [(NSMutableArray *)multiTokenContexts addObject:v4];
}

- (unint64_t)multiTokenContextsCount
{
  return [(NSMutableArray *)self->_multiTokenContexts count];
}

- (id)multiTokenContextsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_multiTokenContexts objectAtIndex:a3];
}

+ (Class)multiTokenContextsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasRecurringPaymentRequest
{
  return self->_recurringPaymentRequest != 0;
}

- (BOOL)hasAutomaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest != 0;
}

- (BOOL)hasDeferredPaymentRequest
{
  return self->_deferredPaymentRequest != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentClientUpdate;
  id v4 = [(PKProtobufPaymentClientUpdate *)&v8 description];
  v5 = [(PKProtobufPaymentClientUpdate *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
  if (remotePaymentRequestIdentifier) {
    [v3 setObject:remotePaymentRequestIdentifier forKey:@"remotePaymentRequestIdentifier"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithUnsignedInt:self->_status];
    [v4 setObject:v6 forKey:@"status"];
  }
  if ([(NSMutableArray *)self->_paymentSummaryItems count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_paymentSummaryItems, "count"));
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    objc_super v8 = self->_paymentSummaryItems;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v47 objects:v53 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v48 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v47 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v47 objects:v53 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"paymentSummaryItems"];
  }
  if ([(NSMutableArray *)self->_shippingMethods count])
  {
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_shippingMethods, "count"));
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v15 = self->_shippingMethods;
    uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v43 objects:v52 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v43 + 1) + 8 * j) dictionaryRepresentation];
          [v14 addObject:v20];
        }
        uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v43 objects:v52 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"shippingMethods"];
  }
  selectedAID = self->_selectedAID;
  if (selectedAID) {
    [v4 setObject:selectedAID forKey:@"selectedAID"];
  }
  availableShippingMethods = self->_availableShippingMethods;
  if (availableShippingMethods)
  {
    v23 = [(PKProtobufShippingMethods *)availableShippingMethods dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"availableShippingMethods"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v24 = [NSNumber numberWithUnsignedInt:self->_selectedPaymentType];
    [v4 setObject:v24 forKey:@"selectedPaymentType"];
  }
  if ([(NSMutableArray *)self->_multiTokenContexts count])
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_multiTokenContexts, "count"));
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v26 = self->_multiTokenContexts;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v39 objects:v51 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v28; ++k)
        {
          if (*(void *)v40 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = objc_msgSend(*(id *)(*((void *)&v39 + 1) + 8 * k), "dictionaryRepresentation", (void)v39);
          [v25 addObject:v31];
        }
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v39 objects:v51 count:16];
      }
      while (v28);
    }

    [v4 setObject:v25 forKey:@"multiTokenContexts"];
  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  if (recurringPaymentRequest)
  {
    v33 = [(PKProtobufRecurringPaymentRequest *)recurringPaymentRequest dictionaryRepresentation];
    [v4 setObject:v33 forKey:@"recurringPaymentRequest"];
  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  if (automaticReloadPaymentRequest)
  {
    v35 = [(PKProtobufAutomaticReloadPaymentRequest *)automaticReloadPaymentRequest dictionaryRepresentation];
    [v4 setObject:v35 forKey:@"automaticReloadPaymentRequest"];
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  if (deferredPaymentRequest)
  {
    v37 = [(PKProtobufDeferredPaymentRequest *)deferredPaymentRequest dictionaryRepresentation];
    [v4 setObject:v37 forKey:@"deferredPaymentRequest"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentClientUpdateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_remotePaymentRequestIdentifier) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_paymentSummaryItems;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_shippingMethods;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  if (self->_selectedAID) {
    PBDataWriterWriteStringField();
  }
  if (self->_availableShippingMethods) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = self->_multiTokenContexts;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if (self->_recurringPaymentRequest) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_automaticReloadPaymentRequest) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_deferredPaymentRequest) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v18 = v4;
  if (self->_remotePaymentRequestIdentifier)
  {
    objc_msgSend(v4, "setRemotePaymentRequestIdentifier:");
    id v4 = v18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 22) = self->_status;
    *((unsigned char *)v4 + 92) |= 2u;
  }
  if ([(PKProtobufPaymentClientUpdate *)self paymentSummaryItemsCount])
  {
    [v18 clearPaymentSummaryItems];
    unint64_t v5 = [(PKProtobufPaymentClientUpdate *)self paymentSummaryItemsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PKProtobufPaymentClientUpdate *)self paymentSummaryItemsAtIndex:i];
        [v18 addPaymentSummaryItems:v8];
      }
    }
  }
  if ([(PKProtobufPaymentClientUpdate *)self shippingMethodsCount])
  {
    [v18 clearShippingMethods];
    unint64_t v9 = [(PKProtobufPaymentClientUpdate *)self shippingMethodsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
      {
        uint64_t v12 = [(PKProtobufPaymentClientUpdate *)self shippingMethodsAtIndex:j];
        [v18 addShippingMethods:v12];
      }
    }
  }
  if (self->_selectedAID) {
    objc_msgSend(v18, "setSelectedAID:");
  }
  if (self->_availableShippingMethods) {
    objc_msgSend(v18, "setAvailableShippingMethods:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v18 + 18) = self->_selectedPaymentType;
    *((unsigned char *)v18 + 92) |= 1u;
  }
  if ([(PKProtobufPaymentClientUpdate *)self multiTokenContextsCount])
  {
    [v18 clearMultiTokenContexts];
    unint64_t v13 = [(PKProtobufPaymentClientUpdate *)self multiTokenContextsCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t k = 0; k != v14; ++k)
      {
        uint64_t v16 = [(PKProtobufPaymentClientUpdate *)self multiTokenContextsAtIndex:k];
        [v18 addMultiTokenContexts:v16];
      }
    }
  }
  if (self->_recurringPaymentRequest) {
    objc_msgSend(v18, "setRecurringPaymentRequest:");
  }
  uint64_t v17 = v18;
  if (self->_automaticReloadPaymentRequest)
  {
    objc_msgSend(v18, "setAutomaticReloadPaymentRequest:");
    uint64_t v17 = v18;
  }
  if (self->_deferredPaymentRequest)
  {
    objc_msgSend(v18, "setDeferredPaymentRequest:");
    uint64_t v17 = v18;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_remotePaymentRequestIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 88) = self->_status;
    *(unsigned char *)(v5 + 92) |= 2u;
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v8 = self->_paymentSummaryItems;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v46 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * i) copyWithZone:a3];
        [(id)v5 addPaymentSummaryItems:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v45 objects:v51 count:16];
    }
    while (v10);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v14 = self->_shippingMethods;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v42 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * j) copyWithZone:a3];
        [(id)v5 addShippingMethods:v19];
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSString *)self->_selectedAID copyWithZone:a3];
  long long v21 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v20;

  id v22 = [(PKProtobufShippingMethods *)self->_availableShippingMethods copyWithZone:a3];
  long long v23 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v22;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 72) = self->_selectedPaymentType;
    *(unsigned char *)(v5 + 92) |= 1u;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v24 = self->_multiTokenContexts;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v37 objects:v49 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v38;
    do
    {
      for (uint64_t k = 0; k != v26; ++k)
      {
        if (*(void *)v38 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * k), "copyWithZone:", a3, (void)v37);
        [(id)v5 addMultiTokenContexts:v29];
      }
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v37 objects:v49 count:16];
    }
    while (v26);
  }

  id v30 = [(PKProtobufRecurringPaymentRequest *)self->_recurringPaymentRequest copyWithZone:a3];
  long long v31 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v30;

  id v32 = [(PKProtobufAutomaticReloadPaymentRequest *)self->_automaticReloadPaymentRequest copyWithZone:a3];
  v33 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v32;

  id v34 = [(PKProtobufDeferredPaymentRequest *)self->_deferredPaymentRequest copyWithZone:a3];
  uint64_t v35 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v34;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  remotePaymentRequestIdentifier = self->_remotePaymentRequestIdentifier;
  if ((unint64_t)remotePaymentRequestIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](remotePaymentRequestIdentifier, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 92) & 2) == 0 || self->_status != *((_DWORD *)v4 + 22)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
LABEL_30:
    char v14 = 0;
    goto LABEL_31;
  }
  paymentSummaryItems = self->_paymentSummaryItems;
  if ((unint64_t)paymentSummaryItems | *((void *)v4 + 5)
    && !-[NSMutableArray isEqual:](paymentSummaryItems, "isEqual:"))
  {
    goto LABEL_30;
  }
  shippingMethods = self->_shippingMethods;
  if ((unint64_t)shippingMethods | *((void *)v4 + 10))
  {
    if (!-[NSMutableArray isEqual:](shippingMethods, "isEqual:")) {
      goto LABEL_30;
    }
  }
  selectedAID = self->_selectedAID;
  if ((unint64_t)selectedAID | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](selectedAID, "isEqual:")) {
      goto LABEL_30;
    }
  }
  availableShippingMethods = self->_availableShippingMethods;
  if ((unint64_t)availableShippingMethods | *((void *)v4 + 2))
  {
    if (!-[PKProtobufShippingMethods isEqual:](availableShippingMethods, "isEqual:")) {
      goto LABEL_30;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 92) & 1) == 0 || self->_selectedPaymentType != *((_DWORD *)v4 + 18)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 92))
  {
    goto LABEL_30;
  }
  multiTokenContexts = self->_multiTokenContexts;
  if ((unint64_t)multiTokenContexts | *((void *)v4 + 4)
    && !-[NSMutableArray isEqual:](multiTokenContexts, "isEqual:"))
  {
    goto LABEL_30;
  }
  recurringPaymentRequest = self->_recurringPaymentRequest;
  if ((unint64_t)recurringPaymentRequest | *((void *)v4 + 6))
  {
    if (!-[PKProtobufRecurringPaymentRequest isEqual:](recurringPaymentRequest, "isEqual:")) {
      goto LABEL_30;
    }
  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  if ((unint64_t)automaticReloadPaymentRequest | *((void *)v4 + 1))
  {
    if (!-[PKProtobufAutomaticReloadPaymentRequest isEqual:](automaticReloadPaymentRequest, "isEqual:")) {
      goto LABEL_30;
    }
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  if ((unint64_t)deferredPaymentRequest | *((void *)v4 + 3)) {
    char v14 = -[PKProtobufDeferredPaymentRequest isEqual:](deferredPaymentRequest, "isEqual:");
  }
  else {
    char v14 = 1;
  }
LABEL_31:

  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_remotePaymentRequestIdentifier hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_status;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_paymentSummaryItems hash];
  uint64_t v6 = [(NSMutableArray *)self->_shippingMethods hash];
  NSUInteger v7 = [(NSString *)self->_selectedAID hash];
  unint64_t v8 = [(PKProtobufShippingMethods *)self->_availableShippingMethods hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v9 = 2654435761 * self->_selectedPaymentType;
  }
  else {
    uint64_t v9 = 0;
  }
  NSUInteger v10 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  uint64_t v11 = [(NSMutableArray *)self->_multiTokenContexts hash];
  unint64_t v12 = v11 ^ [(PKProtobufRecurringPaymentRequest *)self->_recurringPaymentRequest hash];
  unint64_t v13 = v12 ^ [(PKProtobufAutomaticReloadPaymentRequest *)self->_automaticReloadPaymentRequest hash];
  return v10 ^ v13 ^ [(PKProtobufDeferredPaymentRequest *)self->_deferredPaymentRequest hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 7)) {
    -[PKProtobufPaymentClientUpdate setRemotePaymentRequestIdentifier:](self, "setRemotePaymentRequestIdentifier:");
  }
  if ((*((unsigned char *)v4 + 92) & 2) != 0)
  {
    self->_status = *((_DWORD *)v4 + 22);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = *((id *)v4 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PKProtobufPaymentClientUpdate *)self addPaymentSummaryItems:*(void *)(*((void *)&v36 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v7);
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v10 = *((id *)v4 + 10);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(v10);
        }
        [(PKProtobufPaymentClientUpdate *)self addShippingMethods:*(void *)(*((void *)&v32 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v12);
  }

  if (*((void *)v4 + 8)) {
    -[PKProtobufPaymentClientUpdate setSelectedAID:](self, "setSelectedAID:");
  }
  availableShippingMethods = self->_availableShippingMethods;
  uint64_t v16 = *((void *)v4 + 2);
  if (availableShippingMethods)
  {
    if (v16) {
      -[PKProtobufShippingMethods mergeFrom:](availableShippingMethods, "mergeFrom:");
    }
  }
  else if (v16)
  {
    -[PKProtobufPaymentClientUpdate setAvailableShippingMethods:](self, "setAvailableShippingMethods:");
  }
  if (*((unsigned char *)v4 + 92))
  {
    self->_selectedPaymentType = *((_DWORD *)v4 + 18);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v17 = *((id *)v4 + 4);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v29 != v20) {
          objc_enumerationMutation(v17);
        }
        -[PKProtobufPaymentClientUpdate addMultiTokenContexts:](self, "addMultiTokenContexts:", *(void *)(*((void *)&v28 + 1) + 8 * k), (void)v28);
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v19);
  }

  recurringPaymentRequest = self->_recurringPaymentRequest;
  uint64_t v23 = *((void *)v4 + 6);
  if (recurringPaymentRequest)
  {
    if (v23) {
      -[PKProtobufRecurringPaymentRequest mergeFrom:](recurringPaymentRequest, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[PKProtobufPaymentClientUpdate setRecurringPaymentRequest:](self, "setRecurringPaymentRequest:");
  }
  automaticReloadPaymentRequest = self->_automaticReloadPaymentRequest;
  uint64_t v25 = *((void *)v4 + 1);
  if (automaticReloadPaymentRequest)
  {
    if (v25) {
      -[PKProtobufAutomaticReloadPaymentRequest mergeFrom:](automaticReloadPaymentRequest, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[PKProtobufPaymentClientUpdate setAutomaticReloadPaymentRequest:](self, "setAutomaticReloadPaymentRequest:");
  }
  deferredPaymentRequest = self->_deferredPaymentRequest;
  uint64_t v27 = *((void *)v4 + 3);
  if (deferredPaymentRequest)
  {
    if (v27) {
      -[PKProtobufDeferredPaymentRequest mergeFrom:](deferredPaymentRequest, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[PKProtobufPaymentClientUpdate setDeferredPaymentRequest:](self, "setDeferredPaymentRequest:");
  }
}

- (NSString)remotePaymentRequestIdentifier
{
  return self->_remotePaymentRequestIdentifier;
}

- (void)setRemotePaymentRequestIdentifier:(id)a3
{
}

- (unsigned)status
{
  return self->_status;
}

- (NSMutableArray)paymentSummaryItems
{
  return self->_paymentSummaryItems;
}

- (void)setPaymentSummaryItems:(id)a3
{
}

- (NSMutableArray)shippingMethods
{
  return self->_shippingMethods;
}

- (void)setShippingMethods:(id)a3
{
}

- (NSString)selectedAID
{
  return self->_selectedAID;
}

- (void)setSelectedAID:(id)a3
{
}

- (PKProtobufShippingMethods)availableShippingMethods
{
  return self->_availableShippingMethods;
}

- (void)setAvailableShippingMethods:(id)a3
{
}

- (unsigned)selectedPaymentType
{
  return self->_selectedPaymentType;
}

- (NSMutableArray)multiTokenContexts
{
  return self->_multiTokenContexts;
}

- (void)setMultiTokenContexts:(id)a3
{
}

- (PKProtobufRecurringPaymentRequest)recurringPaymentRequest
{
  return self->_recurringPaymentRequest;
}

- (void)setRecurringPaymentRequest:(id)a3
{
}

- (PKProtobufAutomaticReloadPaymentRequest)automaticReloadPaymentRequest
{
  return self->_automaticReloadPaymentRequest;
}

- (void)setAutomaticReloadPaymentRequest:(id)a3
{
}

- (PKProtobufDeferredPaymentRequest)deferredPaymentRequest
{
  return self->_deferredPaymentRequest;
}

- (void)setDeferredPaymentRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shippingMethods, 0);
  objc_storeStrong((id *)&self->_selectedAID, 0);
  objc_storeStrong((id *)&self->_remotePaymentRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_recurringPaymentRequest, 0);
  objc_storeStrong((id *)&self->_paymentSummaryItems, 0);
  objc_storeStrong((id *)&self->_multiTokenContexts, 0);
  objc_storeStrong((id *)&self->_deferredPaymentRequest, 0);
  objc_storeStrong((id *)&self->_availableShippingMethods, 0);
  objc_storeStrong((id *)&self->_automaticReloadPaymentRequest, 0);
}

@end