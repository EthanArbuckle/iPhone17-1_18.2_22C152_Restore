@interface PGNamingQuestion
- (NSString)contactIdentifier;
- (PGNamingQuestion)initWithConfirmedPerson:(id)a3 contactIdentifier:(id)a4 localFactoryScore:(double)a5 serviceManager:(id)a6;
- (PGNamingQuestion)initWithPerson:(id)a3 contactIdentifier:(id)a4 localFactoryScore:(double)a5 serviceManager:(id)a6;
- (PHPerson)person;
- (double)localFactoryScore;
- (id)_additionalInfoFromContactIdentifier:(id)a3 serviceManager:(id)a4;
- (id)_personForContactSuggestion;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
- (void)persistWithCreationDate:(id)a3 questionVersion:(signed __int16)a4;
@end

@implementation PGNamingQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_additionalInfo, 0);
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (PHPerson)person
{
  return self->_person;
}

- (unsigned)state
{
  return self->_state;
}

- (double)localFactoryScore
{
  return self->_localFactoryScore;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (id)_personForContactSuggestion
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v3 = [(PHPerson *)self->_person photoLibrary];
  v4 = [v3 librarySpecificFetchOptions];

  v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(verifiedType = %d)", 0);
  [v4 setPredicate:v5];

  v6 = (void *)MEMORY[0x1E4F391F0];
  v11[0] = self->_contactIdentifier;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [v6 fetchPersonsForContactIdentifiers:v7 options:v4];

  v9 = [v8 firstObject];

  return v9;
}

- (void)persistWithCreationDate:(id)a3 questionVersion:(signed __int16)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = [(PGNamingQuestion *)self additionalInfo];

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E4F39258];
    v9 = [(PGNamingQuestion *)self entityIdentifier];
    uint64_t v10 = [(PGNamingQuestion *)self type];
    uint64_t v11 = [(PGNamingQuestion *)self state];
    uint64_t v12 = [(PGNamingQuestion *)self entityType];
    uint64_t v13 = [(PGNamingQuestion *)self displayType];
    [(PGSurveyQuestion *)self score];
    double v15 = v14;
    v16 = [(PGNamingQuestion *)self additionalInfo];
    LOWORD(v22) = a4;
    id v17 = (id)[v8 creationRequestForQuestionWithEntityIdentifier:v9 type:v10 state:v11 entityType:v12 displayType:v13 score:v16 additionalInfo:v15 creationDate:v6 questionVersion:v22];
  }
  else
  {
    v18 = +[PGLogging sharedLogging];
    v19 = [v18 loggingConnection];

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = [(PGNamingQuestion *)self entityIdentifier];
      v21 = [(PGNamingQuestion *)self contactIdentifier];
      *(_DWORD *)buf = 138412546;
      v24 = v20;
      __int16 v25 = 2112;
      v26 = v21;
      _os_log_error_impl(&dword_1D1805000, v19, OS_LOG_TYPE_ERROR, "Cannot persist PGNamingQuestion (personUUID: %@, contactIdentifier: %@) with a nil additional info dictionary.", buf, 0x16u);
    }
  }
}

- (unsigned)entityType
{
  return 1;
}

- (unsigned)displayType
{
  return 2;
}

- (unsigned)type
{
  return 1;
}

- (id)_additionalInfoFromContactIdentifier:(id)a3 serviceManager:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CAD0];
  id v7 = a4;
  v8 = [v6 setWithObject:v5];
  v9 = [v7 contactsForIdentifiers:v8];

  uint64_t v10 = [v9 anyObject];

  if (v10)
  {
    uint64_t v11 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    uint64_t v12 = [v10 givenName];
    [v11 setGivenName:v12];

    uint64_t v13 = [v10 familyName];
    [v11 setFamilyName:v13];

    double v14 = [MEMORY[0x1E4F28F38] localizedStringFromPersonNameComponents:v11 style:1 options:0];
    if ([v14 length])
    {
      v20[0] = @"contactName";
      v20[1] = @"contactIdentifier";
      v21[0] = v14;
      v21[1] = v5;
      double v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
    }
    else
    {
      id v17 = +[PGLogging sharedLogging];
      v18 = [v17 loggingConnection];

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v5;
        _os_log_error_impl(&dword_1D1805000, v18, OS_LOG_TYPE_ERROR, "No contact name resolved for contact identifier %@", buf, 0xCu);
      }

      double v15 = 0;
    }
  }
  else
  {
    v16 = +[PGLogging sharedLogging];
    uint64_t v11 = [v16 loggingConnection];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v5;
      _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "Contact found to be nil for contact identifier %@", buf, 0xCu);
    }
    double v15 = 0;
  }

  return v15;
}

- (PGNamingQuestion)initWithConfirmedPerson:(id)a3 contactIdentifier:(id)a4 localFactoryScore:(double)a5 serviceManager:(id)a6
{
  result = [(PGNamingQuestion *)self initWithPerson:a3 contactIdentifier:a4 localFactoryScore:a6 serviceManager:a5];
  if (result) {
    result->_state = 2;
  }
  return result;
}

- (PGNamingQuestion)initWithPerson:(id)a3 contactIdentifier:(id)a4 localFactoryScore:(double)a5 serviceManager:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PGNamingQuestion;
  double v14 = [(PGNamingQuestion *)&v21 init];
  double v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_person, a3);
    uint64_t v16 = [(PHPerson *)v15->_person uuid];
    entityIdentifier = v15->_entityIdentifier;
    v15->_entityIdentifier = (NSString *)v16;

    v15->_state = 0;
    v15->_localFactoryScore = a5;
    uint64_t v18 = [(PGNamingQuestion *)v15 _additionalInfoFromContactIdentifier:v12 serviceManager:v13];
    additionalInfo = v15->_additionalInfo;
    v15->_additionalInfo = (NSDictionary *)v18;

    objc_storeStrong((id *)&v15->_contactIdentifier, a4);
  }

  return v15;
}

@end