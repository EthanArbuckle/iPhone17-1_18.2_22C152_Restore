@interface NPKProtoRemotePassActionSelectItemRequest
- (BOOL)hasDeviceIdentifier;
- (BOOL)hasExpiryDateData;
- (BOOL)hasPassSerialNumber;
- (BOOL)hasPassTypeIdentifier;
- (BOOL)hasPaymentPassActionData;
- (BOOL)hasPlanDetailLabel;
- (BOOL)hasPlanIdentifier;
- (BOOL)hasPlanLabel;
- (BOOL)hasStartDateData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)expiryDateData;
- (NSData)paymentPassActionData;
- (NSData)startDateData;
- (NSString)deviceIdentifier;
- (NSString)passSerialNumber;
- (NSString)passTypeIdentifier;
- (NSString)planDetailLabel;
- (NSString)planIdentifier;
- (NSString)planLabel;
- (NSString)requestUniqueID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setExpiryDateData:(id)a3;
- (void)setPassSerialNumber:(id)a3;
- (void)setPassTypeIdentifier:(id)a3;
- (void)setPaymentPassActionData:(id)a3;
- (void)setPlanDetailLabel:(id)a3;
- (void)setPlanIdentifier:(id)a3;
- (void)setPlanLabel:(id)a3;
- (void)setRequestUniqueID:(id)a3;
- (void)setStartDateData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoRemotePassActionSelectItemRequest

- (BOOL)hasPlanIdentifier
{
  return self->_planIdentifier != 0;
}

- (BOOL)hasPlanLabel
{
  return self->_planLabel != 0;
}

- (BOOL)hasPlanDetailLabel
{
  return self->_planDetailLabel != 0;
}

- (BOOL)hasStartDateData
{
  return self->_startDateData != 0;
}

- (BOOL)hasExpiryDateData
{
  return self->_expiryDateData != 0;
}

- (BOOL)hasPaymentPassActionData
{
  return self->_paymentPassActionData != 0;
}

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (BOOL)hasPassTypeIdentifier
{
  return self->_passTypeIdentifier != 0;
}

