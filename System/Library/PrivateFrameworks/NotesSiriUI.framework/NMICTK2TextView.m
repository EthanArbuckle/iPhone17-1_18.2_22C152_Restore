@interface NMICTK2TextView
+ (id)createTextViewWithNote:(id)a3 size:(CGSize)a4;
@end

@implementation NMICTK2TextView

+ (id)createTextViewWithNote:(id)a3 size:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  v6 = (objc_class *)MEMORY[0x263F5A788];
  id v7 = a3;
  v8 = objc_msgSend([v6 alloc], "initWithNote:size:insideSystemPaper:linkDelegate:insideSiriSnippet:", v7, 0, 0, 1, width, height);

  return v8;
}

@end