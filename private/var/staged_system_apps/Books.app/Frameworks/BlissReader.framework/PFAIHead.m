@interface PFAIHead
- (BOOL)mapStartElementWithState:(id)a3;
- (CGSize)sizeOfPage:(id)a3 contentState:(id)a4;
- (void)createPagesWithContentState:(id)a3;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFAIHead

- (CGSize)sizeOfPage:(id)a3 contentState:(id)a4
{
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(objc_msgSend(a3, "properties"), "objectForKey:", @"width"), a4);
  double v7 = v6;
  +[PFXStyleUtilities pointLengthInArray:readerState:](PFXStyleUtilities, "pointLengthInArray:readerState:", objc_msgSend(objc_msgSend(a3, "properties"), "objectForKey:", @"height"), a4);
  double v9 = v8;
  double v10 = v7;
  result.height = v9;
  result.width = v10;
  return result;
}

- (void)createPagesWithContentState:(id)a3
{
  v5 = (char *)objc_msgSend(objc_msgSend(objc_msgSend(a3, "paginatedState"), "pageCache"), "pageCount");
  if (v5)
  {
    double v6 = v5;
    for (i = 0; i != v6; ++i)
    {
      id v8 = [a3 paginatedState];
      id v9 = [v8 pageCache];
      double v10 = -[THModelPageInfo initWithContext:]([THModelPageInfo alloc], "initWithContext:", [a3 tspContext]);
      -[PFAIHead sizeOfPage:contentState:](self, "sizeOfPage:contentState:", [v9 pageWithIndex:i], a3);
      id v13 = [objc_alloc((Class)TSDInfoGeometry) initWithSize:v11, v12];
      [(THModelPageInfo *)v10 setGeometry:v13];

      objc_msgSend(objc_msgSend(v8, "contentNodeBody"), "addPageInfo:", v10);
      -[THDrawablesZOrder addDrawable:](-[THModelPageInfo drawablesZOrder](v10, "drawablesZOrder"), "addDrawable:", [v8 bodyStorage]);
    }
  }
}

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

- (void)mapEndElementWithState:(id)a3
{
  -[PFAIHead createPagesWithContentState:](self, "createPagesWithContentState:");

  [a3 resetTotalTextRead];
}

@end