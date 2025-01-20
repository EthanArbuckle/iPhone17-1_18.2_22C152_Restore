@interface WebPDFNSNumberFormatter
+ (id)copyNumberFormater;
- (void)dealloc;
@end

@implementation WebPDFNSNumberFormatter

+ (id)copyNumberFormater
{
  v2 = (void *)sWebPDFNSNumberFormatter;
  if (sWebPDFNSNumberFormatter)
  {
    return v2;
  }
  else
  {
    sWebPDFNSNumberFormatter = objc_alloc_init(WebPDFNSNumberFormatter);
    [(id)sWebPDFNSNumberFormatter setFormatterBehavior:1040];
    [(id)sWebPDFNSNumberFormatter setNumberStyle:0];
    return (id)sWebPDFNSNumberFormatter;
  }
}

- (void)dealloc
{
  if ((WebPDFNSNumberFormatter *)sWebPDFNSNumberFormatter == self) {
    sWebPDFNSNumberFormatter = 0;
  }
  v2.receiver = self;
  v2.super_class = (Class)WebPDFNSNumberFormatter;
  [(WebPDFNSNumberFormatter *)&v2 dealloc];
}

@end