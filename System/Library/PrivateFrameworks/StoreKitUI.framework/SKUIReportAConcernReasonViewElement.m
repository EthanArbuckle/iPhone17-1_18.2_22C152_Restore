@interface SKUIReportAConcernReasonViewElement
- (NSNumber)reasonID;
- (NSString)name;
- (NSString)uppercaseName;
- (SKUIReportAConcernReasonViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5;
@end

@implementation SKUIReportAConcernReasonViewElement

- (SKUIReportAConcernReasonViewElement)initWithDOMElement:(id)a3 parent:(id)a4 elementFactory:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIReportAConcernReasonViewElement initWithDOMElement:parent:elementFactory:]();
  }
  v20.receiver = self;
  v20.super_class = (Class)SKUIReportAConcernReasonViewElement;
  v11 = [(SKUIViewElement *)&v20 initWithDOMElement:v8 parent:v9 elementFactory:v10];
  if (v11)
  {
    v12 = [v8 getAttribute:@"data-content-id"];
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "integerValue"));
    reasonID = v11->_reasonID;
    v11->_reasonID = (NSNumber *)v13;

    v15 = [v8 getAttribute:@"data-uppercase-name"];
    if ([v15 length]) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
    objc_storeStrong((id *)&v11->_uppercaseName, v16);
    uint64_t v17 = [v8 textContent];
    name = v11->_name;
    v11->_name = (NSString *)v17;
  }
  return v11;
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

- (void)initWithDOMElement:parent:elementFactory:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIReportAConcernReasonViewElement initWithDOMElement:parent:elementFactory:]";
}

@end