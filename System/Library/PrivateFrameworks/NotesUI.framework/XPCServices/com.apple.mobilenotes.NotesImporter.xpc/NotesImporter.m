@interface NotesImporter
- (ICEvernoteContentParser)evernoteContentParser;
- (ICEvernoteNoteParser)evernoteNoteParser;
- (NotesImporter)init;
- (void)archiveEvernoteNotesFromBookmarkData:(id)a3 completionBlock:(id)a4;
- (void)cleanupArchiveId:(id)a3 completionBlock:(id)a4;
- (void)countEvernoteNotesFromBookmarkData:(id)a3 completionBlock:(id)a4;
- (void)parseHTMLStringFromEvernoteContentString:(id)a3 completionBlock:(id)a4;
- (void)parseTitleFromHTMLString:(id)a3 completionBlock:(id)a4;
- (void)setEvernoteContentParser:(id)a3;
- (void)setEvernoteNoteParser:(id)a3;
- (void)unarchiveEvernoteNoteFromArchiveId:(id)a3 noteArchiveId:(id)a4 completionBlock:(id)a5;
- (void)unarchiveEvernoteResourceFromArchiveId:(id)a3 resourceArchiveId:(id)a4 completionBlock:(id)a5;
@end

@implementation NotesImporter

- (NotesImporter)init
{
  v8.receiver = self;
  v8.super_class = (Class)NotesImporter;
  v2 = [(NotesImporter *)&v8 init];
  if (v2)
  {
    v3 = (ICEvernoteNoteParser *)objc_alloc_init((Class)ICEvernoteNoteParser);
    evernoteNoteParser = v2->_evernoteNoteParser;
    v2->_evernoteNoteParser = v3;

    v5 = (ICEvernoteContentParser *)objc_alloc_init((Class)ICEvernoteContentParser);
    evernoteContentParser = v2->_evernoteContentParser;
    v2->_evernoteContentParser = v5;
  }
  return v2;
}

- (void)parseHTMLStringFromEvernoteContentString:(id)a3 completionBlock:(id)a4
{
  v9 = (void (**)(id, void *))a4;
  id v6 = a3;
  v7 = [(NotesImporter *)self evernoteContentParser];
  objc_super v8 = [v7 htmlStringFromEvernoteContentString:v6];

  if (v9) {
    v9[2](v9, v8);
  }
}

- (void)countEvernoteNotesFromBookmarkData:(id)a3 completionBlock:(id)a4
{
  id v10 = a4;
  id v6 = a3;
  v7 = [(NotesImporter *)self evernoteNoteParser];
  id v8 = [v7 countEvernoteNotesFromBookmarkData:v6];

  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, id))v10 + 2))(v10, v8);
    v9 = v10;
  }
}

- (void)parseTitleFromHTMLString:(id)a3 completionBlock:(id)a4
{
  v9 = (void (**)(id, void *))a4;
  id v6 = a3;
  v7 = [(NotesImporter *)self evernoteContentParser];
  id v8 = [v7 titleFromHTMLString:v6];

  if (v9) {
    v9[2](v9, v8);
  }
}

- (void)archiveEvernoteNotesFromBookmarkData:(id)a3 completionBlock:(id)a4
{
  id v6 = (void (**)(id, void *, id))a4;
  id v7 = a3;
  id v8 = [(NotesImporter *)self evernoteNoteParser];
  id v11 = 0;
  v9 = [v8 archiveItemsFromBookmarkData:v7 error:&v11];

  id v10 = v11;
  if (v6) {
    v6[2](v6, v9, v10);
  }
}

- (void)unarchiveEvernoteNoteFromArchiveId:(id)a3 noteArchiveId:(id)a4 completionBlock:(id)a5
{
  v12 = (void (**)(id, void *))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NotesImporter *)self evernoteNoteParser];
  id v11 = [v10 unarchiveEvernoteNoteFromArchiveId:v9 noteArchiveId:v8];

  if (v12) {
    v12[2](v12, v11);
  }
}

- (void)unarchiveEvernoteResourceFromArchiveId:(id)a3 resourceArchiveId:(id)a4 completionBlock:(id)a5
{
  v12 = (void (**)(id, void *))a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(NotesImporter *)self evernoteNoteParser];
  id v11 = [v10 unarchiveEvernoteResourceFromArchiveId:v9 resourceArchiveId:v8];

  if (v12) {
    v12[2](v12, v11);
  }
}

- (void)cleanupArchiveId:(id)a3 completionBlock:(id)a4
{
  id v9 = a4;
  id v6 = a3;
  id v7 = [(NotesImporter *)self evernoteNoteParser];
  [v7 cleanupArchiveId:v6];

  id v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    id v8 = v9;
  }
}

- (ICEvernoteNoteParser)evernoteNoteParser
{
  return self->_evernoteNoteParser;
}

- (void)setEvernoteNoteParser:(id)a3
{
}

- (ICEvernoteContentParser)evernoteContentParser
{
  return self->_evernoteContentParser;
}

- (void)setEvernoteContentParser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evernoteContentParser, 0);
  objc_storeStrong((id *)&self->_evernoteNoteParser, 0);
}

@end