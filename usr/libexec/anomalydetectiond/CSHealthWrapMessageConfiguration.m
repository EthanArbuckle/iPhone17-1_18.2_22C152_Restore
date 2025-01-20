@interface CSHealthWrapMessageConfiguration
- (BOOL)disableCompression;
- (CSHealthWrapMessageConfiguration)initWithCertificate:(__SecCertificate *)a3 messageUUID:(id)a4 subjectUUID:(id)a5 studyUUID:(id)a6 channel:(id)a7 payloadType:(id)a8;
- (NSData)applicationData;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSDictionary)keyValuePairs;
- (NSString)channel;
- (NSString)payloadIdentifier;
- (NSString)payloadType;
- (NSUUID)messageUUID;
- (NSUUID)studyUUID;
- (NSUUID)subjectUUID;
- (__SecCertificate)certificate;
- (void)dealloc;
- (void)setApplicationData:(id)a3;
- (void)setChannel:(id)a3;
- (void)setDisableCompression:(BOOL)a3;
- (void)setEndDate:(id)a3;
- (void)setKeyValuePairs:(id)a3;
- (void)setMessageUUID:(id)a3;
- (void)setPayloadIdentifier:(id)a3;
- (void)setPayloadType:(id)a3;
- (void)setStartDate:(id)a3;
- (void)setStudyUUID:(id)a3;
- (void)setSubjectUUID:(id)a3;
@end

@implementation CSHealthWrapMessageConfiguration

- (CSHealthWrapMessageConfiguration)initWithCertificate:(__SecCertificate *)a3 messageUUID:(id)a4 subjectUUID:(id)a5 studyUUID:(id)a6 channel:(id)a7 payloadType:(id)a8
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (!a3)
  {
    v32 = +[NSAssertionHandler currentHandler];
    [v32 handleFailureInMethod:a2, self, @"CSHealthWrapMessage.m", 44, @"Invalid parameter not satisfying: %@", @"certificate != NULL" object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)CSHealthWrapMessageConfiguration;
  v20 = [(CSHealthWrapMessageConfiguration *)&v33 init];
  if (v20)
  {
    if (v15)
    {
      v21 = (NSUUID *)[v15 copy];
    }
    else
    {
      v21 = +[NSUUID UUID];
    }
    messageUUID = v20->_messageUUID;
    v20->_messageUUID = v21;

    v23 = (NSUUID *)[v16 copy];
    subjectUUID = v20->_subjectUUID;
    v20->_subjectUUID = v23;

    v25 = (NSUUID *)[v17 copy];
    studyUUID = v20->_studyUUID;
    v20->_studyUUID = v25;

    v27 = (NSString *)[v18 copy];
    channel = v20->_channel;
    v20->_channel = v27;

    v29 = (NSString *)[v19 copy];
    payloadType = v20->_payloadType;
    v20->_payloadType = v29;

    CFRetain(a3);
    v20->_certificate = a3;
  }

  return v20;
}

- (void)dealloc
{
  certificate = self->_certificate;
  if (certificate) {
    CFRelease(certificate);
  }
  v4.receiver = self;
  v4.super_class = (Class)CSHealthWrapMessageConfiguration;
  [(CSHealthWrapMessageConfiguration *)&v4 dealloc];
}

- (__SecCertificate)certificate
{
  return self->_certificate;
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (void)setMessageUUID:(id)a3
{
}

- (NSUUID)subjectUUID
{
  return self->_subjectUUID;
}

- (void)setSubjectUUID:(id)a3
{
}

- (NSUUID)studyUUID
{
  return self->_studyUUID;
}

- (void)setStudyUUID:(id)a3
{
}

- (NSString)channel
{
  return self->_channel;
}

- (void)setChannel:(id)a3
{
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (void)setPayloadType:(id)a3
{
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
}

- (NSString)payloadIdentifier
{
  return self->_payloadIdentifier;
}

- (void)setPayloadIdentifier:(id)a3
{
}

- (NSData)applicationData
{
  return self->_applicationData;
}

- (void)setApplicationData:(id)a3
{
}

- (NSDictionary)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setKeyValuePairs:(id)a3
{
}

- (BOOL)disableCompression
{
  return self->_disableCompression;
}

- (void)setDisableCompression:(BOOL)a3
{
  self->_disableCompression = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_applicationData, 0);
  objc_storeStrong((id *)&self->_payloadIdentifier, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_studyUUID, 0);
  objc_storeStrong((id *)&self->_subjectUUID, 0);

  objc_storeStrong((id *)&self->_messageUUID, 0);
}

@end