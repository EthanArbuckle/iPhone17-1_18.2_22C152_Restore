@interface PPExtractionSet
+ (BOOL)supportsSecureCoding;
- (BOOL)isEmpty;
- (NSArray)namedEntityRecords;
- (NSArray)topicRecords;
- (PPExtractionSet)initWithCoder:(id)a3;
- (PPExtractionSet)initWithNamedEntityRecords:(id)a3 topicRecords:(id)a4;
- (id)merge:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPExtractionSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicRecords, 0);
  objc_storeStrong((id *)&self->_namedEntityRecords, 0);
}

- (NSArray)topicRecords
{
  return self->_topicRecords;
}

- (NSArray)namedEntityRecords
{
  return self->_namedEntityRecords;
}

- (BOOL)isEmpty
{
  return ![(NSArray *)self->_namedEntityRecords count] && [(NSArray *)self->_topicRecords count] == 0;
}

- (id)merge:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = v5;
  v7 = (NSArray *)MEMORY[0x1E4F1CBF0];
  if (self->_namedEntityRecords) {
    namedEntityRecords = self->_namedEntityRecords;
  }
  else {
    namedEntityRecords = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  [v5 addObjectsFromArray:namedEntityRecords];
  uint64_t v9 = [v4 namedEntityRecords];
  v10 = (void *)v9;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = (uint64_t)v7;
  }
  [v6 addObjectsFromArray:v11];

  v12 = objc_opt_new();
  v13 = v12;
  if (self->_topicRecords) {
    topicRecords = self->_topicRecords;
  }
  else {
    topicRecords = v7;
  }
  [v12 addObjectsFromArray:topicRecords];
  v15 = [v4 topicRecords];

  if (v15) {
    v16 = v15;
  }
  else {
    v16 = v7;
  }
  [v13 addObjectsFromArray:v16];

  v17 = [PPExtractionSet alloc];
  if ([v6 count]) {
    v18 = v6;
  }
  else {
    v18 = 0;
  }
  if ([v13 count]) {
    v19 = v13;
  }
  else {
    v19 = 0;
  }
  v20 = [(PPExtractionSet *)v17 initWithNamedEntityRecords:v18 topicRecords:v19];

  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  namedEntityRecords = self->_namedEntityRecords;
  id v5 = a3;
  [v5 encodeObject:namedEntityRecords forKey:@"nam"];
  [v5 encodeObject:self->_topicRecords forKey:@"top"];
}

- (PPExtractionSet)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  v6 = (void *)MEMORY[0x192F97350]();
  v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v5, objc_opt_class(), 0);
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"nam"];

  uint64_t v9 = (void *)MEMORY[0x192F97350]();
  v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v5, objc_opt_class(), 0);
  uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"top"];

  v12 = [(PPExtractionSet *)self initWithNamedEntityRecords:v8 topicRecords:v11];
  return v12;
}

- (PPExtractionSet)initWithNamedEntityRecords:(id)a3 topicRecords:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPExtractionSet;
  uint64_t v9 = [(PPExtractionSet *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_namedEntityRecords, a3);
    objc_storeStrong((id *)&v10->_topicRecords, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end