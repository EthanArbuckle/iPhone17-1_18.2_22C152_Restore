@interface NDAnalyticsEnvelopeStoreEntry
- (BOOL)isEqual:(id)a3;
- (NDAnalyticsEnvelopeStoreEntry)init;
- (NDAnalyticsEnvelopeStoreEntry)initWithStringRepresentation:(id)a3;
- (NSDate)envelopeSubmissionDate;
- (NSString)envelopeIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)stringRepresentation;
- (int)envelopeContentType;
- (unint64_t)hash;
- (void)setEnvelopeContentType:(int)a3;
- (void)setEnvelopeIdentifier:(id)a3;
- (void)setEnvelopeSubmissionDate:(id)a3;
@end

@implementation NDAnalyticsEnvelopeStoreEntry

- (NDAnalyticsEnvelopeStoreEntry)init
{
  v3.receiver = self;
  v3.super_class = (Class)NDAnalyticsEnvelopeStoreEntry;
  return [(NDAnalyticsEnvelopeStoreEntry *)&v3 init];
}

- (NDAnalyticsEnvelopeStoreEntry)initWithStringRepresentation:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAnalyticsEnvelopeStoreEntry initWithStringRepresentation:]();
  }
  v5 = [v4 componentsSeparatedByString:@"$"];
  if ((unint64_t)[v5 count] < 3)
  {
    v6 = 0;
LABEL_8:

    goto LABEL_9;
  }
  v6 = [(NDAnalyticsEnvelopeStoreEntry *)self init];
  if (v6)
  {
    uint64_t v7 = [v5 objectAtIndexedSubscript:0];
    envelopeIdentifier = v6->_envelopeIdentifier;
    v6->_envelopeIdentifier = (NSString *)v7;

    v9 = [v5 objectAtIndexedSubscript:1];
    v6->_submissionDateMillisecondsSince1970 = objc_msgSend(v9, "fc_unsignedLongLongValue");

    self = [v5 objectAtIndexedSubscript:2];
    v6->_envelopeContentType = [(NDAnalyticsEnvelopeStoreEntry *)self integerValue];
    goto LABEL_8;
  }
LABEL_9:

  return v6;
}

- (void)setEnvelopeSubmissionDate:(id)a3
{
  self->_submissionDateMillisecondsSince1970 = objc_msgSend(a3, "fc_millisecondTimeIntervalSince1970");
}

- (NSDate)envelopeSubmissionDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x263EFF910], "fc_dateWithMillisecondTimeIntervalSince1970:", self->_submissionDateMillisecondsSince1970);
}

- (id)stringRepresentation
{
  v17[3] = *MEMORY[0x263EF8340];
  v17[0] = self->_envelopeIdentifier;
  objc_super v3 = [NSNumber numberWithUnsignedLongLong:self->_submissionDateMillisecondsSince1970];
  id v4 = [v3 stringValue];
  v17[1] = v4;
  v5 = [NSNumber numberWithInt:self->_envelopeContentType];
  v6 = [v5 stringValue];
  v17[2] = v6;
  uint64_t v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];

  v8 = objc_opt_new();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __53__NDAnalyticsEnvelopeStoreEntry_stringRepresentation__block_invoke;
  v14[3] = &unk_264538EE0;
  id v9 = v8;
  id v15 = v9;
  v16 = v7;
  id v10 = v7;
  [v10 enumerateObjectsUsingBlock:v14];
  v11 = v16;
  id v12 = v9;

  return v12;
}

uint64_t __53__NDAnalyticsEnvelopeStoreEntry_stringRepresentation__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) appendString:a2];
  uint64_t result = [*(id *)(a1 + 40) count];
  if (result - 1 != a3)
  {
    v6 = *(void **)(a1 + 32);
    return [v6 appendString:@"$"];
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  v5 = FCDynamicCast();

  if (v5)
  {
    v6 = [(NDAnalyticsEnvelopeStoreEntry *)self envelopeIdentifier];
    uint64_t v7 = [v5 envelopeIdentifier];
    if ([v6 isEqualToString:v7])
    {
      v8 = [(NDAnalyticsEnvelopeStoreEntry *)self envelopeSubmissionDate];
      id v9 = [v5 envelopeSubmissionDate];
      if ([v8 isEqualToDate:v9])
      {
        int v10 = [(NDAnalyticsEnvelopeStoreEntry *)self envelopeContentType];
        BOOL v11 = v10 == [v5 envelopeContentType];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  objc_super v3 = [(NDAnalyticsEnvelopeStoreEntry *)self envelopeIdentifier];
  uint64_t v4 = [v3 hash];
  v5 = [(NDAnalyticsEnvelopeStoreEntry *)self envelopeSubmissionDate];
  uint64_t v6 = [v5 hash] ^ v4;
  unint64_t v7 = v6 ^ [(NDAnalyticsEnvelopeStoreEntry *)self envelopeContentType];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(NDAnalyticsEnvelopeStoreEntry *)self stringRepresentation];
  uint64_t v6 = (void *)[v4 initWithStringRepresentation:v5];

  return v6;
}

- (id)description
{
  objc_super v3 = [MEMORY[0x263F59420] descriptionWithObject:self];
  uint64_t v4 = [(NDAnalyticsEnvelopeStoreEntry *)self envelopeIdentifier];
  [v3 addField:@"identifier" object:v4];

  v5 = [(NDAnalyticsEnvelopeStoreEntry *)self envelopeSubmissionDate];
  [v3 addField:@"submissionDate" object:v5];

  uint64_t v6 = objc_msgSend(NSNumber, "numberWithInt:", -[NDAnalyticsEnvelopeStoreEntry envelopeContentType](self, "envelopeContentType"));
  [v3 addField:@"contentType" object:v6];

  unint64_t v7 = [v3 descriptionString];

  return v7;
}

- (NSString)envelopeIdentifier
{
  return self->_envelopeIdentifier;
}

- (void)setEnvelopeIdentifier:(id)a3
{
}

- (int)envelopeContentType
{
  return self->_envelopeContentType;
}

- (void)setEnvelopeContentType:(int)a3
{
  self->_envelopeContentType = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithStringRepresentation:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21FDD6000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"stringRepresentation", v6, 2u);
}

@end