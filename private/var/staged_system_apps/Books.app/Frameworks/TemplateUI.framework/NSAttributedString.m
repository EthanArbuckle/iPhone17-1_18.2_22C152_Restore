@interface NSAttributedString
- (double)tui_widthAsTitle;
- (id)tui_attributedTitleForButtonType:(unint64_t)a3;
@end

@implementation NSAttributedString

- (id)tui_attributedTitleForButtonType:(unint64_t)a3
{
  v4 = +[TUIFontSpec defaultFontSpec];
  v5 = [v4 font];

  v6 = +[UIFont systemFontOfSize:15.0];
  id v7 = objc_alloc((Class)NSMutableAttributedString);
  v8 = [(NSAttributedString *)self string];
  NSAttributedStringKey v20 = NSFontAttributeName;
  v21 = v6;
  v9 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  id v10 = [v7 initWithString:v8 attributes:v9];

  NSUInteger v11 = [(NSAttributedString *)self length];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_88B04;
  v17[3] = &unk_254260;
  id v18 = v5;
  id v12 = v10;
  id v19 = v12;
  id v13 = v5;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:", 0, v11, 0, v17);
  v14 = v19;
  id v15 = v12;

  return v15;
}

- (double)tui_widthAsTitle
{
  v3 = +[UIFont systemFontOfSize:15.0];
  id v4 = objc_alloc((Class)NSMutableAttributedString);
  v5 = [(NSAttributedString *)self string];
  NSAttributedStringKey v18 = NSFontAttributeName;
  id v19 = v3;
  v6 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v7 = [v4 initWithString:v5 attributes:v6];

  NSUInteger v8 = [(NSAttributedString *)self length];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_143F44;
  v16 = &unk_256340;
  id v17 = v7;
  id v9 = v7;
  -[NSAttributedString enumerateAttributesInRange:options:usingBlock:](self, "enumerateAttributesInRange:options:usingBlock:", 0, v8, 0, &v13);
  [v9 boundingRectWithSize:0 options:0 context:3.40282347e38 3.40282347e38 v13 v14 v15 v16];
  UICeilToViewScale();
  double v11 = v10;

  return v11;
}

@end