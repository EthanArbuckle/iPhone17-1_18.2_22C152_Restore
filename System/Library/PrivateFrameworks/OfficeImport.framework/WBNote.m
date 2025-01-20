@interface WBNote
+ (int)readFrom:(id)a3 at:(int)a4 paragraph:(id)a5 note:(id)a6;
@end

@implementation WBNote

+ (int)readFrom:(id)a3 at:(int)a4 paragraph:(id)a5 note:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  unsigned int v25 = 0;
  v12 = [v11 text];
  int v13 = [v12 textType];

  if (v13 == 1) {
    v14 = (WrdNoteTable *)[v9 footnoteTable];
  }
  else {
    v14 = (WrdNoteTable *)[v9 endnoteTable];
  }
  uint64_t NoteAtMainTextCP = WrdNoteTable::getNoteAtMainTextCP(v14, a4, &v25);
  [v11 setAutomaticNumbering:*(_WORD *)(NoteAtMainTextCP + 20) != 0];
  if (v13 == 1) {
    int v16 = 1;
  }
  else {
    int v16 = 5;
  }
  WrdTextRun::WrdTextRun((uint64_t)v23, v16, *(_DWORD *)(NoteAtMainTextCP + 12));
  int v24 = *(_DWORD *)(NoteAtMainTextCP + 16);
  v17 = [v11 text];
  +[WBText readFrom:v9 text:v17 textRun:v23];

  WrdCharacterTextRun::WrdCharacterTextRun(&v22);
  v22.var1 = 0;
  v22.var2 = *(_DWORD *)(NoteAtMainTextCP + 8);
  uint64_t v18 = [v9 wrdReader];
  (*(void (**)(uint64_t, WrdCharacterTextRun *))(*(void *)v18 + 192))(v18, &v22);
  unsigned int var3 = v22.var3;
  v20 = [v11 reference];
  +[WBCharacterRun readFrom:v9 wrdTextRun:&v22 run:v20 paragraph:v10];

  WrdCharacterTextRun::~WrdCharacterTextRun(&v22);
  return var3;
}

@end