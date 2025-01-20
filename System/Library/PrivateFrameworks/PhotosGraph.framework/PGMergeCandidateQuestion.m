@interface PGMergeCandidateQuestion
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToQuestion:(id)a3;
- (PGMergeCandidateQuestion)initWithPerson:(id)a3 score:(double)a4;
- (PHPerson)person;
- (double)score;
- (id)additionalInfo;
- (id)entityIdentifier;
- (unint64_t)hash;
- (unsigned)displayType;
- (unsigned)entityType;
- (unsigned)state;
- (unsigned)type;
- (void)persistWithCreationDate:(id)a3 questionVersion:(signed __int16)a4;
- (void)remove;
- (void)setScore:(double)a3;
@end

@implementation PGMergeCandidateQuestion

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalInfo, 0);
  objc_storeStrong((id *)&self->_person, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (id)additionalInfo
{
  return self->_additionalInfo;
}

- (PHPerson)person
{
  return self->_person;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (double)score
{
  return self->_score;
}

- (unsigned)state
{
  return self->_state;
}

- (id)entityIdentifier
{
  return self->_entityIdentifier;
}

- (BOOL)isEqualToQuestion:(id)a3
{
  id v4 = a3;
  if ([v4 type] == self->_type)
  {
    v5 = [v4 person];
    BOOL v6 = v5 == self->_person;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && [(PGMergeCandidateQuestion *)self isEqualToQuestion:v4];

  return v5;
}

- (unint64_t)hash
{
  return [(PHPerson *)self->_person hash];
}

- (void)remove
{
  id v2 = [MEMORY[0x1E4F39200] changeRequestForPerson:self->_person];
  [v2 setQuestionType:0];
}

- (void)persistWithCreationDate:(id)a3 questionVersion:(signed __int16)a4
{
  objc_msgSend(MEMORY[0x1E4F39200], "changeRequestForPerson:", self->_person, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setQuestionType:", -[PGMergeCandidateQuestion type](self, "type"));
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
  return 2;
}

- (PGMergeCandidateQuestion)initWithPerson:(id)a3 score:(double)a4
{
  id v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGMergeCandidateQuestion;
  v8 = [(PGMergeCandidateQuestion *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_person, a3);
    uint64_t v10 = [(PHPerson *)v9->_person uuid];
    entityIdentifier = v9->_entityIdentifier;
    v9->_entityIdentifier = (NSString *)v10;

    v9->_state = 0;
    v9->_score = a4;
  }

  return v9;
}

@end