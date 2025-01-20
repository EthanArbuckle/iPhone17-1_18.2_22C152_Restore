@interface NoteBodyObject
- (NSString)contentAsPlainText;
- (id)contentAsPlainTextPreservingNewlines;
@end

@implementation NoteBodyObject

- (NSString)contentAsPlainText
{
  v3 = [(NoteBodyObject *)self content];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F734D8];
    v5 = [(NoteBodyObject *)self content];
    v6 = [v4 plainTextFromHTML:v5];
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (id)contentAsPlainTextPreservingNewlines
{
  v3 = [(NoteBodyObject *)self content];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F734D8];
    v5 = [(NoteBodyObject *)self content];
    v6 = [v4 plainTextFromHTML:v5 limit:0xFFFFFFFFLL preserveNewlines:1];
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end