@interface WRWidgetRendererSessionKey
+ (BOOL)supportsBSXPCSecureCoding;
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CHSWidget)widget;
- (CHSWidgetMetrics)metrics;
- (NSString)description;
- (NSString)identifier;
- (WRWidgetRendererSessionKey)initWithBSXPCCoder:(id)a3;
- (WRWidgetRendererSessionKey)initWithCoder:(id)a3;
- (WRWidgetRendererSessionKey)initWithIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5;
- (unint64_t)hash;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WRWidgetRendererSessionKey

- (CHSWidget)widget
{
  return self->_widget;
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (WRWidgetRendererSessionKey *)a3;
  if (self == v4)
  {
    char v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      widget = self->_widget;
      v7 = [(WRWidgetRendererSessionKey *)v5 widget];
      if ([(CHSWidget *)widget isEqual:v7])
      {
        metrics = self->_metrics;
        v9 = [(WRWidgetRendererSessionKey *)v5 metrics];
        if ([(CHSWidgetMetrics *)metrics isEqual:v9])
        {
          identifier = self->_identifier;
          v11 = [(WRWidgetRendererSessionKey *)v5 identifier];
          char v12 = [(NSString *)identifier isEqual:v11];
        }
        else
        {
          char v12 = 0;
        }
      }
      else
      {
        char v12 = 0;
      }
    }
    else
    {
      char v12 = 0;
    }
  }

  return v12;
}

- (WRWidgetRendererSessionKey)initWithBSXPCCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WRWidgetRendererSessionKey;
  v5 = [(WRWidgetRendererSessionKey *)&v16 init];
  if (!v5) {
    goto LABEL_7;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widget"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metrics"];
  v8 = [v4 decodeStringForKey:@"identifier"];
  if (!v8 || !v6 || !v7)
  {

LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v8;
  id v10 = v8;

  widget = v5->_widget;
  v5->_widget = (CHSWidget *)v6;
  id v12 = v6;

  metrics = v5->_metrics;
  v5->_metrics = (CHSWidgetMetrics *)v7;

  v14 = v5;
LABEL_8:

  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(CHSWidget *)self->_widget hash] + v3;
  return v4 + [(CHSWidgetMetrics *)self->_metrics hash];
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_widget forKey:@"widget"];
  [v5 encodeObject:self->_metrics forKey:@"metrics"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (WRWidgetRendererSessionKey)initWithIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WRWidgetRendererSessionKey;
  id v12 = [(WRWidgetRendererSessionKey *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_widget, a4);
    objc_storeStrong((id *)&v13->_metrics, a5);
    objc_storeStrong((id *)&v13->_identifier, a3);
  }

  return v13;
}

- (NSString)description
{
  v2 = NSString;
  identifier = self->_identifier;
  NSUInteger v4 = [(CHSWidget *)self->_widget _loggingIdentifierWithMetrics:self->_metrics];
  id v5 = [v2 stringWithFormat:@"<%@-%@>", identifier, v4];

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"identifier"];
  [v5 encodeObject:self->_widget forKey:@"widget"];
  [v5 encodeObject:self->_metrics forKey:@"metrics"];
}

- (WRWidgetRendererSessionKey)initWithCoder:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WRWidgetRendererSessionKey;
  id v5 = [(WRWidgetRendererSessionKey *)&v19 init];
  if (!v5) {
    goto LABEL_11;
  }
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"widget"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metrics"];
  id v9 = v8;
  if (v6) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10 || v8 == 0)
  {

LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  widget = v5->_widget;
  v5->_widget = (CHSWidget *)v7;
  id v13 = v7;

  metrics = v5->_metrics;
  v5->_metrics = v9;
  objc_super v15 = v9;

  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v17 = v5;
LABEL_12:

  return v17;
}

@end