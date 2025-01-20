@interface VKFeedbackAttachment
- (BOOL)isOptional;
- (NSString)fileName;
- (NSString)label;
- (VKFeedbackAttachment)initWithFileName:(id)a3 label:(id)a4 isOptional:(BOOL)a5;
@end

@implementation VKFeedbackAttachment

- (VKFeedbackAttachment)initWithFileName:(id)a3 label:(id)a4 isOptional:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VKFeedbackAttachment;
  v11 = [(VKFeedbackAttachment *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fileName, a3);
    objc_storeStrong((id *)&v12->_label, a4);
    v12->_isOptional = a5;
  }

  return v12;
}

- (NSString)fileName
{
  return self->_fileName;
}

- (NSString)label
{
  return self->_label;
}

- (BOOL)isOptional
{
  return self->_isOptional;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
}

@end