- (BOOL)hasPassSerialNumber
{
  return self->_passSerialNumber != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoRemotePassActionSelectItemRequest;
  v4 = [(NPKProtoRemotePassActionSelectItemRequest *)&v8 description];
  v5 = [(NPKProtoRemotePassActionSelectItemRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  requestUniqueID = self->_requestUniqueID;
  if (requestUniqueID) {
    [v3 setObject:requestUniqueID forKey:@"requestUniqueID"];
  }
  planIdentifier = self->_planIdentifier;
  if (planIdentifier) {
    [v4 setObject:planIdentifier forKey:@"planIdentifier"];
  }
  planLabel = self->_planLabel;
  if (planLabel) {
    [v4 setObject:planLabel forKey:@"planLabel"];
  }
  planDetailLabel = self->_planDetailLabel;
  if (planDetailLabel) {
    [v4 setObject:planDetailLabel forKey:@"planDetailLabel"];
  }
  startDateData = self->_startDateData;
  if (startDateData) {
    [v4 setObject:startDateData forKey:@"startDateData"];
  }
  expiryDateData = self->_expiryDateData;
  if (expiryDateData) {
    [v4 setObject:expiryDateData forKey:@"expiryDateData"];
  }
  paymentPassActionData = self->_paymentPassActionData;
  if (paymentPassActionData) {
    [v4 setObject:paymentPassActionData forKey:@"paymentPassActionData"];
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier) {
    [v4 setObject:deviceIdentifier forKey:@"deviceIdentifier"];
  }
  passTypeIdentifier = self->_passTypeIdentifier;
  if (passTypeIdentifier) {
    [v4 setObject:passTypeIdentifier forKey:@"passTypeIdentifier"];
  }
  passSerialNumber = self->_passSerialNumber;
  if (passSerialNumber) {
    [v4 setObject:passSerialNumber forKey:@"passSerialNumber"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoRemotePassActionSelectItemRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_requestUniqueID) {
    -[NPKProtoRemotePassActionSelectItemRequest writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteStringField();
  if (self->_planIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_planLabel) {
    PBDataWriterWriteStringField();
  }
  v5 = v6;
  if (self->_planDetailLabel)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_startDateData)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_expiryDateData)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_paymentPassActionData)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_deviceIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_passTypeIdentifier)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_passSerialNumber)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setRequestUniqueID:self->_requestUniqueID];
  if (self->_planIdentifier) {
    objc_msgSend(v5, "setPlanIdentifier:");
  }
  if (self->_planLabel) {
    objc_msgSend(v5, "setPlanLabel:");
  }
  id v4 = v5;
  if (self->_planDetailLabel)
  {
    objc_msgSend(v5, "setPlanDetailLabel:");
    id v4 = v5;
  }
  if (self->_startDateData)
  {
    objc_msgSend(v5, "setStartDateData:");
    id v4 = v5;
  }
  if (self->_expiryDateData)
  {
    objc_msgSend(v5, "setExpiryDateData:");
    id v4 = v5;
  }
  if (self->_paymentPassActionData)
  {
    objc_msgSend(v5, "setPaymentPassActionData:");
    id v4 = v5;
  }
  if (self->_deviceIdentifier)
  {
    objc_msgSend(v5, "setDeviceIdentifier:");
    id v4 = v5;
  }
  if (self->_passTypeIdentifier)
  {
    objc_msgSend(v5, "setPassTypeIdentifier:");
    id v4 = v5;
  }
  if (self->_passSerialNumber)
  {
    objc_msgSend(v5, "setPassSerialNumber:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_requestUniqueID copyWithZone:a3];
  v7 = (void *)v5[9];
  v5[9] = v6;

  uint64_t v8 = [(NSString *)self->_planIdentifier copyWithZone:a3];
  v9 = (void *)v5[7];
  v5[7] = v8;

  uint64_t v10 = [(NSString *)self->_planLabel copyWithZone:a3];
  v11 = (void *)v5[8];
  v5[8] = v10;

  uint64_t v12 = [(NSString *)self->_planDetailLabel copyWithZone:a3];
  v13 = (void *)v5[6];
  v5[6] = v12;

  uint64_t v14 = [(NSData *)self->_startDateData copyWithZone:a3];
  v15 = (void *)v5[10];
  v5[10] = v14;

  uint64_t v16 = [(NSData *)self->_expiryDateData copyWithZone:a3];
  v17 = (void *)v5[2];
  v5[2] = v16;

  uint64_t v18 = [(NSData *)self->_paymentPassActionData copyWithZone:a3];
  v19 = (void *)v5[5];
  v5[5] = v18;

  uint64_t v20 = [(NSString *)self->_deviceIdentifier copyWithZone:a3];
  v21 = (void *)v5[1];
  v5[1] = v20;

  uint64_t v22 = [(NSString *)self->_passTypeIdentifier copyWithZone:a3];
  v23 = (void *)v5[4];
  v5[4] = v22;

  uint64_t v24 = [(NSString *)self->_passSerialNumber copyWithZone:a3];
  v25 = (void *)v5[3];
  v5[3] = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  requestUniqueID = self->_requestUniqueID;
  if ((unint64_t)requestUniqueID | v4[9])
  {
    if (!-[NSString isEqual:](requestUniqueID, "isEqual:")) {
      goto LABEL_22;
    }
  }
  planIdentifier = self->_planIdentifier;
  if ((unint64_t)planIdentifier | v4[7] && !-[NSString isEqual:](planIdentifier, "isEqual:")) {
    goto LABEL_22;
  }
  if (((planLabel = self->_planLabel, !((unint64_t)planLabel | v4[8]))
     || -[NSString isEqual:](planLabel, "isEqual:"))
    && ((planDetailLabel = self->_planDetailLabel, !((unint64_t)planDetailLabel | v4[6]))
     || -[NSString isEqual:](planDetailLabel, "isEqual:"))
    && ((startDateData = self->_startDateData, !((unint64_t)startDateData | v4[10]))
     || -[NSData isEqual:](startDateData, "isEqual:"))
    && ((expiryDateData = self->_expiryDateData, !((unint64_t)expiryDateData | v4[2]))
     || -[NSData isEqual:](expiryDateData, "isEqual:"))
    && ((paymentPassActionData = self->_paymentPassActionData, !((unint64_t)paymentPassActionData | v4[5]))
     || -[NSData isEqual:](paymentPassActionData, "isEqual:"))
    && ((deviceIdentifier = self->_deviceIdentifier, !((unint64_t)deviceIdentifier | v4[1]))
     || -[NSString isEqual:](deviceIdentifier, "isEqual:"))
    && ((passTypeIdentifier = self->_passTypeIdentifier, !((unint64_t)passTypeIdentifier | v4[4]))
     || -[NSString isEqual:](passTypeIdentifier, "isEqual:")))
  {
    passSerialNumber = self->_passSerialNumber;
    if ((unint64_t)passSerialNumber | v4[3]) {
      char v15 = -[NSString isEqual:](passSerialNumber, "isEqual:");
    }
    else {
      char v15 = 1;
    }
  }
  else
  {
LABEL_22:
    char v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_requestUniqueID hash];
  NSUInteger v4 = [(NSString *)self->_planIdentifier hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_planLabel hash];
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_planDetailLabel hash];
  uint64_t v7 = [(NSData *)self->_startDateData hash];
  uint64_t v8 = v7 ^ [(NSData *)self->_expiryDateData hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSData *)self->_paymentPassActionData hash];
  NSUInteger v10 = [(NSString *)self->_deviceIdentifier hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_passTypeIdentifier hash];
  return v9 ^ v11 ^ [(NSString *)self->_passSerialNumber hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[9]) {
    -[NPKProtoRemotePassActionSelectItemRequest setRequestUniqueID:](self, "setRequestUniqueID:");
  }
  if (v4[7]) {
    -[NPKProtoRemotePassActionSelectItemRequest setPlanIdentifier:](self, "setPlanIdentifier:");
  }
  if (v4[8]) {
    -[NPKProtoRemotePassActionSelectItemRequest setPlanLabel:](self, "setPlanLabel:");
  }
  if (v4[6]) {
    -[NPKProtoRemotePassActionSelectItemRequest setPlanDetailLabel:](self, "setPlanDetailLabel:");
  }
  if (v4[10]) {
    -[NPKProtoRemotePassActionSelectItemRequest setStartDateData:](self, "setStartDateData:");
  }
  if (v4[2]) {
    -[NPKProtoRemotePassActionSelectItemRequest setExpiryDateData:](self, "setExpiryDateData:");
  }
  if (v4[5]) {
    -[NPKProtoRemotePassActionSelectItemRequest setPaymentPassActionData:](self, "setPaymentPassActionData:");
  }
  if (v4[1]) {
    -[NPKProtoRemotePassActionSelectItemRequest setDeviceIdentifier:](self, "setDeviceIdentifier:");
  }
  if (v4[4]) {
    -[NPKProtoRemotePassActionSelectItemRequest setPassTypeIdentifier:](self, "setPassTypeIdentifier:");
  }
  if (v4[3]) {
    -[NPKProtoRemotePassActionSelectItemRequest setPassSerialNumber:](self, "setPassSerialNumber:");
  }
}

