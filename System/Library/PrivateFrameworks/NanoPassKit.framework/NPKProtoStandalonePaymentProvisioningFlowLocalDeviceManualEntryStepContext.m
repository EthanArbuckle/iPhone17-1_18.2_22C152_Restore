@interface NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext)secondaryManualEntryStepContext;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSecondaryManualEntryStepContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext;
  v4 = [(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext *)&v8 description];
  v5 = [(NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
  if (secondaryManualEntryStepContext)
  {
    v5 = [(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *)secondaryManualEntryStepContext dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"secondaryManualEntryStepContext"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContextReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_secondaryManualEntryStepContext) {
    -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext writeTo:]();
  }
  id v5 = v4;
  PBDataWriterWriteSubmessage();
}

- (void)copyTo:(id)a3
{
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *)self->_secondaryManualEntryStepContext copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
    if ((unint64_t)secondaryManualEntryStepContext | v4[1]) {
      char v6 = -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext isEqual:](secondaryManualEntryStepContext, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext *)self->_secondaryManualEntryStepContext hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  secondaryManualEntryStepContext = self->_secondaryManualEntryStepContext;
  uint64_t v6 = v4[1];
  if (secondaryManualEntryStepContext)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext mergeFrom:](secondaryManualEntryStepContext, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext setSecondaryManualEntryStepContext:](self, "setSecondaryManualEntryStepContext:");
  }
  id v4 = v7;
LABEL_7:
}

- (NPKProtoStandalonePaymentProvisioningFlowSecondaryManualEntryStepContext)secondaryManualEntryStepContext
{
  return self->_secondaryManualEntryStepContext;
}

- (void)setSecondaryManualEntryStepContext:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext writeTo:]", "NPKProtoStandalonePaymentProvisioningFlowLocalDeviceManualEntryStepContext.m", 86, "self->_secondaryManualEntryStepContext != nil");
}

@end