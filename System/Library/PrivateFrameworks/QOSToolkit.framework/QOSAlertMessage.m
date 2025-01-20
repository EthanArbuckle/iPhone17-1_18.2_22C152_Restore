@interface QOSAlertMessage
- (QOSAlertMessage)initWithTitle:(id)a3 body:(id)a4;
- (QOSAlertMessageInternal)underlyingObject;
- (id)body;
- (id)title;
@end

@implementation QOSAlertMessage

- (QOSAlertMessage)initWithTitle:(id)a3 body:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)QOSAlertMessage;
  id v5 = a4;
  id v6 = a3;
  v7 = [(QOSAlertMessage *)&v12 init];
  v8 = [QOSAlertMessageInternal alloc];
  uint64_t v9 = -[QOSAlertMessageInternal initWithTitle:body:](v8, "initWithTitle:body:", v6, v5, v12.receiver, v12.super_class);

  underlyingObject = v7->_underlyingObject;
  v7->_underlyingObject = (QOSAlertMessageInternal *)v9;

  return v7;
}

- (id)title
{
  v2 = [(QOSAlertMessage *)self underlyingObject];
  v3 = [v2 title];

  return v3;
}

- (id)body
{
  v2 = [(QOSAlertMessage *)self underlyingObject];
  v3 = [v2 body];

  return v3;
}

- (QOSAlertMessageInternal)underlyingObject
{
  return (QOSAlertMessageInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end