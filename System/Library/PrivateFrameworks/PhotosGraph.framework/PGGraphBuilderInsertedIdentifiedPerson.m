@interface PGGraphBuilderInsertedIdentifiedPerson
- (NSDate)anniversaryDate;
- (NSDate)birthdayDate;
- (PGGraphBuilderInsertedIdentifiedPerson)initWithPersonNode:(id)a3;
- (PGGraphPersonNode)personNode;
- (unint64_t)relationship;
- (void)setAnniversaryDate:(id)a3;
- (void)setBirthdayDate:(id)a3;
- (void)setRelationship:(unint64_t)a3;
@end

@implementation PGGraphBuilderInsertedIdentifiedPerson

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anniversaryDate, 0);
  objc_storeStrong((id *)&self->_birthdayDate, 0);
  objc_storeStrong((id *)&self->_personNode, 0);
}

- (void)setRelationship:(unint64_t)a3
{
  self->_relationship = a3;
}

- (unint64_t)relationship
{
  return self->_relationship;
}

- (void)setAnniversaryDate:(id)a3
{
}

- (NSDate)anniversaryDate
{
  return self->_anniversaryDate;
}

- (void)setBirthdayDate:(id)a3
{
}

- (NSDate)birthdayDate
{
  return self->_birthdayDate;
}

- (PGGraphPersonNode)personNode
{
  return (PGGraphPersonNode *)objc_getProperty(self, a2, 8, 1);
}

- (PGGraphBuilderInsertedIdentifiedPerson)initWithPersonNode:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphBuilderInsertedIdentifiedPerson;
  v6 = [(PGGraphBuilderInsertedIdentifiedPerson *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_personNode, a3);
  }

  return v7;
}

@end