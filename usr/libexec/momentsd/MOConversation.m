@interface MOConversation
+ (BOOL)supportsSecureCoding;
+ (id)conversationWithContactIdentifier:(id)a3 scoredContact:(id)a4 interactions:(id)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToConversation:(id)a3;
- (MOConversation)initWithCoder:(id)a3;
- (MOConversation)initWithContactIdentifier:(id)a3 scoredContact:(id)a4 interactions:(id)a5;
- (NSArray)interactions;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSString)contactIdentifier;
- (NSString)providerId;
- (PPScoredContact)scoredContact;
- (id)description;
- (id)providerIdFromConcatenatedIdentifiers:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MOConversation

- (MOConversation)initWithContactIdentifier:(id)a3 scoredContact:(id)a4 interactions:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v12) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  v14 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[MOConversation initWithContactIdentifier:scoredContact:interactions:]();
  }

  v15 = +[NSAssertionHandler currentHandler];
  [v15 handleFailureInMethod:a2 object:self file:@"MOConversation.m" lineNumber:16 description:@"Invalid parameter not satisfying: contactIdentifier != nil (in %s:%d)", "-[MOConversation initWithContactIdentifier:scoredContact:interactions:]", 16];

  if (!v13)
  {
LABEL_7:
    v16 = _mo_log_facility_get_os_log(&MOLogFacilityGeneral);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MOConversation initWithContactIdentifier:scoredContact:interactions:]();
    }

    v17 = +[NSAssertionHandler currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"MOConversation.m" lineNumber:17 description:@"Invalid parameter not satisfying: interactions != nil (in %s:%d)", "-[MOConversation initWithContactIdentifier:scoredContact:interactions:]", 17];
  }
LABEL_10:
  v36.receiver = self;
  v36.super_class = (Class)MOConversation;
  v18 = [(MOConversation *)&v36 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contactIdentifier, a3);
    objc_storeStrong((id *)&v19->_scoredContact, a4);
    objc_storeStrong((id *)&v19->_interactions, a5);
    v20 = [v13 objectAtIndexedSubscript:0];
    uint64_t v21 = [v20 startDate];
    startDate = v19->_startDate;
    v19->_startDate = (NSDate *)v21;

    v23 = [v13 objectAtIndexedSubscript:0];
    uint64_t v24 = [v23 endDate];
    endDate = v19->_endDate;
    v19->_endDate = (NSDate *)v24;

    id v26 = objc_alloc_init((Class)NSMutableArray);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = __71__MOConversation_initWithContactIdentifier_scoredContact_interactions___block_invoke;
    v33[3] = &unk_1002CBAA8;
    v27 = v19;
    v34 = v27;
    id v35 = v26;
    id v28 = v26;
    [v13 enumerateObjectsUsingBlock:v33];
    v29 = [v28 componentsJoinedByString:@"|"];
    uint64_t v30 = [(MOConversation *)v27 providerIdFromConcatenatedIdentifiers:v29];
    providerId = v27->_providerId;
    v27->_providerId = (NSString *)v30;
  }
  return v19;
}

void __71__MOConversation_initWithContactIdentifier_scoredContact_interactions___block_invoke(uint64_t a1, void *a2)
{
  id v19 = a2;
  v3 = *(void **)(*(void *)(a1 + 32) + 32);
  v4 = [v19 startDate];
  uint64_t v5 = [v3 earlierDate:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v5;

  v8 = *(void **)(*(void *)(a1 + 32) + 40);
  v9 = [v19 endDate];
  uint64_t v10 = [v8 laterDate:v9];
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = [v19 identifier];
  if (v13)
  {
    v14 = (void *)v13;
    v15 = [v19 identifier];
    id v16 = [v15 length];

    if (v16)
    {
      v17 = *(void **)(a1 + 40);
      v18 = [v19 identifier];
      [v17 addObject:v18];
    }
  }
}

+ (id)conversationWithContactIdentifier:(id)a3 scoredContact:(id)a4 interactions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [objc_alloc((Class)a1) initWithContactIdentifier:v10 scoredContact:v9 interactions:v8];

  return v11;
}

