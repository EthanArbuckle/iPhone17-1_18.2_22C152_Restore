@interface NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext
+ (BOOL)supportsSecureCoding;
- (NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext)initWithCoder:(id)a3;
- (NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext)initWithRequestContext:(id)a3;
- (NSString)subtitle;
- (NSString)title;
- (NSURL)physicalCardImageURL;
- (double)ingestionProgress;
- (id)description;
- (unint64_t)ingestionState;
- (void)encodeWithCoder:(id)a3;
- (void)setIngestionProgress:(double)a3;
- (void)setIngestionState:(unint64_t)a3;
- (void)setPhysicalCardImageURL:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext)initWithRequestContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext;
  return [(NPKPaymentProvisioningFlowStepContext *)&v4 initWithRequestContext:a3];
}

- (id)description
{
  v3 = NSString;
  objc_super v4 = [(NPKPaymentProvisioningFlowStepContext *)self _baseFlowStepDescription];
  v5 = [(NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *)self title];
  v6 = [(NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *)self subtitle];
  unint64_t v7 = [(NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *)self ingestionState];
  [(NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext *)self ingestionProgress];
  v9 = [v3 stringWithFormat:@"<%@ title %@ subtitle %@ ingestion state %ld ingestion progress %f>", v4, v5, v6, v7, v8];

  return v9;
}

- (NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext;
  v5 = [(NPKPaymentProvisioningFlowStepContext *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subtitle"];
    subtitle = v5->_subtitle;
    v5->_subtitle = (NSString *)v8;

    v5->_ingestionState = [v4 decodeIntegerForKey:@"ingestionState"];
    [v4 decodeDoubleForKey:@"ingestionProgress"];
    v5->_ingestionProgress = v10;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NPKPaymentProvisioningFlowControllerReaderModeIngestionStepContext;
  id v4 = a3;
  [(NPKPaymentProvisioningFlowStepContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_title, @"title", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_subtitle forKey:@"subtitle"];
  [v4 encodeInteger:self->_ingestionState forKey:@"ingestionState"];
  [v4 encodeDouble:@"ingestionProgress" forKey:self->_ingestionProgress];
}

- (NSURL)physicalCardImageURL
{
  return self->_physicalCardImageURL;
}

- (void)setPhysicalCardImageURL:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (unint64_t)ingestionState
{
  return self->_ingestionState;
}

- (void)setIngestionState:(unint64_t)a3
{
  self->_ingestionState = a3;
}

- (double)ingestionProgress
{
  return self->_ingestionProgress;
}

- (void)setIngestionProgress:(double)a3
{
  self->_ingestionProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_physicalCardImageURL, 0);
}

@end