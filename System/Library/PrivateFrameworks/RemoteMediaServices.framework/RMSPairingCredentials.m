@interface RMSPairingCredentials
- (RMSPairingCredentials)initWithProtobuf:(id)a3;
- (id)protobuf;
- (unint64_t)characterCount;
- (unint64_t)requirementType;
- (void)setCharacterCount:(unint64_t)a3;
- (void)setRequirementType:(unint64_t)a3;
@end

@implementation RMSPairingCredentials

- (RMSPairingCredentials)initWithProtobuf:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)RMSPairingCredentials;
  v5 = [(RMSPairingCredentials *)&v7 init];
  if (v5)
  {
    v5->_requirementType = (int)[v4 requirementType];
    v5->_characterCount = [v4 characterCount];
  }

  return v5;
}

- (id)protobuf
{
  v3 = objc_opt_new();
  [v3 setRequirementType:LODWORD(self->_requirementType)];
  [v3 setCharacterCount:LODWORD(self->_characterCount)];
  return v3;
}

- (unint64_t)requirementType
{
  return self->_requirementType;
}

- (void)setRequirementType:(unint64_t)a3
{
  self->_requirementType = a3;
}

- (unint64_t)characterCount
{
  return self->_characterCount;
}

- (void)setCharacterCount:(unint64_t)a3
{
  self->_characterCount = a3;
}

@end