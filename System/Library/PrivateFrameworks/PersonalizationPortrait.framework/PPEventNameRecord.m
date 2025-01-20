@interface PPEventNameRecord
+ (BOOL)supportsSecureCoding;
+ (id)describeChangeType:(unsigned __int8)a3;
+ (id)eventNameRecordWithScore:(double)a3 eventIdentifier:(id)a4 changeType:(unsigned __int8)a5 title:(id)a6 location:(id)a7 participantNames:(id)a8;
- (BOOL)hasScoreSimilarToRecord:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToEventNameRecord:(id)a3;
- (NSArray)participantNames;
- (NSString)eventIdentifier;
- (NSString)identifier;
- (NSString)location;
- (NSString)title;
- (PPEventNameRecord)initWithCoder:(id)a3;
- (PPEventNameRecord)initWithIdentifier:(id)a3 score:(double)a4 eventIdentifier:(id)a5 changeType:(unsigned __int8)a6 title:(id)a7 location:(id)a8 participantNames:(id)a9;
- (double)score;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)changeType;
- (void)encodeWithCoder:(id)a3;
- (void)setChangeType:(unsigned __int8)a3;
- (void)setEventIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLocation:(id)a3;
- (void)setParticipantNames:(id)a3;
- (void)setScore:(double)a3;
- (void)setTitle:(id)a3;
@end

@implementation PPEventNameRecord

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantNames, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setParticipantNames:(id)a3
{
}

- (NSArray)participantNames
{
  return self->_participantNames;
}

- (void)setLocation:(id)a3
{
}

- (NSString)location
{
  return self->_location;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setEventIdentifier:(id)a3
{
}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (void)setChangeType:(unsigned __int8)a3
{
  self->_changeType = a3;
}

- (unsigned)changeType
{
  return self->_changeType;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEqualToEventNameRecord:(id)a3
{
  v4 = (id *)a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_14;
  }
  title = self->_title;
  v7 = (NSString *)v4[5];
  if (title == v7)
  {
  }
  else
  {
    v8 = v7;
    v9 = title;
    char v10 = [(NSString *)v9 isEqual:v8];

    if ((v10 & 1) == 0) {
      goto LABEL_14;
    }
  }
  if (self->_score != *((double *)v5 + 3) || self->_changeType != *((unsigned __int8 *)v5 + 8)) {
    goto LABEL_14;
  }
  eventIdentifier = self->_eventIdentifier;
  v12 = (NSString *)v5[4];
  if (eventIdentifier == v12)
  {
  }
  else
  {
    v13 = v12;
    v14 = eventIdentifier;
    char v15 = [(NSString *)v14 isEqual:v13];

    if ((v15 & 1) == 0) {
      goto LABEL_14;
    }
  }
  location = self->_location;
  v17 = (NSString *)v5[6];
  if (location == v17)
  {
  }
  else
  {
    v18 = v17;
    v19 = location;
    char v20 = [(NSString *)v19 isEqual:v18];

    if ((v20 & 1) == 0)
    {
LABEL_14:
      char v21 = 0;
      goto LABEL_15;
    }
  }
  v23 = self->_participantNames;
  v24 = v23;
  if (v23 == v5[7]) {
    char v21 = 1;
  }
  else {
    char v21 = -[NSArray isEqual:](v23, "isEqual:");
  }

LABEL_15:
  return v21;
}

- (BOOL)hasScoreSimilarToRecord:(id)a3
{
  return vabdd_f64(self->_score, *((double *)a3 + 3)) < 0.000001;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PPEventNameRecord *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PPEventNameRecord *)self isEqualToEventNameRecord:v5];

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_opt_class();
  uint64_t v5 = objc_opt_new();
  if (v5)
  {
    uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
    v7 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v6;

    *(unsigned char *)(v5 + 8) = self->_changeType;
    *(double *)(v5 + 24) = self->_score;
    uint64_t v8 = [(NSString *)self->_eventIdentifier copyWithZone:a3];
    v9 = *(void **)(v5 + 32);
    *(void *)(v5 + 32) = v8;

    uint64_t v10 = [(NSString *)self->_title copyWithZone:a3];
    v11 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v10;

    uint64_t v12 = [(NSString *)self->_location copyWithZone:a3];
    v13 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = v12;

    uint64_t v14 = [(NSArray *)self->_participantNames copyWithZone:a3];
    char v15 = *(void **)(v5 + 56);
    *(void *)(v5 + 56) = v14;
  }
  return (id)v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"ide"];
  [v5 encodeDouble:@"scr" forKey:self->_score];
  [v5 encodeObject:self->_eventIdentifier forKey:@"eid"];
  [v5 encodeInt32:self->_changeType forKey:@"cht"];
  [v5 encodeObject:self->_title forKey:@"ttl"];
  [v5 encodeObject:self->_location forKey:@"loc"];
  [v5 encodeObject:self->_participantNames forKey:@"pnm"];
}

