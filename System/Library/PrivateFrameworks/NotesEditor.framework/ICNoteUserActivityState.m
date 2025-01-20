@interface ICNoteUserActivityState
- (BOOL)isEditing;
- (BOOL)wantsContinuationStreams;
- (ICNoteUserActivityState)initWithNote:(id)a3;
- (ICTextViewScrollState)scrollState;
- (NSData)contentHash;
- (NSData)selectionRangeData;
- (NSData)visibleRangeData;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)folderID;
- (NSString)folderName;
- (NSString)noteID;
- (NSString)title;
- (_NSRange)selectionRange;
- (_NSRange)visibleRange;
- (void)setContentHash:(id)a3;
- (void)setCreationDate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setFolderID:(id)a3;
- (void)setFolderName:(id)a3;
- (void)setModificationDate:(id)a3;
- (void)setNoteID:(id)a3;
- (void)setScrollState:(id)a3;
- (void)setSelectionRange:(_NSRange)a3;
- (void)setSelectionRangeData:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVisibleRange:(_NSRange)a3;
- (void)setVisibleRangeData:(id)a3;
- (void)setWantsContinuationStreams:(BOOL)a3;
- (void)updateUserActivity:(id)a3;
@end

@implementation ICNoteUserActivityState

- (ICNoteUserActivityState)initWithNote:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ICNoteUserActivityState;
  v5 = [(ICNoteBaseUserActivityState *)&v15 initWithNote:v4];
  if (v5)
  {
    v6 = [v4 title];
    [(ICNoteUserActivityState *)v5 setTitle:v6];

    v7 = [v4 identifier];
    [(ICNoteUserActivityState *)v5 setNoteID:v7];

    v8 = [v4 folder];
    v9 = [v8 identifier];
    [(ICNoteUserActivityState *)v5 setFolderID:v9];

    v10 = [v4 folder];
    v11 = [v10 title];
    [(ICNoteUserActivityState *)v5 setFolderName:v11];

    [(ICNoteUserActivityState *)v5 setWantsContinuationStreams:ICNotesSupportsContinuationStreamsForNote(v4)];
    v12 = [v4 modificationDate];
    [(ICNoteUserActivityState *)v5 setModificationDate:v12];

    v13 = [v4 creationDate];
    [(ICNoteUserActivityState *)v5 setCreationDate:v13];
  }
  return v5;
}

- (void)updateUserActivity:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICNoteUserActivityState;
  id v4 = a3;
  [(ICNoteBaseUserActivityState *)&v5 updateUserActivity:v4];
  ICNotesUpdateUserActivityForViewingNoteWithState(v4, self);
}

- (NSString)noteID
{
  return self->_noteID;
}

- (void)setNoteID:(id)a3
{
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (BOOL)wantsContinuationStreams
{
  return self->_wantsContinuationStreams;
}

- (void)setWantsContinuationStreams:(BOOL)a3
{
  self->_wantsContinuationStreams = a3;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSData)contentHash
{
  return self->_contentHash;
}

- (void)setContentHash:(id)a3
{
}

- (NSString)folderID
{
  return self->_folderID;
}

- (void)setFolderID:(id)a3
{
}

- (NSString)folderName
{
  return self->_folderName;
}

- (void)setFolderName:(id)a3
{
}

- (ICTextViewScrollState)scrollState
{
  return self->_scrollState;
}

- (void)setScrollState:(id)a3
{
}

- (_NSRange)visibleRange
{
  p_visibleRange = &self->_visibleRange;
  NSUInteger location = self->_visibleRange.location;
  NSUInteger length = p_visibleRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setVisibleRange:(_NSRange)a3
{
  self->_visibleRange = a3;
}

- (NSData)visibleRangeData
{
  return self->_visibleRangeData;
}

- (void)setVisibleRangeData:(id)a3
{
}

- (_NSRange)selectionRange
{
  p_selectionRange = &self->_selectionRange;
  NSUInteger location = self->_selectionRange.location;
  NSUInteger length = p_selectionRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setSelectionRange:(_NSRange)a3
{
  self->_selectionRange = a3;
}

- (NSData)selectionRangeData
{
  return self->_selectionRangeData;
}

- (void)setSelectionRangeData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionRangeData, 0);
  objc_storeStrong((id *)&self->_visibleRangeData, 0);
  objc_storeStrong((id *)&self->_scrollState, 0);
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_storeStrong((id *)&self->_folderID, 0);
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);

  objc_storeStrong((id *)&self->_noteID, 0);
}

@end