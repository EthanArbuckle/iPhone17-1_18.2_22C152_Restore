@interface _TVRUIFactoidItem
+ (id)factoidWithText:(id)a3;
+ (id)factoidWithText:(id)a3 options:(unint64_t)a4;
- (NSString)factoidText;
- (_TVRUIFactoidItem)initWithText:(id)a3 options:(unint64_t)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)factoidOptions;
@end

@implementation _TVRUIFactoidItem

- (_TVRUIFactoidItem)initWithText:(id)a3 options:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_TVRUIFactoidItem;
  v8 = [(_TVRUIFactoidItem *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_factoidText, a3);
    v9->_factoidOptions = a4;
  }

  return v9;
}

+ (id)factoidWithText:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithText:v4 options:0];

  return v5;
}

+ (id)factoidWithText:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)a1) initWithText:v6 options:a4];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(_TVRUIFactoidItem *)self factoidText];
  id v6 = objc_msgSend(v4, "initWithText:options:", v5, -[_TVRUIFactoidItem factoidOptions](self, "factoidOptions"));

  return v6;
}

- (NSString)factoidText
{
  return self->_factoidText;
}

- (unint64_t)factoidOptions
{
  return self->_factoidOptions;
}

- (void).cxx_destruct
{
}

@end