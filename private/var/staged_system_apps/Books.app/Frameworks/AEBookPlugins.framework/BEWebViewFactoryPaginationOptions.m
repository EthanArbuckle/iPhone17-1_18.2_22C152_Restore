@interface BEWebViewFactoryPaginationOptions
+ (id)paginationOptionsForBookInfoSnapshot:(id)a3 withConfiguration:(id)a4 contentLayoutSize:(CGSize)a5;
@end

@implementation BEWebViewFactoryPaginationOptions

+ (id)paginationOptionsForBookInfoSnapshot:(id)a3 withConfiguration:(id)a4 contentLayoutSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  id v8 = a3;
  id v9 = a4;
  if ([v8 isFixedLayout])
  {
    id v10 = objc_alloc((Class)BEWebViewFactoryPaginationOptions);
    [v8 fixedLayoutSize];
    id v11 = [v10 initWithFixedSize:];
  }
  else
  {
    if ([v9 isScroll])
    {
      uint64_t v12 = 0;
    }
    else if ([v8 bkPageProgressionDirection] == 1)
    {
      uint64_t v12 = 3;
    }
    else
    {
      uint64_t v12 = 2;
    }
    id v13 = objc_alloc((Class)BEWebViewFactoryPaginationOptions);
    id v14 = [v9 usePaginationLineGrid];
    id v15 = [v8 obeyPageBreaks];
    BOOL v16 = [v9 layout] == (char *)&dword_0 + 3;
    [v9 gutterWidth];
    double v18 = v17;
    [v9 fontSize];
    id v11 = [v13 initWithMode:v12 usePaginationLineGrid:v14 respectPageBreaks:v15 isHorizontalScroll:[v8 shouldAllowRemoteInspection] contentLayoutSize:width viewportWidth:height fixedLayoutSize:CGSizeZero.width gapBetweenPages:CGSizeZero.height pageLength:width fontSize:v19];
  }
  v20 = v11;

  return v20;
}

@end