@interface VKImageAnalysisInteractionResultInfo
- (CGRect)normalizedBoundingRect;
- (NSString)displayLabel;
- (NSString)displayMessage;
- (NSString)domain;
- (NSString)glyphName;
- (VKImageAnalysisInteractionResultInfo)initWithDisplayLabel:(id)a3 displayMessage:(id)a4 glyphName:(id)a5 rect:(CGRect)a6;
@end

@implementation VKImageAnalysisInteractionResultInfo

- (VKImageAnalysisInteractionResultInfo)initWithDisplayLabel:(id)a3 displayMessage:(id)a4 glyphName:(id)a5 rect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  v20.receiver = self;
  v20.super_class = (Class)VKImageAnalysisInteractionResultInfo;
  v17 = [(VKImageAnalysisInteractionResultInfo *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_domain, a3);
    objc_storeStrong((id *)&v18->_displayLabel, a3);
    objc_storeStrong((id *)&v18->_displayMessage, a4);
    objc_storeStrong((id *)&v18->_glyphName, a5);
    v18->_normalizedBoundingRect.origin.CGFloat x = x;
    v18->_normalizedBoundingRect.origin.CGFloat y = y;
    v18->_normalizedBoundingRect.size.CGFloat width = width;
    v18->_normalizedBoundingRect.size.CGFloat height = height;
  }

  return v18;
}

- (NSString)displayLabel
{
  return self->_displayLabel;
}

- (NSString)displayMessage
{
  return self->_displayMessage;
}

- (NSString)domain
{
  return self->_domain;
}

- (NSString)glyphName
{
  return self->_glyphName;
}

- (CGRect)normalizedBoundingRect
{
  double x = self->_normalizedBoundingRect.origin.x;
  double y = self->_normalizedBoundingRect.origin.y;
  double width = self->_normalizedBoundingRect.size.width;
  double height = self->_normalizedBoundingRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glyphName, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_displayMessage, 0);
  objc_storeStrong((id *)&self->_displayLabel, 0);
}

@end