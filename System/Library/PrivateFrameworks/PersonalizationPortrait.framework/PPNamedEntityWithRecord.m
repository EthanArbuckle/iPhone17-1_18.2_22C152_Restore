@interface PPNamedEntityWithRecord
- (PPNamedEntityWithRecord)initWithName:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 language:(id)a6 mostRelevantRecord:(id)a7;
- (double)sentimentScore;
- (id)description;
- (id)mostRelevantRecord;
@end

@implementation PPNamedEntityWithRecord

- (void).cxx_destruct
{
}

- (double)sentimentScore
{
  mostRelevantRecord = self->_mostRelevantRecord;
  if (!mostRelevantRecord) {
    return 0.0;
  }
  [(PPNamedEntityRecord *)mostRelevantRecord sentimentScore];
  return result;
}

- (id)description
{
  id v3 = [NSString alloc];
  v4 = [(PPNamedEntity *)self name];
  v5 = +[PPNamedEntity describeCategory:[(PPNamedEntity *)self category]];
  v6 = [(PPNamedEntity *)self bestLanguage];
  v7 = (void *)[v3 initWithFormat:@"<PPNamedEntityWithRecord n:'%@' c:'%@' l:%@ r:%p>", v4, v5, v6, self->_mostRelevantRecord];

  return v7;
}

- (id)mostRelevantRecord
{
  return self->_mostRelevantRecord;
}

- (PPNamedEntityWithRecord)initWithName:(id)a3 category:(unint64_t)a4 dynamicCategory:(id)a5 language:(id)a6 mostRelevantRecord:(id)a7
{
  id v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)PPNamedEntityWithRecord;
  v14 = [(PPNamedEntity *)&v17 initWithName:a3 category:a4 dynamicCategory:a5 language:a6 mostRelevantRecord:0];
  v15 = v14;
  if (v14) {
    objc_storeStrong((id *)&v14->_mostRelevantRecord, a7);
  }

  return v15;
}

@end