@interface ICASSessionData
+ (BOOL)requiresDiagnosticsConsent;
+ (NSString)dataName;
- (ICASCellularRadioAccessTechnology)cellularRadioAccessTechnology;
- (ICASSessionData)initWithUtcOffset:(id)a3 countryCode:(id)a4 languageCode:(id)a5 productType:(id)a6 cellularRadioAccessTechnology:(id)a7 bioAuthEnabled:(id)a8 localNotesEnabled:(id)a9 accountTypeSummary:(id)a10 sessionType:(id)a11 isSaltRegenerated:(id)a12 isGlobalSession:(id)a13;
- (ICASSessionType)sessionType;
- (NSArray)accountTypeSummary;
- (NSNumber)bioAuthEnabled;
- (NSNumber)isGlobalSession;
- (NSNumber)isSaltRegenerated;
- (NSNumber)localNotesEnabled;
- (NSNumber)utcOffset;
- (NSString)countryCode;
- (NSString)languageCode;
- (NSString)productType;
- (id)toDict;
@end

@implementation ICASSessionData

- (ICASSessionData)initWithUtcOffset:(id)a3 countryCode:(id)a4 languageCode:(id)a5 productType:(id)a6 cellularRadioAccessTechnology:(id)a7 bioAuthEnabled:(id)a8 localNotesEnabled:(id)a9 accountTypeSummary:(id)a10 sessionType:(id)a11 isSaltRegenerated:(id)a12 isGlobalSession:(id)a13
{
  id v35 = a3;
  id v34 = a4;
  id v27 = a5;
  id v33 = a5;
  id v32 = a6;
  id v31 = a7;
  id v28 = a8;
  id v30 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  id v21 = a12;
  id v22 = a13;
  v36.receiver = self;
  v36.super_class = (Class)ICASSessionData;
  v23 = [(ICASSessionData *)&v36 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_utcOffset, a3);
    objc_storeStrong((id *)&v24->_countryCode, a4);
    objc_storeStrong((id *)&v24->_languageCode, v27);
    objc_storeStrong((id *)&v24->_productType, a6);
    objc_storeStrong((id *)&v24->_cellularRadioAccessTechnology, a7);
    objc_storeStrong((id *)&v24->_bioAuthEnabled, v28);
    objc_storeStrong((id *)&v24->_localNotesEnabled, a9);
    objc_storeStrong((id *)&v24->_accountTypeSummary, a10);
    objc_storeStrong((id *)&v24->_sessionType, a11);
    objc_storeStrong((id *)&v24->_isSaltRegenerated, a12);
    objc_storeStrong((id *)&v24->_isGlobalSession, a13);
  }

  return v24;
}

+ (NSString)dataName
{
  return (NSString *)@"SessionData";
}

+ (BOOL)requiresDiagnosticsConsent
{
  return 0;
}