- (PPEventNameRecord)initWithCoder:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  v7 = [v4 decodeObjectOfClass:v5 forKey:@"ide"];
  uint64_t v8 = [v4 decodeObjectOfClass:v5 forKey:@"eid"];
  v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    v11 = pp_events_log_handle();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v4;
      _os_log_error_impl(&dword_18CAA6000, v11, OS_LOG_TYPE_ERROR, "failed to decode identifier or eventIdentifier from %@", buf, 0xCu);
    }

    char v20 = 0;
  }
  else
  {
    [v4 decodeDoubleForKey:@"scr"];
    double v13 = v12;
    unsigned __int8 v14 = [v4 decodeInt32ForKey:@"cht"];
    char v15 = [v4 decodeObjectOfClass:v5 forKey:@"ttl"];
    v16 = [v4 decodeObjectOfClass:v5 forKey:@"loc"];
    v17 = (void *)MEMORY[0x192F97350]();
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v6, v5, 0);
    v19 = [v4 decodeObjectOfClasses:v18 forKey:@"pnm"];
    self = [(PPEventNameRecord *)self initWithIdentifier:v7 score:v9 eventIdentifier:v14 changeType:v15 title:v16 location:v19 participantNames:v13];

    char v20 = self;
  }

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  unint64_t v4 = (unint64_t)self->_score - v3 + 32 * v3;
  uint64_t v5 = self->_changeType - v4 + 32 * v4;
  NSUInteger v6 = [(NSString *)self->_title hash] - v5 + 32 * v5;
  NSUInteger v7 = [(NSString *)self->_location hash] - v6 + 32 * v6;
  uint64_t v8 = [(NSArray *)self->_participantNames hash] - v7 + 32 * v7;
  return [(NSString *)self->_eventIdentifier hash] - v8 + 32 * v8;
}

- (id)description
{
  id v3 = [NSString alloc];
  long long v9 = *(_OWORD *)&self->_title;
  participantNames = self->_participantNames;
  double score = self->_score;
  NSUInteger v6 = +[PPEventNameRecord describeChangeType:[(PPEventNameRecord *)self changeType]];
  NSUInteger v7 = (void *)[v3 initWithFormat:@"<PPEventNameRecord t:'%@' l:'%@' p:%@ s:%f ct:%@>", v9, participantNames, *(void *)&score, v6];

  return v7;
}

- (PPEventNameRecord)initWithIdentifier:(id)a3 score:(double)a4 eventIdentifier:(id)a5 changeType:(unsigned __int8)a6 title:(id)a7 location:(id)a8 participantNames:(id)a9
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  v31.receiver = self;
  v31.super_class = (Class)PPEventNameRecord;
  char v21 = [(PPEventNameRecord *)&v31 init];
  if (v21)
  {
    uint64_t v22 = [v16 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v22;

    v21->_double score = a4;
    uint64_t v24 = [v17 copy];
    eventIdentifier = v21->_eventIdentifier;
    v21->_eventIdentifier = (NSString *)v24;

    v21->_changeType = a6;
    uint64_t v26 = [v18 copy];
    title = v21->_title;
    v21->_title = (NSString *)v26;

    uint64_t v28 = [v19 copy];
    location = v21->_location;
    v21->_location = (NSString *)v28;

    objc_storeStrong((id *)&v21->_participantNames, a9);
  }

  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)describeChangeType:(unsigned __int8)a3
{
  if (a3 >= 4u) {
    id v3 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid (%lu)", a3);
  }
  else {
    id v3 = off_1E550E4C8[a3];
  }
  return v3;
}

+ (id)eventNameRecordWithScore:(double)a3 eventIdentifier:(id)a4 changeType:(unsigned __int8)a5 title:(id)a6 location:(id)a7 participantNames:(id)a8
{
  uint64_t v10 = a5;
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a4;
  id v17 = [PPEventNameRecord alloc];
  id v18 = [MEMORY[0x1E4F29128] UUID];
  id v19 = [v18 UUIDString];
  id v20 = [(PPEventNameRecord *)v17 initWithIdentifier:v19 score:v16 eventIdentifier:v10 changeType:v15 title:v14 location:v13 participantNames:a3];

  return v20;
}

@end