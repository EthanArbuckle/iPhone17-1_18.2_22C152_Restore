@interface WFContactTextAttachment
- (WFContact)value;
- (id)valueName;
- (void)setValue:(id)a3;
@end

@implementation WFContactTextAttachment

- (void).cxx_destruct
{
}

- (void)setValue:(id)a3
{
}

- (WFContact)value
{
  return self->_value;
}

- (id)valueName
{
  v2 = [(WFContactTextAttachment *)self value];
  v3 = [v2 wfName];

  return v3;
}

@end