@interface ICNANoteInlineAttachmentReport
- (unint64_t)countOfCalculateGraphExpressions;
- (unint64_t)countOfCalculateResults;
- (unint64_t)countOfDistinctFolderLinks;
- (unint64_t)countOfDistinctMentions;
- (unint64_t)countOfDistinctNoteLinks;
- (unint64_t)countOfDistinctTags;
- (unint64_t)countOfFolderLinks;
- (unint64_t)countOfMentions;
- (unint64_t)countOfNoteLinks;
- (unint64_t)countOfTags;
- (void)setCountOfCalculateGraphExpressions:(unint64_t)a3;
- (void)setCountOfCalculateResults:(unint64_t)a3;
- (void)setCountOfDistinctFolderLinks:(unint64_t)a3;
- (void)setCountOfDistinctMentions:(unint64_t)a3;
- (void)setCountOfDistinctNoteLinks:(unint64_t)a3;
- (void)setCountOfDistinctTags:(unint64_t)a3;
- (void)setCountOfFolderLinks:(unint64_t)a3;
- (void)setCountOfMentions:(unint64_t)a3;
- (void)setCountOfNoteLinks:(unint64_t)a3;
- (void)setCountOfTags:(unint64_t)a3;
@end

@implementation ICNANoteInlineAttachmentReport

- (unint64_t)countOfTags
{
  return self->_countOfTags;
}

- (void)setCountOfTags:(unint64_t)a3
{
  self->_countOfTags = a3;
}

- (unint64_t)countOfDistinctTags
{
  return self->_countOfDistinctTags;
}

- (void)setCountOfDistinctTags:(unint64_t)a3
{
  self->_countOfDistinctTags = a3;
}

- (unint64_t)countOfMentions
{
  return self->_countOfMentions;
}

- (void)setCountOfMentions:(unint64_t)a3
{
  self->_countOfMentions = a3;
}

- (unint64_t)countOfDistinctMentions
{
  return self->_countOfDistinctMentions;
}

- (void)setCountOfDistinctMentions:(unint64_t)a3
{
  self->_countOfDistinctMentions = a3;
}

- (unint64_t)countOfNoteLinks
{
  return self->_countOfNoteLinks;
}

- (void)setCountOfNoteLinks:(unint64_t)a3
{
  self->_countOfNoteLinks = a3;
}

- (unint64_t)countOfDistinctNoteLinks
{
  return self->_countOfDistinctNoteLinks;
}

- (void)setCountOfDistinctNoteLinks:(unint64_t)a3
{
  self->_countOfDistinctNoteLinks = a3;
}

- (unint64_t)countOfFolderLinks
{
  return self->_countOfFolderLinks;
}

- (void)setCountOfFolderLinks:(unint64_t)a3
{
  self->_countOfFolderLinks = a3;
}

- (unint64_t)countOfDistinctFolderLinks
{
  return self->_countOfDistinctFolderLinks;
}

- (void)setCountOfDistinctFolderLinks:(unint64_t)a3
{
  self->_countOfDistinctFolderLinks = a3;
}

- (unint64_t)countOfCalculateResults
{
  return self->_countOfCalculateResults;
}

- (void)setCountOfCalculateResults:(unint64_t)a3
{
  self->_countOfCalculateResults = a3;
}

- (unint64_t)countOfCalculateGraphExpressions
{
  return self->_countOfCalculateGraphExpressions;
}

- (void)setCountOfCalculateGraphExpressions:(unint64_t)a3
{
  self->_countOfCalculateGraphExpressions = a3;
}

@end