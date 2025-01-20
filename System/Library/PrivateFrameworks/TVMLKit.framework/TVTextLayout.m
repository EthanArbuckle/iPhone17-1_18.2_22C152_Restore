@interface TVTextLayout
+ (id)layoutWithLayout:(id)a3 element:(id)a4;
- (NSString)textHighlightStyle;
- (void)setTextHighlightStyle:(id)a3;
@end

@implementation TVTextLayout

+ (id)layoutWithLayout:(id)a3 element:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (TVTextLayout *)v6;
  v9 = v8;
  if (!v8) {
    v9 = objc_alloc_init(TVTextLayout);
  }
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___TVTextLayout;
  id v10 = objc_msgSendSuper2(&v15, sel_layoutWithLayout_element_, v9, v7);
  v11 = [v7 style];
  v12 = objc_msgSend(v11, "tv_textHighlightStyle");

  if (v12)
  {
    v13 = objc_msgSend(v11, "tv_textHighlightStyle");
    [(TVTextLayout *)v9 setTextHighlightStyle:v13];
  }
  return v9;
}

- (NSString)textHighlightStyle
{
  return self->_textHighlightStyle;
}

- (void)setTextHighlightStyle:(id)a3
{
}

- (void).cxx_destruct
{
}

@end