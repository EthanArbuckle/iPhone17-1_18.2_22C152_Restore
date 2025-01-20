@interface TUIHostedBox
+ (unint64_t)arrowDirectionFromString:(id)a3;
+ (unint64_t)presentationFromString:(id)a3;
- (Class)layoutClass;
- (NSString)anchorRefId;
- (TUIHostingIdentifier)hostingIdentifier;
- (TUIHostingProperties)hostingProperties;
- (UIEdgeInsets)insets;
- (void)setAnchorRefId:(id)a3;
- (void)setHostingIdentifier:(id)a3;
- (void)setHostingProperties:(id)a3;
- (void)setInsets:(UIEdgeInsets)a3;
@end

@implementation TUIHostedBox

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)presentationFromString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_2DF378 != -1)
  {
    dispatch_once(&qword_2DF378, &stru_252DA8);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF370 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

+ (unint64_t)arrowDirectionFromString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (qword_2DF388 != -1)
  {
    dispatch_once(&qword_2DF388, &stru_252DC8);
    if (v4) {
      goto LABEL_3;
    }
LABEL_5:
    id v6 = 0;
    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(id)qword_2DF380 objectForKeyedSubscript:v4];
  id v6 = [v5 unsignedIntegerValue];

LABEL_6:
  return (unint64_t)v6;
}

- (TUIHostingIdentifier)hostingIdentifier
{
  return self->_hostingIdentifier;
}

- (void)setHostingIdentifier:(id)a3
{
}

- (TUIHostingProperties)hostingProperties
{
  return self->_hostingProperties;
}

- (void)setHostingProperties:(id)a3
{
}

- (NSString)anchorRefId
{
  return self->_anchorRefId;
}

- (void)setAnchorRefId:(id)a3
{
}

- (UIEdgeInsets)insets
{
  double top = self->_insets.top;
  double left = self->_insets.left;
  double bottom = self->_insets.bottom;
  double right = self->_insets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setInsets:(UIEdgeInsets)a3
{
  self->_insets = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorRefId, 0);
  objc_storeStrong((id *)&self->_hostingProperties, 0);

  objc_storeStrong((id *)&self->_hostingIdentifier, 0);
}

@end