- (id)toDict
{
  v39[11] = *MEMORY[0x1E4F143B8];
  v38[0] = @"utcOffset";
  v37 = [(ICASSessionData *)self utcOffset];
  if (v37)
  {
    uint64_t v3 = [(ICASSessionData *)self utcOffset];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  objc_super v36 = (void *)v3;
  v39[0] = v3;
  v38[1] = @"countryCode";
  id v35 = [(ICASSessionData *)self countryCode];
  if (v35)
  {
    uint64_t v4 = [(ICASSessionData *)self countryCode];
  }
  else
  {
    uint64_t v4 = objc_opt_new();
  }
  id v34 = (void *)v4;
  v39[1] = v4;
  v38[2] = @"languageCode";
  id v33 = [(ICASSessionData *)self languageCode];
  if (v33)
  {
    uint64_t v5 = [(ICASSessionData *)self languageCode];
  }
  else
  {
    uint64_t v5 = objc_opt_new();
  }
  id v32 = (void *)v5;
  v39[2] = v5;
  v38[3] = @"productType";
  id v31 = [(ICASSessionData *)self productType];
  if (v31)
  {
    uint64_t v6 = [(ICASSessionData *)self productType];
  }
  else
  {
    uint64_t v6 = objc_opt_new();
  }
  id v30 = (void *)v6;
  v39[3] = v6;
  v38[4] = @"cellularRadioAccessTechnology";
  v29 = [(ICASSessionData *)self cellularRadioAccessTechnology];
  if (v29)
  {
    uint64_t v7 = [(ICASSessionData *)self cellularRadioAccessTechnology];
  }
  else
  {
    uint64_t v7 = objc_opt_new();
  }
  id v28 = (void *)v7;
  v39[4] = v7;
  v38[5] = @"bioAuthEnabled";
  id v27 = [(ICASSessionData *)self bioAuthEnabled];
  if (v27)
  {
    uint64_t v8 = [(ICASSessionData *)self bioAuthEnabled];
  }
  else
  {
    uint64_t v8 = objc_opt_new();
  }
  v26 = (void *)v8;
  v39[5] = v8;
  v38[6] = @"localNotesEnabled";
  v25 = [(ICASSessionData *)self localNotesEnabled];
  if (v25)
  {
    uint64_t v9 = [(ICASSessionData *)self localNotesEnabled];
  }
  else
  {
    uint64_t v9 = objc_opt_new();
  }
  v10 = (void *)v9;
  v39[6] = v9;
  v38[7] = @"accountTypeSummary";
  v11 = [(ICASSessionData *)self accountTypeSummary];
  if (v11)
  {
    uint64_t v12 = [(ICASSessionData *)self accountTypeSummary];
  }
  else
  {
    uint64_t v12 = objc_opt_new();
  }
  v13 = (void *)v12;
  v39[7] = v12;
  v38[8] = @"sessionType";
  v14 = [(ICASSessionData *)self sessionType];
  if (v14)
  {
    uint64_t v15 = [(ICASSessionData *)self sessionType];
  }
  else
  {
    uint64_t v15 = objc_opt_new();
  }
  v16 = (void *)v15;
  v39[8] = v15;
  v38[9] = @"isSaltRegenerated";
  v17 = [(ICASSessionData *)self isSaltRegenerated];
  if (v17)
  {
    uint64_t v18 = [(ICASSessionData *)self isSaltRegenerated];
  }
  else
  {
    uint64_t v18 = objc_opt_new();
  }
  id v19 = (void *)v18;
  v39[9] = v18;
  v38[10] = @"isGlobalSession";
  id v20 = [(ICASSessionData *)self isGlobalSession];
  if (v20)
  {
    uint64_t v21 = [(ICASSessionData *)self isGlobalSession];
  }
  else
  {
    uint64_t v21 = objc_opt_new();
  }
  id v22 = (void *)v21;
  v39[10] = v21;
  v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:11];

  return v23;
}

- (NSNumber)utcOffset
{
  return self->_utcOffset;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (NSString)productType
{
  return self->_productType;
}

- (ICASCellularRadioAccessTechnology)cellularRadioAccessTechnology
{
  return self->_cellularRadioAccessTechnology;
}

- (NSNumber)bioAuthEnabled
{
  return self->_bioAuthEnabled;
}

- (NSNumber)localNotesEnabled
{
  return self->_localNotesEnabled;
}

- (NSArray)accountTypeSummary
{
  return self->_accountTypeSummary;
}

- (ICASSessionType)sessionType
{
  return self->_sessionType;
}

- (NSNumber)isSaltRegenerated
{
  return self->_isSaltRegenerated;
}

- (NSNumber)isGlobalSession
{
  return self->_isGlobalSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isGlobalSession, 0);
  objc_storeStrong((id *)&self->_isSaltRegenerated, 0);
  objc_storeStrong((id *)&self->_sessionType, 0);
  objc_storeStrong((id *)&self->_accountTypeSummary, 0);
  objc_storeStrong((id *)&self->_localNotesEnabled, 0);
  objc_storeStrong((id *)&self->_bioAuthEnabled, 0);
  objc_storeStrong((id *)&self->_cellularRadioAccessTechnology, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_utcOffset, 0);
}

@end