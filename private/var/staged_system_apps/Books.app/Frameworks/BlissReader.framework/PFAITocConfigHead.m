@interface PFAITocConfigHead
- (BOOL)mapStartElementWithState:(id)a3;
- (CGSize)sizeOfPage:(id)a3 readerState:(id)a4;
- (void)createPagesWithContentState:(id)a3;
@end

@implementation PFAITocConfigHead

- (CGSize)sizeOfPage:(id)a3 readerState:(id)a4
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
  id v5 = [a3 paginatedState];
  id v6 = [v5 pageCache];
  double v10 = -[THModelPageInfo initWithContext:]([THModelPageInfo alloc], "initWithContext:", [a3 tspContext]);
  -[PFAITocConfigHead sizeOfPage:readerState:](self, "sizeOfPage:readerState:", [v6 pageWithIndex:0], a3);
  id v9 = [objc_alloc((Class)TSDInfoGeometry) initWithSize:v7, v8];
  [(THModelPageInfo *)v10 setGeometry:v9];

  objc_msgSend(objc_msgSend(v5, "contentNodeBody"), "addPageInfo:", v10);
  -[THDrawablesZOrder addDrawable:](-[THModelPageInfo drawablesZOrder](v10, "drawablesZOrder"), "addDrawable:", [v5 bodyStorage]);
}

- (BOOL)mapStartElementWithState:(id)a3
{
  return 1;
}

@end