- (id)providerIdFromConcatenatedIdentifiers:(id)a3
{
  if (!a3)
  {
    id v6 = 0;
    goto LABEL_9;
  }
  v3 = [a3 dataUsingEncoding:2];
  v4 = v3;
  if (!v3) {
    goto LABEL_7;
  }
  id v5 = v3;
  id v6 = [v5 bytes];
  [v5 length];
  if (v6)
  {
    if ([v5 length])
    {
      _PASMurmur3_x86_128();
      _PASBytesToHex();
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
LABEL_7:
    id v6 = 0;
  }
LABEL_8:

LABEL_9:

  return v6;
}

- (BOOL)isEqualToConversation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    goto LABEL_11;
  }
  int v6 = self->_contactIdentifier != 0;
  v7 = [v4 contactIdentifier];
  int v8 = v7 == 0;

  if (v6 == v8) {
    goto LABEL_11;
  }
  contactIdentifier = self->_contactIdentifier;
  if (contactIdentifier)
  {
    id v10 = [v5 contactIdentifier];
    unsigned int v11 = [(NSString *)contactIdentifier isEqual:v10];

    if (!v11) {
      goto LABEL_11;
    }
  }
  int v12 = self->_scoredContact != 0;
  uint64_t v13 = [v5 scoredContact];
  int v14 = v13 == 0;

  if (v12 == v14) {
    goto LABEL_11;
  }
  scoredContact = self->_scoredContact;
  if (scoredContact)
  {
    id v16 = [v5 scoredContact];
    unsigned int v17 = [(PPScoredContact *)scoredContact isEqual:v16];

    if (!v17) {
      goto LABEL_11;
    }
  }
  int v18 = self->_interactions != 0;
  id v19 = [v5 interactions];
  int v20 = v19 == 0;

  if (v18 == v20)
  {
LABEL_11:
    unsigned __int8 v23 = 0;
  }
  else
  {
    interactions = self->_interactions;
    if (interactions)
    {
      v22 = [v5 interactions];
      unsigned __int8 v23 = [(NSArray *)interactions isEqual:v22];
    }
    else
    {
      unsigned __int8 v23 = 1;
    }
  }

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (MOConversation *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v6 = [(MOConversation *)self isEqualToConversation:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contactIdentifier hash];
  id v4 = (char *)[(PPScoredContact *)self->_scoredContact hash] + 32 * v3 - v3;
  return (unsigned char *)[(NSArray *)self->_interactions hash] - v4 + 32 * (void)v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MOConversation)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"scoredContact"];
      if (!v6)
      {
        int v18 = [v4 error];

        if (v18)
        {
          unsigned int v11 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      id v7 = objc_alloc((Class)NSSet);
      uint64_t v8 = objc_opt_class();
      id v9 = [v7 initWithObjects:v8, objc_opt_class(), 0];
      id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"interactions"];

      if (!v10)
      {
        id v19 = [v4 error];

        if (v19) {
          goto LABEL_16;
        }
        NSErrorUserInfoKey v27 = NSLocalizedDescriptionKey;
        CFStringRef v28 = @"Retrieved nil serialized value for nonnull MOConversation.interactions";
        id v15 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
        id v16 = [objc_alloc((Class)NSError) initWithDomain:@"MOConversationOCNTErrorDomain" code:2 userInfo:v15];
        [v4 failWithError:v16];
        goto LABEL_11;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        self = [(MOConversation *)self initWithContactIdentifier:v5 scoredContact:v6 interactions:v10];
        unsigned int v11 = self;
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v17 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOConversation key \"interactions\" (expected %@, decoded %@)", v15, v16, 0];
      NSErrorUserInfoKey v25 = NSLocalizedDescriptionKey;
      id v26 = v17;
      unsigned __int8 v23 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
      id v24 = [objc_alloc((Class)NSError) initWithDomain:@"MOConversationOCNTErrorDomain" code:3 userInfo:v23];
      [v4 failWithError:v24];
    }
    else
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      BOOL v6 = NSStringFromClass(v13);
      int v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = [objc_alloc((Class)NSString) initWithFormat:@"Unarchived unexpected class for MOConversation key \"contactIdentifier\" (expected %@, decoded %@)", v6, v10, 0];
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      id v30 = v15;
      id v16 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v17 = [objc_alloc((Class)NSError) initWithDomain:@"MOConversationOCNTErrorDomain" code:3 userInfo:v16];
      [v4 failWithError:v17];
    }

LABEL_11:
LABEL_16:
    unsigned int v11 = 0;
    goto LABEL_17;
  }
  int v12 = [v4 error];

  if (!v12)
  {
    NSErrorUserInfoKey v31 = NSLocalizedDescriptionKey;
    CFStringRef v32 = @"Retrieved nil serialized value for nonnull MOConversation.contactIdentifier";
    BOOL v6 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    id v10 = [objc_alloc((Class)NSError) initWithDomain:@"MOConversationOCNTErrorDomain" code:2 userInfo:v6];
    [v4 failWithError:v10];
    goto LABEL_16;
  }
  unsigned int v11 = 0;
LABEL_19:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  contactIdentifier = self->_contactIdentifier;
  id v8 = v4;
  if (contactIdentifier)
  {
    [v4 encodeObject:contactIdentifier forKey:@"contactIdentifier"];
    id v4 = v8;
  }
  scoredContact = self->_scoredContact;
  if (scoredContact)
  {
    [v8 encodeObject:scoredContact forKey:@"scoredContact"];
    id v4 = v8;
  }
  interactions = self->_interactions;
  if (interactions)
  {
    [v8 encodeObject:interactions forKey:@"interactions"];
    id v4 = v8;
  }
}

- (id)description
{
  id v2 = [objc_alloc((Class)NSString) initWithFormat:@"<MOConversation | contactIdentifier:%@ scoredContact:%@ interactions:%@>", self->_contactIdentifier, self->_scoredContact, self->_interactions];

  return v2;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (PPScoredContact)scoredContact
{
  return self->_scoredContact;
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSString)providerId
{
  return self->_providerId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_providerId, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_scoredContact, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (void)initWithContactIdentifier:scoredContact:interactions:.cold.1()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 17;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: interactions != nil (in %s:%d)", v1, 0x12u);
}

- (void)initWithContactIdentifier:scoredContact:interactions:.cold.2()
{
  OUTLINED_FUNCTION_0_5();
  int v2 = 16;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: contactIdentifier != nil (in %s:%d)", v1, 0x12u);
}

@end