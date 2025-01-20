@interface _JSAAlertActionModel
+ (int64_t)_alertActionStyleForName:(id)a3;
+ (unint64_t)_modelTypeForString:(id)a3;
- (BOOL)allowsEmpty;
- (BOOL)selected;
- (JSValue)callback;
- (NSString)actionType;
- (NSString)option;
- (NSString)placeholderText;
- (NSString)title;
- (_JSAAlertActionModel)initWithAction:(id)a3;
- (int64_t)style;
- (unint64_t)type;
@end

@implementation _JSAAlertActionModel

- (_JSAAlertActionModel)initWithAction:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)_JSAAlertActionModel;
  v5 = [(_JSAAlertActionModel *)&v35 init];
  if (v5)
  {
    v6 = [v4 valueForProperty:@"actionType"];
    v7 = [v4 valueForProperty:@"option"];
    v8 = [v4 valueForProperty:@"title"];
    v34 = [v4 valueForProperty:@"selected"];
    v9 = [v4 valueForProperty:@"style"];
    v10 = [v4 valueForProperty:@"type"];
    v11 = [v4 valueForProperty:@"placeholderText"];
    v12 = [v4 valueForProperty:@"allowsEmpty"];
    if ([v6 isString])
    {
      uint64_t v13 = [v6 toString];
      actionType = v5->_actionType;
      v5->_actionType = (NSString *)v13;
    }
    else
    {
      actionType = v5->_actionType;
      v5->_actionType = (NSString *)&stru_39B8B0;
    }

    if ([v7 isString])
    {
      uint64_t v15 = [v7 toString];
      option = v5->_option;
      v5->_option = (NSString *)v15;
    }
    else
    {
      option = v5->_option;
      v5->_option = (NSString *)&stru_39B8B0;
    }

    if ([v8 isString])
    {
      uint64_t v17 = [v8 toString];
      title = v5->_title;
      v5->_title = (NSString *)v17;
    }
    else
    {
      title = v5->_title;
      v5->_title = (NSString *)&stru_39B8B0;
    }

    uint64_t v19 = [v4 valueForProperty:@"callback"];
    callback = v5->_callback;
    v5->_callback = (JSValue *)v19;

    unsigned int v21 = [v34 isBoolean];
    v32 = v8;
    if (v21) {
      LOBYTE(v21) = [v34 toBool:v8];
    }
    v22 = v7;
    v5->_selected = v21;
    v23 = v6;
    if (objc_msgSend(v9, "isString", v32))
    {
      v24 = objc_opt_class();
      v25 = [v9 toString];
      v5->_style = (int64_t)[v24 _alertActionStyleForName:v25];
    }
    else
    {
      v5->_style = 0;
    }
    if ([v10 isString])
    {
      v26 = objc_opt_class();
      v27 = [v10 toString];
      v5->_type = (unint64_t)[v26 _modelTypeForString:v27];
    }
    else
    {
      v5->_type = 0;
    }
    if ([v11 isString])
    {
      uint64_t v28 = [v11 toString];
      placeholderText = v5->_placeholderText;
      v5->_placeholderText = (NSString *)v28;
    }
    else
    {
      placeholderText = v5->_placeholderText;
      v5->_placeholderText = 0;
    }

    unsigned int v30 = [v12 isBoolean];
    if (v30) {
      LOBYTE(v30) = [v12 toBool];
    }
    v5->_allowsEmpty = v30;
  }
  return v5;
}

+ (unint64_t)_modelTypeForString:(id)a3
{
  return [a3 isEqualToString:@"textField"];
}

+ (int64_t)_alertActionStyleForName:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"destructive"]) {
    int64_t v4 = 2;
  }
  else {
    int64_t v4 = [v3 isEqualToString:@"cancel"];
  }

  return v4;
}

- (NSString)actionType
{
  return self->_actionType;
}

- (NSString)option
{
  return self->_option;
}

- (NSString)title
{
  return self->_title;
}

- (JSValue)callback
{
  return self->_callback;
}

- (BOOL)selected
{
  return self->_selected;
}

- (int64_t)style
{
  return self->_style;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)placeholderText
{
  return self->_placeholderText;
}

- (BOOL)allowsEmpty
{
  return self->_allowsEmpty;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderText, 0);
  objc_storeStrong((id *)&self->_callback, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_option, 0);

  objc_storeStrong((id *)&self->_actionType, 0);
}

@end