- (NSString)requestUniqueID
{
  return self->_requestUniqueID;
}

- (void)setRequestUniqueID:(id)a3
{
}

- (NSString)planIdentifier
{
  return self->_planIdentifier;
}

- (void)setPlanIdentifier:(id)a3
{
}

- (NSString)planLabel
{
  return self->_planLabel;
}

- (void)setPlanLabel:(id)a3
{
}

- (NSString)planDetailLabel
{
  return self->_planDetailLabel;
}

- (void)setPlanDetailLabel:(id)a3
{
}

- (NSData)startDateData
{
  return self->_startDateData;
}

- (void)setStartDateData:(id)a3
{
}

- (NSData)expiryDateData
{
  return self->_expiryDateData;
}

- (void)setExpiryDateData:(id)a3
{
}

- (NSData)paymentPassActionData
{
  return self->_paymentPassActionData;
}

- (void)setPaymentPassActionData:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (NSString)passTypeIdentifier
{
  return self->_passTypeIdentifier;
}

- (void)setPassTypeIdentifier:(id)a3
{
}

- (NSString)passSerialNumber
{
  return self->_passSerialNumber;
}

- (void)setPassSerialNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDateData, 0);
  objc_storeStrong((id *)&self->_requestUniqueID, 0);
  objc_storeStrong((id *)&self->_planLabel, 0);
  objc_storeStrong((id *)&self->_planIdentifier, 0);
  objc_storeStrong((id *)&self->_planDetailLabel, 0);
  objc_storeStrong((id *)&self->_paymentPassActionData, 0);
  objc_storeStrong((id *)&self->_passTypeIdentifier, 0);
  objc_storeStrong((id *)&self->_passSerialNumber, 0);
  objc_storeStrong((id *)&self->_expiryDateData, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoRemotePassActionSelectItemRequest writeTo:]", "NPKProtoRemotePassActionSelectItemRequest.m", 207, "nil != self->_requestUniqueID");
}

@end