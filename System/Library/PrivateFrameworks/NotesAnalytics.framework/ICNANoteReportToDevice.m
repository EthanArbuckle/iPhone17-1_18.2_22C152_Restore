@interface ICNANoteReportToDevice
- (unint64_t)countOfModernNotes;
- (unint64_t)countOfModernNotesWithDeeplink;
- (unint64_t)countOfModernNotesWithDrawing;
- (unint64_t)countOfModernNotesWithImage;
- (unint64_t)countOfModernNotesWithLinks;
- (unint64_t)countOfModernNotesWithTable;
- (unint64_t)countOfModernNotesWithWebHighlights;
- (unint64_t)countOfPinnedNotes;
- (unint64_t)countOfScrapPapers;
- (unint64_t)countOfScrapPapersWithDeepLink;
- (unint64_t)countOfScrapPapersWithDrawing;
- (unint64_t)countOfScrapPapersWithImage;
- (unint64_t)countOfScrapPapersWithLinks;
- (unint64_t)countOfScrapPapersWithTables;
- (unint64_t)countOfScrapPapersWithWebHighlights;
- (void)setCountOfModernNotes:(unint64_t)a3;
- (void)setCountOfModernNotesWithDeeplink:(unint64_t)a3;
- (void)setCountOfModernNotesWithDrawing:(unint64_t)a3;
- (void)setCountOfModernNotesWithImage:(unint64_t)a3;
- (void)setCountOfModernNotesWithLinks:(unint64_t)a3;
- (void)setCountOfModernNotesWithTable:(unint64_t)a3;
- (void)setCountOfModernNotesWithWebHighlights:(unint64_t)a3;
- (void)setCountOfPinnedNotes:(unint64_t)a3;
- (void)setCountOfScrapPapers:(unint64_t)a3;
- (void)setCountOfScrapPapersWithDeepLink:(unint64_t)a3;
- (void)setCountOfScrapPapersWithDrawing:(unint64_t)a3;
- (void)setCountOfScrapPapersWithImage:(unint64_t)a3;
- (void)setCountOfScrapPapersWithLinks:(unint64_t)a3;
- (void)setCountOfScrapPapersWithTables:(unint64_t)a3;
- (void)setCountOfScrapPapersWithWebHighlights:(unint64_t)a3;
@end

@implementation ICNANoteReportToDevice

- (unint64_t)countOfPinnedNotes
{
  return self->_countOfPinnedNotes;
}

- (void)setCountOfPinnedNotes:(unint64_t)a3
{
  self->_countOfPinnedNotes = a3;
}

- (unint64_t)countOfModernNotes
{
  return self->_countOfModernNotes;
}

- (void)setCountOfModernNotes:(unint64_t)a3
{
  self->_countOfModernNotes = a3;
}

- (unint64_t)countOfModernNotesWithDeeplink
{
  return self->_countOfModernNotesWithDeeplink;
}

- (void)setCountOfModernNotesWithDeeplink:(unint64_t)a3
{
  self->_countOfModernNotesWithDeeplink = a3;
}

- (unint64_t)countOfModernNotesWithDrawing
{
  return self->_countOfModernNotesWithDrawing;
}

- (void)setCountOfModernNotesWithDrawing:(unint64_t)a3
{
  self->_countOfModernNotesWithDrawing = a3;
}

- (unint64_t)countOfModernNotesWithImage
{
  return self->_countOfModernNotesWithImage;
}

- (void)setCountOfModernNotesWithImage:(unint64_t)a3
{
  self->_countOfModernNotesWithImage = a3;
}

- (unint64_t)countOfModernNotesWithLinks
{
  return self->_countOfModernNotesWithLinks;
}

- (void)setCountOfModernNotesWithLinks:(unint64_t)a3
{
  self->_countOfModernNotesWithLinks = a3;
}

- (unint64_t)countOfModernNotesWithTable
{
  return self->_countOfModernNotesWithTable;
}

- (void)setCountOfModernNotesWithTable:(unint64_t)a3
{
  self->_countOfModernNotesWithTable = a3;
}

- (unint64_t)countOfModernNotesWithWebHighlights
{
  return self->_countOfModernNotesWithWebHighlights;
}

- (void)setCountOfModernNotesWithWebHighlights:(unint64_t)a3
{
  self->_countOfModernNotesWithWebHighlights = a3;
}

- (unint64_t)countOfScrapPapers
{
  return self->_countOfScrapPapers;
}

- (void)setCountOfScrapPapers:(unint64_t)a3
{
  self->_countOfScrapPapers = a3;
}

- (unint64_t)countOfScrapPapersWithDeepLink
{
  return self->_countOfScrapPapersWithDeepLink;
}

- (void)setCountOfScrapPapersWithDeepLink:(unint64_t)a3
{
  self->_countOfScrapPapersWithDeepLink = a3;
}

- (unint64_t)countOfScrapPapersWithDrawing
{
  return self->_countOfScrapPapersWithDrawing;
}

- (void)setCountOfScrapPapersWithDrawing:(unint64_t)a3
{
  self->_countOfScrapPapersWithDrawing = a3;
}

- (unint64_t)countOfScrapPapersWithImage
{
  return self->_countOfScrapPapersWithImage;
}

- (void)setCountOfScrapPapersWithImage:(unint64_t)a3
{
  self->_countOfScrapPapersWithImage = a3;
}

- (unint64_t)countOfScrapPapersWithLinks
{
  return self->_countOfScrapPapersWithLinks;
}

- (void)setCountOfScrapPapersWithLinks:(unint64_t)a3
{
  self->_countOfScrapPapersWithLinks = a3;
}

- (unint64_t)countOfScrapPapersWithTables
{
  return self->_countOfScrapPapersWithTables;
}

- (void)setCountOfScrapPapersWithTables:(unint64_t)a3
{
  self->_countOfScrapPapersWithTables = a3;
}

- (unint64_t)countOfScrapPapersWithWebHighlights
{
  return self->_countOfScrapPapersWithWebHighlights;
}

- (void)setCountOfScrapPapersWithWebHighlights:(unint64_t)a3
{
  self->_countOfScrapPapersWithWebHighlights = a3;
}

@end