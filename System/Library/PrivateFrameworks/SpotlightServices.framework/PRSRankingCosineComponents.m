@interface PRSRankingCosineComponents
- (NSArray)inverseDocFrequencies;
- (NSArray)termFrequencies;
- (NSArray)termFrequenciesWeighted;
- (NSArray)termInverseDoc;
- (NSArray)termInverseDocWeighted;
- (unint64_t)fieldLength;
- (void)setFieldLength:(unint64_t)a3;
- (void)setInverseDocFrequencies:(id)a3;
- (void)setTermFrequencies:(id)a3;
- (void)setTermFrequenciesWeighted:(id)a3;
- (void)setTermInverseDoc:(id)a3;
- (void)setTermInverseDocWeighted:(id)a3;
@end

@implementation PRSRankingCosineComponents

- (NSArray)termFrequencies
{
  return self->_termFrequencies;
}

- (void)setTermFrequencies:(id)a3
{
}

- (NSArray)termFrequenciesWeighted
{
  return self->_termFrequenciesWeighted;
}

- (void)setTermFrequenciesWeighted:(id)a3
{
}

- (NSArray)inverseDocFrequencies
{
  return self->_inverseDocFrequencies;
}

- (void)setInverseDocFrequencies:(id)a3
{
}

- (NSArray)termInverseDoc
{
  return self->_termInverseDoc;
}

- (void)setTermInverseDoc:(id)a3
{
}

- (NSArray)termInverseDocWeighted
{
  return self->_termInverseDocWeighted;
}

- (void)setTermInverseDocWeighted:(id)a3
{
}

- (unint64_t)fieldLength
{
  return self->_fieldLength;
}

- (void)setFieldLength:(unint64_t)a3
{
  self->_fieldLength = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_termInverseDocWeighted, 0);
  objc_storeStrong((id *)&self->_termInverseDoc, 0);
  objc_storeStrong((id *)&self->_inverseDocFrequencies, 0);
  objc_storeStrong((id *)&self->_termFrequenciesWeighted, 0);
  objc_storeStrong((id *)&self->_termFrequencies, 0);
}

@end