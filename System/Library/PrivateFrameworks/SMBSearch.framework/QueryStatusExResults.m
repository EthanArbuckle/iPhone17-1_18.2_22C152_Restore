@interface QueryStatusExResults
- (QueryStatusExResults)init;
- (unsigned)cDocumentsToFilter;
- (unsigned)cFilteredDocuments;
- (unsigned)cResultsFound;
- (unsigned)cRowsTotal;
- (unsigned)dwRatioFinishedDenominator;
- (unsigned)dwRatioFinishedNumerator;
- (unsigned)maxRank;
- (unsigned)qStatus;
- (unsigned)rowsetBookMark;
- (unsigned)whereID;
- (void)setCDocumentsToFilter:(unsigned int)a3;
- (void)setCFilteredDocuments:(unsigned int)a3;
- (void)setCResultsFound:(unsigned int)a3;
- (void)setCRowsTotal:(unsigned int)a3;
- (void)setDwRatioFinishedDenominator:(unsigned int)a3;
- (void)setDwRatioFinishedNumerator:(unsigned int)a3;
- (void)setMaxRank:(unsigned int)a3;
- (void)setQStatus:(unsigned int)a3;
- (void)setRowsetBookMark:(unsigned int)a3;
- (void)setWhereID:(unsigned int)a3;
@end

@implementation QueryStatusExResults

- (QueryStatusExResults)init
{
  v3.receiver = self;
  v3.super_class = (Class)QueryStatusExResults;
  result = [(QueryStatusExResults *)&v3 init];
  if (result)
  {
    *(void *)&result->_cResultsFound = 0;
    *(_OWORD *)&result->_dwRatioFinishedNumerator = 0u;
    *(_OWORD *)&result->_qStatus = 0u;
  }
  return result;
}

- (unsigned)qStatus
{
  return self->_qStatus;
}

- (void)setQStatus:(unsigned int)a3
{
  self->_qStatus = a3;
}

- (unsigned)cFilteredDocuments
{
  return self->_cFilteredDocuments;
}

- (void)setCFilteredDocuments:(unsigned int)a3
{
  self->_cFilteredDocuments = a3;
}

- (unsigned)cDocumentsToFilter
{
  return self->_cDocumentsToFilter;
}

- (void)setCDocumentsToFilter:(unsigned int)a3
{
  self->_cDocumentsToFilter = a3;
}

- (unsigned)dwRatioFinishedDenominator
{
  return self->_dwRatioFinishedDenominator;
}

- (void)setDwRatioFinishedDenominator:(unsigned int)a3
{
  self->_dwRatioFinishedDenominator = a3;
}

- (unsigned)dwRatioFinishedNumerator
{
  return self->_dwRatioFinishedNumerator;
}

- (void)setDwRatioFinishedNumerator:(unsigned int)a3
{
  self->_dwRatioFinishedNumerator = a3;
}

- (unsigned)rowsetBookMark
{
  return self->_rowsetBookMark;
}

- (void)setRowsetBookMark:(unsigned int)a3
{
  self->_rowsetBookMark = a3;
}

- (unsigned)cRowsTotal
{
  return self->_cRowsTotal;
}

- (void)setCRowsTotal:(unsigned int)a3
{
  self->_cRowsTotal = a3;
}

- (unsigned)maxRank
{
  return self->_maxRank;
}

- (void)setMaxRank:(unsigned int)a3
{
  self->_maxRank = a3;
}

- (unsigned)cResultsFound
{
  return self->_cResultsFound;
}

- (void)setCResultsFound:(unsigned int)a3
{
  self->_cResultsFound = a3;
}

- (unsigned)whereID
{
  return self->_whereID;
}

- (void)setWhereID:(unsigned int)a3
{
  self->_whereID = a3;
}

@end