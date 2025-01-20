@interface WFWebPageToTrainingText
+ (id)documentSignature;
+ (id)signatureForCategory:(unint64_t)a3;
- (id)categorySignature;
- (id)rawPlainText;
- (void)dealloc;
- (void)setCategorySignature:(id)a3;
@end

@implementation WFWebPageToTrainingText

+ (id)documentSignature
{
  return (id)WFWebPageToTrainingText_Signature;
}

+ (id)signatureForCategory:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
      id result = WFWebPageToTrainingText_Category1;
      break;
    case 2uLL:
      id result = (id)WFWebPageToTrainingText_Category2;
      break;
    case 3uLL:
      id result = (id)WFWebPageToTrainingText_Category3;
      break;
    case 4uLL:
      id result = (id)WFWebPageToTrainingText_Category4;
      break;
    case 5uLL:
      id result = (id)WFWebPageToTrainingText_Category5;
      break;
    case 6uLL:
      id result = (id)WFWebPageToTrainingText_Category6;
      break;
    case 7uLL:
      id result = (id)WFWebPageToTrainingText_Category7;
      break;
    case 8uLL:
      id result = (id)WFWebPageToTrainingText_Category8;
      break;
    case 9uLL:
      id result = (id)WFWebPageToTrainingText_Category9;
      break;
    default:
      id result = 0;
      break;
  }
  return result;
}

- (id)categorySignature
{
  return self->categorySignature;
}

- (void)setCategorySignature:(id)a3
{
  id v5 = a3;

  self->categorySignature = (NSString *)a3;
}

- (id)rawPlainText
{
  v3 = objc_opt_new();
  [v3 appendString:WFWebPageToTrainingText_Signature];
  [v3 appendString:@"\n"];
  id v4 = [(WFWebPageToTrainingText *)self categorySignature];
  if (v4) {
    [v3 appendString:v4];
  }
  [v3 appendString:@"\n"];
  [v3 appendString:@"\n"];
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_pageTitle, @"=========", 15));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_tags, @"=========", 5));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_metaTagDescription, @"=========", 10));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:weight:](self, "plainTextAttributeWithSelector:title:weight:", sel_metaTagKeywords, @"=========", 10));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_imageAltsText, @"========="));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_linkTitlesText, @"========="));
  objc_msgSend(v3, "appendString:", -[WFWebPageDecorator plainTextAttributeWithSelector:title:](self, "plainTextAttributeWithSelector:title:", sel_pageContent, @"========="));
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)WFWebPageToTrainingText;
  [(WFWebPageDecorator *)&v3 dealloc];
}

@end