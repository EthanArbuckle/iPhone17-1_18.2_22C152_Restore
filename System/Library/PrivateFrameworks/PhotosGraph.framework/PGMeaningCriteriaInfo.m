@interface PGMeaningCriteriaInfo
- (NSString)meaningLabel;
- (double)version;
- (unint64_t)criteriaNumber;
- (void)setCriteriaNumber:(unint64_t)a3;
- (void)setMeaningLabel:(id)a3;
- (void)setVersion:(double)a3;
@end

@implementation PGMeaningCriteriaInfo

- (void).cxx_destruct
{
}

- (void)setCriteriaNumber:(unint64_t)a3
{
  self->_criteriaNumber = a3;
}

- (unint64_t)criteriaNumber
{
  return self->_criteriaNumber;
}

- (void)setVersion:(double)a3
{
  self->_version = a3;
}

- (double)version
{
  return self->_version;
}

- (void)setMeaningLabel:(id)a3
{
}

- (NSString)meaningLabel
{
  return self->_meaningLabel;
}

@end