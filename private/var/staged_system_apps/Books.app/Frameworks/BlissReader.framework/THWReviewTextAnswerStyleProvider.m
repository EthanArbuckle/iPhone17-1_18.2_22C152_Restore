@interface THWReviewTextAnswerStyleProvider
- (THWReviewTextAnswerStyleProvider)initWithIndex:(unint64_t)a3 storage:(id)a4 listLabelStyle:(id)a5;
- (TSWPListStyle)listStyle;
- (TSWPParagraphStyle)listLabelStyle;
- (TSWPStorage)storage;
- (id)listLabelParagraphStyleOverrideAtParIndex:(unint64_t)a3;
- (id)listStyleAtParIndex:(unint64_t)a3;
- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4;
- (unint64_t)index;
- (unint64_t)listNumberAtParIndex:(unint64_t)a3 numberingData:(id *)a4;
- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3;
- (void)dealloc;
@end

@implementation THWReviewTextAnswerStyleProvider

- (THWReviewTextAnswerStyleProvider)initWithIndex:(unint64_t)a3 storage:(id)a4 listLabelStyle:(id)a5
{
  v15.receiver = self;
  v15.super_class = (Class)THWReviewTextAnswerStyleProvider;
  v8 = [(THWReviewTextAnswerStyleProvider *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_index = a3;
    v8->_storage = (TSWPStorage *)a4;
    objc_opt_class();
    objc_msgSend(objc_msgSend(a4, "stylesheet"), "styleWithIdentifier:", @"review-list-style");
    v10 = (TSWPListStyle *)(id)TSUDynamicCast();
    v9->_listStyle = v10;
    if (!v10)
    {
      id v11 = +[TSWPListStyle propertyMapForListNumberType:9];
      id v12 = +[TSWPListStyle defaultStyleWithContext:type:](TSWPListStyle, "defaultStyleWithContext:type:", [a4 context], 3);
      objc_msgSend(objc_msgSend(a4, "stylesheet"), "addStyle:", v12);
      v13 = (TSWPListStyle *)objc_msgSend(objc_msgSend(a4, "stylesheet"), "variationOfStyle:propertyMap:", v12, v11);
      v9->_listStyle = v13;
      [(-[TSWPListStyle stylesheet](v13, "stylesheet")) setIdentifier:@"review-list-style" ofStyle:v9->_listStyle];
    }
    v9->_listLabelStyle = (TSWPParagraphStyle *)a5;
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THWReviewTextAnswerStyleProvider;
  [(THWReviewTextAnswerStyleProvider *)&v3 dealloc];
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v7 = +[TSSPropertyMap propertyMap];
  [v7 setIntValue:0 forProperty:86];
  HIDWORD(v8) = 1078427648;
  *(float *)&double v8 = 47.0;
  [v7 setFloatValue:80 forProperty:v8];
  *(float *)&double v9 = 47.0;
  [v7 setFloatValue:81 forProperty:v9];
  [v7 setBoolValue:1 forProperty:93];
  [v7 setFloatValue:82 forProperty:0.0];
  id v10 = [TSWPStorageStyleProvider styleProviderForStorage:self->_storage paragraphStyleAtParIndex:a3 effectiveRange:a4];
  id v11 = [v10 stylesheet];

  return [v11 variationOfStyle:v10 propertyMap:v7];
}

- (id)listStyleAtParIndex:(unint64_t)a3
{
  return self->_listStyle;
}

- (unint64_t)listNumberAtParIndex:(unint64_t)a3 numberingData:(id *)a4
{
  if (a3)
  {
    unint64_t result = 0;
    if (a4)
    {
      a4->var2 = 0;
      a4->var0 = 0;
      a4->var1 = 0;
    }
  }
  else
  {
    if (a4)
    {
      a4->var2 = self->_index != 0;
      a4->var0 = 3;
      a4->var1 = 0;
    }
    return self->_index + 1;
  }
  return result;
}

- (id)listLabelParagraphStyleOverrideAtParIndex:(unint64_t)a3
{
  if (a3) {
    return 0;
  }
  else {
    return self->_listLabelStyle;
  }
}

- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)index
{
  return self->_index;
}

- (TSWPListStyle)listStyle
{
  return self->_listStyle;
}

- (TSWPParagraphStyle)listLabelStyle
{
  return self->_listLabelStyle;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

@end