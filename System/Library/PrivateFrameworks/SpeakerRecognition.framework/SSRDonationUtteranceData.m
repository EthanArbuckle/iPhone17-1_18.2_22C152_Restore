@interface SSRDonationUtteranceData
- (NSString)donationId;
- (NSString)locale;
- (SSRDonationUtteranceData)initWithDonationInfoString:(id)a3 locale:(id)a4;
- (unint64_t)triggerPhrase;
@end

@implementation SSRDonationUtteranceData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_donationId, 0);
}

- (NSString)locale
{
  return self->_locale;
}

- (unint64_t)triggerPhrase
{
  return self->_triggerPhrase;
}

- (NSString)donationId
{
  return self->_donationId;
}

- (SSRDonationUtteranceData)initWithDonationInfoString:(id)a3 locale:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SSRDonationUtteranceData;
  v8 = [(SSRDonationUtteranceData *)&v19 init];
  if (!v8)
  {
LABEL_12:
    v15 = v8;
    goto LABEL_13;
  }
  v9 = +[SSRUtils convertToUtteranceDataWithDonationString:v6];
  v10 = v9;
  if (!v9)
  {
    v13 = *MEMORY[0x263F38100];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315138;
    v21 = "-[SSRDonationUtteranceData initWithDonationInfoString:locale:]";
    v14 = "%s donationInfo return as nil";
LABEL_15:
    _os_log_error_impl(&dword_21C8A5000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
    goto LABEL_9;
  }
  if ([v9 count])
  {
    uint64_t v11 = [v10 objectAtIndexedSubscript:0];
    donationId = v8->_donationId;
    v8->_donationId = (NSString *)v11;

    if ([v10 count] == 1)
    {
      v8->_triggerPhrase = 0;
    }
    else
    {
      v16 = [v10 objectAtIndexedSubscript:1];
      v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v16, "intValue"));
      v8->_triggerPhrase = +[SSRUtils convertToEnrollmentTriggerPhraseWithPhId:](SSRUtils, "convertToEnrollmentTriggerPhraseWithPhId:", [v17 unsignedIntegerValue]);
    }
    objc_storeStrong((id *)&v8->_locale, a4);

    goto LABEL_12;
  }
  v13 = *MEMORY[0x263F38100];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F38100], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[SSRDonationUtteranceData initWithDonationInfoString:locale:]";
    v14 = "%s donationInfo contain empty info";
    goto LABEL_15;
  }
LABEL_9:

  v15 = 0;
LABEL_13:

  return v15;
}

@end