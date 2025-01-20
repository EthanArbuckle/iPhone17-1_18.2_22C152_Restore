@interface VIUserFeedback
- (NSData)sfReportData;
- (NSData)userFeedbackPayload;
- (NSString)reportIdentifier;
- (VIImageContent)image;
- (VIUserFeedback)initWithImage:(id)a3 payload:(id)a4 reportIdentifier:(id)a5;
- (VIUserFeedback)initWithImage:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5 reportIdentifier:(id)a6;
@end

@implementation VIUserFeedback

- (VIUserFeedback)initWithImage:(id)a3 payload:(id)a4 reportIdentifier:(id)a5
{
  return [(VIUserFeedback *)self initWithImage:a3 userFeedbackPayload:a4 sfReportData:0 reportIdentifier:a5];
}

- (VIUserFeedback)initWithImage:(id)a3 userFeedbackPayload:(id)a4 sfReportData:(id)a5 reportIdentifier:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)VIUserFeedback;
  v15 = [(VIUserFeedback *)&v24 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_image, a3);
    uint64_t v17 = [v12 copy];
    userFeedbackPayload = v16->_userFeedbackPayload;
    v16->_userFeedbackPayload = (NSData *)v17;

    uint64_t v19 = [v13 copy];
    sfReportData = v16->_sfReportData;
    v16->_sfReportData = (NSData *)v19;

    uint64_t v21 = [v14 copy];
    reportIdentifier = v16->_reportIdentifier;
    v16->_reportIdentifier = (NSString *)v21;
  }
  return v16;
}

- (VIImageContent)image
{
  return self->_image;
}

- (NSData)userFeedbackPayload
{
  return self->_userFeedbackPayload;
}

- (NSData)sfReportData
{
  return self->_sfReportData;
}

- (NSString)reportIdentifier
{
  return self->_reportIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportIdentifier, 0);
  objc_storeStrong((id *)&self->_sfReportData, 0);
  objc_storeStrong((id *)&self->_userFeedbackPayload, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end