@interface SUUIReportAConcernReasonViewElement
- (NSNumber)reasonID;
- (NSString)name;
- (NSString)uppercaseName;
- (SUUIReportAConcernReasonViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SUUIReportAConcernReasonViewElement

- (SUUIReportAConcernReasonViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SUUIReportAConcernReasonViewElement;
  v9 = [(SUUIViewElement *)&v18 initWithDOMElement:v8 parent:a4 elementFactory:a5];
  if (v9)
  {
    v10 = [v8 getAttribute:@"data-content-id"];
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v10, "integerValue"));
    reasonID = v9->_reasonID;
    v9->_reasonID = (NSNumber *)v11;

    v13 = [v8 getAttribute:@"data-uppercase-name"];
    if ([v13 length]) {
      v14 = v13;
    }
    else {
      v14 = 0;
    }
    objc_storeStrong((id *)&v9->_uppercaseName, v14);
    uint64_t v15 = [v8 textContent];
    name = v9->_name;
    v9->_name = (NSString *)v15;
  }
  return v9;
}

- (NSNumber)reasonID
{
  return self->_reasonID;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)uppercaseName
{
  return self->_uppercaseName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uppercaseName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_reasonID, 0);
}

@end