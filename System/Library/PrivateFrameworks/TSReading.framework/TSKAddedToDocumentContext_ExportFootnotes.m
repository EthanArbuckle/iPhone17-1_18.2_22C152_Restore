@interface TSKAddedToDocumentContext_ExportFootnotes
- (BOOL)exportingFootnotes;
- (id)description;
@end

@implementation TSKAddedToDocumentContext_ExportFootnotes

- (id)description
{
  return @"Export footnotes";
}

- (BOOL)exportingFootnotes
{
  return 1;
}

@end