@interface CRLPdfTaggerListParagraphLevelResolver
- (BOOL)paragraphInfo:(id)a3 matchesParagraphInfo:(id)a4 level:(int)a5;
- (int)levelOfCurrentParagraph:(id *)a3;
- (int)tagType;
@end

@implementation CRLPdfTaggerListParagraphLevelResolver

- (int)tagType
{
  return 300;
}

- (int)levelOfCurrentParagraph:(id *)a3
{
  v4 = [(CRLPdfTaggerParagraphLevelResolver *)self tagger];
  v5 = [v4 topmostColumnContext];

  id v6 = [v5 paragraphEnumerator];
  v7 = sub_100189EA4((uint64_t)v6, 0);
  if (+[CRLPdfTagger isHeadingStyle:v7 headingIndex:0]
    || !sub_10018A060((uint64_t)v6))
  {
    int v8 = -1;
  }
  else
  {
    int v8 = sub_100189FF8((uint64_t)v6);
    sub_10018A008((uint64_t)v6);
    id v9 = objc_claimAutoreleasedReturnValue();
    *a3 = v9;
  }
  return v8;
}

- (BOOL)paragraphInfo:(id)a3 matchesParagraphInfo:(id)a4 level:(int)a5
{
  return a3 == a4;
}

@end