@interface NoteUserActivityState
- (BOOL)isContentPlainText;
- (BOOL)isEditing;
- (NSData)contentHash;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)noteID;
- (NSString)title;
- (NoteUserActivityState)initWithNote:(id)a3;
- (void)setContentHash:(id)a3;
- (void)setContentPlainText:(BOOL)a3;
- (void)setCreationDate:(id)a3;
- (void)setEditing:(BOOL)a3;
- (void)setModificationDate:(id)a3;
- (void)setNoteID:(id)a3;
- (void)setTitle:(id)a3;
- (void)updateUserActivity:(id)a3;
@end

@implementation NoteUserActivityState

- (NoteUserActivityState)initWithNote:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NoteUserActivityState;
  return [(NoteUserActivityState *)&v4 initWithNote:a3];
}

- (void)updateUserActivity:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NoteUserActivityState;
  id v4 = a3;
  [(NoteUserActivityState *)&v5 updateUserActivity:v4];
  sub_1000741FC(v4, self);
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

- (BOOL)isContentPlainText
{
  return self->_contentPlainText;
}

- (void)setContentPlainText:(BOOL)a3
{
  self->_contentPlainText = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentHash, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);

  objc_storeStrong((id *)&self->_noteID, 0);
}

@end