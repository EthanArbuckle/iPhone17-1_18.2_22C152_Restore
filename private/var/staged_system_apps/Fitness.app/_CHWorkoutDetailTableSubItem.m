@interface _CHWorkoutDetailTableSubItem
+ (id)_emptyItem;
- (BOOL)_fitsWidth:(double)a3;
- (NSAttributedString)valueAttrString;
- (NSString)titleString;
- (id)updateBlock;
- (void)setTitleString:(id)a3;
- (void)setUpdateBlock:(id)a3;
- (void)setValueAttrString:(id)a3;
@end

@implementation _CHWorkoutDetailTableSubItem

- (BOOL)_fitsWidth:(double)a3
{
  v5 = [(_CHWorkoutDetailTableSubItem *)self titleString];
  NSAttributedStringKey v14 = NSFontAttributeName;
  v6 = +[UIFont defaultFontForTextStyle:UIFontTextStyleBody];
  v15 = v6;
  v7 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v5 sizeWithAttributes:v7];
  double v9 = v8;

  v10 = [(_CHWorkoutDetailTableSubItem *)self valueAttrString];
  [v10 boundingRectWithSize:3 options:0 context:1.79769313e308];
  double v12 = v11;

  return v12 < a3 && v9 < a3;
}

+ (id)_emptyItem
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 setTitleString:0];
  [v2 setValueAttrString:0];
  [v2 setUpdateBlock:&stru_1008AD090];

  return v2;
}

- (NSString)titleString
{
  return self->_titleString;
}

- (void)setTitleString:(id)a3
{
}

- (NSAttributedString)valueAttrString
{
  return self->_valueAttrString;
}

- (void)setValueAttrString:(id)a3
{
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
  objc_storeStrong((id *)&self->_valueAttrString, 0);

  objc_storeStrong((id *)&self->_titleString, 0);
}

@end