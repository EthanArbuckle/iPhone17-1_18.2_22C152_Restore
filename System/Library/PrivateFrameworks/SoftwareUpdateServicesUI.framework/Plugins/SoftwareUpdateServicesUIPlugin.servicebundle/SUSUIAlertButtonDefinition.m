@interface SUSUIAlertButtonDefinition
- (BOOL)isPreferredButton;
- (NSString)label;
- (SUSUIAlertButtonDefinition)initWithLabel:(id)a3 presentationStyle:(unint64_t)a4 isPreferredButton:(BOOL)a5 handler:(id)a6;
- (id)handler;
- (unint64_t)presentationStyle;
@end

@implementation SUSUIAlertButtonDefinition

- (SUSUIAlertButtonDefinition)initWithLabel:(id)a3 presentationStyle:(unint64_t)a4 isPreferredButton:(BOOL)a5 handler:(id)a6
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v18 = a4;
  BOOL v17 = a5;
  id v16 = 0;
  objc_storeStrong(&v16, a6);
  v6 = v20;
  v20 = 0;
  v15.receiver = v6;
  v15.super_class = (Class)SUSUIAlertButtonDefinition;
  v14 = [(SUSUIAlertButtonDefinition *)&v15 init];
  v20 = v14;
  objc_storeStrong((id *)&v20, v14);
  if (v14)
  {
    objc_storeStrong((id *)&v20->_label, location[0]);
    v20->_presentationStyle = v18;
    v20->_isPreferredButton = v17;
    id v7 = objc_retainBlock(v16);
    id handler = v20->_handler;
    v20->_id handler = v7;
  }
  v10 = v20;
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v10;
}

- (NSString)label
{
  return self->_label;
}

- (id)handler
{
  return self->_handler;
}

- (unint64_t)presentationStyle
{
  return self->_presentationStyle;
}

- (BOOL)isPreferredButton
{
  return self->_isPreferredButton;
}

- (void).cxx_destruct
{
}

@end